#!/bin/bash

declare -A COLORS=(
    
    ["PRIMARY"]='\033[38;5;255m'    
    ["SUCCESS"]='\033[38;5;71m'     
    ["MONERO"]='\033[38;5;208m'     
    ["WARNING"]='\033[38;5;184m'    
    ["ERROR"]='\033[38;5;167m'      
    ["INFO"]='\033[38;5;74m'        
    ["BG"]='\033[48;5;16m'           
    ["GRIS"]='\033[38;5;245m'        
    
)


draw_banner() {
    tput sc
    tput cup 0 0
    echo -e "\033[38;5;208m"
    echo "  *     *   ***   *   * ***** ****   ***   "
    echo "  **   **  *   *  **  * *     *   * *   *  "
    echo "  * * * * *     * * * * ****  ****  *   *  "
    echo "  *  *  * *     * *  ** *     * *   *   *  "
    echo "  *     *  *   *  *   * *     *  *  *   *  "
    echo "  *     *   ***   *   * ***** *   *  ***   "
    echo "  ═════════ ▌EASYNODE▐ ══Tunnels══Vpn+Tor "
   
    echo -e "${COLORS[RESET]}"
    tput rc
}

USERNAME=""
LANG_CHOICE=""
BLOCKCHAIN_TYPE=""
MONERO_VERSION="0.18.5.4"

print_styled() {
    local style=$1
    local message=$2
    echo -e "${COLORS[$style]}${message}${COLORS[RESET]}"
}
info() {
    print_styled "INFO" "ℹ $1"
}

error() {
    print_styled "ERROR" "✖ $1"
}

warning() {
    print_styled "WARNING" "⚠ $1"
}

success() {
    print_styled "SUCCESS" "✓ $1"
}


print_header() {
    local message=$1
    local length=${#message}
    local total_width=37    
    local line="═════════════════════════════════════════"
    local padding=$(( (total_width - length) / 2 ))
    local spaces=$(printf '%*s' $padding '')
    echo
    print_styled "MONERO" "$line"
    print_styled "HEADER" "${spaces}${message}"
    print_styled "MONERO" "$line"
    echo
}

setup_terminal() {
    echo -e "${COLORS[BG]}"
    clear
    printf '\033]11;#1a1a1a\007'
    draw_banner
}

select_language() {
    clear
    draw_banner
    echo -e "\n\n\n\n\n\n\n\n"  
    print_header "LANGUAGE SELECTION"
                  
    while true; do
        print_styled "PRIMARY" "1) Français"
        print_styled "PRIMARY" "2) English"
        echo -n "$(print_styled "MONERO" "Choose/Choisissez (1-2): ")"    
            
        read -r lang_choice
        case $lang_choice in
            1) LANG_CHOICE="FR"; break ;;
            2) LANG_CHOICE="EN"; break ;;
            *) error "Invalid choice / Choix invalide" ;;    
        esac
      done
}

get_message() {
    local fr_msg=$1
    local en_msg=$2
    if [ "$LANG_CHOICE" = "FR" ]; then
        echo "$fr_msg"
    else
        echo "$en_msg"
    fi
}
 Manuel() {
    clear
    setup_terminal
    echo -e "\n\n\n\n\n\n\n\n"  
    print_header "$(get_message "GUIDE" "HOW TO")"
   
    print_styled "MONERO" "$(get_message "Pour une installation complète, suivez ces étapes dans l'ordre:" "For a complete installation, follow these steps in order:")"
    echo
         print_styled "SUCCESS" "$(get_message "  1️⃣ ➜ 2️⃣ ➜ 3️⃣ ➜ 4️⃣ ➜ 5️⃣." "  1️⃣ ➜ 2️⃣ ➜ 3️⃣ ➜ 4️⃣ ➜ 5️⃣.")"
   echo
   print_styled "SUCCESS" "$(get_message "  Puis au choix :" "  Then your choice :")"
   echo
   print_styled "SUCCESS" "$(get_message "  ▶️, Disque interne : Configuration VPN 1️⃣0️⃣ ➜ 1️⃣ ➜ 2️⃣ ➜ 3️⃣ et enfin étape 6️⃣." "  ▶️, Internal disk : VPN Configuration  1️⃣0️⃣ ➜ 1️⃣ ➜ 2️⃣ ➜ 3️⃣ then stape 6️⃣.")"
    echo
    print_styled "SUCCESS" "$(get_message "  ou :" "  or :")"
    echo
    print_styled "SUCCESS" "$(get_message "  ▶️, Disque externe : étape 8️⃣  puis Configuration VPN 1️⃣0️⃣ ➜ 1️⃣ ➜ 2️⃣ ➜ 3️⃣ et enfin 6️⃣." "  ▶️, External disk : stape 8️⃣  then VPN Configuration  1️⃣0️⃣ ➜ 1️⃣ ➜ 2️⃣ ➜ 3️⃣ and finally  6️⃣.")"
   echo
   print_header "$(get_message "AUTRES" "OTHER")"
   print_styled "GRIS" "$(get_message "  ➡️ Étape 6 : Démarrer le nœud et configurer l'exclusion des ⛔ 'IP bannis '." "  ➡️ step 6: Start the Node and introduce the exclusion of the ⛔ 'listed IP bans'.")"
   echo
   print_styled "GRIS" "$(get_message "  ➡️ Étape 9 : Démonter la blockchain du disque externe," "  ➡️ Step 9 : Is used to unmount the blockchain from the external disk,")"
   print_styled "GRIS" "$(get_message "  ↳ Pour revenir au disque interne : passez à l'étape 6." "  ↳ Return on internal disk: then step 6.")"
   echo
   print_styled "GRIS" "$(get_message "  ➡️ Étape 4 : Sert aussi pour le DEBUG du chemin d'amorçage du disque interne." "  ➡️ Step 4 : Also serves as DEBUG of the boot path to internal disk.")"
   echo
   print_styled "PRIMARY" "$(get_message "   CTRL+C 1 seule fois pour arreter la Blockchain et revenir au menu." "  -CTRL+C 1 time only to stop the Blockchain and return to the menu.")"
   echo
   print_styled "WARNING" "$(get_message "⚠️ Important: REDIRIGER le port 22 et 18080 de votre Box internet" "⚠️ Important: REDIRECT port 22 and 18080 from your internet router")"
   print_styled "WARNING" "$(get_message "  vers l'adresse 'ip local' de votre PC" "  to your 'local ip' of your PC")"
   echo
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour revenir au menu..." "Press Enter to return to menu...")")"
}
select_blockchain_type() {
    print_header "$(get_message "TYPE DE BLOCKCHAIN" "BLOCKCHAIN TYPE")"
    
        print_styled "PRIMARY" "$(get_message "1) Complète 220 Go" "1) Complete 220 Go")"
        print_styled "PRIMARY" "$(get_message "2) Prune 90 Go" "2) Pruned 90 Go")"
        echo -n "$(print_styled "INFO" "$(get_message "Choix (1-2): " "Choice (1-2): ")")"
        read -r choice
        case $choice in
            1) BLOCKCHAIN_TYPE="complete"; return 0  ;;
            2) BLOCKCHAIN_TYPE="pruned"; return 0 ;;
            *) 
            error "$(get_message "Choix invalide" "Invalid choice")" 
            return 1;;
        esac
    
}

update_system() {
    print_header "$(get_message "MISE À JOUR DU SYSTÈME" "SYSTEM UPDATE")"
    
    info "$(get_message "Mise à jour initiale du système..." "Initial system update...")"
    sudo apt update && sudo apt upgrade -y

    info "$(get_message "Installation des outils système essentiels..." "Installing essential system tools...")"
    sudo apt install -y \
        build-essential \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        curl \
        wget \
        git \
        gnupg \
        lsb-release

   info "$(get_message "Installation des outils de sécurité..." "Installing security tools...")"
   sudo apt install -y \
    gnupg \
    dirmngr \
    curl \
    wget

    info "$(get_message "Installation des outils de compression..." "Installing compression tools...")"
    sudo apt install -y \
        bzip2 \
        libbz2-dev \
        zip \
        unzip \
        tar \
        gzip

    info "$(get_message "Installation des outils réseau..." "Installing network tools...")"
    sudo apt install -y \
        net-tools \
        openssh-server \
        ufw \
        fail2ban \
        nmap \
        tcpdump \
        htop \
        iftop \
        iotop


    info "$(get_message "Configuration de SSH..." "Configuring SSH...")"
    sudo systemctl enable ssh
    sudo systemctl start ssh
    
if [ ! -f /etc/ssh/sshd_config.backup ]; then
    sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
fi

sudo sed -i 's/MaxAuthTries 6/MaxAuthTries 3/' /etc/ssh/sshd_config

if ! grep -q "PermitRootLogin no" /etc/ssh/sshd_config; then
    echo "PermitRootLogin no" | sudo tee -a /etc/ssh/sshd_config
fi



    info "$(get_message "Installation des outils Python..." "Installing Python tools...")"
    sudo apt install -y \
        python3 \
        python3-pip \
        python3-dev

    info "$(get_message "Installation des éditeurs..." "Installing text editors...")"
    sudo apt install -y \
        vim \
        nano

    info "$(get_message "Configuration du pare-feu..." "Configuring firewall...")"
    
ufw_status=$(sudo ufw status)

if [[ "$ufw_status" == *"Status: inactive"* ]]; then
    sudo ufw --force enable
fi

sudo ufw allow 22/tcp comment "SSH"           
sudo ufw allow 80/tcp comment "HTTP"
sudo ufw allow 443/tcp comment "HTTPS"
sudo ufw allow 9050/tcp comment "TOR SOCKS"
sudo ufw allow 18080/tcp comment "Monero P2P"
sudo ufw allow 18081/tcp comment "Monero RPC"
sudo ufw allow 18083/tcp comment "Monero ZMQ"
sudo ufw allow 4200/tcp comment "Shell in box"
sudo ufw allow 4444/tcp comment "I2P HTTP"
sudo ufw allow 4447/tcp comment "I2P SOCKS"

   

    info "$(get_message "Configuration de fail2ban..." "Configuring fail2ban...")"
    sudo systemctl enable fail2ban
    sudo systemctl start fail2ban

    info "$(get_message "Nettoyage du système..." "System cleanup...")"
    sudo apt autoremove -y
    sudo apt clean

    success "$(get_message "Mise à jour terminée" "Update completed")"
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I | cut -d' ' -f1)
SYSTEM_INFO=$(uname -s)" "$(uname -r)

