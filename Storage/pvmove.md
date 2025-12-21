

```bash
[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#
[root@eyad ~]#
[root@eyad ~]# for host in `ls /sys/class/scsi_host/`; do echo "- - -" >/sys/class/scsi_host/${host}/scan; done
[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdb                    8:16   0    1G  0 disk
sdc                    8:32   0    2G  0 disk
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#
[root@eyad ~]#
[root@eyad ~]# vgcreate vg-data /dev/sdb /dev/sdc
  Physical volume "/dev/sdb" successfully created.
  Physical volume "/dev/sdc" successfully created.
  Volume group "vg-data" successfully created
[root@eyad ~]#
[root@eyad ~]# lvcreate -n lv-data -l +100%free vg-data
  Logical volume "lv-data" created.
[root@eyad ~]#
[root@eyad ~]# mkfs.xfs /dev/vg-data/lv-data
meta-data=/dev/vg-data/lv-data   isize=512    agcount=4, agsize=196096 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=784384, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
[root@eyad ~]#
[root@eyad ~]# mkdir /data
[root@eyad ~]#

[root@eyad ~]# cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Tue Nov  4 00:26:47 2025
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/centos_eyad-root /                       xfs     defaults        0 0
UUID=5a741273-2ca1-46ab-a7f8-35373c66159f /boot                   xfs     defaults        0 0
UUID=C26A-697B          /boot/efi               vfat    umask=0077,shortname=winnt 0 0
/dev/mapper/centos_eyad-swap swap                    swap    defaults        0 0
[root@eyad ~]#
[root@eyad ~]#
[root@eyad ~]# echo "/dev/vg-data/lv-data /data xfs defaults 0 0" >> /etc/fstab
[root@eyad ~]# cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Tue Nov  4 00:26:47 2025
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/centos_eyad-root /                       xfs     defaults        0 0
UUID=5a741273-2ca1-46ab-a7f8-35373c66159f /boot                   xfs     defaults        0 0
UUID=C26A-697B          /boot/efi               vfat    umask=0077,shortname=winnt 0 0
/dev/mapper/centos_eyad-swap swap                    swap    defaults        0 0
/dev/vg-data/lv-data /data xfs defaults 0 0
[root@eyad ~]#
[root@eyad ~]# mount -a
[root@eyad ~]#
[root@eyad ~]# df -Th /data
Filesystem                    Type  Size  Used Avail Use% Mounted on
/dev/mapper/vg--data-lv--data xfs   3.0G   33M  3.0G   2% /data
[root@eyad ~]#

[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdb                    8:16   0    1G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sdc                    8:32   0    2G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#

===================================================================================================



[root@eyad ~]# fallocate -l 100M /data/tmp-01.img
[root@eyad ~]# fallocate -l 100M /data/tmp-02.img
[root@eyad ~]# fallocate -l 100M /data/tmp-03.img
[root@eyad ~]# fallocate -l 100M /data/tmp-04.img
[root@eyad ~]# fallocate -l 100M /data/tmp-05.img
[root@eyad ~]#
[root@eyad ~]# df -Th /data
Filesystem                    Type  Size  Used Avail Use% Mounted on
/dev/mapper/vg--data-lv--data xfs   3.0G  533M  2.5G  18% /data
[root@eyad ~]#
[root@eyad ~]# fallocate -l 500M /data/tmp-06.img
[root@eyad ~]# fallocate -l 500M /data/tmp-07.img
[root@eyad ~]#
[root@eyad ~]# df -Th /data
Filesystem                    Type  Size  Used Avail Use% Mounted on
/dev/mapper/vg--data-lv--data xfs   3.0G  1.5G  1.5G  51% /data
[root@eyad ~]#
[root@eyad ~]# fallocate -l 500M /data/tmp-08.img
[root@eyad ~]# fallocate -l 500M /data/tmp-09.img
[root@eyad ~]#
[root@eyad ~]# df -Th /data
Filesystem                    Type  Size  Used Avail Use% Mounted on
/dev/mapper/vg--data-lv--data xfs   3.0G  2.5G  522M  83% /data
[root@eyad ~]#
[root@eyad ~]# fallocate -l 250M /data/tmp-10.img
[root@eyad ~]#
[root@eyad ~]# df -Th /data
Filesystem                    Type  Size  Used Avail Use% Mounted on
/dev/mapper/vg--data-lv--data xfs   3.0G  2.8G  272M  92% /data
[root@eyad ~]#

===================================================================================================



[root@eyad ~]# df -Th /data/
Filesystem                    Type  Size  Used Avail Use% Mounted on
/dev/mapper/vg--data-lv--data xfs   3.0G  2.8G  272M  92% /data
[root@eyad ~]#
[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdb                    8:16   0    1G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sdc                    8:32   0    2G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#





===================================================================================================

Add new disk /dev/sdd 5 GB

[root@eyad ~]# for host in `ls /sys/class/scsi_host/`; do echo "- - -" >/sys/class/scsi_host/${host}/scan; done
[root@eyad ~]#
[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdb                    8:16   0    1G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sdc                    8:32   0    2G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sdd                    8:48   0    5G  0 disk
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#



[root@eyad ~]# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  centos_eyad   1   2   0 wz--n- <48.00g    0
  vg-data       2   1   0 wz--n-   2.99g    0
[root@eyad ~]#
[root@eyad ~]# vgextend vg-data /dev/sdd
  Physical volume "/dev/sdd" successfully created.
  Volume group "vg-data" successfully extended
[root@eyad ~]#
[root@eyad ~]# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  centos_eyad   1   2   0 wz--n- <48.00g     0
  vg-data       3   1   0 wz--n-  <7.99g <5.00g
[root@eyad ~]#


[root@eyad ~]# pvs
  PV         VG          Fmt  Attr PSize    PFree
  /dev/sda3  centos_eyad lvm2 a--   <48.00g     0
  /dev/sdb   vg-data     lvm2 a--  1020.00m     0
  /dev/sdc   vg-data     lvm2 a--    <2.00g     0
  /dev/sdd   vg-data     lvm2 a--    <5.00g <5.00g
[root@eyad ~]#


[root@eyad ~]# pvs -o+pv_used
  PV         VG          Fmt  Attr PSize    PFree  Used
  /dev/sda3  centos_eyad lvm2 a--   <48.00g     0   <48.00g
  /dev/sdb   vg-data     lvm2 a--  1020.00m     0  1020.00m
  /dev/sdc   vg-data     lvm2 a--    <2.00g     0    <2.00g
  /dev/sdd   vg-data     lvm2 a--    <5.00g <5.00g       0
[root@eyad ~]#









[root@eyad ~]# pvs -o+pv_used
  PV         VG          Fmt  Attr PSize    PFree  Used
  /dev/sda3  centos_eyad lvm2 a--   <48.00g     0   <48.00g
  /dev/sdb   vg-data     lvm2 a--  1020.00m     0  1020.00m
  /dev/sdc   vg-data     lvm2 a--    <2.00g     0    <2.00g
  /dev/sdd   vg-data     lvm2 a--    <5.00g <5.00g       0
[root@eyad ~]#
[root@eyad ~]# pvmove /dev/sdb /dev/sdd
  /dev/sdb: Moved: 4.71%
  /dev/sdb: Moved: 100.00%
[root@eyad ~]#
[root@eyad ~]# pvs -o+pv_used
  PV         VG          Fmt  Attr PSize    PFree    Used
  /dev/sda3  centos_eyad lvm2 a--   <48.00g       0   <48.00g
  /dev/sdb   vg-data     lvm2 a--  1020.00m 1020.00m       0
  /dev/sdc   vg-data     lvm2 a--    <2.00g       0    <2.00g
  /dev/sdd   vg-data     lvm2 a--    <5.00g    4.00g 1020.00m
[root@eyad ~]#
[root@eyad ~]# pvmove /dev/sdc /dev/sdd
  /dev/sdc: Moved: 0.59%
  /dev/sdc: Moved: 100.00%
[root@eyad ~]#
[root@eyad ~]# pvs -o+pv_used
  PV         VG          Fmt  Attr PSize    PFree    Used
  /dev/sda3  centos_eyad lvm2 a--   <48.00g       0  <48.00g
  /dev/sdb   vg-data     lvm2 a--  1020.00m 1020.00m      0
  /dev/sdc   vg-data     lvm2 a--    <2.00g   <2.00g      0
  /dev/sdd   vg-data     lvm2 a--    <5.00g    2.00g   2.99g
[root@eyad ~]#








[root@eyad ~]# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  centos_eyad   1   2   0 wz--n- <48.00g     0
  vg-data       3   1   0 wz--n-  <7.99g <5.00g
[root@eyad ~]#
[root@eyad ~]# pvs
  PV         VG          Fmt  Attr PSize    PFree
  /dev/sda3  centos_eyad lvm2 a--   <48.00g       0
  /dev/sdb   vg-data     lvm2 a--  1020.00m 1020.00m
  /dev/sdc   vg-data     lvm2 a--    <2.00g   <2.00g
  /dev/sdd   vg-data     lvm2 a--    <5.00g    2.00g
[root@eyad ~]#
[root@eyad ~]# vgreduce vg-data /dev/sdb
  Removed "/dev/sdb" from volume group "vg-data"
[root@eyad ~]#
[root@eyad ~]# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  centos_eyad   1   2   0 wz--n- <48.00g    0
  vg-data       2   1   0 wz--n-   6.99g 4.00g
[root@eyad ~]#
[root@eyad ~]# pvs
  PV         VG          Fmt  Attr PSize   PFree
  /dev/sda3  centos_eyad lvm2 a--  <48.00g     0
  /dev/sdb               lvm2 ---    1.00g  1.00g
  /dev/sdc   vg-data     lvm2 a--   <2.00g <2.00g
  /dev/sdd   vg-data     lvm2 a--   <5.00g  2.00g
[root@eyad ~]#
[root@eyad ~]# vgreduce vg-data /dev/sdc
  Removed "/dev/sdc" from volume group "vg-data"
[root@eyad ~]#
[root@eyad ~]# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  centos_eyad   1   2   0 wz--n- <48.00g    0
  vg-data       1   1   0 wz--n-  <5.00g 2.00g
[root@eyad ~]#
[root@eyad ~]# pvs
  PV         VG          Fmt  Attr PSize   PFree
  /dev/sda3  centos_eyad lvm2 a--  <48.00g    0
  /dev/sdb               lvm2 ---    1.00g 1.00g
  /dev/sdc               lvm2 ---    2.00g 2.00g
  /dev/sdd   vg-data     lvm2 a--   <5.00g 2.00g
[root@eyad ~]#









root@eyad ~]# pvs
  PV         VG          Fmt  Attr PSize   PFree
  /dev/sda3  centos_eyad lvm2 a--  <48.00g    0
  /dev/sdb               lvm2 ---    1.00g 1.00g
  /dev/sdc               lvm2 ---    2.00g 2.00g
  /dev/sdd   vg-data     lvm2 a--   <5.00g 2.00g
[root@eyad ~]#
[root@eyad ~]# pvremove /dev/sdb
  Labels on physical volume "/dev/sdb" successfully wiped.
[root@eyad ~]# pvremove /dev/sdc
  Labels on physical volume "/dev/sdc" successfully wiped.
[root@eyad ~]#
[root@eyad ~]# pvs
  PV         VG          Fmt  Attr PSize   PFree
  /dev/sda3  centos_eyad lvm2 a--  <48.00g    0
  /dev/sdd   vg-data     lvm2 a--   <5.00g 2.00g
[root@eyad ~]#
[root@eyad ~]# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  centos_eyad   1   2   0 wz--n- <48.00g    0
  vg-data       1   1   0 wz--n-  <5.00g 2.00g
[root@eyad ~]#
[root@eyad ~]# lvs
  LV      VG          Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root    centos_eyad -wi-ao---- <43.00g
  swap    centos_eyad -wi-ao----   5.00g
  lv-data vg-data     -wi-ao----   2.99g
[root@eyad ~]#



[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdb                    8:16   0    1G  0 disk
sdc                    8:32   0    2G  0 disk
sdd                    8:48   0    5G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#
[root@eyad ~]# df -Th /data
Filesystem                    Type  Size  Used Avail Use% Mounted on
/dev/mapper/vg--data-lv--data xfs   3.0G  2.8G  272M  92% /data
[root@eyad ~]#



[root@eyad ~]# pvs
  PV         VG          Fmt  Attr PSize   PFree
  /dev/sda3  centos_eyad lvm2 a--  <48.00g    0
  /dev/sdd   vg-data     lvm2 a--   <5.00g 2.00g
[root@eyad ~]#
[root@eyad ~]# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  centos_eyad   1   2   0 wz--n- <48.00g    0
  vg-data       1   1   0 wz--n-  <5.00g 2.00g
[root@eyad ~]#
[root@eyad ~]# lvs
  LV      VG          Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root    centos_eyad -wi-ao---- <43.00g
  swap    centos_eyad -wi-ao----   5.00g
  lv-data vg-data     -wi-ao----   2.99g
[root@eyad ~]#







# Remove old disks from VMWare
# You can also reboot




[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdb                    8:16   0    1G  0 disk
sdc                    8:32   0    2G  0 disk
sdd                    8:48   0    5G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#
[root@eyad ~]# for host in `ls /sys/class/scsi_host/`; do echo "- - -" >/sys/class/scsi_host/${host}/scan; done
[root@eyad ~]#
[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdb                    8:16   0    1G  0 disk
sdc                    8:32   0    2G  0 disk
sdd                    8:48   0    5G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#
[root@eyad ~]# echo 1 > /sys/block/sdb/device/delete
[root@eyad ~]# echo 1 > /sys/block/sdc/device/delete
[root@eyad ~]#
[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdd                    8:48   0    5G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#





[root@eyad ~]# reboot


# After reboot, /dev/sdd now it's /dev/sdb

[root@eyad ~]# lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   50G  0 disk
├─sda1                 8:1    0    1G  0 part /boot/efi
├─sda2                 8:2    0    1G  0 part /boot
└─sda3                 8:3    0   48G  0 part
  ├─centos_eyad-root 253:0    0   43G  0 lvm  /
  └─centos_eyad-swap 253:1    0    5G  0 lvm  [SWAP]
sdb                    8:16   0    5G  0 disk
└─vg--data-lv--data  253:2    0    3G  0 lvm  /data
sr0                   11:0    1 1024M  0 rom
[root@eyad ~]#
[root@eyad ~]# pvs
  PV         VG          Fmt  Attr PSize   PFree
  /dev/sda3  centos_eyad lvm2 a--  <48.00g    0
  /dev/sdb   vg-data     lvm2 a--   <5.00g 2.00g
[root@eyad ~]#
[root@eyad ~]# vgs
  VG          #PV #LV #SN Attr   VSize   VFree
  centos_eyad   1   2   0 wz--n- <48.00g    0
  vg-data       1   1   0 wz--n-  <5.00g 2.00g
[root@eyad ~]#
[root@eyad ~]# lvs
  LV      VG          Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root    centos_eyad -wi-ao---- <43.00g
  swap    centos_eyad -wi-ao----   5.00g
  lv-data vg-data     -wi-ao----   2.99g
[root@eyad ~]#

```