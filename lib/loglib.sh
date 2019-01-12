#!/bin/bash -
# You must set 'LOGFILE'
readonly PROCNAME=${0##*/}
log() {
    local fname=${BASH_SOURCE[1]##*/}
    # echo -e "$(date '+%Y-%m-%dT%H:%M:%S') ${PROCNAME} (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $@" | tee -a ${LOGFILE}
    echo -e "$(date '+%Y-%m-%dT%H:%M:%S') ${PROCNAME} (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $@" | tee -a "${LOGFILE}"
}
