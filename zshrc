
############################################################################################
############################################################################################
##########                                                                        ##########
##########                      NEW VERSIONS OS .ZSHRC FILE                       ##########
##########                                                                        ##########
############################################################################################
############################################################################################

ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one from https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Useful oh-my-zsh plugins for Le Wagon bootcamps
plugins=(git gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search pyenv)

# (macOS-only) Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed (to manage your Ruby versions)
export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load pyenv (to manage your Python versions)
export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
export PYENV_VIRTUALENV_DISABLE_PROMPT=1 # https://github.com/pyenv/pyenv-virtualenv/issues/135
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" && RPROMPT+='[🐍 $(pyenv_prompt_info)]'

# Load nvm (to manage your node versions)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Call `nvm use` automatically in a directory with a `.nvmrc` file
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use --silent
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    nvm use default --silent
  fi
}
add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# export GOOGLE_APPLICATION_CREDENTIALS=\\wsl$\Ubuntu\home\renan\gcloud-xps\Batch-541-8b42649e54a4.json
export GOOGLE_APPLICATION_CREDENTIALS=/Ubuntu/home/renan/gcloud-xps/batch-541-mac-42fa98d1aa16.json


# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"
export PATH="/usr/local/opt/bzip2/bin:$PATH"

# # Solving problems with python installation in macOS Big Sur
# export PATH="/usr/local/opt/bzip2/bin:$PATH"
# export CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include $CPPFLAGS"
# export CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include"
# export LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"


############################################################################################
############################################################################################
##########                                                                        ##########
##########                      OLD VERSIONS OS .ZSHRC FILE                       ##########
##########                                                                        ##########
############################################################################################
############################################################################################

# # ZSH=$HOME/.oh-my-zsh

# # # You can change the theme with another one from https://github.com/robbyrussell/oh-my-zsh/wiki/themes
# # ZSH_THEME="robbyrussell"

# # # Useful oh-my-zsh plugins for Le Wagon bootcamps
# # plugins=(gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search ssh-agent)

# # # (macOS-only) Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
# # export HOMEBREW_NO_ANALYTICS=1

# # ZSH_DISABLE_COMPFIX=true
# # # Actually load Oh-My-Zsh
# # source "${ZSH}/oh-my-zsh.sh"
# # unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# # # Load rbenv if installed (To manage your Ruby versions)
# # export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
# # type -a rbenv > /dev/null && eval "$(rbenv init -)"

# # # Load pyenv (To manage your Python versions)
# # export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
# # type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

# # # Load nvm if installed (To manage your Node versions)
# # export NVM_DIR="$HOME/.nvm"
# # [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# # # Rails and Ruby uses the local `bin` folder to store binstubs.
# # # So instead of running `bin/rails` like the doc says, just run `rails`
# # # Same for `./node_modules/.bin` and nodejs
# # export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# # # Load 'lewagon' virtualenv for the Data Bootcamp. You can comment these 2 lines to disable this behavior.
# # export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# # pyenv activate lewagon 2>/dev/null && echo "🐍 Loading 'lewagon' virtualenv"

# # # Store your own aliases in the ~/.aliases file and load the here.
# # [[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# # # Encoding stuff for the terminal
# # export LANG=en_US.UTF-8
# # export LC_ALL=en_US.UTF-8
# # export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
# # export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"
# # export BROWSER='"/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"'
# # export BROWSER='"/mnt/c/Program Files (x86)/Mozilla Firefox/firefox.exe"'

# ZSH=$HOME/.oh-my-zsh

# # You can change the theme with another one from https://github.com/robbyrussell/oh-my-zsh/wiki/themes
# ZSH_THEME="robbyrussell"

# # Useful oh-my-zsh plugins for Le Wagon bootcamps
# plugins=(git gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search pyenv ssh-agent)

# # (macOS-only) Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
# export HOMEBREW_NO_ANALYTICS=1

# ZSH_DISABLE_COMPFIX=true
# # Actually load Oh-My-Zsh
# source "${ZSH}/oh-my-zsh.sh"
# unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# # Load rbenv if installed (to manage your Ruby versions)
# export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
# type -a rbenv > /dev/null && eval "$(rbenv init -)"

# # Load pyenv (to manage your Python versions)
# export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1 # https://github.com/pyenv/pyenv-virtualenv/issues/135
# type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" #  && RPROMPT+='[🐍 $(pyenv_prompt_info)]'

# # Load nvm (to manage your node versions)
# # export NVM_DIR="$HOME/.nvm"
# # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # # Call `nvm use` automatically in a directory with a `.nvmrc` file
# # autoload -U add-zsh-hook
# # load-nvmrc() {
# #   local node_version="$(nvm version)"
# #   local nvmrc_path="$(nvm_find_nvmrc)"

# #   if [ -n "$nvmrc_path" ]; then
# #     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

# #     if [ "$nvmrc_node_version" = "N/A" ]; then
# #       nvm install
# #     elif [ "$nvmrc_node_version" != "$node_version" ]; then
# #       nvm use --silent
# #     fi
# #   elif [ "$node_version" != "$(nvm version default)" ]; then
# #     nvm use default --silent
# #   fi
# # }
# # add-zsh-hook chpwd load-nvmrc
# # load-nvmrc

# # # Rails and Ruby uses the local `bin` folder to store binstubs.
# # # So instead of running `bin/rails` like the doc says, just run `rails`
# # # Same for `./node_modules/.bin` and nodejs
# # export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# # # Load 'lewagon' virtualenv for the Data Bootcamp. You can comment these 2 lines to disable this behavior.
# # export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# # pyenv activate lewagon 2>/dev/null && echo "🐍 Loading 'lewagon' virtualenv"

# # Store your own aliases in the ~/.aliases file and load the here.

# # export GOOGLE_APPLICATION_CREDENTIALS=\\wsl$\Ubuntu\home\renan\gcloud-xps\Batch-541-8b42649e54a4.json
# export GOOGLE_APPLICATION_CREDENTIALS=/Ubuntu/home/renan/gcloud-xps/batch-541-mac-42fa98d1aa16.json


# # Encoding stuff for the terminal
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
# export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"
# export PATH="/usr/local/opt/bzip2/bin:$PATH"

# # # Solving problems with python installation in macOS Big Sur
# # export PATH="/usr/local/opt/bzip2/bin:$PATH"
# # export CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include $CPPFLAGS"
# # export CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include"
# # export LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
