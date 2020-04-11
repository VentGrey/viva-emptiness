#! /usr/bin/env bash


[ -L "$0" ] && pushd `readlink $0 | xargs dirname` > /dev/null \
    || pushd `dirname $0` > /dev/null
export OPATH=`pwd -P`
popd > /dev/null || exit

function use {
    cat << __EOF__

   Viva Emptiness

   Funtoo Linux toolkit for newb and lazy users

   usage: viva [module] [option] or type "--help" to view this screen
          or command help usage.

          OPTIONS:
            help

          modules:
__EOF__

    for i in ${OPATH}/breeds/*; do
        [ ! -L "$i" -a -f "$i" ] && echo "            ${i##*/}"
    done

    [ "${OPTIONS}" == "help" ] && exit 0 || exit 1
   
}

OPTIONS=$1; shift;

[ ! -f "${OPATH}/breeds/${OPTIONS}" ] && use
${OPATH}/breeds/${OPTIONS} "$@"

# Orchid 2020 - VentGrey
