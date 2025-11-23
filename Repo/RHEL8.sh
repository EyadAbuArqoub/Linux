mkdir -p /mnt/disc
#mount -o loop downloaded_iso_RHEL8.iso /mnt/disc
mount /dev/sr0 /mnt/disc

echo "[dvd-BaseOS]" >> /etc/yum.repos.d/rhel8dvd.repo
echo "name=DVD for RHEL - BaseOS" >> /etc/yum.repos.d/rhel8dvd.repo
echo "baseurl=file:///mnt/disc/BaseOS" >> /etc/yum.repos.d/rhel8dvd.repo
echo "enabled=1" >> /etc/yum.repos.d/rhel8dvd.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/rhel8dvd.repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> /etc/yum.repos.d/rhel8dvd.repo

echo "" >> /etc/yum.repos.d/rhel8dvd.repo

echo "[dvd-AppStream]" >> /etc/yum.repos.d/rhel8dvd.repo
echo "name=DVD for RHEL - AppStream" >> /etc/yum.repos.d/rhel8dvd.repo
echo "baseurl=file:///mnt/disc/AppStream" >> /etc/yum.repos.d/rhel8dvd.repo
echo "enabled=1" >> /etc/yum.repos.d/rhel8dvd.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/rhel8dvd.repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> /etc/yum.repos.d/rhel8dvd.repo

rm -rf /var/cache/yum/*
yum clean all