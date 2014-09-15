PATH=/usr/local/bin:/usr/local/sbin:~/.gem/ruby/1.8/bin:$PATH
CDPATH=~/Projects

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Returns "*" if the current git branch is dirty.
function parse_git_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "✎"
}

# Returns "|shashed:N" where N is the number of stashed states (if any).
function parse_git_stash {
  local stash=`expr $(git stash list 2>/dev/null| wc -l)`
  if [ "$stash" != "0" ]
  then
    echo "|stashed:$stash"
  fi
}

# Get the current git branch name (if available)
git_prompt() {
  #local ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
  local ref=$(__git_ps1 "%s")
  if [ "$ref" != "" ]
  then
    echo "($ref$(parse_git_dirty)$(parse_git_stash)) "
  fi
}

PS1='\W \u $(git_prompt)$ '

alias cls='tput clear'

# Load in .bashrc -------------------------------------------------
source ~/.bashrc

#alias for making a tar.bz2 archivecd /
alias tarbz2='tar -jcvf'

alias symlink='ln -s'

alias symb='xcrun -sdk iphoneos atos -arch armv7 -o'

alias symcrash='/Developer/Platforms/iPhoneOS.platform/Developer/Library/PrivateFrameworks/DTDeviceKit.framework/Versions/A/Resources/symbolicatecrash'

#Go to paros directory, run paros.jar, return to previous directory
alias paros='cd /Users/davidhardiman/Documents/paros/build/paros/; java -jar paros.jar; cd -'

export ANDROID_HOME=~/android-sdk-macosx/
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
