# wsl
Instruction for Installation and configuration for WSL

# Good to know:
- Windows is mounted in Linux under /mnt/c
- do not! change linux files from Windows --> things will get corrupt (see: https://devblogs.microsoft.com/commandline/do-not-change-linux-files-using-windows-apps-and-tools/)

# Brief instruction
 1) WSL Installation
 2) Install all Tools
 3) Dotfiles and Plugins
 4) SSH Configuration
 5) ...


# Step 1: Install WSL

Manual Download of Linux Distro: https://docs.microsoft.com/en-us/windows/wsl/install-manual
- Rename file to zip file
- extract it
- load ubuntu.exe (or similar)
- execute:
```
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata
```

## Step 1.1: Configure Bash on Windows

  1) Check Option:  `Verwendung von STRG + UMSCHALT +C/V zum Kopieren/Einfügen`
  2) Under `Farben` change to preffered Color Style ( Iam Using https://github.com/carloscuesta/materialshell/tree/master/shell-color-themes)
  3) Font: Lucida Console
  4) Font Size: 14


## Step 1.2: Configure MobaXterm

  1) change [colors] section from MobaXterm.ini file
  2) import or create ur sessions


## Step 1.3: Make Ditto compatible with WSL
  1) Hotkey for Ditto: `STRG + ALT + V`
  2) Ditto --> Options --> Advanced Options:
  Change `Default Paste String` from `^{VKEY86}` to `^+{VKEY86}`

## Step 1.4: Configure VSCode
  1) Download Settings Sync from extensions
  2) Link to Gist: https://gist.github.com/wieczoreko/0c752654f8c25b3863dc03e771f97904
  3) to use WSL from within VSCode change following line:
  `"terminal.integrated.shell.windows": "C:\\WINDOWS\\sysnative\\wsl.exe",`
  
## Step 1.5: Install Python
 1) Link: https://www.python.org/downloads/
 2) Opt-in to add Python to PATH
 2) Install flake8 under cmd `pip install flake8 boto3`
 
 Note: Python currently not working flawless from Windows with WSL. See: https://github.com/Microsoft/vscode-python/issues/67
 Workaround: Just execute Python File form terminal.
 
 Link to Windows Python from within WSL:
 ```
 /mnt/c/Users/wieczoreko/AppData/Local/Programs/Python/Python37-32/python.exe
 ```
  
  
 


# Step 2: Install needed Tools

```
sudo apt-get update
sudo apt-get install curl git zsh python3-pip awscli google-cloud-sdk tmux whois

```

## Step 2.1: zsh
##### oh-my-zsh:
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- Source: https://github.com/robbyrussell/oh-my-zsh

##### zsh-syntax-highlighting:
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

- Note: Plugin needs to be activated in .zshrc
- Source: https://github.com/zsh-users/zsh-syntax-highlighting

##### Tmux Plugins:
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

- Source: https://github.com/tmux-plugins

##### fzf (fuzzy finder for history):
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
- Source: https://github.com/junegunn/fzf

##### Dircolors
```
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
```
- Note: Needs to be activated in .zshrc with: `eval $(dircolors -b $HOME/.dircolors)`
- Source: https://github.com/trapd00r/LS_COLORS


## Step 2.2: Configure Credentials
```
aws configure
gcloud init
```

## Step 2.3: Configure AWS CLI over Azure AD
Install:
```
sudo apt install libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget npm
sudo npm install -g aws-azure-login --unsafe-perm
```


# Step 3: Dotfiles
Currently using this dotfiles:
- .bashrc
- .zshrc
- .vimrc
- .tmuxconf
- .gitconfig

 Just copy all files to homedir.


# Step 4: SSH

There are multiple options to use SSH.
1) Windows Software like MobaXterm
2) through WSL with Windows Pageant
3) through WSL with Linux ssh-agent


## Step 4.1: Deploy SSH with Pageant

1) Download https://github.com/vuori/weasel-pageant/releases
2) Extract in a Windows Directory (not WSL)
3) add to .zshrc:
`eval $(<location where you unpacked the zip>/weasel-pageant -r)`

Source: https://github.com/vuori/weasel-pageant


### Step 4.1.1 Use Pageant as autostart
1) Right-Click -> New Shortcut
2) Destination:
`"C:\Program Files\PuTTY\pageant.exe" ""Path_to_first_.ppk_file"" ""Path_to_second_.ppk_file"" `
3) Place Shortcut in Startup Folder
```
wir +r
shell:startup
```

## Step 4.2: Deploy SSH Keys from zsh
1) deploy private Keys to ~/.ssh/
`chmod 600 ~/.ssh/... `
2) enable ssh-agent plugin in .zshrc3
3) add this to .zshrc
```
#### SSH-Agent-Config
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa1 id_rsa2
```
