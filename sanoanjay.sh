#!/bin/bash

# Periksa apakah skrip dijalankan sebagai root
if [ "$EUID" -ne 0 ]; then
    echo "Harap jalankan skrip ini sebagai root."
    exit
fi

# 1. Tanyakan User ID yang tidak boleh dihapus
echo -n "Masukkan User ID yang tidak boleh dihapus (contoh: 1): "
read PROTECTED_USER_ID

if [[ ! "$PROTECTED_USER_ID" =~ ^[0-9]+$ ]]; then
    echo "User ID harus berupa angka. Keluar."
    exit 1
fi

# 2. Sisipkan kode validasi ke Pterodactyl
CONTROLLER_PATH="/var/www/pterodactyl/app/Http/Controllers/Admin/UserController.php"

if [ -f "$CONTROLLER_PATH" ]; then
    echo "Menambahkan validasi ke UsersController.php..."
    sed -i "/public function delete(Request \$request, User \$user): RedirectResponse {/a \ \ \ \ \ \ \ \ if (\$user->id === $PROTECTED_USER_ID) { throw new DisplayException('Dilarang Menghapus Admin Utama Panel'); }" $CONTROLLER_PATH
    echo "Validasi berhasil ditambahkan."
else
    echo "File UsersController.php tidak ditemukan di $CONTROLLER_PATH."
    exit 1
fi

# 3. Instal Node.js 16 jika belum ada
if ! command -v node &>/dev/null || [[ $(node -v | grep -oP '[0-9]+' | head -1) -lt 16 ]]; then
    echo "Node.js 16 tidak ditemukan. Menginstal Node.js 16..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
    apt-get install -y nodejs
else
    echo "Node.js 16 sudah terinstal."
fi

# 4. Instal Yarn jika belum ada
if ! command -v yarn &>/dev/null; then
    echo "Yarn tidak ditemukan. Menginstal Yarn..."
    npm install -g yarn
else
    echo "Yarn sudah terinstal."
fi

# 5. Jalankan yarn dan build frontend
cd /var/www/pterodactyl || exit
echo "Menjalankan Yarn..."
yarn
echo "Membangun aset frontend..."
yarn build:production

# 6. Bersihkan cache Laravel
echo "Membersihkan cache Laravel..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

# 7. Selesai
echo "Proses selesai. Admin dengan User ID $PROTECTED_USER_ID tidak dapat dihapus."
