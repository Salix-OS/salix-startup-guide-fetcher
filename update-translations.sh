#!/bin/sh

intltool-extract --type="gettext/ini" salix-startup-guide.desktop.in
xgettext --from-code=utf-8 -j -L C -kN_ -o po/salix-startup-guide.pot salix-startup-guide.desktop.in.h

rm salix-startup-guide.desktop.in.h

cd po
for i in `ls *.po`; do
	msgmerge -U $i salix-startup-guide.pot
done
rm -f ./*~

