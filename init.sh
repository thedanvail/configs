#!/bin/bash

linuxSetup() {
	echo "Beginning Linux setup.";
	cd ~

	# Map linux distros to their package manager install commands
	declare -A osInfo;
	osInfo[/etc/redhat-release]="yum install"
	osInfo[/etc/arch-release]="pacman -S"
	osInfo[/etc/gentoo-release]="emerge"
	osInfo[/etc/SuSE-release]="zypper install"
	osInfo[/etc/debian_version]="apt-get install"
	osInfo[/etc/alpine-release]="apk add"

	for f in ${!osInfo[@]}
	do
		if [[ -f $f ]];then
			eval sudo ${osInfo[$f]} python3 fish neovim curl awk sed jq
		fi
	done
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source $HOME/.cargo/env
	chsh -s $(which fish)
}

osxSetup() {
	echo "Beginning OSx setup.";
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install python3 fish neovim curl awk sed jq

	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source $HOME/.cargo/env
	chsh -s $(which fish)
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	linuxSetup
elif [[ "$OSTYPE" == "dawrin"* ]]; then
	osxSetup
else
	echo "Unsupported OS. Aborting.";
fi