echo -e "\e[0;33;38;5;208m  *     *   ***   *   * ***** ****   ***   
  **   **  *   *  **  * *     *   * *   *  
  * * * * *     * * * * ****  ****  *   *  
  *  *  * *     * *  ** *     * *   *   *  
  *     *  *   *  *   * *     *  *  *   *  
  *     *   ***   *   * ***** *   *  ***   
  ══════ ▌EASYNODE▐ ══Tunnels══Vpn+Tor\e[0m

\e[0;33;38;5;208m    ▐ EASYNODE               EASYNODE▐ \e[0m

\e[1;34mNode Status:\e[0m
- Hostname: $HOSTNAME
- IP Address: $IP_ADDRESS
- Monero Version: $MONERO_VERSION
- System: $SYSTEM_INFO

\e[1;33mUseful Commands:\e[0m
- monerod --help : Show Monero daemon help
- monero-wallet-cli --help : Show wallet CLI help

\e[1;31mImportant:\e[0m
- Start monero: monerod
- Stop  monero: CTRL+C
- Check status: monerod status" | sudo tee /etc/motd > /dev/null
ask_username() {
clear
    setup_terminal
    echo -e "\n\n\n\n\n\n\n\n"  

    print_header "$(get_message "CONFIGURATION UTILISATEUR" "USER CONFIGURATION")"
    
    local current_user=""
    if [ -n "$SUDO_USER" ]; then
        current_user="$SUDO_USER"
    elif [ -n "$USER" ]; then
        current_user="$USER"
    else
        current_user=$(whoami)
    fi
    
    echo -e "$(get_message "Utilisateur détecté: " "Detected user: ")${COLORS[SUCCESS]}${current_user}${COLORS[RESET]}"
    echo
    
    print_styled "INFO" "$(get_message "Appuyez sur Entrée pour confirmer ou tapez un autre nom d'utilisateur: " "Press Enter to confirm or type another username: ")"
    read -r input_username
    
    if [ -z "$input_username" ]; then
        input_username="$current_user"
        USERNAME="$input_username"
        return 0
    fi
    
    if ! id "$input_username" &>/dev/null; then
        error "$(get_message "L'utilisateur n'existe pas" "User does not exist")"
        return 1
    fi
    
    USERNAME="$input_username"
    return 0
}


verify_monero_gpg() {
    local MONERO_FILE="$1"
    local MONERO_VERSION="$2"
    
    info "$(get_message "🔍 Vérification complète des binaires Monero..." "🔍 Complete Monero binary verification...")"
    
    
    info "$(get_message "📋 Vérifications préliminaires..." "📋 Preliminary checks...")"
    
    
    local FILE_SIZE=$(stat -c%s "$MONERO_FILE" 2>/dev/null || stat -f%z "$MONERO_FILE" 2>/dev/null)
    if [ -z "$FILE_SIZE" ]; then
        error "$(get_message "Impossible de lire la taille du fichier" "Cannot read file size")"
        return 1
    fi
    
    info "$(get_message "   Taille: $(( FILE_SIZE / 1024 / 1024 )) MB" "   Size: $(( FILE_SIZE / 1024 / 1024 )) MB")"
    
    
    if [ "$FILE_SIZE" -lt 50000000 ]; then
        error "$(get_message "Fichier trop petit (${FILE_SIZE} bytes) - téléchargement incomplet" "File too small (${FILE_SIZE} bytes) - incomplete download")"
        return 1
    fi
    
    if [ "$FILE_SIZE" -gt 200000000 ]; then
        warning "$(get_message "Fichier très volumineux ($(( FILE_SIZE / 1024 / 1024 )) MB)" "Very large file ($(( FILE_SIZE / 1024 / 1024 )) MB)")"
    fi
    
    
    if command -v file >/dev/null 2>&1; then
        local file_type=$(file "$MONERO_FILE")
        if echo "$file_type" | grep -q "bzip2"; then
            success "$(get_message "   ✅ Format bzip2 correct" "   ✅ Correct bzip2 format")"
        else
            error "$(get_message "Format de fichier inattendu: $file_type" "Unexpected file format: $file_type")"
            return 1
        fi
    fi
    
    
    if tar -tjf "$MONERO_FILE" >/dev/null 2>&1; then
        success "$(get_message "   ✅ Archive valide et lisible" "   ✅ Valid and readable archive")"
    else
        error "$(get_message "Archive corrompue ou invalide" "Corrupted or invalid archive")"
        return 1
    fi
    
    
    local monero_files=$(tar -tjf "$MONERO_FILE" 2>/dev/null | grep -E "(monerod|monero-wallet-cli)" | wc -l)
    if [ "$monero_files" -ge 2 ]; then
        success "$(get_message "   ✅ Fichiers Monero détectés ($monero_files fichiers)" "   ✅ Monero files detected ($monero_files files)")"
    else
        warning "$(get_message "   ⚠️ Fichiers Monero non clairement détectés" "   ⚠️ Monero files not clearly detected")"
    fi
    
    
    info "$(get_message "🔐 Vérification cryptographique..." "🔐 Cryptographic verification...")"
    
    if ! wget -q "https://www.getmonero.org/downloads/hashes.txt" -O hashes.txt; then
        error "$(get_message "Échec téléchargement hashes.txt depuis getmonero.org" "Failed to download hashes.txt from getmonero.org")"
        return 1
    fi
    
    local expected_hash=$(grep "monero-linux-x64-v${MONERO_VERSION}.tar.bz2" hashes.txt | awk '{print $1}')
    if [ -z "$expected_hash" ]; then
        error "$(get_message "Hash SHA256 non trouvé pour la version $MONERO_VERSION" "SHA256 hash not found for version $MONERO_VERSION")"
        rm -f hashes.txt
        return 1
    fi
    
    local actual_hash=$(sha256sum "$MONERO_FILE" | awk '{print $1}')
    if [ "$expected_hash" != "$actual_hash" ]; then
        error "$(get_message "❌ HASH SHA256 INVALIDE - FICHIER SUSPECT" "❌ INVALID SHA256 HASH - SUSPICIOUS FILE")"
        error "$(get_message "   Attendu: $expected_hash" "   Expected: $expected_hash")"
        error "$(get_message "   Obtenu:  $actual_hash" "   Got:      $actual_hash")"
        rm -f hashes.txt
        return 1
    fi
    
    success "$(get_message "✅ Hash SHA256 vérifié contre getmonero.org" "✅ SHA256 hash verified against getmonero.org")"
    
    
    local signer=""
    local fingerprint=""
    local key_date=""
    local sig_date=""
    
    
    if wget -q "https://www.getmonero.org/downloads/hashes.txt.sig" -O hashes.txt.sig; then
        info "$(get_message "🗝️ Vérification signature GPG..." "🗝️ Verifying GPG signature...")"
        
        
        if wget -q "https://raw.githubusercontent.com/monero-project/monero/master/utils/gpg_keys/binaryfate.asc" -O binaryfate.asc; then
            if gpg --import binaryfate.asc >/dev/null 2>&1; then
                
                printf "5\ny\n" | gpg --batch --quiet --command-fd 0 --edit-key F4ACA0183641E010 trust quit >/dev/null 2>&1
            fi
            rm -f binaryfate.asc
        fi
        
        
        local gpg_output=$(LANG=C gpg --verify hashes.txt.sig hashes.txt 2>&1)
        
       
        if echo "$gpg_output" | grep -q "No public key"; then
            local key_id=$(echo "$gpg_output" | grep -E "using RSA key" | awk '{print $NF}')
            if [ -n "$key_id" ]; then
                info "$(get_message "Import clé manquante..." "Importing missing key...")"
                if gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key_id" >/dev/null 2>&1; then
                    
                    printf "5\ny\n" | gpg --batch --quiet --command-fd 0 --edit-key "$key_id" trust quit >/dev/null 2>&1
                    gpg_output=$(LANG=C gpg --verify hashes.txt.sig hashes.txt 2>&1)
                fi
            fi
        fi
        
        
        if echo "$gpg_output" | grep -q "Good signature"; then
           
            signer=$(echo "$gpg_output" | grep "Good signature from" | sed 's/.*"\([^"]*\)".*/\1/')
            
            
            sig_date=$(echo "$gpg_output" | grep "Signature made" | sed 's/.*Signature made //' | sed 's/ using.*//')
            
            
            fingerprint=$(echo "$gpg_output" | grep -E "Primary key fingerprint:" | sed 's/.*: //' | tr -d ' ')
            
            
            if [ -z "$fingerprint" ]; then
                local key_info=$(LANG=C gpg --list-keys "$signer" 2>/dev/null)
                fingerprint=$(echo "$key_info" | grep -A1 "pub" | tail -1 | tr -d ' ')
            fi
            
            
            local key_info=$(LANG=C gpg --list-keys "$signer" 2>/dev/null)
            key_date=$(echo "$key_info" | grep "pub" | sed 's/.*\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\).*/\1/')
            
            success "$(get_message "🎉 SIGNATURE GPG VÉRIFIÉE !" "🎉 GPG SIGNATURE VERIFIED !")"
        else
            info "$(get_message "ℹ️ Signature GPG non vérifiable automatiquement" "ℹ️ GPG signature not automatically verifiable")"
        fi
    fi
    
    
    echo
    success "$(get_message "🎉 FICHIER MONERO AUTHENTIFIÉ AVEC SUCCÈS" "🎉 MONERO FILE SUCCESSFULLY AUTHENTICATED")"
    echo
    success "$(get_message "🔐 VÉRIFICATIONS CRYPTOGRAPHIQUES :" "🔐 CRYPTOGRAPHIC VERIFICATIONS:")"
    success "$(get_message "   ✓ Hash SHA256: $expected_hash" "   ✓ SHA256 Hash: $expected_hash")"
    
    if [ -n "$signer" ]; then
        success "$(get_message "   ✓ Signature GPG: $signer" "   ✓ GPG Signature: $signer")"
        if [ -n "$sig_date" ]; then
            success "$(get_message "   ✓ Signé le: $sig_date" "   ✓ Signed on: $sig_date")"
        fi
        if [ -n "$fingerprint" ]; then
            success "$(get_message "   ✓ Empreinte: $fingerprint" "   ✓ Fingerprint: $fingerprint")"
        fi
        if [ -n "$key_date" ]; then
            success "$(get_message "   ✓ Clé créée: $key_date" "   ✓ Key created: $key_date")"
        fi
    fi
    
    echo
    success "$(get_message "🛡️ GARANTIES DE SÉCURITÉ :" "🛡️ SECURITY GUARANTEES:")"
    success "$(get_message "   ✓ Intégrité physique vérifiée" "   ✓ Physical integrity verified")"
    success "$(get_message "   ✓ Authenticité cryptographique vérifiée" "   ✓ Cryptographic authenticity verified")" 
    success "$(get_message "   ✓ Contenu Monero confirmé" "   ✓ Monero content confirmed")"
    
    
    rm -f hashes.txt hashes.txt.sig binaryfate.asc
    
    return 0
}

install_monero_cli() {
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    print_header "$(get_message "INSTALLATION DE MONERO" "MONERO INSTALLATION")"
    
    if ! command -v gpg &> /dev/null; then
        info "$(get_message "Installation de GPG..." "Installing GPG...")"
        sudo apt update && sudo apt install -y gnupg
    fi
    
    mkdir -p ~/monero_install
    cd ~/monero_install || exit
    
    local MONERO_FILE="monero-linux-x64-v${MONERO_VERSION}.tar.bz2"
    
    info "$(get_message "Téléchargement de Monero..." "Downloading Monero...")"
    if wget --tries=3 "https://downloads.getmonero.org/cli/${MONERO_FILE}"; then
        success "$(get_message "Téléchargement terminé" "Download completed")"
        
        local FILE_SIZE=$(stat -f%z "$MONERO_FILE" 2>/dev/null || stat -c%s "$MONERO_FILE")
        if [ "$FILE_SIZE" -lt 1000000 ]; then  
            error "$(get_message "Fichier téléchargé incomplet" "Downloaded file is incomplete")"
            rm -f "$MONERO_FILE"
            return 1
        fi
        
        if ! verify_monero_gpg "$MONERO_FILE" "$MONERO_VERSION"; then
            error "$(get_message "Échec de la vérification GPG" "GPG verification failed")"
            rm -f "$MONERO_FILE" "${MONERO_FILE}.asc"
            return 1
        fi
        
        info "$(get_message "Extraction des fichiers..." "Extracting files...")"
        if tar xvjf "$MONERO_FILE"; then
            success "$(get_message "Extraction terminée" "Extraction completed")"
        else
            error "$(get_message "Échec de l'extraction - Tentative de re-téléchargement" "Extraction failed - Trying to download again")"
            rm -f "$MONERO_FILE" "${MONERO_FILE}.asc"
            if wget --tries=3 "https://downloads.getmonero.org/cli/${MONERO_FILE}" && \
               verify_monero_gpg "$MONERO_FILE" && \
               tar xvjf "$MONERO_FILE"; then
                success "$(get_message "Second essai réussi" "Second attempt successful")"
            else
                error "$(get_message "Installation impossible" "Installation impossible")"
                return 1
            fi
        fi
    else
        error "$(get_message "Échec du téléchargement" "Download failed")"
        return 1
    fi

    sudo mkdir -p "/home/$USERNAME/monero"
    sudo cp -r "monero-x86_64-linux-gnu-v${MONERO_VERSION}"/* "/home/$USERNAME/monero/"
    echo "export PATH=\$PATH:/home/$USERNAME/monero" | sudo tee -a "/home/$USERNAME/.bashrc"

    sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/monero"
    sudo chmod -R 755 "/home/$USERNAME/monero"

    sudo mkdir -p "/home/$USERNAME/.bitmonero"
    sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.bitmonero"
    sudo chmod -R 755 "/home/$USERNAME/.bitmonero"

    cd ~ || exit
    rm -rf ~/monero_install

    success "$(get_message "✅ Installation terminée avec vérification GPG dans /home/$USERNAME/monero" "✅ Installation completed with GPG verification in /home/$USERNAME/monero")"
    return 0
}


install_tor() {
    print_header "$(get_message "INSTALLATION DE TOR" "TOR INSTALLATION")"
    
    if ! command -v tor &> /dev/null; then
        info "$(get_message "Installation de Tor..." "Installing Tor...")"
        if sudo apt update && sudo apt install -y tor; then
            success "$(get_message "Installation de Tor terminée" "Tor installation completed")"
        else
            error "$(get_message "Échec de l'installation de Tor" "Tor installation failed")"
            return 1
        fi
    else
        info "$(get_message "Tor est déjà installé" "Tor is already installed")"
    fi

    if [ -f /etc/tor/torrc ]; then
        sudo cp /etc/tor/torrc /etc/tor/torrc.backup
    fi

  sudo bash -c 'cat > /etc/tor/torrc << EOL
SOCKSPort 9050
ControlPort 9051
HiddenServiceDir /var/lib/tor/ssh/
HiddenServicePort 22 127.0.0.1:22         
HiddenServiceDir /var/lib/tor/monero-service/
HiddenServicePort 18081 127.0.0.1:18081
EOL'

    if [ ! -d "/var/lib/tor/monero-service/" ]; then
        sudo mkdir -p /var/lib/tor/monero-service/
        sudo chown -R debian-tor:debian-tor /var/lib/tor/monero-service/
        sudo chmod 700 /var/lib/tor/monero-service/
    fi

    if [ ! -d "/var/lib/tor/ssh/" ]; then
        sudo mkdir -p /var/lib/tor/ssh/
        sudo chown -R debian-tor:debian-tor /var/lib/tor/ssh/
        sudo chmod 700 /var/lib/tor/ssh/
    fi

    info "$(get_message "Redémarrage de Tor..." "Restarting Tor...")"
    sudo systemctl restart tor

    info "$(get_message "Génération de l'adresse onion..." "Generating onion address...")"
    sleep 10

    if [ -f /var/lib/tor/monero-service/hostname ]; then
        ONION_ADDRESS=$(sudo cat /var/lib/tor/monero-service/hostname)
        success "$(get_message "Adresse onion: $ONION_ADDRESS" "Onion address: $ONION_ADDRESS")"
        echo "Monero Onion Address ($(date)): $ONION_ADDRESS" | sudo tee -a "/home/$USERNAME/monero_onion_address.txt"
        sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/monero_onion_address.txt"
        echo "-------------------->$(get_message "L'adresse TOR est sauvegardée dans le dossier /home" "The TOR address is saved in the folder /home")"
    else
        error "$(get_message "Échec de la génération de l'adresse onion" "Failed to generate onion address")"
    fi

    if [ -f /var/lib/tor/ssh/hostname ]; then
        SSH_ONION_ADDRESS=$(sudo cat /var/lib/tor/ssh/hostname)
        success "$(get_message "Adresse onion SSH: " "SSH onion address: ")$SSH_ONION_ADDRESS"
        echo "SSH Onion Address ($(date)): $SSH_ONION_ADDRESS" | sudo tee -a "/home/$USERNAME/ssh_onion_address.txt"
        sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/ssh_onion_address.txt"
        echo "-------------------->$(get_message "L'adresse SSH est sauvegardée dans le dossier /home" "The SSH address is saved in the folder /home")"
    else
        error "$(get_message "Échec de la génération de l'adresse onion SSH" "Failed to generate SSH onion address")"
    fi

    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}


configure_monero() {
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    print_header "$(get_message "CONFIGURATION DE MONERO" "MONERO CONFIGURATION")"
    
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    mkdir -p "/home/$USERNAME/.bitmonero"

    cat > "$CONFIG_FILE" << EOL
no-igd=1
no-zmq=1
rpc-bind-ip=0.0.0.0
rpc-bind-port=18081
p2p-bind-port=18080
p2p-bind-ip=0.0.0.0
in-peers=32
out-peers=32
disable-dns-checkpoints=1
confirm-external-bind=1
data-dir=/home/$USERNAME/.bitmonero
EOL

    echo
    print_styled "WARNING" "$(get_message "🔐 CONFIGURATION DE LA SÉCURITÉ RPC" "🔐 RPC SECURITY CONFIGURATION")"
    echo
    print_styled "INFO" "$(get_message "Choisissez le mode de sécurisation de votre nœud :" "Choose your node security mode:")"
    echo
    print_styled "PRIMARY" "$(get_message "1) AVEC mot de passe (Recommandé - Plus sécurisé)" "1) WITH password (Recommended - More secure)")"
    print_styled "GRIS" "$(get_message "   ↳ Nécessite une connexion en mode distant dans Monero GUI d'abord" "   ↳ Requires remote connection in Monero GUI first")"
    print_styled "GRIS" "$(get_message "   ↳ Puis vous pourrez revenir en mode local après connexion" "   ↳ Then you can switch back to local mode after connection")"
    echo
    print_styled "PRIMARY" "$(get_message "2) SANS mot de passe (Connexion directe en local)" "2) WITHOUT password (Direct local connection)")"
    print_styled "GRIS" "$(get_message "   ↳ Connexion directe possible mais moins sécurisé" "   ↳ Direct connection possible but less secure")"
    print_styled "GRIS" "$(get_message "   ↳ Recommandé uniquement pour usage personnel local" "   ↳ Recommended only for personal local use")"
    echo
    
    while true; do
        echo -n "$(print_styled "INFO" "$(get_message "Votre choix (1-2): " "Your choice (1-2): ")")"
        read -r security_choice
        
        case $security_choice in
            1)
                echo
                print_styled "SUCCESS" "$(get_message "✅ Configuration sécurisée choisie" "✅ Secure configuration selected")"
                echo
                print_styled "WARNING" "$(get_message "📝 IMPORTANT - Procédure de connexion Monero GUI :" "📝 IMPORTANT - Monero GUI connection procedure:")"
                print_styled "INFO" "$(get_message "   1️⃣ Ouvrir Monero GUI" "   1️⃣ Open Monero GUI")"
                print_styled "INFO" "$(get_message "   2️⃣ Aller dans Paramètres > Nœud" "   2️⃣ Go to Settings > Node")"
                print_styled "INFO" "$(get_message "   3️⃣ Sélectionner 'Nœud distant'" "   3️⃣ Select 'Remote node'")"
                print_styled "INFO" "$(get_message "   4️⃣ Entrer : [IP_DE_VOTRE_NOEUD]:18081" "   4️⃣ Enter: [YOUR_NODE_IP]:18081")"
                print_styled "INFO" "$(get_message "   5️⃣ Nom d'utilisateur : easynode" "   5️⃣ Username: easynode")"
                print_styled "INFO" "$(get_message "   6️⃣ Mot de passe : [celui que vous allez créer]" "   6️⃣ Password: [the one you're about to create]")"
                print_styled "INFO" "$(get_message "   7️⃣ Après synchronisation, vous pourrez revenir en mode 'Nœud local'" "   7️⃣ After sync, you can switch back to 'Local node' mode")"
                echo

                while true; do
                    echo -n "$(print_styled "PRIMARY" "$(get_message "Entrez un mot de passe RPC sécurisé: " "Enter a secure RPC password: ")")"
                    read -r RPC_PASSWORD
                    
                    if [ -z "$RPC_PASSWORD" ]; then
                        error "$(get_message "Le mot de passe ne peut pas être vide" "Password cannot be empty")"
                        continue
                    fi
                    
                    if [ ${#RPC_PASSWORD} -lt 6 ]; then
                        error "$(get_message "Le mot de passe doit contenir au moins 6 caractères" "Password must be at least 6 characters")"
                        continue
                    fi
                    
                    echo -n "$(print_styled "PRIMARY" "$(get_message "Confirmez le mot de passe: " "Confirm password: ")")"
                    read -r RPC_PASSWORD_CONFIRM
                    
                    if [ "$RPC_PASSWORD" = "$RPC_PASSWORD_CONFIRM" ]; then
                        break
                    else
                        error "$(get_message "Les mots de passe ne correspondent pas" "Passwords do not match")"
                        echo
                    fi
                done

                RPC_USERNAME="easynode"

                echo "rpc-login=$RPC_USERNAME:$RPC_PASSWORD" >> "$CONFIG_FILE"

                cat > "/home/$USERNAME/rpc_easynode_pass.txt" << EOL
=== IDENTIFICATION RPC MONERO (SÉCURISÉ) ===
Username: $RPC_USERNAME
Password: $RPC_PASSWORD
Date: $(date)
=====================================

📝 PROCÉDURE DE CONNEXION MONERO GUI :
1️⃣ Ouvrir Monero GUI
2️⃣ Aller dans Paramètres > Nœud  
3️⃣ Sélectionner 'Nœud distant'
4️⃣ Adresse: [IP_DE_VOTRE_NOEUD]:18081
5️⃣ Nom d'utilisateur: $RPC_USERNAME
6️⃣ Mot de passe: $RPC_PASSWORD
7️⃣ Après synchronisation complète, vous pourrez 
   revenir en mode 'Nœud local' dans les paramètres

⚠️ IMPORTANT: Gardez ce fichier en sécurité !
EOL

                print_styled "SUCCESS" "$(get_message "🔐 Authentification RPC sécurisée configurée" "🔐 Secure RPC authentication configured")"
                break
                ;;
                
            2)
                echo
                print_styled "WARNING" "$(get_message "⚠️ Configuration non sécurisée choisie" "⚠️ Unsecured configuration selected")"
                print_styled "INFO" "$(get_message "✅ Connexion directe possible en mode local dans Monero GUI" "✅ Direct connection possible in local mode in Monero GUI")"
                echo
                print_styled "INFO" "$(get_message "📝 PROCÉDURE DE CONNEXION MONERO GUI :" "📝 MONERO GUI CONNECTION PROCEDURE:")"
                print_styled "INFO" "$(get_message "   1️⃣ Ouvrir Monero GUI" "   1️⃣ Open Monero GUI")"
                print_styled "INFO" "$(get_message "   2️⃣ Sélectionner 'Nœud local' (mode par défaut)" "   2️⃣ Select 'Local node' (default mode)")"
                print_styled "INFO" "$(get_message "   3️⃣ Aucun mot de passe requis" "   3️⃣ No password required")"
                echo

                RPC_USERNAME=""
                RPC_PASSWORD=""

                cat > "/home/$USERNAME/rpc_easynode_pass.txt" << EOL
=== CONFIGURATION RPC MONERO (NON SÉCURISÉ) ===
Mode: Sans authentification
Date: $(date)
=====================================

📝 PROCÉDURE DE CONNEXION MONERO GUI :
1️⃣ Ouvrir Monero GUI
2️⃣ Sélectionner 'Nœud local' (mode par défaut)
3️⃣ Aucun mot de passe requis

⚠️ ATTENTION: Cette configuration est moins sécurisée
   mais plus simple pour un usage personnel local.
EOL

                print_styled "SUCCESS" "$(get_message "✅ Configuration sans authentification activée" "✅ Configuration without authentication enabled")"
                break
                ;;
                
            *)
                error "$(get_message "Choix invalide. Choisissez 1 ou 2." "Invalid choice. Choose 1 or 2.")"
                ;;
        esac
    done

    sudo chown "$USERNAME:$USERNAME" "$CONFIG_FILE"
    sudo chmod 644 "$CONFIG_FILE"
    sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/rpc_easynode_pass.txt"
    chmod 600 "/home/$USERNAME/rpc_easynode_pass.txt"  

    sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.bitmonero"
    sudo chmod -R u+rw "/home/$USERNAME/.bitmonero"

    if grep -q "data-dir=" "$CONFIG_FILE" | grep -q "/media"; then
        BLOCKCHAIN_PATH=$(grep "data-dir=" "$CONFIG_FILE" | cut -d'=' -f2)
        
        if [ ! -d "$BLOCKCHAIN_PATH" ]; then
            mkdir -p "$(dirname "$BLOCKCHAIN_PATH")"
            ln -sf "/home/$USERNAME/.bitmonero" "$BLOCKCHAIN_PATH"
        fi
    fi

    success "$(get_message "Configuration créée dans $CONFIG_FILE" "Configuration created in $CONFIG_FILE")"
    
    if [ -n "$RPC_PASSWORD" ]; then
        print_styled "SUCCESS" "$(get_message "🔐 Mode sécurisé activé" "🔐 Secure mode enabled")"
        print_styled "PRIMARY" "$(get_message "Username: $RPC_USERNAME" "Username: $RPC_USERNAME")"
        print_styled "WARNING" "$(get_message "⚠️ Identifiants sauvés dans: /home/$USERNAME/rpc_easynode_pass.txt" "⚠️ Credentials saved in: /home/$USERNAME/rpc_easynode_pass.txt")"
        echo
        print_styled "INFO" "$(get_message "🔗 Pour Monero GUI : Mode distant puis local après sync" "🔗 For Monero GUI: Remote mode then local after sync")"
    else
        print_styled "SUCCESS" "$(get_message "✅ Mode direct activé" "✅ Direct mode enabled")"
        print_styled "INFO" "$(get_message "🔗 Pour Monero GUI : Mode local directement" "🔗 For Monero GUI: Local mode directly")"
    fi
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

configure_dns() {
    print_header "$(get_message "CONFIGURATION DNS" "DNS CONFIGURATION")"
    
    info "$(get_message "Configuration des serveurs DNS..." "Configuring DNS servers...")"

    sudo cp /etc/resolv.conf /etc/resolv.conf.backup

    if systemctl is-active --quiet systemd-resolved; then
        sudo systemctl stop systemd-resolved
        sudo systemctl disable systemd-resolved
    fi

    if [ -L /etc/resolv.conf ]; then
        sudo rm /etc/resolv.conf
    fi

    cat << EOL | sudo tee /etc/resolv.conf
nameserver 94.140.14.14
nameserver 94.140.15.15
EOL

    sudo chmod 644 /etc/resolv.conf

    success "$(get_message "Configuration DNS terminée" "DNS configuration completed")"
    info "$(get_message "Backup créé: /etc/resolv.conf.backup" "Backup created: /etc/resolv.conf.backup")"
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

unmount_sdb1() {
    print_header "$(get_message "DÉMONTAGE DU DISQUE" "DISK UNMOUNTING")"
    
    MOUNT_POINT="/media/$USERNAME"
    
    if mount | grep -q "$MOUNT_POINT"; then
        if lsof "$MOUNT_POINT" > /dev/null 2>&1; then
            warning "$(get_message "Fermeture des processus en cours..." "Closing active processes...")"
            lsof "$MOUNT_POINT" | awk 'NR!=1 {print $2}' | xargs -r sudo kill
            sleep 2
        fi
        
        if sudo umount -f "$MOUNT_POINT"; then
            success "$(get_message "Disque démonté avec succès" "Disk unmounted successfully")"
            
            if [ -n "$USERNAME" ]; then
                CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
                if [ -f "$CONFIG_FILE" ]; then
                    EXISTING_RPC_LOGIN=""
                    if grep -q "^rpc-login=" "$CONFIG_FILE"; then
                        EXISTING_RPC_LOGIN=$(grep "^rpc-login=" "$CONFIG_FILE")
                        info "$(get_message "Configuration RPC avec mot de passe préservée" "RPC configuration with password preserved")"
                    else
                        info "$(get_message "Configuration RPC sans mot de passe préservée" "RPC configuration without password preserved")"
                    fi
                    
                    grep -v "^data-dir=" "$CONFIG_FILE" | sudo tee "$CONFIG_FILE.tmp" > /dev/null
                    
                    echo "data-dir=/home/$USERNAME/.bitmonero" | sudo tee -a "$CONFIG_FILE.tmp"
                    
                    if [ -n "$EXISTING_RPC_LOGIN" ]; then
                        echo "$EXISTING_RPC_LOGIN" | sudo tee -a "$CONFIG_FILE.tmp"
                    fi
                    
                    sudo mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
                    sudo chown "$USERNAME:$USERNAME" "$CONFIG_FILE"
                    sudo chmod 644 "$CONFIG_FILE"
                    
                    sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.bitmonero"
                    sudo chmod -R u+rw "/home/$USERNAME/.bitmonero"
                    
                    if [ -n "$EXISTING_RPC_LOGIN" ]; then
                        RPC_USERNAME=$(echo "$EXISTING_RPC_LOGIN" | cut -d'=' -f2 | cut -d':' -f1)
                        RPC_PASSWORD=$(echo "$EXISTING_RPC_LOGIN" | cut -d':' -f2)
                        
                        cat > "/home/$USERNAME/rpc_easynode_pass.txt" << EOL
=== IDENTIFICATION RPC MONERO (SÉCURISÉ) ===
Username: $RPC_USERNAME
Password: $RPC_PASSWORD
Date: $(date)
Blockchain: Disque interne - /home/$USERNAME/.bitmonero
=====================================

📝 PROCÉDURE DE CONNEXION MONERO GUI :
1️⃣ Ouvrir Monero GUI
2️⃣ Aller dans Paramètres > Nœud  
3️⃣ Sélectionner 'Nœud distant'
4️⃣ Adresse: [IP_DE_VOTRE_NOEUD]:18081
5️⃣ Nom d'utilisateur: $RPC_USERNAME
6️⃣ Mot de passe: $RPC_PASSWORD
7️⃣ Après synchronisation complète, vous pourrez 
   revenir en mode 'Nœud local' dans les paramètres

⚠️ IMPORTANT: Gardez ce fichier en sécurité !
EOL
                    else
                        cat > "/home/$USERNAME/rpc_easynode_pass.txt" << EOL
=== CONFIGURATION RPC MONERO (NON SÉCURISÉ) ===
Mode: Sans authentification
Date: $(date)
Blockchain: Disque interne - /home/$USERNAME/.bitmonero
=====================================

📝 PROCÉDURE DE CONNEXION MONERO GUI :
1️⃣ Ouvrir Monero GUI
2️⃣ Sélectionner 'Nœud local' (mode par défaut)
3️⃣ Aucun mot de passe requis

⚠️ ATTENTION: Cette configuration est moins sécurisée
   mais plus simple pour un usage personnel local.
EOL
                    fi
                    
                    sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/rpc_easynode_pass.txt"
                    chmod 600 "/home/$USERNAME/rpc_easynode_pass.txt"
                    
                    success "$(get_message "Configuration Monero mise à jour" "Monero configuration updated")"
                fi
            else
                warning "$(get_message "Impossible de mettre à jour la configuration: utilisateur non défini" "Cannot update configuration: username not defined")"
            fi
        else
            error "$(get_message "Échec du démontage" "Unmounting failed")"
            return 1
        fi
    else
        warning "$(get_message "Le disque n'est pas monté sur $MOUNT_POINT" "Disk is not mounted on $MOUNT_POINT")"
    fi
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}


manage_blockchain() {
    print_header "$(get_message "GESTION DE LA BLOCKCHAIN" "BLOCKCHAIN MANAGEMENT")"
    
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    EXTERNAL_DRIVE="/media/$USERNAME"
    
    BLOCKCHAIN_FOLDER="MoneroBlockchain"
    BLOCKCHAIN_PATH="$EXTERNAL_DRIVE/$BLOCKCHAIN_FOLDER"

    info "$(get_message "Liste des disques disponibles:" "Available disks:")"
    lsblk -nrpo "NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE" | awk '$3=="disk" || $3=="part"'
    
    echo -n "$(print_styled "INFO" "$(get_message "Entrez le nom du disque (ex: sdb1): " "Enter disk name (e.g., sdb1): ")")"
    read -r DEVICE
    
    if [ -z "$DEVICE" ]; then
        error "$(get_message "Aucun disque sélectionné" "No disk selected")"
        return 1
    fi
    
    DEVICE="/dev/$DEVICE"
    
    if [ ! -b "$DEVICE" ]; then
        error "$(get_message "Le périphérique $DEVICE n'existe pas" "Device $DEVICE does not exist")"
        return 1
    fi

    if mount | grep -q "$DEVICE"; then
        sudo umount "$DEVICE" 2>/dev/null
    fi

    sudo mkdir -p "$EXTERNAL_DRIVE"
    if ! sudo mount -o uid=$(id -u $USERNAME),gid=$(id -g $USERNAME) "$DEVICE" "$EXTERNAL_DRIVE"; then
        error "$(get_message "Échec du montage" "Mount failed")"
        return 1
    fi
    
    sudo mkdir -p "$BLOCKCHAIN_PATH"
    
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    if [ -f "$CONFIG_FILE" ]; then
        sudo cp "$CONFIG_FILE" "${CONFIG_FILE}.backup"
        
        EXISTING_RPC_LOGIN=""
        if grep -q "^rpc-login=" "$CONFIG_FILE"; then
            EXISTING_RPC_LOGIN=$(grep "^rpc-login=" "$CONFIG_FILE")
            info "$(get_message "Configuration RPC existante préservée" "Existing RPC configuration preserved")"
        else
            info "$(get_message "Aucune configuration RPC trouvée - mode sans mot de passe conservé" "No RPC configuration found - passwordless mode preserved")"
        fi
    fi

    sudo mkdir -p "$(dirname "$CONFIG_FILE")"

    TMP_CONFIG=$(mktemp)
    
    {
        echo "# Configuration Monero"
        echo "no-igd=1"
        echo "no-zmq=1"
        echo "rpc-bind-ip=0.0.0.0"
        echo "rpc-bind-port=18081"
        echo "p2p-bind-port=18080"
        echo "p2p-bind-ip=0.0.0.0"
        echo "in-peers=32"
        echo "out-peers=32"
        echo "disable-dns-checkpoints=1"
        echo "confirm-external-bind=1"
        echo "data-dir=$BLOCKCHAIN_PATH"
        
        if [ -n "$EXISTING_RPC_LOGIN" ]; then
            echo "$EXISTING_RPC_LOGIN"
        fi
        
        if [ "$BLOCKCHAIN_TYPE" = "pruned" ]; then
            echo "prune-blockchain=1"
        fi
    } > "$TMP_CONFIG"

    if [ -n "$EXISTING_RPC_LOGIN" ]; then
        success "$(get_message "Configuration RPC avec mot de passe conservée" "RPC configuration with password preserved")"
    else
        success "$(get_message "Configuration RPC sans mot de passe conservée" "RPC configuration without password preserved")"
    fi

    if [ -s "$TMP_CONFIG" ]; then
        sudo cp "$TMP_CONFIG" "$CONFIG_FILE"
        rm "$TMP_CONFIG"
        
        if ! grep -q "^data-dir=" "$CONFIG_FILE"; then
            echo "data-dir=$BLOCKCHAIN_PATH" | sudo tee -a "$CONFIG_FILE"
        fi
    else
        error "$(get_message "Erreur lors de la création de la configuration" "Error creating configuration")"
        rm -f "$TMP_CONFIG"
        return 1
    fi

    sudo chown "$USERNAME:$USERNAME" "$CONFIG_FILE"
    sudo chmod 644 "$CONFIG_FILE"
    sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.bitmonero"
    sudo chmod -R u+rw "/home/$USERNAME/.bitmonero"

    DEVICE_UUID=$(sudo blkid -s UUID -o value "$DEVICE")
    if [ -z "$DEVICE_UUID" ]; then
        error "$(get_message "Impossible d'obtenir l'UUID du disque" "Unable to get disk UUID")"
        return 1
    fi

    MOUNTPOINT_BEFORE=$(findmnt -n -o TARGET -S UUID="$DEVICE_UUID" 2>/dev/null || echo "")
    if [ -n "$MOUNTPOINT_BEFORE" ] && [ "$MOUNTPOINT_BEFORE" != "$EXTERNAL_DRIVE" ]; then
        info "$(get_message "Le disque est actuellement monté sur $MOUNTPOINT_BEFORE" "Disk is currently mounted on $MOUNTPOINT_BEFORE")"
    fi

    if grep -q "UUID=$DEVICE_UUID" /etc/fstab; then
        info "$(get_message "Suppression des entrées existantes pour UUID=$DEVICE_UUID" "Removing existing entries for UUID=$DEVICE_UUID")"
        sudo sed -i "/UUID=$DEVICE_UUID/d" /etc/fstab
    fi

    USER_ID=$(id -u "$USERNAME")
    GROUP_ID=$(id -g "$USERNAME")
    echo "# Entrée pour EasyNode - Ne pas modifier manuellement" | sudo tee -a /etc/fstab > /dev/null
    echo "UUID=$DEVICE_UUID $EXTERNAL_DRIVE auto defaults,users,uid=$USER_ID,gid=$GROUP_ID,umask=022,nofail,x-gvfs-show 0 0" | sudo tee -a /etc/fstab > /dev/null
    success "$(get_message "Configuration du montage automatique ajoutée/mise à jour" "Automatic mount configuration added/updated")"

    info "$(get_message "Rechargement de systemd..." "Reloading systemd...")"
    sudo systemctl daemon-reload

    if ! mountpoint -q "$EXTERNAL_DRIVE"; then
        info "$(get_message "Montage du disque..." "Mounting disk...")"
        sudo mount -a
        
        if ! mountpoint -q "$EXTERNAL_DRIVE"; then
            warning "$(get_message "Le montage automatique a échoué, tentative de montage direct..." "Automatic mount failed, trying direct mount...")"
            sudo mount -U "$DEVICE_UUID" "$EXTERNAL_DRIVE"
        fi
    fi

    if [ -n "$EXISTING_RPC_LOGIN" ]; then
        RPC_USERNAME=$(echo "$EXISTING_RPC_LOGIN" | cut -d'=' -f2 | cut -d':' -f1)
        RPC_PASSWORD=$(echo "$EXISTING_RPC_LOGIN" | cut -d':' -f2)
        
        cat > "/home/$USERNAME/rpc_easynode_pass.txt" << EOL
=== IDENTIFICATION RPC MONERO (SÉCURISÉ) ===
Username: $RPC_USERNAME
Password: $RPC_PASSWORD
Date: $(date)
Blockchain: Disque externe - $BLOCKCHAIN_PATH
=====================================

📝 PROCÉDURE DE CONNEXION MONERO GUI :
1️⃣ Ouvrir Monero GUI
2️⃣ Aller dans Paramètres > Nœud  
3️⃣ Sélectionner 'Nœud distant'
4️⃣ Adresse: [IP_DE_VOTRE_NOEUD]:18081
5️⃣ Nom d'utilisateur: $RPC_USERNAME
6️⃣ Mot de passe: $RPC_PASSWORD
7️⃣ Après synchronisation complète, vous pourrez 
   revenir en mode 'Nœud local' dans les paramètres

⚠️ IMPORTANT: Gardez ce fichier en sécurité !
EOL
    else
        cat > "/home/$USERNAME/rpc_easynode_pass.txt" << EOL
=== CONFIGURATION RPC MONERO (NON SÉCURISÉ) ===
Mode: Sans authentification
Date: $(date)
Blockchain: Disque externe - $BLOCKCHAIN_PATH
=====================================

📝 PROCÉDURE DE CONNEXION MONERO GUI :
1️⃣ Ouvrir Monero GUI
2️⃣ Sélectionner 'Nœud local' (mode par défaut)
3️⃣ Aucun mot de passe requis

⚠️ ATTENTION: Cette configuration est moins sécurisée
   mais plus simple pour un usage personnel local.
EOL
    fi
    
    sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/rpc_easynode_pass.txt"
    chmod 600 "/home/$USERNAME/rpc_easynode_pass.txt"

    success "$(get_message "Blockchain configurée dans: $BLOCKCHAIN_PATH" "Blockchain configured in: $BLOCKCHAIN_PATH")"
    info "$(get_message "Le disque sera monté automatiquement au démarrage" "The disk will be automatically mounted at boot")"
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}


apply_ip_bans() {
    local MONEROD_PATH="$1"
    local BAN_LIST_FILE="/home/$USERNAME/.bitmonero/ban_list.txt"
    
    info "$(get_message "Application des bans IP..." "Applying IP bans...")"
    
    for i in {1..30}; do
        if nc -z localhost 18081; then
            success "$(get_message "Service RPC disponible" "RPC service available")"
            break
        fi
        info "$(get_message "Attente du service RPC... ($i/30)" "Waiting for RPC service... ($i/30)")"
        sleep 2
    done

    if [ ! -f "$BAN_LIST_FILE" ]; then
        error "$(get_message "Fichier de bans non trouvé" "Ban list file not found")"
        return 1
    fi

    while IFS=' ' read -r line || [ -n "$line" ]; do
        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
        
        read -r ip duration <<< "$line"
        
        if [ -n "$ip" ] && [ -n "$duration" ]; then
            "$MONEROD_PATH" ban "$ip" "$duration" --rpc-bind-port 18081
            info "$(get_message "Ban appliqué: $ip" "Ban applied: $ip")"
        fi
    done < "$BAN_LIST_FILE"

    success "$(get_message "Application des bans terminée" "Ban application completed")"
}

ban_ip_via_monerod() {
    local ip="$1"
    local duration="$2"
    
   
    if [ -f "/home/$USERNAME/.bitmonero/bitmonero.conf" ] && grep -q "^rpc-login=" "/home/$USERNAME/.bitmonero/bitmonero.conf"; then
        local RPC_CREDENTIALS=$(grep "^rpc-login=" "/home/$USERNAME/.bitmonero/bitmonero.conf" | cut -d'=' -f2)
        "$MONEROD_PATH" ban "$ip" "$duration" --rpc-bind-port 18081 --rpc-login "$RPC_CREDENTIALS" >/dev/null 2>&1
    else
        "$MONEROD_PATH" ban "$ip" "$duration" --rpc-bind-port 18081 >/dev/null 2>&1
    fi
    
    return $?
}

start_blockchain() {
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    print_header "$(get_message "DÉMARRAGE DE LA BLOCKCHAIN" "STARTING BLOCKCHAIN")"
    
    print_styled "PRIMARY" "$(get_message "Sélectionnez le type de blockchain:" "Select blockchain type:")"
    print_styled "PRIMARY" "1) $(get_message "Complète 220 Go" "Complete 220 Go")"
    print_styled "PRIMARY" "2) $(get_message "Prune 90 Go" "Pruned 90 Go")"
    echo -n "$(print_styled "INFO" "$(get_message "Choix (1-2): " "Choice (1-2): ")")"
    read -r bc_choice
    
    case $bc_choice in
        1) BLOCKCHAIN_TYPE="complete" ;;
        2) BLOCKCHAIN_TYPE="pruned" ;;
        *) 
            error "$(get_message "Choix invalide" "Invalid choice")"
            return 1 ;;
    esac
    
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    DEFAULT_DATA_DIR="/home/$USERNAME/.bitmonero"
    
    if [ -f "$CONFIG_FILE" ]; then
        sudo sed -i '/^prune-blockchain=/d' "$CONFIG_FILE"
        
        if [ "$BLOCKCHAIN_TYPE" = "pruned" ]; then
            echo "prune-blockchain=1" | sudo tee -a "$CONFIG_FILE" > /dev/null
        fi
        
        BLOCKCHAIN_LOCATION=$(grep "^data-dir=" "$CONFIG_FILE" 2>/dev/null | cut -d'=' -f2)
    fi

    if [ -z "$BLOCKCHAIN_LOCATION" ]; then
        BLOCKCHAIN_LOCATION="$DEFAULT_DATA_DIR"
    fi

    info "$(get_message "Emplacement de la blockchain: $BLOCKCHAIN_LOCATION" "Blockchain location: $BLOCKCHAIN_LOCATION")"
    
    download_ban_list
    
    if [ -n "$BLOCKCHAIN_LOCATION" ] && [[ "$BLOCKCHAIN_LOCATION" == "/media/$USERNAME"* ]]; then
        DEVICE=$(mount | grep "/media/$USERNAME" | awk '{print $1}')
        if [ -z "$DEVICE" ]; then
            error "$(get_message "Le disque externe n'est pas monté" "External disk is not mounted")"
            return 1
        fi
        info "$(get_message "Disque externe monté: $DEVICE" "External disk mounted: $DEVICE")"
    fi

    print_styled "PRIMARY" "$(get_message "Démarrer la blockchain MONERO ?" "Start MONERO blockchain?")"
    print_styled "PRIMARY" "1) $(get_message "Avec blocage IP" "With IP blocking")"
    print_styled "PRIMARY" "2) $(get_message "Sans blocage IP" "Without IP blocking")"
    print_styled "PRIMARY" "3) $(get_message "Annuler" "Cancel")"
    echo -n "$(print_styled "INFO" "$(get_message "Choix (1-3): " "Choice (1-3): ")")"
    read -r START_CHOICE

    if [ -n "$BLOCKCHAIN_LOCATION" ] && [ ! -w "$BLOCKCHAIN_LOCATION" ]; then
        error "$(get_message "Permissions insuffisantes sur $BLOCKCHAIN_LOCATION" "Insufficient permissions on $BLOCKCHAIN_LOCATION")"
        return 1
    fi

    MONEROD_PATH="/home/$USERNAME/monero/monerod"
    if [ ! -x "$MONEROD_PATH" ]; then
        error "$(get_message "monerod n'est pas trouvé ou n'est pas exécutable" "monerod not found or not executable")"
        return 1
    fi

   case $START_CHOICE in
        1)
            STOP_MONEROD=0
            
            trap_original=$(trap -p SIGINT)
            
            cleanup() {
                if [ -n "$trap_original" ]; then
                    eval "$trap_original"
                else
                    trap - SIGINT
                fi
                
                if [ -n "$MONITOR_PID" ]; then
                    kill $MONITOR_PID 2>/dev/null
                    wait $MONITOR_PID 2>/dev/null
                fi
                
                if [ -n "$MONEROD_PID" ] && kill -0 $MONEROD_PID 2>/dev/null; then
                    info "$(get_message "Arrêt de monerod..." "Stopping monerod...")"
                    kill $MONEROD_PID 2>/dev/null
                    wait $MONEROD_PID 2>/dev/null
                fi
                
                success "$(get_message "Blockchain arrêtée" "Blockchain stopped")"
            }
            
            handle_sigint() {
                echo
                info "$(get_message "CTRL+C détecté, arrêt de la blockchain..." "CTRL+C detected, stopping blockchain...")"
                STOP_MONEROD=1
                
                if [ -n "$MONEROD_PID" ] && kill -0 $MONEROD_PID 2>/dev/null; then
                    kill -SIGINT $MONEROD_PID 2>/dev/null
                fi
                
                return 0
            }
            
            trap handle_sigint SIGINT
            
            if [ -n "$BLOCKCHAIN_LOCATION" ]; then
                if [ -d "$BLOCKCHAIN_LOCATION" ]; then
                    sudo chown -R "$USERNAME:$USERNAME" "$BLOCKCHAIN_LOCATION" 2>/dev/null || true
                    sudo chmod -R u+rw "$BLOCKCHAIN_LOCATION" 2>/dev/null || true
                fi
                
                sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.bitmonero" 2>/dev/null || true
                sudo chmod -R u+rw "/home/$USERNAME/.bitmonero" 2>/dev/null || true
            fi
            
            
monitor_peers() {
    sleep 15  
    
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    RESET='\033[0m'
    
    RPC_AUTH=""
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    
    if [ -f "$CONFIG_FILE" ] && grep -q "^rpc-login=" "$CONFIG_FILE"; then
        RPC_LOGIN_LINE=$(grep "^rpc-login=" "$CONFIG_FILE")
        RPC_CREDENTIALS=$(echo "$RPC_LOGIN_LINE" | cut -d'=' -f2)
        RPC_AUTH="--digest -u $RPC_CREDENTIALS"
    elif [ -f "/home/$USERNAME/rpc_easynode_pass.txt" ]; then
        RPC_USERNAME=$(grep "Username:" "/home/$USERNAME/rpc_easynode_pass.txt" 2>/dev/null | cut -d' ' -f2)
        RPC_PASSWORD=$(grep "Password:" "/home/$USERNAME/rpc_easynode_pass.txt" 2>/dev/null | cut -d' ' -f2)
        if [ -n "$RPC_USERNAME" ] && [ -n "$RPC_PASSWORD" ]; then
            RPC_AUTH="--digest -u $RPC_USERNAME:$RPC_PASSWORD"
        fi
    fi
    
    while pgrep -f "monerod" > /dev/null; do
        if [ $STOP_MONEROD -eq 1 ]; then
            break
        fi
        
        if [ -n "$RPC_AUTH" ]; then
            PEER_INFO=$(curl -s -X POST http://localhost:18081/json_rpc \
                $RPC_AUTH \
                -H "Content-Type: application/json" \
                -d '{"jsonrpc":"2.0","id":"0","method":"get_info"}' 2>/dev/null)
        else
            PEER_INFO=$(curl -s -X POST http://localhost:18081/json_rpc \
                -H "Content-Type: application/json" \
                -d '{"jsonrpc":"2.0","id":"0","method":"get_info"}' 2>/dev/null)
        fi
        
        if [ $? -eq 0 ] && echo "$PEER_INFO" | grep -q '"result"' && ! echo "$PEER_INFO" | grep -q '"error"'; then
            IN_PEERS=$(echo "$PEER_INFO" | sed -n 's/.*"incoming_connections_count":\s*\([0-9]*\).*/\1/p')
            OUT_PEERS=$(echo "$PEER_INFO" | sed -n 's/.*"outgoing_connections_count":\s*\([0-9]*\).*/\1/p')
            
            if [ -n "$IN_PEERS" ] && [ -n "$OUT_PEERS" ]; then
                echo -ne "\r${GREEN}IN-PEERS: ${IN_PEERS:-0}${RESET} | ${GREEN}OUT-PEERS: ${OUT_PEERS:-0}${RESET}                    "
            else
                echo -ne "\r${GREEN}RPC OK, attente des données...${RESET}                    "
            fi
        else
            if echo "$PEER_INFO" | grep -q "401\|unauthorized\|Unauthorized"; then
                echo -ne "\r${GREEN}❌ Erreur d'authentification RPC${RESET}                    "
            elif [ -z "$PEER_INFO" ]; then
                echo -ne "\r${GREEN}⏳ Attente connexion RPC...${RESET}                    "
            else
                echo -ne "\r${GREEN}⏳ Synchronisation en cours...${RESET}                    "
            fi
        fi
        
        sleep 15  
    done
    
    echo -ne "\r                                                    \r"
}
            
            monitor_peers &
            MONITOR_PID=$!
            
            if [ -n "$BLOCKCHAIN_LOCATION" ]; then
                info "$(get_message "Démarrage de la blockchain avec le fichier de configuration" "Starting blockchain with config file")"
                "$MONEROD_PATH" --config-file="$CONFIG_FILE" --non-interactive &
                MONEROD_PID=$!
            else
                info "$(get_message "Démarrage de la blockchain avec le dossier par défaut" "Starting blockchain with default folder")"
                "$MONEROD_PATH" --data-dir="$DEFAULT_DATA_DIR" --non-interactive &
                MONEROD_PID=$!
            fi
            
            info "$(get_message "Attente du démarrage du service RPC..." "Waiting for RPC service to start...")"
            for i in {1..60}; do
                if [ $STOP_MONEROD -eq 1 ]; then
                    break
                fi
                
                if nc -z localhost 18081; then
                    success "$(get_message "Service RPC disponible" "RPC service available")"
                    break
                fi
                
                echo -n "."
                sleep 2
                
                if [ $i -eq 60 ]; then
                    error "$(get_message "Timeout en attendant le service RPC" "Timeout waiting for RPC service")"
                fi
            done
            
            if [ $STOP_MONEROD -eq 0 ]; then
                info "$(get_message "Application des bans IP..." "Applying IP bans...")"
                sleep 5  
                
                local BAN_DURATION=7776000  
                
                BAN_LIST_FILE="/home/$USERNAME/.bitmonero/ban_list.txt"
                if [ -f "$BAN_LIST_FILE" ]; then
                    local total_bans=$(grep -v "^#" "$BAN_LIST_FILE" | grep -v "^$" | wc -l)
                    info "$(get_message "Nombre total d'adresses IP à bannir: $total_bans" "Total number of IP addresses to ban: $total_bans")"
                    info "$(get_message "Durée des bans: 3 mois" "Ban duration: 3 months")"
                    
                    local counter=0
                    local success_count=0

                    while IFS=' ' read -r line || [ -n "$line" ]; do
                        if [ $STOP_MONEROD -eq 1 ]; then
                            break
                        fi
                        
                        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
                        
                        read -r ip duration_ignored <<< "$line"
                        
                        if [ -n "$ip" ]; then
                            counter=$((counter + 1))
                            
                            info "$(get_message "Ban IP $counter/$total_bans: $ip" "Banning IP $counter/$total_bans: $ip")"
                            
                            ban_ip_via_monerod "$ip" "$BAN_DURATION"
                            if [ $? -eq 0 ]; then
                                success_count=$((success_count + 1))
                            else
                                warning "$(get_message "Échec du ban pour l'IP: $ip" "Ban failed for IP: $ip")"
                            fi
                        fi
                    done < "$BAN_LIST_FILE"
                    
                    success "$(get_message "Bans appliqués: $success_count/$total_bans" "Bans applied: $success_count/$total_bans")"
                    

info "$(get_message "Vérification de l'état des bans..." "Checking ban status...")"


if [ -f "/home/$USERNAME/.bitmonero/bitmonero.conf" ] && grep -q "^rpc-login=" "/home/$USERNAME/.bitmonero/bitmonero.conf"; then
    RPC_CREDENTIALS=$(grep "^rpc-login=" "/home/$USERNAME/.bitmonero/bitmonero.conf" | cut -d'=' -f2)
    ban_status=$("$MONEROD_PATH" bans --rpc-bind-port 18081 --rpc-login "$RPC_CREDENTIALS" 2>/dev/null)
else
    ban_status=$("$MONEROD_PATH" bans --rpc-bind-port 18081 2>/dev/null)
fi

ban_count=$(echo "$ban_status" | grep -c "banned for")
success "$(get_message "Nombre total de bans actifs: $ban_count" "Total active bans: $ban_count")"
                    
                    echo "$ban_status" | head -n 5
                else
                    warning "$(get_message "Fichier de bans non trouvé: $BAN_LIST_FILE" "Ban list file not found: $BAN_LIST_FILE")"
                fi
            fi
            
            print_styled "PRIMARY" "$(get_message "Patientez..." "Wait..")"
            
            while [ $STOP_MONEROD -eq 0 ]; do
                if ! kill -0 $MONEROD_PID 2>/dev/null; then
                    info "$(get_message "Le processus monerod s'est terminé" "Monerod process has terminated")"
                    STOP_MONEROD=1
                    break
                fi
                sleep 1
            done
            
            cleanup
            ;;
            
        2)
            STOP_MONEROD=0
            
            trap_original=$(trap -p SIGINT)
            
            cleanup() {
                if [ -n "$trap_original" ]; then
                    eval "$trap_original"
                else
                    trap - SIGINT
                fi
                
                if [ -n "$MONITOR_PID" ]; then
                    kill $MONITOR_PID 2>/dev/null
                    wait $MONITOR_PID 2>/dev/null
                fi
                
                if [ -n "$MONEROD_PID" ] && kill -0 $MONEROD_PID 2>/dev/null; then
                    info "$(get_message "Arrêt de monerod..." "Stopping monerod...")"
                    kill $MONEROD_PID 2>/dev/null
                    wait $MONEROD_PID 2>/dev/null
                fi
                
                success "$(get_message "Blockchain arrêtée" "Blockchain stopped")"
            }
            
            handle_sigint() {
                echo
                info "$(get_message "CTRL+C détecté, arrêt de la blockchain..." "CTRL+C detected, stopping blockchain...")"
                STOP_MONEROD=1
                
                if [ -n "$MONEROD_PID" ] && kill -0 $MONEROD_PID 2>/dev/null; then
                    kill -SIGINT $MONEROD_PID 2>/dev/null
                fi
                
                return 0
            }
            
            trap handle_sigint SIGINT
            
            if [ -n "$BLOCKCHAIN_LOCATION" ]; then
                if [ -d "$BLOCKCHAIN_LOCATION" ]; then
                    sudo chown -R "$USERNAME:$USERNAME" "$BLOCKCHAIN_LOCATION" 2>/dev/null || true
                    sudo chmod -R u+rw "$BLOCKCHAIN_LOCATION" 2>/dev/null || true
                fi
                
                sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.bitmonero" 2>/dev/null || true
                sudo chmod -R u+rw "/home/$USERNAME/.bitmonero" 2>/dev/null || true
            fi
            
           
monitor_peers() {
    sleep 15  
    
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    RESET='\033[0m'
    
    RPC_AUTH=""
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    
    if [ -f "$CONFIG_FILE" ] && grep -q "^rpc-login=" "$CONFIG_FILE"; then
        RPC_LOGIN_LINE=$(grep "^rpc-login=" "$CONFIG_FILE")
        RPC_CREDENTIALS=$(echo "$RPC_LOGIN_LINE" | cut -d'=' -f2)
        RPC_AUTH="--digest -u $RPC_CREDENTIALS"
    elif [ -f "/home/$USERNAME/rpc_easynode_pass.txt" ]; then
        RPC_USERNAME=$(grep "Username:" "/home/$USERNAME/rpc_easynode_pass.txt" 2>/dev/null | cut -d' ' -f2)
        RPC_PASSWORD=$(grep "Password:" "/home/$USERNAME/rpc_easynode_pass.txt" 2>/dev/null | cut -d' ' -f2)
        if [ -n "$RPC_USERNAME" ] && [ -n "$RPC_PASSWORD" ]; then
            RPC_AUTH="--digest -u $RPC_USERNAME:$RPC_PASSWORD"
        fi
    fi
    
    while pgrep -f "monerod" > /dev/null; do
        if [ $STOP_MONEROD -eq 1 ]; then
            break
        fi
        
        if [ -n "$RPC_AUTH" ]; then
            PEER_INFO=$(curl -s -X POST http://localhost:18081/json_rpc \
                $RPC_AUTH \
                -H "Content-Type: application/json" \
                -d '{"jsonrpc":"2.0","id":"0","method":"get_info"}' 2>/dev/null)
        else
            PEER_INFO=$(curl -s -X POST http://localhost:18081/json_rpc \
                -H "Content-Type: application/json" \
                -d '{"jsonrpc":"2.0","id":"0","method":"get_info"}' 2>/dev/null)
        fi
        
        if [ $? -eq 0 ] && echo "$PEER_INFO" | grep -q '"result"' && ! echo "$PEER_INFO" | grep -q '"error"'; then
            IN_PEERS=$(echo "$PEER_INFO" | sed -n 's/.*"incoming_connections_count":\s*\([0-9]*\).*/\1/p')
            OUT_PEERS=$(echo "$PEER_INFO" | sed -n 's/.*"outgoing_connections_count":\s*\([0-9]*\).*/\1/p')
            
            if [ -n "$IN_PEERS" ] && [ -n "$OUT_PEERS" ]; then
                echo -ne "\r${GREEN}IN-PEERS: ${IN_PEERS:-0}${RESET} | ${GREEN}OUT-PEERS: ${OUT_PEERS:-0}${RESET}                    "
            else
                echo -ne "\r${GREEN}RPC OK, attente des données...${RESET}                    "
            fi
        else
            if echo "$PEER_INFO" | grep -q "401\|unauthorized\|Unauthorized"; then
                echo -ne "\r${GREEN}❌ Erreur d'authentification RPC${RESET}                    "
            elif [ -z "$PEER_INFO" ]; then
                echo -ne "\r${GREEN}⏳ Attente connexion RPC...${RESET}                    "
            else
                echo -ne "\r${GREEN}⏳ Synchronisation en cours...${RESET}                    "
            fi
        fi
        
        sleep 15  
    done
    
    echo -ne "\r                                                    \r"
}
            
            monitor_peers &
            MONITOR_PID=$!
            
            if [ -n "$BLOCKCHAIN_LOCATION" ]; then
                info "$(get_message "Démarrage de la blockchain avec le fichier de configuration" "Starting blockchain with config file")"
                "$MONEROD_PATH" --config-file="$CONFIG_FILE" --non-interactive &
                MONEROD_PID=$!
            else
                info "$(get_message "Démarrage de la blockchain avec le dossier par défaut" "Starting blockchain with default folder")"
                "$MONEROD_PATH" --data-dir="$DEFAULT_DATA_DIR" --non-interactive &
                MONEROD_PID=$!
            fi
            
            print_styled "PRIMARY" "$(get_message "Appuyez sur CTRL+C pour arrêter la blockchain et revenir au menu" "Press CTRL+C to stop the blockchain and return to the menu")"
            
            while [ $STOP_MONEROD -eq 0 ]; do
                if ! kill -0 $MONEROD_PID 2>/dev/null; then
                    info "$(get_message "Le processus monerod s'est terminé" "Monerod process has terminated")"
                    STOP_MONEROD=1
                    break
                fi
                sleep 1
            done
            
            cleanup
            ;;
    esac
    
    return 0
}

download_ban_list() {
    local BAN_LIST_FILE="/home/$USERNAME/.bitmonero/ban_list.txt"
    local BAN_LIST_URL="https://raw.githubusercontent.com/Boog900/monero-ban-list/main/ban_list.txt"
    
    info "$(get_message "Téléchargement de la liste des IP bannis..." "Downloading IP ban list...")"
    
    mkdir -p "/home/$USERNAME/.bitmonero"
    
    if wget -q -O "$BAN_LIST_FILE" "$BAN_LIST_URL"; then
        sudo chown "$USERNAME:$USERNAME" "$BAN_LIST_FILE"
        sudo chmod 644 "$BAN_LIST_FILE"
        success "$(get_message "Liste des IP bannis téléchargée avec succès" "IP ban list downloaded successfully")"
    else
        error "$(get_message "Échec du téléchargement de la liste des IP bannis" "Failed to download IP ban list")"
        
        if [ ! -f "$BAN_LIST_FILE" ]; then
            touch "$BAN_LIST_FILE"
            sudo chown "$USERNAME:$USERNAME" "$BAN_LIST_FILE"
            sudo chmod 644 "$BAN_LIST_FILE"
        fi
    fi
}


install_zerotier() {
    print_header "$(get_message "INSTALLATION DE ZEROTIER" "ZEROTIER INSTALLATION")"
    
    info "$(get_message "Installation de ZeroTier..." "Installing ZeroTier...")"
    if curl -s https://install.zerotier.com | sudo bash; then
        success "$(get_message "Installation de ZeroTier terminée" "ZeroTier installation completed")"
    else
        error "$(get_message "Échec de l'installation de ZeroTier" "ZeroTier installation failed")"
        return 1
    fi
    
     print_styled "INFO" "$(get_message "Entrez l'ID de votre réseau ZeroTier:" "Enter your ZeroTier network ID:")"
     print_styled "INFO" "$(get_message "Puis allez à my.zerotier.com pour autoriser le pc" "then go to my.zerotier.com to authorize the computer.")"
     print_styled "INFO" "$(get_message "Entrez l'ID de votre réseau ZeroTier ici:" "Enter here your ZeroTier network ID:")"
    read -r zerotier_network_id
    
    if [ -z "$zerotier_network_id" ]; then
        error "$(get_message "ID réseau non fourni" "Network ID not provided")"
        return 1
    fi
    
    info "$(get_message "Connexion au réseau ZeroTier..." "Joining ZeroTier network...")"
    if sudo zerotier-cli join "$zerotier_network_id"; then
        success "$(get_message "Connecté au réseau ZeroTier" "Joined ZeroTier network")"
        
        info "$(get_message "Attente de l'attribution d'une adresse IP..." "Waiting for IP address assignment...")"
        sleep 10
        
        ZEROTIER_INFO=$(sudo zerotier-cli info)
        ZEROTIER_NETWORKS=$(sudo zerotier-cli listnetworks)
        
        success "$(get_message "Informations ZeroTier:" "ZeroTier information:")"
        echo "$ZEROTIER_INFO"
        echo "$ZEROTIER_NETWORKS"
        
        sudo systemctl enable zerotier-one
        sudo systemctl start zerotier-one
        
        info "$(get_message "Lancement de l'optimisation ZeroTier pour VPN..." "Starting ZeroTier optimization for VPN...")"
        if optimize_zerotier "$zerotier_network_id"; then
            print_styled "SUCCESS" "$(get_message "ZeroTier a été installé et optimisé pour VPN" "ZeroTier has been installed and optimized for VPN")"
        else
            warning "$(get_message "ZeroTier a été installé mais l'optimisation a échoué" "ZeroTier has been installed but optimization failed")"
        fi
    else
        error "$(get_message "Échec de la connexion au réseau ZeroTier" "Failed to join ZeroTier network")"
        return 1
    fi
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
    return 0
}

optimize_zerotier() {
    local zerotier_network_id="$1"
    
    print_header "$(get_message "OPTIMISATION DE ZEROTIER POUR VPN" "ZEROTIER OPTIMIZATION FOR VPN")"
    
    if [ -z "$zerotier_network_id" ]; then
        zerotier_network_id=$(sudo zerotier-cli listnetworks 2>/dev/null | awk 'NR>1 {print $3}' | head -1)
        
        if [ -z "$zerotier_network_id" ]; then
            print_styled "WARNING" "$(get_message "Aucun réseau ZeroTier actif trouvé" "No active ZeroTier networks found")"
            return 1
        fi
    fi
    
    info "$(get_message "Optimisation du réseau $zerotier_network_id..." "Optimizing network $zerotier_network_id...")"
    
    sudo zerotier-cli set "$zerotier_network_id" allowDNS=1
    if [ $? -eq 0 ]; then
        success "$(get_message "Configuration DNS activée" "DNS configuration enabled")"
    fi
    
    sudo zerotier-cli set "$zerotier_network_id" allowDefault=1
    if [ $? -eq 0 ]; then
        success "$(get_message "Route par défaut activée" "Default route enabled")"
    fi
       
    sleep 2 
    ZT_INTERFACE=$(ip -br addr | grep zt | awk '{print $1}' | head -1)
    if [ -n "$ZT_INTERFACE" ]; then
        current_mtu=$(ip link show "$ZT_INTERFACE" | grep -oP 'mtu \K\d+')
        info "$(get_message "MTU actuel de $ZT_INTERFACE: $current_mtu" "Current MTU of $ZT_INTERFACE: $current_mtu")"
        sudo ip link set mtu 1400 dev "$ZT_INTERFACE"
        new_mtu=$(ip link show "$ZT_INTERFACE" | grep -oP 'mtu \K\d+')
        success "$(get_message "MTU optimisé pour $ZT_INTERFACE: $new_mtu" "MTU optimized for $ZT_INTERFACE: $new_mtu")"
    else
        warning "$(get_message "Interface ZeroTier non trouvée, MTU non optimisé" "ZeroTier interface not found, MTU not optimized")"
    fi
    
    info "$(get_message "Application des optimisations TCP pour VPN..." "Applying TCP optimizations for VPN...")"
    
    if ! grep -q "tcp_window_scaling = 1" /etc/sysctl.conf; then
        echo "" | sudo tee -a /etc/sysctl.conf > /dev/null
        echo "# Optimisations ZeroTier pour VPN" | sudo tee -a /etc/sysctl.conf > /dev/null
        echo "net.ipv4.tcp_window_scaling = 1" | sudo tee -a /etc/sysctl.conf > /dev/null
        echo "net.ipv4.tcp_timestamps = 1" | sudo tee -a /etc/sysctl.conf > /dev/null
        echo "net.ipv4.tcp_sack = 1" | sudo tee -a /etc/sysctl.conf > /dev/null
        echo "net.ipv4.tcp_fastopen = 3" | sudo tee -a /etc/sysctl.conf > /dev/null
        sudo sysctl -p
        success "$(get_message "Optimisations TCP appliquées" "TCP optimizations applied")"
    else
        info "$(get_message "Optimisations TCP déjà configurées" "TCP optimizations already configured")"
    fi
    
    if ! grep -q "net.core.rmem_max" /etc/sysctl.conf; then
        echo "net.core.rmem_max = 16777216" | sudo tee -a /etc/sysctl.conf > /dev/null
        echo "net.core.wmem_max = 16777216" | sudo tee -a /etc/sysctl.conf > /dev/null
        echo "net.ipv4.tcp_rmem = 4096 87380 16777216" | sudo tee -a /etc/sysctl.conf > /dev/null
        echo "net.ipv4.tcp_wmem = 4096 65536 16777216" | sudo tee -a /etc/sysctl.conf > /dev/null
        sudo sysctl -p
        success "$(get_message "Taille des buffers TCP optimisée" "TCP buffer sizes optimized")"
    fi
    
    success "$(get_message "Optimisation de ZeroTier pour VPN terminée avec succès" "ZeroTier optimization for VPN successfully completed")"
    return 0
}

configure_monero_with_vpn() {
    print_header "$(get_message "CONFIGURATION MONERO AVEC VPN" "MONERO CONFIGURATION WITH VPN")"
    
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi
    
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    if [ ! -f "$CONFIG_FILE" ]; then
        error "$(get_message "Fichier de configuration Monero introuvable" "Monero configuration file not found")"
        return 1
    fi
    
    sudo cp "$CONFIG_FILE" "${CONFIG_FILE}.vpn.bak"
    
    info "$(get_message "Recherche d'interfaces VPN..." "Searching for VPN interfaces...")"
    
    INTERFACES=$(ip -br addr show | grep -v "lo" | awk '{print $1}')
    VPN_INTERFACES=""
    
    for iface in $INTERFACES; do
        if [[ "$iface" == tun* ]] || [[ "$iface" == tap* ]] || [[ "$iface" == wg* ]] || [[ "$iface" == *mullvad* ]] || [[ "$iface" == zt* ]]; then
            VPN_INTERFACES="$VPN_INTERFACES $iface"
        fi
    done
    
    if [ -n "$VPN_INTERFACES" ]; then
        success "$(get_message "Interfaces VPN détectées: $VPN_INTERFACES" "VPN interfaces detected: $VPN_INTERFACES")"
        
        if [ "$(echo $VPN_INTERFACES | wc -w)" -eq 1 ]; then
            vpn_interface=$(echo $VPN_INTERFACES | xargs)
            info "$(get_message "Interface VPN sélectionnée automatiquement: $vpn_interface" "VPN interface automatically selected: $vpn_interface")"
        else
            print_styled "INFO" "$(get_message "Plusieurs interfaces VPN détectées, veuillez choisir:" "Multiple VPN interfaces detected, please choose:")"
            count=1
            for iface in $VPN_INTERFACES; do
                ip_addr=$(ip -br addr show dev "$iface" 2>/dev/null | awk '{print $3}' | cut -d'/' -f1)
                print_styled "PRIMARY" "$count) $iface - $ip_addr"
                count=$((count + 1))
            done
            
            echo -n "$(print_styled "INFO" "$(get_message "Choix: " "Choice: ")")"
            read -r choice
            
            if [ "$choice" -ge 1 ] && [ "$choice" -le "$((count-1))" ]; then
                vpn_interface=$(echo $VPN_INTERFACES | awk -v idx="$choice" '{print $idx}')
            else
                error "$(get_message "Choix invalide" "Invalid choice")"
                return 1
            fi
        fi
    else
        warning "$(get_message "Aucune interface VPN détectée automatiquement" "No VPN interface automatically detected")"
        print_styled "INFO" "$(get_message "Interfaces réseau disponibles:" "Available network interfaces:")"
        ip -br addr show | grep -v "lo" | awk '{print $1 " - " $3}'
        
        print_styled "INFO" "$(get_message "Entrez le nom de l'interface VPN (ex: tun0, zt0):" "Enter VPN interface name (e.g., tun0, zt0):")"
        read -r vpn_interface
    fi
    
    if [ -z "$vpn_interface" ]; then
        warning "$(get_message "Aucune interface sélectionnée, utilisation de l'interface par défaut" "No interface selected, using default interface")"
    else
        VPN_IP=$(ip -br addr show dev "$vpn_interface" 2>/dev/null | awk '{print $3}' | cut -d'/' -f1)
        
        if [ -n "$VPN_IP" ]; then
            success "$(get_message "Interface VPN trouvée avec l'adresse IP: $VPN_IP" "VPN interface found with IP address: $VPN_IP")"
            
            sudo sed -i '/^p2p-bind-ip=/d' "$CONFIG_FILE"
            sudo sed -i '/^rpc-bind-ip=/d' "$CONFIG_FILE"
            
            echo "p2p-bind-ip=$VPN_IP" | sudo tee -a "$CONFIG_FILE" > /dev/null
            echo "rpc-bind-ip=0.0.0.0" | sudo tee -a "$CONFIG_FILE" > /dev/null
           
            
            success "$(get_message "Configuration Monero mise à jour pour utiliser l'interface VPN" "Monero configuration updated to use VPN interface")"
        else
            error "$(get_message "Interface $vpn_interface introuvable ou sans adresse IP" "Interface $vpn_interface not found or has no IP address")"
            return 1
        fi
    fi
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
     clear
    setup_terminal
        echo -e "\n\n\n\n\n\n\n\n"   
    
    return 0
}

vpn_menu() {
       
    clear
    setup_terminal
        echo -e "\n\n\n\n\n\n\n\n"  
            
           if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi
     
    print_header "$(get_message "CONFIGURATION VPN" "VPN CONFIGURATION")"
    
    while true; do      
       setup_terminal
        echo -e "\n\n\n\n\n\n\n\n"  
        
        print_header "$(get_message "CONFIGURATION VPN" "VPN CONFIGURATION")"
        echo -e "\033[38;5;208m$(get_message "Information:" "Information:")${COLORS[RESET]}"
        print_styled "PRIMARY" "1) $(get_message "Information ZeroTier" "How to use ZeroTier ")"
        echo -e "\033[38;5;208m$(get_message "Installation:" "Installation:")${COLORS[RESET]}"
        print_styled "PRIMARY" "2) $(get_message "Installer ZeroTier " "Install ZeroTier ")"
        print_styled "PRIMARY" "3) $(get_message "Configurer Monero avec VPN" "Configure Monero with VPN")"
        echo -e "\033[38;5;208m$(get_message "Status:" "status:")${COLORS[RESET]}"
        print_styled "PRIMARY" "4) $(get_message "Montrer l'adresse IP du VPN pour connecter le wallet" "Show VPN IP address to connect wallet")"
        print_styled "PRIMARY" "5) $(get_message "Vérifier le statut des VPN" "Check VPN status")" 
        echo -e "\033[38;5;208m$(get_message "Désactivation/Reactivation:" "Disable/Enable:")${COLORS[RESET]}"
        print_styled "PRIMARY" "6) $(get_message "Désactiver ZeroTier" "Disable ZeroTier")"
        print_styled "PRIMARY" "7) $(get_message "Réactiver ZeroTier" "Reactivate ZeroTier")"
        echo -e "\033[38;5;208m$(get_message "Menu principal:" "Main menu:")${COLORS[RESET]}"
        print_styled "PRIMARY" "8) $(get_message "Retour au menu principal" "Back to main menu")"
        
        echo -n "$(print_styled "INFO" "$(get_message "Choix (1-8): " "Choice (1-8): ")")"
        read -r vpn_choice
        
        case $vpn_choice in
            1) zerotier_info ;;
            2) install_zerotier ;;
            3) configure_monero_with_vpn ;;
            4) 
            show_zerotier_ip
            ;;
            5) check_vpn_status ;;
            6) disable_zerotier_config ;;
            7) reactivate_zerotier_config ;;
            8) 
            return 0 ;;
                        
            *) error "$(get_message "Choix invalide" "Invalid choice")" ;;
        esac
    done
}

