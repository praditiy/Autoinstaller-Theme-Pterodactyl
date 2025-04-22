#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+]                AUTO INSTALLER THEMA             [+]${NC}"
  echo -e "${BLUE}[+]                  © SANO OFFICIAL                [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${RED}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "script ini dibuat untuk mempermudah penginstalasian thema pterodactyl,"
  echo -e "Dilarang Keras Share Bebas."
  echo -e ""
  echo -e "𝗧𝗘𝗟𝗘𝗚𝗥𝗔𝗠 :"
  echo -e "@batuofc"
  echo -e "𝗪𝗛𝗔𝗧𝗦𝗔𝗣𝗣 :"
  echo -e "+6289605983169"
  sleep 4
  clear
}

#Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]             UPDATE & INSTALL JQ                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]              INSTALL JQ BERHASIL                [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] =============================================== [+]${NC}"
    echo -e "${RED}[+]              INSTALL JQ GAGAL                   [+]${NC}"
    echo -e "${RED}[+] =============================================== [+]${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}
#Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               LICENSE SANO OFFICIAL            [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${YELLOW}MASUKKAN AKSES TOKEN: ${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "sanoofc" ]; then
    echo -e "${GREEN}AKSES BERHASIL${NC}}"
  else
    echo -e "${GREEN}Token Salah! Beli Kode Token Di Sano Official${NC}"
    echo -e "${YELLOW}TELEGRAM : @batuofc${NC}"
    echo -e "${YELLOW}WHATSAPP : +6289605983169${NC}"
    echo -e "${YELLOW}HARGA TOKEN : 10K FREE UPDATE JIKA ADA TOKEN BARU${NC}"
    echo -e "${YELLOW}© SANO OFFICIAL${NC}"
    exit 1
  fi
  clear
}

# Install theme
install_theme() {
  while true; do
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                   SELECT THEME                  [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    echo -e "PILIH THEME YANG INGIN DI INSTALL"
    echo "1. stellar"
    echo "2. billing"
    echo "3. enigma"
    echo "x. kembali"
    echo -e "Masukkan pilihan (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL=$(echo -e "https://github.com/Bangsano/Autoinstaller-Theme-Pterodactyl/raw/main/stellar.zip")  
        break
        ;;
      2)
        THEME_URL=$(echo -e "https://github.com/Bangsano/Autoinstaller-Theme-Pterodactyl/raw/main/billing.zip")
        break
        ;;
      3)
        THEME_URL=$(echo -e "https://github.com/Bangsano/Autoinstaller-Theme-Pterodactyl/raw/main/enigma.zip")
        break
        ;; 
      x)
        return
        ;;
      *)
        echo -e "${RED}Pilihan tidak valid, silahkan coba lagi.${NC}"
        ;;
    esac
  done
   
if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
  
