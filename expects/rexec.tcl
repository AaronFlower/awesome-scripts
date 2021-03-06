#!/usr/bin/expect -f

# Execute command on a remote server.
# Usage: `rexec.exp user password server port command`
# You can set `alias rfoo='exec.exp user password server port command'`
# in your '.bashrc' and make it more convient.

# Take arguemnts
# user = User
# password = password
# server = Server
# port = port
# command = command
if {[llength $argv] != 5} {
    puts "usages: rexec.exp user password server port command"
    exit 1
}

set user  [lrange $argv 0 0]
set password  [lrange $argv 1 1]
set server  [lrange $argv 2 2]
set port   [lrange $argv 3 3]
set command  [lrange $argv 4 4]


set timeout 60

spawn ssh -p $port $user@$server $command

match_max 200

# Now we expect to have a request for password
expect "*?assword:*"
send -- "$password\r"
send -- "\r"
expect eof