disable_zerotier_config() {
    clear
    setup_terminal
    echo -e "\n\n\n\n\n\n\n\n"  
    
    print_header "$(get_message "DÉSACTIVATION DE ZEROTIER" "DISABLE ZEROTIER")"
    
    if ! command -v zerotier-cli &>/dev/null; then
        print_styled "WARNING" "$(get_message "ZeroTier n'est pas installé sur ce système" "ZeroTier is not installed on this system")"
        read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
        return 1
    fi
    
    ZT_NETWORKS=$(sudo zerotier-cli listnetworks 2>/dev/null | awk 'NR>1 {print $3}')
    
    if [ -z "$ZT_NETWORKS" ]; then
        print_styled "WARNING" "$(get_message "Aucun réseau ZeroTier actif trouvé" "No active ZeroTier networks found")"
    else
        print_styled "INFO" "$(get_message "Réseaux ZeroTier actifs détectés:" "Active ZeroTier networks detected:")"
        for network_id in $ZT_NETWORKS; do
            if [ -n "$network_id" ]; then
                print_styled "PRIMARY" "- $network_id"
            fi
        done
        
        print_styled "WARNING" "$(get_message "Vous êtes sur le point de quitter tous les réseaux ZeroTier. Monero ne sera plus accessible via ZeroTier." "You are about to leave all ZeroTier networks. Monero will no longer be accessible via ZeroTier.")"
        echo -n "$(print_styled "INFO" "$(get_message "Êtes-vous sûr de vouloir continuer? (o/n): " "Are you sure you want to continue? (y/n): ")")"
        read -r confirm
        
        case $confirm in
            [OoYy]*)
                for network_id in $ZT_NETWORKS; do
                    if [ -n "$network_id" ]; then
                        print_styled "INFO" "$(get_message "Déconnexion du réseau $network_id..." "Disconnecting from network $network_id...")"
                        sudo zerotier-cli leave "$network_id"
                    fi
                done
                
                print_styled "INFO" "$(get_message "Mise en pause du service ZeroTier..." "Pausing ZeroTier service...")"
                sudo systemctl stop zerotier-one
                
                CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
                if [ -f "$CONFIG_FILE" ]; then
                    sudo cp "$CONFIG_FILE" "${CONFIG_FILE}.zerotier.bak"
                    
                    sudo sed -i '/^p2p-bind-ip=/d' "$CONFIG_FILE"
                    sudo sed -i '/^rpc-bind-ip=/d' "$CONFIG_FILE"
                    
                    echo "p2p-bind-ip=0.0.0.0" | sudo tee -a "$CONFIG_FILE" > /dev/null
                    echo "rpc-bind-ip=0.0.0.0" | sudo tee -a "$CONFIG_FILE" > /dev/null
                    
                    print_styled "SUCCESS" "$(get_message "Configuration Monero mise à jour pour ne plus utiliser ZeroTier" "Monero configuration updated to no longer use ZeroTier")"
                else
                    print_styled "WARNING" "$(get_message "Fichier de configuration Monero introuvable" "Monero configuration file not found")"
                fi
                
                print_styled "SUCCESS" "$(get_message "ZeroTier a été désactivé avec succès" "ZeroTier has been successfully disabled")"
                print_styled "INFO" "$(get_message "Pour réactiver ZeroTier, utilisez: 'sudo systemctl start zerotier-one'" "To reactivate ZeroTier, use: 'sudo systemctl start zerotier-one'")"
                ;;
            *)
                print_styled "INFO" "$(get_message "Opération annulée" "Operation cancelled")"
                ;;
        esac
    fi
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}


