# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="arrow"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux django github)

source $ZSH/oh-my-zsh.sh

alias grep='grep --color=always -d skip'
alias emacs='sudo emacs -nw'
alias pacman='sudo pacman-color'
alias systemctl='sudo systemctl'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias tmux='tmux -2'

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

export LS_COLORS

export EDITOR='emacs -nw'

############
#   Work   #
alias deskfreville="rdesktop -g 1024x768 -P -z -a 16 -x b -r sound:off -u s.chailloux 192.168.250.22:3389"
# OpenErp Alias
alias oetail="sudo journalctl -u openerp-server.service -f | cut -d' ' -f8-"
alias oerestart='sudo systemctl restart openerp-server.service'
alias cdaddons='cd /usr/lib/python2.7/site-packages/openerp/addons/'
alias cdvp='cd /data/vp/dev/'
# End Work #
############

###########################
# MOTD Message Of The Day #
#define the filename to use as output
motd="/etc/motd"
# Collect useful information about your system
# $USER is automatically defined
HOSTNAME=`uname -n`
KERNEL=`uname -r`
CPU=`cat /proc/cpuinfo | grep "model name" | head -n1 | cut -d ' ' -f3-` #`uname -p`
RAM=`free -h | grep Mem | cut -d' ' -f12`
ARCH=`uname -m`
# The different colours as variables
W="\033[00;37m"
B="\033[01;34m"
R="\033[00;35m" 
X="\033[00;37m"
clear > $motd # to clear the screen when showing up
# echo -e "

#         ,                       _     _ _
#        /#\        __ _ _ __ ___| |__ | (_)_ __  _   ___  __
#       ,###\      / _` | '__/ __| '_ \| | | '_ \| | | \ \/ /
#      /#####\    | (_| | | | (__| | | | | | | | | |_| |>  <
#     /##,-,##\    \__,_|_|  \___|_| |_|_|_|_| |_|\__,_/_/\_\
#    /##(   )##`
#   /#.--   --.#\       Make it simple and lightweight.
#  /`           `\
# " >> $motd
echo -e "" >> $motd
echo -e "                              ┏━┓┏━┓┏━╸╻ ╻╻  ╻┏┓╻╻ ╻╻ ╻" >> $motd
echo -e "                              ┣━┫┣┳┛┃  ┣━┫┃  ┃┃┗┫┃ ┃┏╋┛" >> $motd
echo -e "                              ╹ ╹╹┗╸┗━╸╹ ╹┗━╸╹╹ ╹┗━┛╹ ╹" >> $motd
echo -e "" >> $motd
echo -e "$B        ,       " >> $motd
echo -e "$B       /#\      $R#===================================================#" >> $motd
echo -e "$B      ,###\     $W Welcome $B $USER $W to $B $HOSTNAME" >> $motd
echo -e "$B     /#####\    $R ARCH   $W= $ARCH" >> $motd
echo -e "$B    /##,-,##\   $R KERNEL $W= $KERNEL" >> $motd
echo -e "$B   /##(   )##\`  $R CPU    $W= $CPU" >> $motd
echo -e "$B  /#.--   --.#\ $R#===================================================#" >> $motd
echo -e "$B /\`           \`\ $X" >> $motd
echo -e "" >> $motd
echo -e "" >> $motd

cat $motd
#         End MODT         #
############################


# Tips #######################################
#                                            #
# search lost file in all pkg : pacman -Qkq  #
# list wifi-network : sudo iwlist wlan0 scan #
# put wlan0 up : sudo ip link set wlan0 up   #
# alsamixer CLI : amixer -c 0 set PCM 2dB+   #
#                                            #
##############################################

# Customize to your needs...
export PATH="${PATH}:/root/.gem/ruby/1.9.1/bin"