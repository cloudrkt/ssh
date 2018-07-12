
#!/usr/bin/env bash
# wssh = SSH connector for the one that cannot wait..

# SSH settings:
SSHCONNECTIONTIMEOUT=2
SSHCONNECTIONATTEMPTS=5

# Catch signals
trap cleanup 1 2 3 6
cleanup()
{
  echo "Caught Signal ... quiting"
  exit 1
}

# grep IP from ssh root@ip argument
IP=$(echo $@|grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')

# usage
if [ $# -eq 0 ]
  then
   /usr/bin/ssh && exit
fi

# start connection loop.
while true; do
    ping -c 1 -W 1 $IP &> /dev/null
    if [ $? -eq  0 ]; then
        if [ $(uname -s) == "Darwin" ]; then
            /usr/bin/say "Initiating connection" &
        fi
        /usr/bin/ssh -o ConnectTimeout=$SSHCONNECTIONTIMEOUT -o ConnectionAttempts=$SSHCONNECTIONATTEMPTS $@
        break
    fi
done