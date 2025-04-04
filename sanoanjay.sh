#!/bin/bash

# Periksa apakah skrip dijalankan sebagai root

if [ "$EUID" -ne 0 ]; then echo "Harap jalankan skrip ini sebagai root." exit 1 fi

# 1. Tanyakan User ID yang tidak boleh dihapus

echo -n "Masukkan User ID yang tidak boleh dihapus (contoh: 1): " read PROTECTED_USER_ID

if [[ ! "$PROTECTED_USER_ID" =~ ^[0-9]+$ ]]; then echo "User ID harus berupa angka. Keluar." exit 1 fi

# 2. Sisipkan kode validasi ke Pterodactyl

CONTROLLER_PATH="/var/www/pterodactyl/app/Http/Controllers/Admin/UserController.php"

if [ -f "$CONTROLLER_PATH" ]; then echo "Menambahkan validasi ke UserController.php..." if ! grep -q "Dilarang Menghapus Admin Utama Panel" "$CONTROLLER_PATH"; then sed -i "/public function delete(Request $request, User $user): RedirectResponse {/a \ \ \ \ \ \ \ \ if ($user->id === $PROTECTED_USER_ID) { throw new DisplayException('Dilarang Menghapus Admin Utama Panel'); }" "$CONTROLLER_PATH" echo "Validasi berhasil ditambahkan." else echo "Validasi sudah ada, melewati langkah ini." fi else echo "File UserController.php tidak ditemukan di $CONTROLLER_PATH." exit 1 fi

# 3. Pastikan Node.js versi terbaru terinstal (Node.js 18 jika diperlukan)

NODE_VERSION=$(node -v 2>/dev/null | grep -oP '[0-9]+' | head -1) if [ -z "$NODE_VERSION" ] || [ "$NODE_VERSION" -lt 18 ]; then echo "Menginstal Node.js 18..." curl -fsSL https://deb.nodesource.com/setup_18.x | bash - apt-get install -y nodejs else echo "Node.js versi $NODE_VERSION sudah terinstal." fi

# 4. Instal Yarn jika belum ada

if ! command -v yarn &>/dev/null; then echo "Menginstal Yarn..." npm install -g yarn else echo "Yarn sudah terinstal." fi

# 5. Jalankan yarn dan build frontend

cd /var/www/pterodactyl || exit

echo "Menjalankan Yarn..." yarn

echo "Membangun aset frontend..." export NODE_OPTIONS=--openssl-legacy-provider yarn build:production

# 6. Bersihkan cache Laravel sebagai user pterodactyl

echo "Membersihkan cache Laravel..." sudo -u pterodactyl php artisan config:clear sudo -u pterodactyl php artisan cache:clear sudo -u pterodactyl php artisan route:clear sudo -u pterodactyl php artisan view:clear

# 7. Selesai

echo "Proses selesai. Admin dengan User ID $PROTECTED_USER_ID tidak dapat dihapus."

