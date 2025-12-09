
# subscription-manager

```bash
# Register and attach subscription - one command
subscription-manager register --username <username> --password <password> --auto-attach
```

```bash
# Clean and remove subscription
subscription-manager remove --all
subscription-manager unregister
subscription-manager clean
```

```bash
# Register and attach subscription
subscription-manager register
subscription-manager refresh
subscription-manager attach --auto
```

```bash
# List and show subscription details
subscription-manager list --available --all
subscription-manager repos --list
subscription-manager repos --list-enabled
subscription-manager list
subscription-manager status
```

```bash
# RHEL6
subscription-manager repos --enable=rhel-6-server-optional-rpms
subscription-manager repos --disable=rhel-6-server-optional-rpms

# RHEL7
subscription-manager repos --enable=rhel-7-server-rpms
subscription-manager repos --enable=rhel-7-server-optional-rpms
subscription-manager repos --enable=rhel-7-server-extras-rpms
subscription-manager repos --enable=rhel-ha-for-rhel-7-server-rpms

subscription-manager repos --enable rhel-7-server-rpms
subscription-manager repos --enable rhel-7-server-extras-rpms
subscription-manager repos --enable rhel-7-server-optional-rpms
subscription-manager repos --enable rhel-7-server-supplementary-rpms

subscription-manager repos --disable=* --enable=rhel-ha-for-rhel-7-server-rpms --enable=rhel-7-server-rpms

# RHEL8
rhel-8-for-x86_64-highavailability-rpms

# RHEL9
rhel-9-for-x86_64-highavailability-rpms

```

```bash
yum install -y yum-utils
yum-config-manager --enable <repo-id>
yum-config-manager --disable <repo-id>
```


# RHEL Repos

| RHEL | Base Repos                       | Optional/Development Repos               | High Availability                       | Resilient Storage                       |
| ---- | -------------------------------- | ---------------------------------------- | --------------------------------------- | --------------------------------------- |
| 6    | rhel-6-server-rpms               | rhel-6-server-optional-rpms              | rhel-ha-for-rhel-6-server-rpms          | rhel-rs-for-rhel-6-server-rpms          |
| 7    | rhel-7-server-rpms               | rhel-7-server-optional-rpms              | rhel-ha-for-rhel-7-server-rpms          | rhel-rs-for-rhel-7-server-rpms          |
| 8    | rhel-8-for-x86_64-baseos-rpms    | codeready-builder-for-rhel-8-x86_64-rpms | rhel-8-for-x86_64-highavailability-rpms | rhel-8-for-x86_64-resilientstorage-rpms |
| 8    | rhel-8-for-x86_64-appstream-rpms | codeready-builder-for-rhel-8-x86_64-rpms |                                         |                                         |
| 9    | rhel-9-for-x86_64-baseos-rpms    | codeready-builder-for-rhel-9-x86_64-rpms | rhel-9-for-x86_64-highavailability-rpms | rhel-9-for-x86_64-resilientstorage-rpms |
| 9    | rhel-9-for-x86_64-appstream-rpms | codeready-builder-for-rhel-9-x86_64-rpms |                                         |                                         |



# URLs

- [Package Browser - Red Hat Customer Portal](https://access.redhat.com/downloads/content/package-browser)