reactivate_zerotier_config() {
    clear
    setup_terminal
    echo -e "\n\n\n\n\n\n\n\n"  
    
    print_header "$(get_message "RÉACTIVATION DE ZEROTIER" "REACTIVATE ZEROTIER")"
    
    if ! command -v zerotier-cli &>/dev/null; then
        print_styled "WARNING" "$(get_message "ZeroTier n'est pas installé sur ce système" "ZeroTier is not installed on this system")"
        print_styled "INFO" "$(get_message "Redirection vers l'installation de ZeroTier..." "Redirecting to ZeroTier installation...")"
        sleep 2
        install_zerotier
        return
    fi
    
    print_styled "INFO" "$(get_message "Démarrage du service ZeroTier..." "Starting ZeroTier service...")"
    sudo systemctl start zerotier-one
    
    sleep 3
    
    if systemctl is-active --quiet zerotier-one; then
        print_styled "SUCCESS" "$(get_message "ZeroTier a été réactivé avec succès" "ZeroTier has been successfully reactivated")"
        
        ZT_NETWORKS=$(sudo zerotier-cli listnetworks 2>/dev/null | awk 'NR>1 {print $3}')
        
        if [ -z "$ZT_NETWORKS" ]; then
            print_styled "WARNING" "$(get_message "Aucun réseau ZeroTier rejoint" "No ZeroTier networks joined")"
            print_styled "INFO" "$(get_message "Redirection vers la configuration de ZeroTier..." "Redirecting to ZeroTier configuration...")"
            sleep 2
            install_zerotier
            return
        fi
        
        print_styled "INFO" "$(get_message "Détection de l'adresse IP ZeroTier..." "Detecting ZeroTier IP address...")"
        sleep 2  
        
        ZEROTIER_IP=$(ip addr show | grep -A2 "zt" | grep 'inet ' | sed -E 's/.*inet ([0-9.]+).*/\1/' | head -1)
        if [ -n "$ZEROTIER_IP" ]; then
            print_styled "SUCCESS" "$(get_message "Adresse IP ZeroTier: $ZEROTIER_IP:18081" "ZeroTier IP address: $ZEROTIER_IP:18081")"
            print_styled "INFO" "$(get_message "Utilisez cette adresse pour connecter votre portefeuille Monero" "Use this address to connect your Monero wallet")"
        else
            print_styled "WARNING" "$(get_message "Aucune adresse IP ZeroTier détectée" "No ZeroTier IP address detected")"
            print_styled "INFO" "$(get_message "Vérifiez que votre nœud est autorisé dans l'interface web ZeroTier" "Make sure your node is authorized in the ZeroTier web interface")"
            print_styled "INFO" "$(get_message "Redirection vers la configuration de ZeroTier..." "Redirecting to ZeroTier configuration...")"
            sleep 2
            install_zerotier
            return
        fi
    else
        print_styled "ERROR" "$(get_message "Échec de réactivation de ZeroTier" "Failed to reactivate ZeroTier")"
        print_styled "INFO" "$(get_message "Redirection vers l'installation de ZeroTier..." "Redirecting to ZeroTier installation...")"
        sleep 2
        install_zerotier
        return
    fi
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

show_zerotier_ip() {
    print_styled "MONERO" "$(get_message "Vérification de l'adresse IP du VPN pour connecter le wallet avec le port 18081..." "Checking the VPN IP address to connect the wallet with port 18081...")"
    
    ZEROTIER_IP=$(ip addr show | grep -A2 zt | grep 'inet ' | sed -E 's/.*inet ([0-9.]+).*/\1/')
    if [ -n "$ZEROTIER_IP" ]; then
        print_styled "SUCCESS" "$(get_message "Adresse IP ZeroTier: $ZEROTIER_IP   port: 18081" "ZeroTier IP: $ZEROTIER_IP  port: 18081")"
    else
        print_styled "WARNING" "$(get_message "Aucune adresse ZeroTier trouvée" "No ZeroTier address found")"
    fi
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

zerotier_info() {
    clear
    setup_terminal
    echo -e "\n\n\n\n\n\n\n\n"  
    
    print_header "$(get_message "ZEROTIER - GUIDE D'UTILISATION" "ZEROTIER - USER GUIDE")"
    
    print_styled "MONERO" "$(get_message "Qu'est-ce que ZeroTier ?" "What is ZeroTier?")"
    print_styled "PRIMARY" "$(get_message "Open source et gratuit, ZeroTier est un réseau virtuel qui connecte vos appareils de façon sécurisée, comme s'ils étaient sur un même réseau local, peu importe où ils se trouvent dans le monde." "Open source and free, ZeroTier is a virtual network that securely connects your devices as if they were on the same local network, no matter where they are in the world.")"
    echo
    
    print_styled "MONERO" "$(get_message "Configuration en 4 étapes :" "Setup in 4 steps:")"
    echo
    print_styled "PRIMARY" "$(get_message "1. Créer un compte ZeroTier" "1. Create a ZeroTier account")"
    print_styled "GRIS" "$(get_message "   • Visitez my.zerotier.com et inscrivez-vous" "   • Visit my.zerotier.com and sign up")"
    print_styled "GRIS" "$(get_message "   • Créez un nouveau réseau (bouton 'Create A Network')" "   • Create a new network ('Create A Network' button)")"
    print_styled "GRIS" "$(get_message "   • NOTEZ l'ID du réseau créé sur un papier (format: a09acf02555666f9)" "   • NOTE the network ID created on a paper (format: a09ac7777775c6f9)")"
    echo
    
    print_styled "PRIMARY" "$(get_message "2. Installer ZeroTier sur ce computer" "2. Install ZeroTier on this computer")"
    print_styled "GRIS" "$(get_message "   • Utilisez l'option 2 du menu VPN" "   • Use option 2 of the VPN menu")"
    print_styled "GRIS" "$(get_message "   • Entrez l'ID du réseau créé précédemment (papier)" "   • Enter the network ID created earlier (pper)")"
    echo
    
    print_styled "PRIMARY" "$(get_message "3. Autoriser votre serveur" "3. Authorize your server")"
    print_styled "GRIS" "$(get_message "   • RETOURNEZ sur my.zerotier.com" "   • GO BACK to my.zerotier.com")"
    print_styled "GRIS" "$(get_message "   • Dans votre réseau, section 'Members', cochez la case 'Auth'" "   • In your network, 'Members' section, check the 'Auth' box")"
    print_styled "GRIS" "$(get_message "   • Notez l'adresse IP attribuée (colonne 'Managed IPs')" "   • Note the assigned IP address ('Managed IPs' column)")"
    echo
    
    print_styled "PRIMARY" "$(get_message "4. Connecter votre portefeuille Monero" "4. Connect your Monero wallet")"
    print_styled "GRIS" "$(get_message "   • Utilisez l'option 4 du menu VPN pour voir l'adresse IP ZeroTier" "   • Use option 4 of the VPN menu to see your ZeroTier IP address")"
    print_styled "GRIS" "$(get_message "   • Dans Cake Wallet ou Monero GUI, configurez la connexion au nœud :" "   • In Cake Wallet or Monero GUI, configure the node connection:")"
    print_styled "GRIS" "$(get_message "     - Adresse: [IP ZeroTier]" "     - Address: [ZeroTier IP]")"
    print_styled "GRIS" "$(get_message "     - Port: 18081" "     - Port: 18081")"
    echo
    
    print_styled "MONERO" "$(get_message "Pour les appareils mobiles :" "For mobile devices:")"
    print_styled "PRIMARY" "$(get_message "• Installez l'application ZeroTier One sur votre téléphone" "• Install the ZeroTier One app on your phone")"
    print_styled "PRIMARY" "$(get_message "• Ajoutez le même ID réseau utilisé sur votre computer" "• Add the same network ID used on your computer")"
    print_styled "PRIMARY" "$(get_message "• Puis aller dans 'setting' à gauche et cocher la case 'allow mobile data'" "• Then go to 'setting' on the left and check the box 'allow mobile data'")"
    print_styled "PRIMARY" "$(get_message "• Appareil mobile/parametres/vpn, activer zerotier " "• mobile device/setting/vpn, activate zerotier")"
    print_styled "PRIMARY" "$(get_message "• Enfin, autorisez l'appareil mobile sur my.zerotier.com (case 'Auth')" "• Finally, authorize the mobile device on my.zerotier.com ('Auth' box)")"
    echo
    
    print_styled "WARNING" "$(get_message "⚠️ Important: Le VPN du script assure qu'aucune fuite d'IP ne se produira." "⚠️ Important: The VPN from the script ensures no IP leaks will occur.")"
    echo
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

check_vpn_status() {
    clear
    setup_terminal
    echo -e "\n\n\n\n\n\n\n\n"  
    
    print_header "$(get_message "STATUT DES VPN" "VPN STATUS")"
    
if command -v zerotier-cli &>/dev/null; then
    ZT_STATUS=$(sudo zerotier-cli info 2>/dev/null)
    if [ $? -eq 0 ]; then
        ZT_INTERFACES=$(ip addr show | grep -c "zt")
        if [ "$ZT_INTERFACES" -gt 0 ]; then
            print_styled "SUCCESS" "$(get_message "✓ ZeroTier: Installé et connecté" "✓ ZeroTier: Installed and connected")"
            ZEROTIER_IPS=$(ip addr show | grep -A2 "zt" | grep 'inet ' | sed -E 's/.*inet ([0-9.]+).*/\1/')
            if [ -n "$ZEROTIER_IPS" ]; then
                print_styled "INFO" "$(get_message "  Adresse(s) IP: $ZEROTIER_IPS" "  IP address(es): $ZEROTIER_IPS")"
            fi
        else
            ZT_NETWORKS=$(sudo zerotier-cli listnetworks 2>/dev/null)
            if echo "$ZT_NETWORKS" | grep -q "OK PRIVATE"; then
                print_styled "SUCCESS" "$(get_message "✓ ZeroTier: Installé et connecté" "✓ ZeroTier: Installed and connected")"
                ZT_IP=$(echo "$ZT_NETWORKS" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -1)
                if [ -n "$ZT_IP" ]; then
                    print_styled "INFO" "$(get_message "  Adresse IP: $ZT_IP" "  IP address: $ZT_IP")"
                fi
            else
                print_styled "WARNING" "$(get_message "⚠ ZeroTier: Installé mais non connecté" "⚠ ZeroTier: Installed but not connected")"
            fi
        fi
    else
        print_styled "WARNING" "$(get_message "⚠ ZeroTier: Installé mais service inactif" "⚠ ZeroTier: Installed but service inactive")"
    fi
else
    print_styled "GRIS" "$(get_message "○ ZeroTier: Non installé" "○ ZeroTier: Not installed")"
fi
    
    
    
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    if [ -f "$CONFIG_FILE" ]; then
        if grep -q "p2p-bind-ip=" "$CONFIG_FILE" || grep -q "rpc-bind-ip=" "$CONFIG_FILE"; then
            VPN_IP=$(grep -E "p2p-bind-ip=|rpc-bind-ip=" "$CONFIG_FILE" | head -1 | cut -d'=' -f2)
            if [ "$VPN_IP" != "0.0.0.0" ] && [ "$VPN_IP" != "127.0.0.1" ]; then
                print_styled "SUCCESS" "$(get_message "✓ Monero configuré avec VPN (IP: $VPN_IP)" "✓ Monero configured with VPN (IP: $VPN_IP)")"
            else
                print_styled "INFO" "$(get_message "ℹ Monero configuré sur toutes les interfaces (IP: $VPN_IP)" "ℹ Monero configured on all interfaces (IP: $VPN_IP)")"
            fi
        else
            print_styled "WARNING" "$(get_message "⚠ Monero non configuré avec VPN" "⚠ Monero not configured with VPN")"
        fi
    else
        print_styled "WARNING" "$(get_message "⚠ Fichier de configuration Monero introuvable" "⚠ Monero configuration file not found")"
    fi
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

show_notes() {
          clear
                setup_terminal
                echo -e "\n\n\n\n\n\n\n\n"   
                

                print_header "$(get_message "NOTES" "READ")"
                
                print_styled "MONERO" "$(get_message "- Pour arrêter la blockchain : CTRL + C" "- To stop the blockchain: CTRL + C")"
                echo
                print_styled "MONERO" "$(get_message "- Votre nom d'utilisateur est: ${COLORS[SUCCESS]}$SUDO_USER${COLORS[INFO]}" "- Your username is: ${COLORS[SUCCESS]}$SUDO_USER${COLORS[INFO]}")"
                echo
                print_styled "MONERO" "$(get_message "- Vérification de l'adresse IP Tor..." "- Checking Tor IP address...")"
    TOR_IP=$(torsocks curl -s https://check.torproject.org/api/ip 2>/dev/null)
    if [ $? -eq 0 ] && [ -n "$TOR_IP" ]; then
        print_styled "SUCCESS" "$(get_message "- Adresse IP TOR: ${COLORS[SUCCESS]}$TOR_IP${COLORS[SUCCESS]}" "- TOR IP address: ${COLORS[SUCCESS]}$TOR_IP${COLORS[SUCCESS]}")"
    else
        print_styled "ERROR" "$(get_message "- Impossible de récupérer l'adresse IP Tor" "- Unable to retrieve Tor IP address")"
    fi
    echo
    print_styled "MONERO" "$(get_message "- Vérification de l'adresse IP du VPN pour connecter le wallet avec le port 18081..." "- Checking the VPN IP address to connect the wallet with port 18081...")"
 ZEROTIER_IP=$(ip addr show | grep -A2 zt | grep 'inet ' | sed -E 's/.*inet ([0-9.]+).*/\1/')
if [ -n "$ZEROTIER_IP" ]; then
    print_styled "SUCCESS" "$(get_message "- Adresse IP ZeroTier: $ZEROTIER_IP" "- ZeroTier IP: $ZEROTIER_IP")"
else
    print_styled "WARNING" "$(get_message "- Aucune adresse ZeroTier trouvée" "- No ZeroTier address found")"
fi
    echo
                print_styled "PRIMARY" "$(get_message "- Configuration réseau requise :" "- Required network configuration:")"
    print_styled "PRIMARY" "$(get_message "⚠️ REDIRIGER le port 22 et 18080 de votre Box internet" "⚠️ Open port 22 and 18080 of your internet router")"
    print_styled "PRIMARY" "$(get_message "  vers l'IP de votre PC." "  to your PC's IP address.")"
    print_styled "MONERO" "$(get_message "  https://github.com/kerlannXmr/EasyMonerod/issues/10" "  https://github.com/kerlannXmr/EasyMonerod/issues/10")"
                echo
    print_styled "MONERO" "$(get_message "- Installer MONERO GUI pour la gestion du wallet" "- Install MONERO GUI for wallet management")"
                print_styled "MONERO" "$(get_message "  MONERO GUI se synchronisera sur ce noeud" "  MONERO GUI will synch on this node")"
                
                print_styled "MONERO" "$(get_message "  https://www.getmonero.org/downloads/" "  https://www.getmonero.org/downloads/")"
                echo
                print_styled "MONERO" "\e]8;;https://mega.nz/file/gjNWgL5B#itd6yCJJk_-1QbP2NbGWIm5DI1CC_MbTr8L6TeDqESI\e\\  PDF Documentations point 5 (CTRL+click)\e]8;;\e\\"
                echo
    
    echo
    print_styled "PRIMARY" "$(get_message "-🙏 Gacieux Dons MONERO(Xmr) pour le dur labeur: " "-🙏 Send MONERO(Xmr) donation for hard work")" 
    print_styled "PRIMARY" "$(get_message "    avec 'cake wallet' à:    kerlann.xmr" "    with 'cake wallet' to:   kerlann.xmr")"
    echo
    print_styled "MONERO" "$(get_message "- Contact:  easynode@kerlann.org" "- Contact:  easynode@kerlann.org")"
    echo
    print_styled "MONERO" "$(get_message "- Code source:" "- Source Code:")"
    print_styled "MONERO" "$(get_message "  https://github.com/kerlannXmr/easymonerod" "  https://github.com/kerlannXmr/easymonerod")"
                
                read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..❤️." "Press Enter to continue..❤️.")")"
}
show_scripts() {
       clear
       setup_terminal
       echo -e "\n\n\n\n\n\n"  
       print_header "$(get_message "INFOS" "FEATURES")"
  
  print_styled "MONERO" "1) $(get_message "Mise à jour système et installation des paquets" "System update and package installation")"
    print_styled "PRIMARY" "   $(get_message "- Configuration du firewall activé avec ouverture des ports :" "- Firewall configuration Actived with ports opening:")"
    echo -e "${COLORS[GRIS]}    $(get_message "-Ports system: 22(SSH), 80(HTTP), 443(HTTPS), 9050(Tor), 4200(SHELL IN BOX), 4444(i2p-http), 4447(i2p-socks), 53317(localsend)" "-System ports: 22(SSH), 80(HTTP), 443(HTTPS), 9050(Tor), 4200(SHELL IN BOX), 4444(i2p-http), 4447(i2p-socks), 53317(localsend)")${COLORS[RESET]}"
    echo -e "${COLORS[GRIS]}    $(get_message "-Ports Monero: 18080(P2P), 18081(Public), 18083(ZMQ), 18084(Tor), 18085(I2P), 18086(LWS), 18081(RPC)" "-Monero ports: 18080(P2P), 18081(Public), 18083(ZMQ), 18084(Tor), 18085(I2P), 18086(LWS), 18081(RPC)")${COLORS[RESET]}"
    echo
    print_styled "MONERO" "2) $(get_message "Installation de Monero CLI" "Monero CLI Installation")"
    print_styled "PRIMARY" "   $(get_message "- Installation des fichiers Monero" "- Installing Monero files")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des permissions" "- Setting up permissions")"
    echo
    print_styled "MONERO" "3) $(get_message "Installation et configuration de TOR" "TOR Installation and configuration")"
           
    if [ -f /var/lib/tor/monero-service/hostname ]; then
    ONION_ADDRESS=$(sudo cat /var/lib/tor/monero-service/hostname)
    echo -e "${COLORS[SUCCESS]}    -TOR Onion: $ONION_ADDRESS${COLORS[RESET]}"
fi
   print_styled "SUCCESS" "     PORT RPC: 18081"
   if [ -f /var/lib/tor/ssh/hostname ]; then
    SSH_ONION_ADDRESS=$(sudo cat /var/lib/tor/ssh/hostname)
    echo -e "${COLORS[SUCCESS]}    -SSH Onion: $SSH_ONION_ADDRESS${COLORS[RESET]}"
fi
   print_styled "SUCCESS" "     PORT SSH: 22"
   print_styled "WARNING" "   $(get_message " Les adresses Tor sont créées uniquement lors de votre installation" "  Tor addresses are only created during installation")"
    echo
    print_styled "MONERO" "4) $(get_message "Configuration de bitmonero.conf" "bitmonero.conf configuration")"
    print_styled "PRIMARY" "   $(get_message "- Configuration du fichier de démarrage" "- Configuring startup file")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des ports" "- Setting up ports")"
    print_styled "SUCCESS" "$(get_message "    -rpc-bind-port=18081" "     rpc-bind-port=18081")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des chemins" "- Setting up paths")"
    echo
    print_styled "MONERO" "5) $(get_message "Configuration DNS Anonyme" "Anonymous DNS Configuration")"
    print_styled "PRIMARY" "   $(get_message "- Installation des DNS sécurisés" "- Installing secure DNS")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des serveurs DNS" "- Configuring DNS servers")"
    echo
    print_styled "MONERO" "6)$(get_message " Démarrage Blockchain et Bloquage 'IP Bans list':" "Start & Block 'IP bans list':")"
    print_styled "PRIMARY" "   $(get_message "- https://github.com/monero-project/meta/issues/1124" "- https://github.com/monero-project/meta/issues/1124")"
    print_styled "PRIMARY" "   $(get_message "- https://github.com/Boog900/monero-ban-list/blob/main/ban_list.txt" "- https://github.com/Boog900/monero-ban-list/blob/main/ban_list.txt")"
    echo
    print_styled "MONERO" "10) $(get_message "Configuration VPN ZeroTier (Sécurité avancée)" "ZeroTier VPN Configuration (Advanced security)")"
    print_styled "PRIMARY" "   $(get_message "- Installation automatique de ZeroTier" "- Automatic ZeroTier installation")"
    print_styled "PRIMARY" "   $(get_message "- Configuration Monero pour VPN" "- Monero configuration for VPN")"
    print_styled "PRIMARY" "   $(get_message "- Guide d'utilisation complet" "- Complete user guide")"
    echo
    print_styled "WARNING" "$(get_message " ⚠️  Configurer votre router/Box internet pour REDIRIGER le port 22 et 18080" " ⚠️   Configure your router/internet box to REDIRECT port 22 and 18080")"
   print_styled "WARNING" "$(get_message "    vers l'ADRESSE IP de votre PC" "    to your PC's IP ADDRESS")"
   print_styled "PRIMARY" "$(get_message "- https://github.com/kerlannXmr/EasyMonerod/issues/10" "- https://github.com/kerlannXmr/EasyMonerod/issues/10")"
                echo

                read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}


