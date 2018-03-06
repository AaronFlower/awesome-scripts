#!/usr/bin/expect -f

# Login a remote sever

# Take arguemnts
# user = User
# password = password
# server = Server
# port = port
if {[llength $argv] != 4} {
    puts "usages: nopasswdssh.exp user password server port"
    exit 1
}

set user  [lrange $argv 0 0]
set password  [lrange $argv 1 1]
set server  [lrange $argv 2 2]
set port   [lrange $argv 3 3]

set timeout 60

spawn ssh -p $port $user@$server

match_max 200

# Now we expect to have a request for password
expect "*?assword:*"
send -- "$password\r"

interact
