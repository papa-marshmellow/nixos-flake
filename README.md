#My Personal Nixos Flake

##Installation
1. Clone the repo, it doesn't matter where. (I use ~/.Build)
2. Copy the hardware configuration from /etc/nixos/ into the folder
3. Use `git branch` to check the available versions (If you would like to stay on the unstable branch skip step 3 and 4)
4. Use `git checkout "version"` to change the repo to that version
5. Use the nixos install command to install nixos `sudo nixos-install --flake Path/To/Repo/#hostname`

##Update the repo
1. Cd into the repo
2. Update the repo with `git pull`
3. Use the nixos rebuild command to make a new nixos build `sudo nixos-rebuild switch --flake ./#hostname`

##Change the version of an install
1. Cd into the repo
2. Use `git branch` to check the available versions
3. Use `git checkout "version"` to change the repo to that version
4. Finally `sudo nixos-rebuild switch --flake ./#hostname` will make a new build of that version
