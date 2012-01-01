#!/bin/sh

cd $(dirname $0)
./compile.sh
mkdir -p pkg
export DESTDIR=$PWD/pkg
./install.sh
VER=$(grep '^SALIX_VERSION=' src/salix-startup-guide | head -n 1 | cut -d= -f2)
cd pkg
cat <<EOF > install/slack-desc
salix-startup-guide: Salix Startup Guide
salix-startup-guide:
salix-startup-guide: Salix Startup Guide is a script that automatically
salix-startup-guide: download and show the guide in the current locale if
salix-startup-guide: available, or in english by default.
salix-startup-guide:
salix-startup-guide:
salix-startup-guide:
salix-startup-guide:
salix-startup-guide:
salix-startup-guide:
EOF
makepkg -l y -c n ../salix-startup-guide-$VER-noarch-1cp.txz
cd ..
md5sum salix-startup-guide-$VER-noarch-1cp.txz > salix-startup-guide-$VER-noarch-1cp.md5
echo -e "coreutils,sed,wget,xdg-utils" > salix-startup-guide-$VER-noarch-1cp.dep
rm -rf pkg
