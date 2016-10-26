#!/bin/bash

# Creates a new user using the arguments given to this script, e.g.:
#   ./cp-create-user.sh -u bob -s /usr/bin/zsh -g vagrant
# The -u/--user option is mandatory. All other options are optional.
# The user's home directory will be an exact copy of /home/vagrant.

# Call this script at the very bottom of your Vagrantfile!

# To be run as root.

while [[ $# -gt 1 ]]
do
  key="$1"

  case $key in
      -u|--user)
        BOX_USER="$2"
        shift
      ;;
      -g|--group)
        BOX_GROUP="$2"
        shift
      ;;
      -s|--shell)
        BOX_SHELL="$2"
        shift
      ;;
      *)
        # Unknown option.
      ;;
  esac
  shift
done

if [ -z "${BOX_USER}" ]; then
  echo "Error: No username specified. Aborting..." >&2
  exit 1
fi

if [ -z "${BOX_GROUP}" ]; then
  BOX_GROUP="vagrant"
fi

if [ -z "${BOX_SHELL}" ]; then
  BOX_SHELL="/bin/bash"
fi

useradd -s ${BOX_SHELL} -m ${BOX_USER} -G ${BOX_GROUP}
rsync -av /home/vagrant/ /home/${BOX_USER}/
chown -R ${BOX_USER}:${BOX_USER} /home/${BOX_USER}
sed -i "s/vagrant/${BOX_USER}/g" /home/${BOX_USER}/.ssh/authorized_keys
chmod 600 /home/${BOX_USER}/.ssh/authorized_keys
chmod 700 /home/${BOX_USER}/.ssh/
echo "${BOX_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${BOX_USER}
