#!/bin/bash

function ssh_sliver_stage_worker() {
    gcloud beta compute ssh --zone "us-central1-a" "celery-worker-1" --project "ace-momentum-248417"
}

# branch
function br() {
  GIT_BRANCH=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [[ ! -z $GIT_BRANCH ]]; then
      echo "$GIT_BRANCH"
  fi
}

function git_branch() {
  GIT_BRANCH=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [[ ! -z $GIT_BRANCH ]]; then
    echo " ($GIT_BRANCH)"
  fi
}


# test environment ssh: Scalr

DEFAULT_TEST_ENV_HOST="test-env.scalr.com"
LAST_TE_PORT_FILE=~/.test-env-port

te(){
    if [[ -z "$1" ]] ; then
        if [[ -f $LAST_TE_PORT_FILE ]] ; then
            TE_PORT=$(cat $LAST_TE_PORT_FILE)
            echo "[INFO] Connecting to port: $TE_PORT"
        else
            echo "[ERROR] You must specify port number as a first argument!"
	    return 1
        fi
    else
        TE_PORT=$1
        echo -n "Do you want to save port $TE_PORT? (y/n):"
        read answer
        if [[ "$answer" == "y" ]] ; then
           echo $TE_PORT > $LAST_TE_PORT_FILE
               echo "[INFO] Port $TE_PORT successfuly saved!"
        fi
    fi
    shift;
    ssh -i ~/.ssh/scalr_id_rsa -l root -p $TE_PORT ${2:-$DEFAULT_TEST_ENV_HOST} -t 'bash --rcfile ~/.dark_customrc -i' $@
}

te_exec(){
    if [[ -f $LAST_TE_PORT_FILE ]] ; then
        TE_PORT=$(cat $LAST_TE_PORT_FILE)
        echo "[INFO] Using port: $TE_PORT"
    else
        echo "[ERROR] Execute te [port_number] first!"
        return 1
	fi
    if [[ -z "$1" ]] ; then
       echo "[ERROR] You must specify command as a first argument!"
	    return 1
    fi

    ssh -i ~/.ssh/scalr_id_rsa -l root -p $TE_PORT ${2:-$DEFAULT_TEST_ENV_HOST} $1
}


# Kubernetes functions: Newfire

function pod_logs {
    namespace=$1; shift
    echo "namespace: $namespace"
    pod_name_regexp=${1-'backend-app'}; shift
    echo "pod-regex: $pod_name_regexp"
    pod_name=$(kubectl -n $namespace get pods | grep $pod_name_regexp | grep Running | tail -1 | cut -d " " -f1)
    kubectl -n $namespace logs -f $pod_name
}

function monitor_pods {
    namespace=$1
    while true; do kubectl -n $namespace get pods && sleep 10 && clear && echo ${namespace^^}; done
}

function get_pods {
    namespace=$1
    regex=$2
    kubectl -n $namespace get pods | grep $2
}

function monitor_logs {
    namespace=$1
    regex=${2-'backend'}
    kubetail $regex -n $namespace
}

function exec_pod {
    namespace=$1; shift
    echo "namespace: $namespace"
    pod_name_regexp=${1-'backend-app'}; shift
    echo "pod-regex: $pod_name_regexp"
    pod_name=$(kubectl -n $namespace get pods | grep $pod_name_regexp | grep Running | tail -1 | cut -d " " -f1)
    comm=${@-'bash'}
    echo "executing $comm at $pod_name"
    kubectl -n $namespace exec -it $pod_name $comm
}
