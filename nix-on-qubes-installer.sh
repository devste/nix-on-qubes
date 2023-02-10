#!/bin/bash

qubes_bind_dir_script="/usr/lib/qubes/bind-dirs.sh"
nix_dir="/nix"
nix_version="2.13.2"
nix_install_src="https://releases.nixos.org/nix/nix-${nix_version}/install"

cd "${HOME}" || exit

# Create the nix-specific bind-dir configuration for qubes
sudo mkdir -p /rw/config/qubes-bind-dirs.d
echo "binds+=( '${nix_dir}' )" | sudo tee /rw/config/qubes-bind-dirs.d/60_nix_on_qubes.conf

# Prepare the /nix directory and bind-mount it with qubes bind-dir
sudo ${qubes_bind_dir_script} umount
sudo mkdir -p ${nix_dir}
sudo chown "${USER}" "${nix_dir}"
sudo ${qubes_bind_dir_script}

# Download the installer
echo "Downloading nix installer from ${nix_install_src}"
curl --proto '=https' --tlsv1.2 "${nix_install_src}" -o "nix-installer-${nix_version}.sh"
chmod u+x nix-installer-${nix_version}.sh
./nix-installer-${nix_version}.sh \
	--no-daemon

# shellcheck source=/dev/null
source "${HOME}/.profile"
