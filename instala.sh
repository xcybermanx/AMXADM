#!/bin/bash

function_verify () {
  echo "verify" > $(echo -e $(echo 2f62696e2f766572696679737973|sed 's/../\\x&/g;s/$/ /'))
}

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
echo -e "\033[1;33m]\033[1;31m -\033[1;32m 100%\033[1;37m"
}

install_fun () {
cd /etc/adm-lite && bash header --install
}

eliminate_fun () {
text=$(source trans -b pt:${id} "Installing")
echo -e "${color[2]} Update"
fun_bar 'apt-get install screen' 'apt-get install python'
echo -e "${color[2]} Upgrade"
fun_bar 'apt-get install lsof' 'apt-get install python3-pip'
echo -e "${color[2]} $text Lsof"
fun_bar 'apt-get install python' 'apt-get install unzip'
echo -e "${color[2]} $text Python3"
fun_bar 'apt-get install zip' 'apt-get install apache2'
echo -e "${color[2]} $text Unzip"
fun_bar 'apt-get install ufw'
echo -e "${color[2]} $text Screen"
fun_bar 'apt-get install figlet' 'apt-get install bc'
echo -e "${color[2]} $text Figlet"
fun_bar 'apt-get install lynx' 'apt-get install curl'
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
service apache2 restart > /dev/null 2>&1
echo -e "${color[1]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
}


valid_fun () {
[[ -d /etc/adm-lite ]] && rm -rf /etc/adm-lite
mkdir /etc/adm-lite
cd /etc/adm-lite
echo "cd /etc/adm-lite && bash ./menu" > /bin/menu
echo "cd /etc/adm-lite && bash ./menu" > /bin/adm
chmod +x /bin/menu
chmod +x /bin/adm
cd /etc/adm-lite
touch /etc/adm-lite/index.html
wget -i $HOME/list -o /dev/null
echo -e "${color[5]} $(source trans -b pt:${id} "INSTALLING DEPENDENCIES")"
echo -e "${color[3]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
cd /etc/adm-lite
chmod +x ./*
install_fun
function_verify
[[ -e $HOME/list ]] && rm $HOME/list
echo -e "${color[5]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -e "${color[5]} $(source trans -b pt:${id} "PROCEDURE COMPLETED!")"
echo -e "${color[3]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -e "${color[3]} |∆| ${color[2]}$(source trans -b pt:${id} "NOW CONFIGURE YOUR VPS WITH THE INSTALLATION MANUAL")"
echo -e "${color[5]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -e "${color[3]} $(source trans -b pt:${id} "USE THE COMMANDS"): menu, adm"
echo -e "${color[2]} $(source trans -b pt:${id} "WELCOME TO MICHU ADM!")"
echo -e "${color[1]}════════════❖•ೋ° 🐱 °ೋ•❖════════════════"
echo -ne " \033[0m"
}


error_fun () {
echo -e "${color[5]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -e "\033[1;31mYour apt-get Error!"
echo -e "Reboot the System!"
echo -e "Use Command:"
echo -e "\033[1;36mdpkg --configure -a"
echo -e "\033[1;31mVerify your Source.list"
echo -e "For Update Source list use this command"
echo -e "\033[1;36mwget https://raw.githubusercontent.com/xcybermanx/AMXADM/master/Install/apt-source.sh && chmod 777 ./* && ./apt-*"
echo -e "${color[5]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -ne "\033[0m"
exit 1
}

rm $(pwd)/$0
color[1]="\033[1;36m"
color[2]="\033[1;33m"
color[3]="\033[1;31m"
color[5]="\033[1;32m"
color[4]="\033[0m"
cd $HOME
locale-gen en_US.UTF-8 > /dev/null 2>&1
update-locale LANG=en_US.UTF-8 > /dev/null 2>&1
apt-get install gawk -y > /dev/null 2>&1
wget -O trans https://raw.githubusercontent.com/xcybermanx/AMXADM/master/Install/trans -o /dev/null 2>&1
mv -f ./trans /bin/ && chmod 777 /bin/*
echo -e "${color[1]}════════════❖•ೋ° 🐱 °ೋ•❖════════════════"
echo -e "${color[2]}SELECT LANGUAGE\n${color[5]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸\n${color[2]}[1]-PT-BR\n[2]-EN\n[3]-ES\n[4]-FR"
echo -e "${color[5]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -ne " OPTION: "; read lang
case $lang in
1)
id="pt"
;;
2)
id="en"
;;
3)
id="es"
;;
4)
id="fr"
;;
*)
id="es"
;;
esac
echo -e "${color[1]}════════════❖•ೋ° 🐱 °ೋ•❖════════════════"
echo -e ""
echo -e "${color[5]} $(source trans -b pt:${id} "")\n\033[1;37m MICHU🐱ADM "
echo -e "${color[5]} $(source trans -b pt:${id} "")\n\033[1;37m ANDROID MEXICO TEAM"
echo -e "${color[3]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -e "${color[2]} $(source trans -b pt:${id} "INSTALLING SYSTEM") ®"
echo -e "${color[5]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -e "${color[3]} $(source trans -b pt:${id} "STARTING INSTALLATION...")"
echo -e "${color[2]}⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸⫸"
echo -ne "${color[4]}"
wget -O list https://raw.githubusercontent.com/xcybermanx/AMXADM/master/list -o /dev/null
valid_fun
