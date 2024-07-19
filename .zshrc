# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulators
PSQL_PATH="/Applications/Postgres.app/Contents/Versions/latest/bin"
export PATH=$PATH:$PSQL_PATH
export PATH=/usr/local/bin:$PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=/usr/local/share/npm/bin:$PATH
# export PATH=/usr/.nvm/versions/node/v14.16.1/bin/npm:$PATH
# source ~/.bash_profile
# . ~/z.sh
# Prevents ^ (and some other characters) from being interpreted as a glob (ref: npm i)
# unsetopt extended_globG
# load time profiling
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  # gitfast
  # heroku # very slow load time
  zsh-syntax-highlighting
  # npm
  # macos
  z
  zsh-autosuggestions
  fzf
  # zsh-interactive-cd
  # web-search
  # dirhistory
  # thefuck
  # git-open
)

export EDITOR='vim'
export FZF_BASE=/usr/local/bin/fzf

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM="$ZSH/custom"

# Needs to come after the plugin are loaded
source $ZSH/oh-my-zsh.sh


# Pure theme https://github.com/sindresorhus/pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
ZSH_THEME="PURE"
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# See here for how to lazy load NVM if I need it: https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/#:~:text=Caching%20Eval%20statements.-,Lazy%20Loading,-The%20issue%20with

# Path to your oh-my-zsh installation.

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# for plugin ($plugins); do
#   if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
#     source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
#   elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
#     source $ZSH/plugins/$plugin/$plugin.plugin.zsh
#   fi
# done

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# heroku autocomplete setup
# HEROKU_AC_ZSH_SETUP_PATH=/Users/jamesbackhouse/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# bit
export PATH="$PATH:/Users/jamesbackhouse/bin"
# bit end

eval "$(~/.local/bin/mise activate zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
