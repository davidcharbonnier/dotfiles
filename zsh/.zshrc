# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fix for lxterminal 256 colors
export TERM="xterm-256color"
# Fix for ranger default terminal
export TERMCMD="lxterminal"

# Set powerlevel9k font
#POWERLEVEL9K_MODE="nerdfont-complete"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dcharbonnier/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose ansible common-aliases dnf extract helm minikube)

source $ZSH/oh-my-zsh.sh

# User configuration

# Openshift client completion
#source <(oc completion zsh)

# Kubectl client completion
# waiting for https://github.com/kubernetes/kubernetes/issues/59078 to be solved before enabling this
source <(kubectl completion zsh)
# Workaround below
#function kubectl() {
#  if ! type __start_kubectl >/dev/null 2>&1; then
#    source <(command kubectl completion zsh)
#  fi
#  command kubectl "$@"
#}

# krew kubectl plugin manager
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubectl config
export KUBECONFIG=$HOME/.kube/config:$HOME/Tests/kubernetes/distributions/kubespray/inventory/vagrant/artifacts/admin.conf:$HOME/Tests/kubernetes/distributions/rke/kube_config_cluster.yml:$HOME/Formations/k8s-miseenoeuvre/source/tp/kubeconfig/k8s-formation-admin.config:/home/dcharbonnier/Projets/OL/rancher/rke/kube_config_cluster.yml:/home/dcharbonnier/Présentations/20191117-cdl-atelier-servicemesh/demo/kubeconfig

# vagrant default provider
export VAGRANT_DEFAULT_PROVIDER=libvirt

# pip user install path
export PATH="$HOME/.local/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

# General aliases
alias open='open_command'

# OL doc aliases
alias ol-doc-make='docker run --rm --user $(id -u):$(id -g) -v $PWD:/data -w /data registry.gitlab.objectif-libre.com/apps/doc-tools make'
alias ol-doc-old-make='docker run --rm --user $(id -u):$(id -g) -v $PWD:/data -w /data registry.gitlab.objectif-libre.com/apps/doc-tools:old make'
alias ol-doc-make-pdf='docker run --rm --user $(id -u):$(id -g) -v $PWD/build/singlehtml:/slides objectiflibre/decktape -s 1920x1080 -p 100 file:///slides/index.html /slides/slides.pdf'
alias ol-slides-bootstrap='docker run -ti --rm --user $(id -u):$(id -g) -v $PWD:/data -w /data registry.gitlab.objectif-libre.com/apps/doc-tools ol-slides-bootstrap'
alias ol-doc-bootstrap='docker run -ti --rm --user $(id -u):$(id -g) -v $PWD:/data -w /data registry.gitlab.objectif-libre.com/apps/doc-tools ol-doc-bootstrap'
alias dac_build='docker run --rm -it -e DEFAULT_DESTINATION=/documents/build/ -v $PWD/:/documents/ docascod/docsascode:latest build'
alias dac_assemble='docker run --rm -it -v $PWD/:/documents/ docascod/docsascode:latest assemble'

# share-tools
alias ol-share='python -m SimpleHTTPServer 8080'

# pidgin-sipe
#alias ol-pidgin-sipe='docker run --rm -d --name pidgin -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${HOME}/.pidgin-sipe-docker:/home/pidgin/.purple -v ${XDG_RUNTIME_DIR}/pulse/native:/run/user/1000/pulse/native -v ${HOME}/.config/pulse/cookie:/home/pidgin/.config/pulse/cookie -e DISPLAY ol-pidgin-sipe:pulseaudio'
#alias ol-pidgin-sipe='docker run --rm -d --name pidgin -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${HOME}/.pidgin-sipe-docker:/home/pidgin/.purple -v ${XDG_RUNTIME_DIR}/pulse/native:/run/user/1000/pulse/native -v ${HOME}/.config/pulse/cookie:/home/pidgin/.config/pulse/cookie -e DISPLAY --device=/dev/snd:/dev/snd ol-pidgin-sipe:jackd'
alias ol-pidgin-sipe='docker run --rm -d --name pidgin -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v ${HOME}/.pidgin-sipe-docker:/home/pidgin/.purple -v ${XDG_RUNTIME_DIR}/pulse/native:/run/user/1000/pulse/native -v ${HOME}/.config/pulse/cookie:/home/pidgin/.config/pulse/cookie -e DISPLAY --device=/dev/snd:/dev/snd --privileged=true ol-pidgin-sipe:jackd'

# AWS
alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:latest'

# added by travis gem
[ ! -s /home/dcharbonnier/.travis/travis.sh ] || source /home/dcharbonnier/.travis/travis.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
