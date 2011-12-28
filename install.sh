#!/bin/sh

cd $(dirname $0)
VER=$(grep '^SALIX_VERSION=' src/salix-startup-guide | head -n 1 | cut -d= -f2)

install -d -m 755 $DESTDIR/usr/bin/
install -d -m 755 $DESTDIR/usr/doc/salix-startup-guide-$VER
install -d -m 755 $DESTDIR/usr/share/applications/
install -d -m 755 $DESTDIR/usr/share/icons/hicolor/128x128/apps
install -d -m 755 $DESTDIR/install
install -m 755 src/salix-startup-guide $DESTDIR/usr/bin/
install -m 644 salix-startup-guide.desktop $DESTDIR/usr/share/applications/
install -m 644 salix-startup-guide-kde.desktop $DESTDIR/usr/share/applications/
install -m 644 src/salixguide-logo.png $DESTDIR/usr/share/icons/hicolor/128x128/apps/salixguide-logo.png

for i in `ls docs`; do
	install -m 644 docs/${i} \
	$DESTDIR/usr/doc/salix-startup-guide-$VER/
done
