# wssh - the SSH connector for the one that cannot wait..

Be the first to log in!

wssh will keep pinging and trying to connect your server with SSH whenever it is ready to accept your connection!

## Features

- Be the first to login
- Uses say on MacOS when ready to connect
- No more wasted time on waiting before the host is online.

## Requirements

- Tested on MacOS (Should work on *nix as well)
- A pingable host with SSH listening.

## Setup

1. Create a bin directory in your home folder

```bash
mkdir ~/bin
```

2. Download the wssh script and place in your new bin folder
3. Add this folder to your path:

```bash
editor .bash_profile #(or .profile or /etc/profile etc)
```

and add the path:

```bash
export PATH="$PATH:~/bin"
```

save and restart your bash session to load in the new path

## Usage

```bash
wssh user@10.0.0.1 
```

## Roadmap

Short term

- Add ipv6
- Check for port availabillity instead of reachable by ping

Wish list

- Remove external dependency's (like ping)
- Initiate the connection as early as possible (faster)