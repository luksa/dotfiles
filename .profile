export PATH=$PATH:/opt/openshift

alias kcd='kubectl config set-context $(kubectl config current-context) --namespace '
alias kshell='kubectl run -it shell --rm --image giantswarm/tiny-tools --restart Never -- sh'

export PATH=/home/luksa/projects/jboss/go/src/k8s.io/kubernetes/third_party/etcd:${PATH}

function rpi() {
  if [ $# -lt 2 ]; then
    echo "Usage: rpi <node> <cmd>"
    echo "       where <node> is either all or master or the node index (1,2,3,...,7)"
    echo
    echo "Examples: rpi all sudo poweroff"
    echo "          rpi master hostname -f"
    echo "          rpi 1 systemctl restart kubelet"
    echo
    exit 1
  fi

  node=$1
  args=${@:2}
  sshopts="-t"

  if [ "$node" == "all" ]; then
    echo "master:" ; ssh $sshopts luksa@master.rpi $args ; echo
    for i in `seq 1 7`; do echo "node$i:" ; ssh $sshopts luksa@node$i.rpi $args ; echo ; done
  elif [ "$node" == "master" ] || [ "$node" == "0" ]; then
    ssh $sshopts luksa@master.rpi $args
  else
    ssh $sshopts luksa@node$node.rpi $args
  fi
}

alias nowrap="less -S -# 20"
alias wrapon="tput smam"
alias wrapoff="tput rmam"

alias killjobs='kill $(jobs -p)'

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

export GOPATH=$HOME/projects/go
PATH=$PATH:$GOPATH/bin
export PATH

export CDPATH=$CDPATH:/home/luksa/Bookmarks

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'




