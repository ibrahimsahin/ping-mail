#!/bin/bash
dire=$1
sub2=`echo $1 | cut -d'/' -f3`

while read myline
do
	grep -v "#" $1 > "/home/$sub2/new"
done < "$1"

while read mynewline
do			
	
 	var2=`echo $mynewline | grep "local" "/home/ibo/new"`
	local_sayisi=`awk '/local/ {i=i+1} END {print i}' "/home/ibo/new"`
	if [ $local_sayisi -eq 2 ];
	then
				
		local_value1=`echo $var2 | cut -d' ' -f1`
		local_value2=`echo $var2 | cut -d' ' -f2`
		local_value1=`echo $local_value1 | cut -d':' -f2`
		local_value2=`echo $local_value2 | cut -d':' -f2`
	
		if [ -n "$local_value1" ];
		then 	
			local_found=`ps -e | grep -i "$local_value1"` #çalışan görevler arasında varmı
			l=$local_found
			lenght=${#l} # uzunluğunu hesapla
			if [ $lenght -eq 0 ] #boyle bi gorev yoksa uzunluğu 0 çıkacaktır
  			then
        			echo "$local_value1 :boyle bi local değişken yok.mail at..."
				mail -s "hata" "erzurumlu@gmail.com"	 		
			fi
		fi
		if [ -n "$local_value2" ];
		then 	
			local_found=`ps -e | grep -i "$local_value2"` #çalışan görevler arasında varmı
			l=$local_found
			lenght=${#l} # uzunluğunu hesapla
			if [ $lenght -eq 0 ] #boyle bi gorev yoksa uzunluğu 0 çıkacaktır
  			then
        			echo "$local_value2 :boyle bi local değişken yok.mail at..." 			
				mail -s "hata" "erzurumlu@gmail.com"		
			fi
		fi
	break
	else
		local_value1==`echo $var2 | cut -d':' -f2`
		if [ -n "$local_value1" ];
		then 	
			local_found=`ps -e | grep -i "$local_value1"` #çalışan görevler arasında varmı
			l=$local_found
			lenght=${#l} # uzunluğunu hesapla
			if [ $lenght -eq 0 ] #boyle bi gorev yoksa uzunluğu 0 çıkacaktır
  			then
        			mail -s "hata" "erzurumlu@gmail.com"			
			fi
		fi
	break
	fi
		
done < "/home/$sub2/new"



