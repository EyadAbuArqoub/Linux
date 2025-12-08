
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

# RHEL8


# RHEL9

```

```bash
yum install -y yum-utils
yum-config-manager --enable <repo-id>
yum-config-manager --disable <repo-id>
```

