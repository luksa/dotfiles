# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
[ -r /home/luksa/.byobu/prompt ] && . /home/luksa/.byobu/prompt   #byobu-prompt#


export PATH=$PATH:/opt/openshift

#export EDITOR=/opt/idea/bin/idea_default_editor.sh

# The next line updates PATH for the Google Cloud SDK.
source '/home/luksa/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/luksa/google-cloud-sdk/completion.bash.inc'


# Added by fabric8-maven-plugin at Thu Apr 26 15:10:50 CEST 2018
export PATH=$PATH:/home/luksa/.fabric8/bin

# enable bash completion for openshift's oc command
source <(oc completion bash)

# source kubectl bash completion
if hash kubectl 2>/dev/null; then
	source <(kubectl completion bash)
	complete -o default -F __start_kubectl k
fi


for file in ~/.{aliases,functions,path,dockerfunc,extra,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file


# istio stuff
export ISTIO=$GOPATH/src/istio.io # eg. ~/go/src/istio.io
export HUB="docker.io/luksa"
export TAG=latest

# bat theme
export BAT_THEME="OneHalfDark"

# use vim as default editor 
export EDITOR=vim

