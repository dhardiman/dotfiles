# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dave"

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
plugins=(git textmate osx brew git-flow pressrunbuild hockeyupload hockeydelete)

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/
export ANDROID_HOME=~/android-sdk-macosx/

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/davidhardiman/.rvm/gems/ruby-1.9.2-p180/bin:/Users/davidhardiman/.rvm/gems/ruby-1.9.2-p180@global/bin:/Users/davidhardiman/.rvm/rubies/ruby-1.9.2-p180/bin:/Users/davidhardiman/.rvm/bin:/usr/local/bin:/usr/local/sbin:/Users/davidhardiman/.gem/ruby/1.8/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

CDPATH=~/Projects

#alias for making a tar.bz2 archivecd /
alias tarbz2='tar -jcvf'
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

alias symlink='ln -s'

alias symb='atos -arch armv7 -o'

alias cls='tput clear'

alias killderiveddata='rm -rf ~/Library/Developer/Xcode/DerivedData/'
alias ddd='killderiveddata'

alias normalxcode='sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer'
alias gmxcode='sudo xcode-select --switch ~/Desktop/Xcode.app/Contents/Developer'

alias xcode='open *.xcodeproj'
alias xcodew='open *.xcworkspace'

alias develop='git checkout develop && git updatesubs'
alias master='git checkout master && git updatesubs'

alias rake='noglob rake'

function fixpng ()
{
        if [[ ! -f $1 ]] ; then
                echo "Usage: fixpng <inputFiles> [outputFile]"
                return -1
        else
                local inputFile=$1
                local outputFile=$1
                if [[ -e $2 ]] ; then
                        outputFile=$2
                else
                        zmodload zsh/regex
                        local baseName=$1
                        [[ $inputFile -regex-match "^(.*).png" ]] && baseName=$match[1]
                        outputFile=$baseName-fixed.png
                fi

                echo Writing fixed PNG to $outputFile

                "`xcode-select -print-path`/Platforms/iPhoneOS.platform/Developer/usr/bin/pngcrush" -q -revert-iphone-optimizations $inputFile $outputFile
        fi
}

# Fix a whole mess of pngs at once
fixpngs ()
{
        if [[ ! -f $1 ]] ; then
                echo "Usage: fixpng <inputFiles> [outputFile]"
                return -1
        else
                for i in "$@"; do fixpng ./"$i"; done;
        fi
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