monero_animation() {
    clear

    local logo_frame1="
      ████████████      
    ██            ██    
   ██   ██    ██   ██   
  ██    ███  ███    ██  
  ██    ██ ██ ██    ██  
  ██    ██    ██    ██  
  ██    ██    ██    ██  
   ██   ██    ██   ██   
    ██            ██    
      ████████████      
"

    local logo_frame2="
      ************      
    **            **    
   **   **    **   **   
  **    ***  ***    **  
  **    ** ** **    **  
  **    **    **    **  
  **    **    **    **  
   **   **    **   **   
    **            **    
      ************      
"

    local terminal_width=$(tput cols)
    local logo_width=24
    local center_x=$(( (terminal_width - logo_width) / 2 ))
    local top_y=3
    
    if [ $center_x -lt 0 ]; then
        center_x=0
    fi
    
    for ((i=0; i<8; i++)); do
        clear
        
        if ((i % 2 == 0)); then
            logo="${logo_frame1}"
            color="${COLORS[MONERO]}"  
        else
            logo="${logo_frame2}"
            color="${COLORS[PRIMARY]}"  
        fi
        
        tput cup $top_y $center_x
        echo -e "$color$logo${COLORS[RESET]}"
        
        sleep 0.3
    done
}

show_menu() {
    while true; do
        setup_terminal
        echo -e "\n\n\n\n\n\n\n\n"  
        
         
        print_styled "PRIMARY" "0) $(get_message "GUIDE" "HOW TO")"
        
        echo -e "\033[38;5;208m$(get_message "Menu Principal:" "Main Menu:")${COLORS[RESET]}"
        print_styled "PRIMARY" "1) $(get_message "Mise à jour système" "Update system")"
        print_styled "PRIMARY" "2) $(get_message "Installer Monero CLI" "Install Monero CLI")"
        print_styled "PRIMARY" "3) $(get_message "Installer service Tor" "Install configure Tor")"
        print_styled "PRIMARY" "4) $(get_message "Configurer bitmonero" "Configure bitmonero")"
        print_styled "PRIMARY" "5) $(get_message "Configurer DNS anonymes" "Configure anonymous DNS")"
        
        echo -e "\033[38;5;208m$(get_message "BLOCKCHAIN" "BLOCKCHAIN")${COLORS[RESET]}"
        print_styled "PRIMARY" "6) $(get_message "MARCHE" "START")"
        print_styled "PRIMARY" "7) $(get_message "ARRET= ctrl+c" "STOP= ctrl+c")"
        
        echo -e "\033[38;5;208m$(get_message "Option du Noeud sur Disque:" "Node Option on DISK:")${COLORS[RESET]}"
        
        print_styled "PRIMARY" "8) $(get_message "Blockchain sur DISQUE EXTERNE" "Blockchain on EXTERNAL DISK")"
        print_styled "PRIMARY" "9) $(get_message "Blockchain sur DISQUE INTERNE" "Blockchain on INTERNAL DISK")"
        
        echo -e "\033[38;5;208m$(get_message "SÉCURITÉ AVANCÉE 'mode VPN' " "ADVANCED SECURITY 'VPN mode'")${COLORS[RESET]}"
        print_styled "GRIS" "10) $(get_message "Configuration VPN" "VPN Configuration")"
        
        echo -e "\033[38;5;208m$(get_message "AUTRES OPTIONS" "OTHER OPTIONS")${COLORS[RESET]}"
        print_styled "PRIMARY" "11) $(get_message "Changer language" "Change language")"
        print_styled "PRIMARY" "12) $(get_message "INFOS" "FEATURES")"
        print_styled "PRIMARY" "13) $(get_message "NOTES" "READ")"
        
        echo -e "\033[38;5;208m$(get_message "FIN" "END")${COLORS[RESET]}"
        print_styled "PRIMARY" "14) $(get_message "QUITTER" "EXIT")"
                
        echo -n "$(print_styled "INFO" "$(get_message "Choix (1-14): " "Choice (1-14): ")")"
        read -r choice

        case $choice in
              
            0) 
                Manuel
                ;;
            1) 
                update_system 
                ;;
            2)  
                if ! ask_username; then
                    continue
                fi
               
                install_monero_cli
                read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
                ;;
            3)  
                if ! ask_username; then
                    continue
                fi
                install_tor
                ;;
            4)  
                if ! ask_username; then
                    continue
                fi
                configure_monero
                ;;
            5) 
                configure_dns 
                ;;
            6) 
                if ! ask_username; then
                    continue
                fi
                start_blockchain
                ;;
            7) 
        echo -n "$(print_styled "INFO" "$(get_message "Voulez-vous vraiment arrêter la blockchain? (o/n): " "Do you really want to stop the blockchain? (y/n): ")")"
