#!/system/bin/sh
export PATH="/sbin:/system/sbin:/system/bin:/system/xbin":${PATH}
#==============================================================================
#
#   File Name: config_aplogd.sh
#
#   General Description: This file is used to configure the aplogd's sqlite3
#   database in a user friedly way.
#
#==============================================================================
#                     Motorola Confidential Proprietary
#            (c) Copyright Motorola 2010, All Rights Reserved

log_level="Q" # Q: quiet; D: debug

aplogd_config_settings_a="aplogd.AOL.status"
aplogd_config_settings_m="aplogd.collect.main"
aplogd_config_settings_r="aplogd.collect.radio"
aplogd_config_settings_e="aplogd.collect.events"
aplogd_config_settings_k="aplogd.collect.kernel"
aplogd_config_settings_s="aplogd.collect.system"
aplogd_db="/data/logger/aplogd.db"

aplogd_pid_file="/tmp/aplogd.pid"

sqlite_cmd1_head="sqlite3 ${aplogd_db} 'DELETE FROM config"
sqlite_cmd2_head="sqlite3 ${aplogd_db} 'INSERT INTO config"

build_cmd="0"

echo_info() {
    if [ $log_level = "D" ]
    then
        echo "[INFO] $1"
    fi
}

echo_warn() {
    if [ $log_level != "Q" ]
    then
        echo "[WARN] $1"
    fi
}

echo_usage() {
    echo "Usage: config_aplogd.sh [OPTION]"
    echo "Configure aplogd."
    echo
    echo "      -a E    enable AOL logging if E=ON, stop it if E=OFF"
    echo "      -m E    start logging main log if E=1, stop it if E=0"
    echo "      -r E    start logging radio log if E=1, stop it if E=0"
    echo "      -e E    start logging events log if E=1, stop it if E=0"
    echo "      -k E    start logging kernel log if E=1, stop it if E=0"
    echo "      -s E    start logging system log if E=1, stop it if E=0"
}

inform_aplogd() {
#Inform aplogd of the changes.
    echo_info "Inform aplogd of the changes."
    if [ ! -f "${aplogd_pid_file}" ]
    then
        echo_warn "Aplogd seems not running at present. The change will take effect next time aplogd runs."
        aplogd_pid=0
    else
        aplogd_pid=`cat ${aplogd_pid_file}`
    fi

    if [ "$aplogd_pid" -ne "0" ]
    then
        kill -10 $aplogd_pid
    fi
}


#The command line to used this script seems like
# config_aplogd.sh s(ize)=5 m(ain)=1 r(adio)=0 e(vent)=1 k(ernel)=1 a(OL)=0
#If no parameter, just print the current settings.
if [ -z "$1" ]
then
echo_info "No parameter, just print the current settings and send USER1."
    echo_info "list aplogd settings in the database"
    aplogd_cur_config=`sqlite3 ${aplogd_db} 'SELECT * FROM config'`
    result=$?
    if [ "$result" -ne "0" ]
    then
        echo_warn "No aplogd setting exists!"
        exit 0
    fi
    echo_info "Current aplogd settings in database:"
    echo_info "$aplogd_cur_config"
    echo_usage
    inform_aplogd
    exit 0
fi

#Look through the parameters.
echo_info "Look through the parameters."

s="-1"
m="-1"
r="-1"
e="-1"
k="-1"
a="-1"

TEMP=`busybox getopt -o "s:m:r:e:k:a:" -- "$@"`
if [ $? != 0 ];
then
    echo_warn "Terminating..."
    exit 0
fi
eval set -- "$TEMP"

while [ ! -z "$1" ]
do
    case "$1" in
        -s) s=$2;build_cmd=1;;
        -m) m=$2;build_cmd=1;;
        -r) r=$2;build_cmd=1;;
        -e) e=$2;build_cmd=1;;
        -k) k=$2;build_cmd=1;;
        -a) a=$2;build_cmd=1;;
        *) break;;
    esac
    echo_info "$1=$2"
    shift 2
done

echo_info "s=$s, m=$m, r=$r, e=$e, k=$k, a=$a"

if [ $build_cmd -eq 0 ]
then
    echo_warn "No real change!"
    exit 0
fi

#sqlite3 will ignore this command if table 'config' exists. 
sqlite3 ${aplogd_db} 'CREATE TABLE config(name text, value text)' 2>/dev/null

#construct the command line to update the database.
echo_info "construct the command line to update the database."
for p in s m r e k a
do
    eval tmp_value=\$$p
    tmp_name="aplogd_config_settings_$p"
    eval tmp_name=\$$tmp_name

    if [ $tmp_value != "-1" ]
    then
        #delete old config value
        sqlite_cmd="${sqlite_cmd1_head} WHERE name=\"$tmp_name\""
        sqlite_cmd="${sqlite_cmd}'"
        echo_info "${sqlite_cmd}"
        eval "${sqlite_cmd}"
        #insert the new config value
        sqlite_cmd="${sqlite_cmd2_head} values(\"$tmp_name\",\"$tmp_value\")"
        sqlite_cmd="${sqlite_cmd}'"
        echo_info "${sqlite_cmd}"
        eval "${sqlite_cmd}"

    fi
done
aplogd_cur_config=`sqlite3 ${aplogd_db} 'SELECT * FROM config'`
echo_warn "Current aplogd settings in database:"
echo_warn "$aplogd_cur_config"

inform_aplogd
