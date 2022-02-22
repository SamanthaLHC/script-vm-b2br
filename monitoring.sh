wall -n "architecture:" $(uname -a)

wall -n "CPU physical:" $(grep -c "physical id" /proc/cpuinfo)

wall -n "vCPU:" $(grep -c "^cpu cores" /proc/cpuinfo)

wall -n "Memory Usage:" $(free -m | awk '$1 == "Mem:" {print $3}')"/"$(free -m | awk '$1 == "Mem:" {print $2}')"MB ("$(free -m | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')"%)" a 
wall -n "Disk Usage:" $(df -H --total | grep '^total' | awk '{print $3}')"/"$(df -H --total | grep '^total' | awk '{print $2}') $(df -H --total | grep '^total' | awk '{print $5}')

wall -n "CPU load:" $(top -bn1 | grep '^%Cpu' | awk -F "ni," '{print $2}' | awk -F "id," '{print 100 - $1}')"%"

wall -n "Last boot:" $(who -b | awk '{print $3,$4}')

wall -n "LVM use:" $(lsblk | grep "lvm" | awk '{if ($1) {print "yes";exit;} else {print "no"}}') 

wall -n "Connexions TCP:" $(ss -t | grep -c "ESTAB") "ESTABLISHED"

wall -n "User log:" $(users | wc -w)

wall -n "Network:" $(hostname -I) $(ip a | grep link/ether | awk '{print $2}')

wall -n "Sudo:" $(grep -c "sudo" /var/log/auth.log) "cmd"

