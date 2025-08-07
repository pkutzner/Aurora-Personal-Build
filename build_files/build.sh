#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux aria2.x86_64

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket

# install VirtualBox using script from bazzite-virtualbox
curl -L -o /tmp/vbox.sh "https://raw.githubusercontent.com/Preston159/bazzite-virtualbox/refs/heads/main/build.sh"
sed -i 's/bazzite/fc42/g' /tmp/vbox.sh
chmod +x /tmp/vbox.sh
/tmp/vbox.sh
