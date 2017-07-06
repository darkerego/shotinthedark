#!/usr/bin/expect

# Start an interactive session
# usage: ./interactive 192.168.1.2 admin password

set hostname [lindex $argv 0]
set username [lindex $argv 1]
set password [lindex $argv 2]

if { $hostname == "" || $username == "" || $password == "" }  {
  puts "Usage: <hostname> <username> <password>\n"
  exit 1
}

set timeout 10
set stty_init "rows 10000 cols 200"
spawn telnet $hostname

expect "ogin:"
send "$username\r"
expect "assword:"
send "$password\r"

#puts "\n\nPress ? to get help. Enter  exit  to leave the interactive session."
#puts "Enter  enable  and then the password again for the privileged mode."
#expect "\r\n\r\n\r\nBusyBox v1.02 (2014.08.11-03:54+0000) Built-in shell (msh)\r\nEnter 'help' for a list of built-in commands.\r\n\r\n# "
expect "#"
send "cd /var\r"
send "tftp -g -r tpshell $host \r"
send "chmod +x tpshell \r"
send "./tpshell & \r"
interact
