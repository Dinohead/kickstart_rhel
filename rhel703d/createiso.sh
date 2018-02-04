#!/bin/bash
set -x
umount /dev/sr0
mkdir /mnt/cdrom /tmp/bootisoks
mount -o loop /dev/sr0 /mnt/cdrom
cp -r /mnt/cdrom/* /tmp/bootisoks
umount /mnt/cdrom
rmdir /mnt/cdrom
chmod -R u+w /tmp/bootisoks
/bin/cp -rf ks.cfg /tmp/bootisoks/ks.cfg
/bin/cp -rf isolinux.cfg /tmp/bootisoks/isolinux/isolinux.cfg
cd /tmp/bootisoks
mkisofs -o /tmp/rhel703d.iso -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -J -v -T isolinux/. .
rm -rf /tmp/bootisoks
