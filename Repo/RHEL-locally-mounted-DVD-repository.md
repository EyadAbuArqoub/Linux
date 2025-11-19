
# RHEL locally-mounted DVD repository

## RHEL7 - Set up yum repository for locally-mounted DVD

```bash
mkdir -p /mnt/disc
mount /dev/sr0 /mnt/disc

cp /mnt/disc/media.repo /etc/yum.repos.d/rhel7dvd.repo

chmod 644 /etc/yum.repos.d/rhel7dvd.repo

sed -i 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.repos.d/rhel7dvd.repo

echo "enabled=1" >> /etc/yum.repos.d/rhel7dvd.repo
echo "baseurl=file:///mnt/disc/" >> /etc/yum.repos.d/rhel7dvd.repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> /etc/yum.repos.d/rhel7dvd.repo

rm -rf /var/cache/yum/*
yum clean all
```

Reference: [How to set up yum repository for locally-mounted DVD on Red Hat Enterprise Linux 7 - Red Hat Customer Portal](https://access.redhat.com/solutions/1355683)

---

## RHEL8 - Set up yum repository for locally-mounted DVD

```bash
mkdir -p /media/rheldvd
#mount -o loop downloaded_iso_name.iso /media/rheldvd
mount /dev/sr0 /media/rheldvd

echo "[dvd-BaseOS]" >> /etc/yum.repos.d/my.repo
echo "name=DVD for RHEL - BaseOS" >> /etc/yum.repos.d/my.repo
echo "baseurl=file:///media/rheldvd/BaseOS" >> /etc/yum.repos.d/my.repo
echo "enabled=1" >> /etc/yum.repos.d/my.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/my.repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> /etc/yum.repos.d/my.repo

echo "[dvd-AppStream]" >> /etc/yum.repos.d/my.repo
echo "name=DVD for RHEL - AppStream" >> /etc/yum.repos.d/my.repo
echo "baseurl=file:///media/rheldvd/AppStream" >> /etc/yum.repos.d/my.repo
echo "enabled=1" >> /etc/yum.repos.d/my.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/my.repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> /etc/yum.repos.d/my.repo

rm -rf /var/cache/yum/*
yum clean all
```

Reference: [Need to set up yum repository for locally-mounted DVD on Red Hat Enterprise Linux 8 - Red Hat Customer Portal](https://access.redhat.com/solutions/3776721)

---

## RHEL9 - Set up yum repository for locally-mounted DVD

```bash
mkdir -p /mnt/disc
mount /dev/sr0 /mnt/disc

echo "[BaseOS]" >> /etc/yum.repos.d/rhel9dvd.repo
echo "name=BaseOS Packages Red Hat Enterprise Linux 9" >> /etc/yum.repos.d/rhel9dvd.repo
echo "metadata_expire=-1" >> /etc/yum.repos.d/rhel9dvd.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/rhel9dvd.repo
echo "enabled=1" >> /etc/yum.repos.d/rhel9dvd.repo
echo "baseurl=file:///mnt/disc/BaseOS/" >> /etc/yum.repos.d/rhel9dvd.repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> /etc/yum.repos.d/rhel9dvd.repo

echo "" >> /etc/yum.repos.d/rhel9dvd.repo

echo "[AppStream]" >> /etc/yum.repos.d/rhel9dvd.repo
echo "name=AppStream Packages Red Hat Enterprise Linux 9" >> /etc/yum.repos.d/rhel9dvd.repo
echo "metadata_expire=-1" >> /etc/yum.repos.d/rhel9dvd.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/rhel9dvd.repo
echo "enabled=1" >> /etc/yum.repos.d/rhel9dvd.repo
echo "baseurl=file:///mnt/disc/AppStream/" >> /etc/yum.repos.d/rhel9dvd.repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> /etc/yum.repos.d/rhel9dvd.repo

yum clean all
yum repolist

#yum check-update
#yum update
```

Reference: [Need to set up yum repository for locally-mounted DVD on Red Hat Enterprise Linux 9 - Red Hat Customer Portal](https://access.redhat.com/solutions/6913101)

---

Add commands to run @startup

```bash
cat /etc/rc.d/rc.local
mount /dev/sr0  /media/rheldvd

chmod +x /etc/rc.d/rc.local
```
