# wsl
Instruction for Installation and configuration for WSL

# Good to know:
- Windows is mounted in Linux under /mnt/c
- do not! change linux files from Windows --> things will get corrupt (see: https://devblogs.microsoft.com/commandline/do-not-change-linux-files-using-windows-apps-and-tools/)

# Step 1: Install WSL

Manual Download of Linux Distro: https://docs.microsoft.com/en-us/windows/wsl/install-manual
- Rename file to a zip file
- extract it
- load ubuntu.exe (or similar if other distro)
- run: 
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata


# Step 2: Install needed Tools
run: 
sudo apt-get update
sudo apt-get install curl git zsh python3-pip
pip install awscli ...

For oh-my-zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Step 3.1: Deploy SSH with Pageant 
If you use pageant and want to keep it just use https://github.com/vuori/weasel-pageant

### Step 3.1.1 Use Pageant as autostart
Create Shortcut with destination and change to ur keys:
"C:\Program Files\PuTTY\pageant.exe" "C:\Users\wieczoreko\Documents\SSH\hosting@aws.ppk" "C:\Users\wieczoreko\Documents\SSH\PrivateKey.ppk"

Open Autostart folder on Windows 10
- win + r
- type: shell:startup
- place your file here

# Step 3.2: Deploy SSH from bash/zsh
- deploy private Keys to ~/.ssh/
- chmod 600 ~/.ssh/...
- Deploy the .basrc and .zshrc files


For ZSH use this Plugin: 
https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/ssh-agent

# Step 4: Deploy the rest
- deploy .vimrc
-  deploy...



