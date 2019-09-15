#!/bin/sh


if [ ! -d "${DEFAULT_ROOT}" ]; then
    echo "Create root dir : ${DEFAULT_ROOT}"
    mkdir -p ${DEFAULT_ROOT}
fi

if [ "${DEFAULT_USR}" != "username" ]; then
    # Create user root directory if not exists
    if [ ! -d ${DEFAULT_ROOT}${DEFAULT_USR} ]; then
        mkdir ${DEFAULT_ROOT}${DEFAULT_USR}
    fi
    
    # Create user
    echo "Create new user : ${DEFAULT_USR}"
    expect -c "
        spawn pure-pw useradd ${DEFAULT_USR} -u pure -d /opt/pure/datas/${DEFAULT_USR}
        expect {
            Password { 
                send \"${DEFAULT_PWD}\r\"
                exp_continue
            }
            again { 
                send \"${DEFAULT_PWD}\r\"
                exp_continue 
            }
        }
    "

    # Update puredb
    echo "Create puredb"
    pure-pw mkdb /opt/pure/secure/pureftpd.pdb
fi

FTP_FLAGS=""
if [ -n "${FTP_HOST}" ]; then
    FTP_FLAGS="${FTP_FLAGS} -P ${FTP_HOST}"
fi
if [ -n "${FTP_PASSIVE_PORT_RANGE}" ]; then
    if [ -z "${FTP_HOST}" ]; then
        echo "Usage :"
        echo " - FTP_HOST must be defined"
        exit
    fi

    #FTP_HOST=${FTP_HOST:-localhost}
    FTP_FLAGS="${FTP_FLAGS} -P ${FTP_HOST} -p ${FTP_PASSIVE_PORT_RANGE}"
fi

echo "Starting Pure-FTPD :"
echo "> pure-ftpd -c ${FTP_CLIENTS} -C ${FTP_CONNECTIONS} -l puredb:/opt/pure/secure/pureftpd.pdb -j -E ${FTP_FLAGS}"

# Option explanations :
#   -c <int> : Allow maximum of clients to be connected
#   -C <int> : Limit the number of simultaneous connections coming from the same IP address.
#   -E : Only allow authenticated users. Anonymous logins are prohibited.
#   -H : Avoid host names resolution
#   -j : If the home directory of a user doesn't exist, automatically create it.
#   -l <puredb:path> : PureDB file
#   -P <ip address or host name> : Force the specified parameter in reply to a PASV/EPSV/SPSV command.
#   -p <rangeStart:rangeStop> : Only use ports in range <rangeStart:rangeStop> for passive mode downloads.
exec /usr/sbin/pure-ftpd -c ${FTP_CLIENTS} -C ${FTP_CONNECTIONS} -l puredb:/opt/pure/secure/pureftpd.pdb -j -E -H${FTP_FLAGS} $@