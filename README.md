# Before using

1. Set your PATH (https://opensource.com/article/17/6/set-path-linux) <br>
>testuser@quantum:~$ echo $PATH
**/home/testuser/bin**:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/pdtools/bin

2. Make file executable (https://gcore.com/learning/how-to-make-file-executable-in-linux)  <br>
>testuser@quantum:~$ ls -l /home/testuser/bin/getpms.sh<br>
**-rwx------** 1 testuser users 782 Jan  9 18:16 /home/testuser/bin/getpms.sh

3. To download file using curl, example:
>curl -k "https://raw.githubusercontent.com/lyoben/Quantum/main/getpms.sh" -o /home/$(whoami)/bin/getpms.sh


## cds
Python script for quick copy and paste for scp command to/from Quantum cds

## getpms.sh
Generate pms file from a pcap file (https://support.f5.com/csp/article/K31793632)

