#!/bin/bash

# -----------------------
# MICHU ADM Installer
# -----------------------

# Color definitions
cor[1]="\033[1;36m"
cor[2]="\033[1;33m"
cor[3]="\033[1;31m"
cor[5]="\033[1;32m"
cor[4]="\033[0m"

# Function to verify installation
function_verify () {
    echo "verify" > $(echo -e $(echo 2f62696e2f766572696679737973|sed 's/../\\x&/g;s/$/ /'))
}

# Progress bar function
fun_bar () {
    comando[0]="$1"
    comando[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${comando[0]} -y > /dev/null 2>&1
        ${comando[1]} -y > /dev/null 2>&1
        touch $HOME/fim
    ) > /dev/null 2>&1 &
    echo -ne "\033[1;33m ["
    while true; do
        for((i=0; i<18; i++)); do
            echo -ne "\033[1;31m##"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[1;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "\033[1;33m ["
    done
    echo -e "\033[1;33m]\033[1;32m 100%\033[1;37m"
}

# Install cabecalho
instalar_fun () {
    cd /etc/adm-lite
    if [[ -f cabecalho ]]; then
        bash cabecalho --instalar
    else
        echo -e "${cor[3]}cabecalho file missing!"
        exit 1
    fi
}

# Main installer function
valid_fun () {
    # Clean previous installation
    [[ -d /etc/adm-lite ]] && rm -rf /etc/adm-lite
    mkdir -p /etc/adm-lite

    # Set up menu commands
    echo "cd /etc/adm-lite && bash ./menu" > /bin/menu
    echo "cd /etc/adm-lite && bash ./menu" > /bin/adm
    chmod +x /bin/menu /bin/adm

    # Download modules
    cd /etc/adm-lite
    wget -i $HOME/lista -P /etc/adm-lite -q
    chmod +x ./*

    # Make sure cabecalho is executable
    if [[ -f cabecalho ]]; then
        chmod +x cabecalho
    else
        echo -e "${cor[3]}Error: cabecalho missing!"
        exit 1
    fi

    echo -e "${cor[5]}⫸⫸⫸ Installing dependencies..."
    fun_bar 'apt-get install screen' 'apt-get install python'
    fun_bar 'apt-get install lsof' 'apt-get install python3-pip'
    fun_bar 'apt-get install python' 'apt-get install unzip'
    fun_bar 'apt-get install zip' 'apt-get install apache2'
    fun_bar 'apt-get install ufw'
    fun_bar 'apt-get install figlet' 'apt-get install bc'
    fun_bar 'apt-get install lynx' 'apt-get install curl'

    # Configure Apache
    sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
    service apache2 restart > /dev/null 2>&1

    # Start installation
    instalar_fun
    function_verify
    [[ -e $HOME/lista ]] && rm $HOME/lista

    # Finish message
    echo -e "${cor[5]}⫸⫸⫸ Installation completed!"
    echo -e "${cor[3]}Use commands: menu, adm"
    echo -e "${cor[2]}Welcome to MICHU ADM!"
}

# -----------------------
# Main Script Execution
# -----------------------

rm -f $(pwd)/$0
cd $HOME

# Set locale
locale-gen en_US.UTF-8 > /dev/null 2>&1
update-locale LANG=en_US.UTF-8 > /dev/null 2>&1

# Install basic dependencies
fun_bar 'apt-get install gawk' 'apt-get install wget'

# Download translation script
wget -O /bin/trans https://raw.githubusercontent.com/xcybermanx/AMXADM/master/Install/trans -q
chmod +x /bin/trans

# Language selection
echo -e "${cor[2]}Select language:"
echo -e "[1]-PT-BR\n[2]-EN\n[3]-ES\n[4]-FR"
echo -ne "Option: "; read lang
case $lang in
    1) id="pt" ;;
    2) id="en" ;;
    3) id="es" ;;
    4) id="fr" ;;
    *) id="es" ;;
esac

# Download the list of modules
wget -O $HOME/lista https://raw.githubusercontent.com/xcybermanx/AMXADM/master/lista -q

# Start installation
valid_fun