if [ "$SELECT_THEME" -eq 1 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               INSTALASI THEMA STELLAR               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/stellar.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                    INSTALL SUCCESS                    [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 2
  clear
  exit 0

elif [ "$SELECT_THEME" -eq 2 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               INSTALASI THEMA BILLING               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan billing:install stable
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/billing.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                    INSTALL SUCCESS                    [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 3 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               INSTALASI THEMA ENIGMA               [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "

    # Menanyakan informasi kepada pengguna untuk tema Enigma
    echo -e "${YELLOW}Masukkan link wa (https://wa.me/...) : ${NC}"
    read LINK_WA
    echo -e "${YELLOW}Masukkan link group 1 (https://chat.whatsapp.com/...) : ${NC}"
    read LINK_GROUP1
    echo -e "${YELLOW}Masukkan link group 2 (https://chat.whatsapp.com/...) : ${NC}"
    read LINK_GROUP2
    echo -e "${YELLOW}Masukkan link channel (https://whatsapp.com/channel/...) : ${NC}"
    read LINK_CHNL

    # Mengganti placeholder dengan nilai dari pengguna
    sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP1|$LINK_GROUP1|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP2|$LINK_GROUP2|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx

  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/enigma.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                    INSTALL SUCCESS                    [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 5
else
  echo ""
  echo "Pilihan tidak valid. silahkan pilih 1/2/3/x."
fi
}


# Uninstall theme
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    DELETE THEME                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/VallzHost/installer-theme/main/repair.sh)
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]               DELETE THEME SUCCESS               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}
install_themeSteeler() {
#!/bin/bash

echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]               INSTALASI THEMA STELLAR               [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                                   "

# Unduh file tema
wget -O /root/stellar.zip https://github.com/Bangsano/Autoinstaller-Theme-Pterodactyl/raw/main/stellar.zip


# Ekstrak file tema
unzip /root/stellar.zip -d /root/pterodactyl

# Salin tema ke direktori Pterodactyl
sudo cp -rfT /root/pterodactyl /var/www/pterodactyl

# Instal Node.js dan Yarn
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm i -g yarn

# Instal dependensi dan build tema
cd /var/www/pterodactyl
yarn add react-feather
php artisan migrate
yarn build:production
php artisan view:clear

# Hapus file dan direktori sementara
sudo rm /root/stellar.zip
sudo rm -rf /root/pterodactyl

echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]                    INSTALL SUCCESS                    [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e ""
sleep 2
clear
exit 0

}
create_node() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CREATE NODE                    [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  #!/bin/bash
#!/bin/bash

# Minta input dari pengguna
read -p "Masukkan nama lokasi: " location_name
read -p "Masukkan deskripsi lokasi: " location_description
read -p "Masukkan domain: " domain
read -p "Masukkan nama node: " node_name
read -p "Masukkan RAM (dalam MB): " ram
read -p "Masukkan jumlah maksimum disk space (dalam MB): " disk_space
read -p "Masukkan Locid: " locid

# Ubah ke direktori pterodactyl
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:location:make <<EOF
$location_name
$location_description
EOF

# Membuat node baru
php artisan p:node:make <<EOF
$node_name
$location_description
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]          CREATE NODE & LOCATION SUCCESS          [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
uninstall_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    UNINSTALL PANEL                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "


bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF


  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]               UNINSTALL PANEL SUKSES               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
configure_wings() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    CONFIGURE WINGS                    [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  #!/bin/bash

# Minta input token dari pengguna
read -p "Masukkan token Configure menjalankan wings: " wings

eval "$wings"
# Menjalankan perintah systemctl start wings
sudo systemctl start wings

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]               CONFIGURE WINGS SUKSES               [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
hackback_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    HACK BACK PANEL                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  # Minta input dari pengguna
read -p "Masukkan Username Panel: " user
read -p "password login: " psswdhb
  #!/bin/bash
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:user:make <<EOF
yes
$user@sano.com
$user
$user
$user
$psswdhb
EOF
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 AKUN TELAH DI ADD             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
ubahpw_vps() {
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                  UBAH PASSWORD VPS                    [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
read -p "Masukkan Pw Baru: " pw
read -p "Masukkan Ulang Pw Baru " pw

passwd <<EOF
$pw
$pw

EOF


  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 GANTI PW VPS SUKSES                    [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}

# Install Dependencies Untuk Nebula Dan Elysium
install_depend() {
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]           INSTALL NODE.JS & BLUEPRINT           [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "

    # Install dependensi dasar
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings

    # Menambahkan kunci repositori Node.js
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

    # Menambahkan sumber paket Node.js versi 20.x
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

    # Memperbarui daftar paket dan menginstal Node.js
    sudo apt-get update
    sudo apt-get install -y nodejs
    npm i -g yarn

    # Navigasi ke direktori Pterodactyl
    cd /var/www/pterodactyl

    # Menginstal dependensi dengan Yarn
    yarn
    yarn add cross-env

    # Install dependensi tambahan
    sudo apt install -y zip unzip git curl wget

    # Mengunduh Blueprint Framework versi terbaru
    wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | cut -d '"' -f 4)" -O release.zip

    # Memindahkan dan mengekstrak file release
    mv release.zip /var/www/pterodactyl/release.zip
    cd /var/www/pterodactyl
    unzip release.zip

    # Konfigurasi permission dan eksekusi blueprint.sh
    WEBUSER="www-data"
    USERSHELL="/bin/bash"
    PERMISSIONS="www-data:www-data"

    sed -i -E -e "s|WEBUSER=\"www-data\" #;|WEBUSER=\"$WEBUSER\" #;|g" \
               -e "s|USERSHELL=\"/bin/bash\" #;|USERSHELL=\"$USERSHELL\" #;|g" \
               -e "s|OWNERSHIP=\"www-data:www-data\" #;|OWNERSHIP=\"$PERMISSIONS\" #;|g" blueprint.sh

    chmod +x blueprint.sh
    bash blueprint.sh

    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]        INSTALLASI NODE.JS & BLUEPRINT SELESAI   [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "

    sleep 2
}

# Nebula Theme
install_nebula_theme() {
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]                INSTALASI NEBULA THEME                 [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "

    local BLUEPRINT_FILE="/var/www/pterodactyl/blueprint.sh"
    
    if [ ! -f "$BLUEPRINT_FILE" ]; then
        echo "𝗗𝗘𝗣𝗘𝗡𝗗 𝗣𝗟𝗨𝗚𝗜𝗡𝗦 𝗕𝗘𝗟𝗨𝗠 𝗗𝗜𝗜𝗡𝗦𝗧𝗔𝗟. 𝗦𝗜𝗟𝗔𝗛𝗞𝗔𝗡 𝗜𝗡𝗦𝗧𝗔𝗟𝗟 𝗗𝗘𝗡𝗚𝗔𝗡 𝗢𝗣𝗦𝗜 𝗡𝗢 𝟭𝟭"
        exit 1
    fi

    # URL Repositori (gunakan HTTPS tanpa autentikasi)
    local REPO_URL="https://github.com/Bangsano/Autoinstaller-Theme-Pterodactyl.git"
    local TEMP_DIR="Autoinstaller-Theme-Pterodactyl"

    echo -e "${BLUE}🔄 Mengkloning repositori...${NC}"
    git clone --depth=1 "$REPO_URL"

    if [ ! -d "$TEMP_DIR" ]; then
        echo -e "${RED}❌ Gagal mengkloning repositori.${NC}"
        exit 1
    fi

    echo -e "${BLUE}📦 Memindahkan dan mengekstrak file...${NC}"
    mv "$TEMP_DIR/nebulaptero.zip" /var/www/
    unzip -o /var/www/nebulaptero.zip -d /var/www/

    echo -e "${BLUE}⚙️ Menginstal blueprint...${NC}"
    cd /var/www/pterodactyl && blueprint -install nebula

    echo -e "${BLUE}🧹 Membersihkan file sementara...${NC}"
    rm -rf "$TEMP_DIR" "/var/www/nebulaptero.zip" "/var/www/pterodactyl/nebula.blueprint"

    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]           NEBULA THEME BERHASIL DIINSTALL          [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    
    sleep 2
}

# Elysium Theme
install_elysium_theme() {
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]             INSTALLASI ELYSIUM THEME           [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "

        # Menginstal Tema Elysium
    REPO_URL="https://github.com/Bangsano/Autoinstaller-Theme-Pterodactyl.git"
    TEMP_DIR="Autoinstaller-Theme-Pterodactyl"

        git clone "$REPO_URL" "$TEMP_DIR" || { echo "Gagal mengkloning repositori."; exit 1; }

        # Menyimpan dan mengekstrak file ZIP
        sudo mv "$TEMP_DIR/ElysiumTheme.zip" /var/www/
        unzip -o /var/www/ElysiumTheme.zip -d /var/www/
        rm -rf "$TEMP_DIR" /var/www/ElysiumTheme.zip
        cd /root
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg || true
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
        sudo apt update
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
        export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
        nvm install 16
        sudo apt install -y nodejs
        apt install npm -y
        npm i -g yarn
        cd /var/www/pterodactyl
        yarn
        yarn build:production
        php artisan migrate
        php artisan view:clear

    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]          ELYSIUM THEME BERHASIL DIINSTALL       [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
}

installThemeQuestion(){
    while true; do
        read -p "Are you sure that you want to install the theme [y/n]? " yn
        case $yn in
            [Yy]* ) installTheme_nightcore; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

installTheme_nightcore(){
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${RESET}"
    echo -e "${GREEN}[+]          INSTALLASI NIGHTCORE THEME           [+]${RESET}"
    echo -e "${GREEN}[+] =============================================== [+]${RESET}"
    echo -e "                                                       "

    echo -e "${GREEN}Installing ${YELLOW}sudo${GREEN} if not installed${RESET}"
    apt install sudo -y > /dev/null 2>&1
    cd /var/www/ > /dev/null 2>&1
    echo -e "${GREEN}Unpack the themebackup...${RESET}"
    tar -cvf Pterodactyl_Nightcore_Themebackup.tar.gz pterodactyl > /dev/null 2>&1
    echo -e "${GREEN}Installing theme... ${RESET}"
    cd /var/www/pterodactyl > /dev/null 2>&1
    echo -e "${GREEN}Removing old theme if exist${RESET}"
    rm -r Pterodactyl_Nightcore_Theme > /dev/null 2>&1
    echo -e "${GREEN}Download the Theme${RESET}"
    git clone https://github.com/Bangsano/Autoinstaller-Theme-Pterodactyl.git > /dev/null 2>&1
    cd Autoinstaller-Theme-Pterodactyl > /dev/null 2>&1
    echo -e "${GREEN}Removing old theme resources if exist${RESET}"
    rm /var/www/pterodactyl/resources/scripts/Pterodactyl_Nightcore_Theme.css > /dev/null 2>&1
    rm /var/www/pterodactyl/resources/scripts/index.tsx > /dev/null 2>&1
    echo -e "${GREEN}Moving the new theme files to directory${RESET}"
    mv index.tsx /var/www/pterodactyl/resources/scripts/index.tsx > /dev/null 2>&1
    mv Pterodactyl_Nightcore_Theme.css /var/www/pterodactyl/resources/scripts/Pterodactyl_Nightcore_Theme.css > /dev/null 2>&1
    cd /var/www/pterodactyl > /dev/null 2>&1
    
    curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - > /dev/null 2>&1
    apt update -y > /dev/null 2>&1
    apt install nodejs -y > /dev/null 2>&1
    
    NODE_VERSION=$(node -v)
    REQUIRED_VERSION="v16.20.2"
    if [ "$NODE_VERSION" != "$REQUIRED_VERSION" ]; then
        echo -e "${GREEN}Node.js version is not ${YELLOW}${REQUIRED_VERSION}${GREEN}. Version: ${YELLOW}${NODE_VERSION}${RESET}"
        echo -e "${GREEN}Set version to ${YELLOW}v16.20.2${GREEN}... ${RESET}"
        sudo npm install -g n > /dev/null 2>&1
        sudo n 16 > /dev/null 2>&1
        node -v > /dev/null 2>&1
        npm -v > /dev/null  2>&1
        echo -e "${GREEN}Now the default version is ${YELLOW}${REQUIRED_VERSION}"
    else
        echo -e "${GREEN}Node.js Version is compatible: ${YELLOW}${NODE_VERSION} ${RESET}"
    fi

    apt install npm -y > /dev/null 2>&1
    npm i -g yarn > /dev/null 2>&1
    yarn > /dev/null 2>&1

    cd /var/www/pterodactyl > /dev/null 2>&1
    echo -e "${GREEN}Rebuilding the Panel...${RESET}"
    yarn build:production > /dev/null 2>&1
    echo -e "${GREEN}Optimizing the Panel...${RESET}"
    sudo php artisan optimize:clear > /dev/null 2>&1

    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${RESET}"
    echo -e "${GREEN}[+]      NIGHTCORE THEME BERHASIL DIINSTALL        [+]${RESET}"
    echo -e "${GREEN}[+] =============================================== [+]${RESET}"
    echo -e "                                                       "
}

# Main script
install_jq

while true; do
  clear
  echo -e "                                                                     "
  echo -e "${RED}        _,gggggggggg.                                     ${NC}"
  echo -e "${RED}    ,ggggggggggggggggg.                                   ${NC}"
  echo -e "${RED}  ,ggggg        gggggggg.                                 ${NC}"
  echo -e "${RED} ,ggg'               'ggg.                                ${NC}"
  echo -e "${RED}',gg       ,ggg.      'ggg:                               ${NC}"
  echo -e "${RED}'ggg      ,gg'''  .    ggg       Auto Installer Theme Pterodactyl   ${NC}"
  echo -e "${RED}gggg      gg     ,     ggg      ------------------------  ${NC}"
  echo -e "${RED}ggg:     gg.     -   ,ggg       • Telegram : @batuofc      ${NC}"
  echo -e "${RED} ggg:     ggg._    _,ggg        • Whatsapp  : +6289605983169  ${NC}"
  echo -e "${RED} ggg.    '.'''ggggggp                                   ${NC}"
  echo -e "${RED}  'ggg    '-.__                                           ${NC}"
  echo -e "${RED}    ggg                                                   ${NC}"
  echo -e "${RED}      ggg                                                 ${NC}"
  echo -e "${RED}        ggg.                                              ${NC}"
  echo -e "${RED}          ggg.                                            ${NC}"
  echo -e "${RED}             b.                                           ${NC}"
  echo -e "                                                                     "
  echo -e "BERIKUT ADALAH LIST FITUR:"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "3. Configure Wings"
  echo "4. Create Node"
  echo "5. Uninstall Panel"
  echo "6. Stellar Theme"
  echo "7. Hack Back Panel"
  echo "8. Ubah Pw Vps"
  echo "9. Install Depend"
  echo "10. Install Tema Nebula (wajib install depend terlebih dahulu)"
  echo "11. Install Tema Elysium"
  echo "12. Install Tema Nightcore"
  echo "x. Exit"
  echo -e "Masukkan pilihan 1/2/3/.../x:"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
      1)
      install_theme
      ;;
      2)
      uninstall_theme
      ;;
      3)
      configure_wings
      ;;
      4)
      create_node
      ;;
      5)
      uninstall_panel
      ;;
      6)
      install_themeSteeler
      ;;
      7)
      hackback_panel
      ;;
      8)
      ubahpw_vps
      ;;
      9)
      install_depend
      ;;
      10)
      install_nebula_theme
      ;;
      11)
      install_elysium_theme
      ;;
      12)
      installThemeQuestion
      ;;
    x)
      echo "Keluar dari skrip."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