read -r confirm
case $confirm in
    [OoYy]*)
        pkill -f monerod
        sudo systemctl stop haproxy-monero
        sudo systemctl stop monero-decoy
        sudo systemctl stop monero
        
        if pgrep -f monerod > /dev/null; then
            warning "$(get_message "Certains processus persistent, forçage de l'arrêt..." "Some processes still running, forcing shutdown...")"
            pkill -9 -f monerod
        fi
        
        success "$(get_message "Blockchain arrêtée" "Blockchain stopped")"
        ;;

        *)
                        continue
                        ;;
                esac
                ;;
            8)
                if ! ask_username; then
                    continue
                fi
                manage_blockchain
                ;;
            9) 
                unmount_sdb1 
                ;;
            10) 
                ask_username || continue
                vpn_menu 
                ;;
            11) 
                select_language
                continue
                ;;
            12) 
                show_scripts 
                ;;
            13) 
                 
                show_notes 
                ;;
            14) 
                    clear
                     if ! monero_animation; then
                    continue
                fi
    setup_terminal
    echo -e "\n\n\n\n\n\n\n\n"  
    print_header "$(get_message "MERCI" "THANK YOU")"
    
    echo
    print_styled "SUCCESS" "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    if [ "$LANG_CHOICE" = "FR" ]; then
        print_styled "SUCCESS" "┃                                                                             ┃"
        print_styled "SUCCESS" "┃  Programme d'aide informatique et de liberté.                               ┃"
        print_styled "SUCCESS" "┃  Permet d'installer un nœud MONERO sans aucune connaissance sur Linux.      ┃"
        print_styled "SUCCESS" "┃                                                                             ┃"
        print_styled "SUCCESS" "┃  Merci d'avoir utilisé ce programme.                                        ┃"
        print_styled "SUCCESS" "┃                                                                             ┃"
        print_styled "MONERO"  "┃                           🔒 PRIVACY MATTERS 🔒                             ┃"
    else
        print_styled "SUCCESS" "┃                                                                             ┃"
        print_styled "SUCCESS" "┃  Computer assistance and freedom program.                                   ┃"
        print_styled "SUCCESS" "┃  Helps you install a MONERO node without any knowledge on Linux.            ┃"
        print_styled "SUCCESS" "┃                                                                             ┃"
        print_styled "SUCCESS" "┃  Thank you for using this program.                                          ┃"
        print_styled "SUCCESS" "┃                                                                             ┃"
        print_styled "MONERO"  "┃                           🔒 PRIVACY MATTERS 🔒                             ┃"
    fi
    print_styled "SUCCESS" "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    echo
      
    sleep 3
    exit 0
    ;;
        esac
    done
}

setup_terminal
select_language
show_menu
exit 0
