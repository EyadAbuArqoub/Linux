



<details>
<summary>grep "Failed password" /var/log/secure</summary>
<pre>
[root@RHEL7 ~]# grep "Failed password" /var/log/secure
Nov 16 20:12:36 RHEL7 sshd[1725]: Failed password for root from 192.168.15.1 port 51666 ssh2
[root@RHEL7 ~]#
</pre>
</details>


---


<details>
  <summary><b>last username</b></summary>

  <details>
    <summary>last root</summary>
<pre>
[root@RHEL7 ~]# last root
root     pts/1        192.168.15.1     Sun Nov 16 21:06   still logged in
root     pts/0        192.168.15.1     Sun Nov 16 19:28   still logged in
root     pts/0        192.168.15.1     Sun Nov 16 19:27 - down   (00:00)
root     pts/0        192.168.15.1     Sun Nov 16 18:30 - down   (00:55)
root     pts/0        192.168.15.1     Sun Nov 16 00:50 - down   (00:02)
root     pts/0        192.168.15.1     Sun Nov 16 00:38 - down   (00:06)
root     tty1                          Sun Nov 16 00:22 - 00:23  (00:01)

wtmp begins Sun Nov 16 00:01:53 2025
[root@RHEL7 ~]#
</pre>
  </details>

  <details>
    <summary>last eyad</summary>
<pre>
[root@RHEL7 ~]# last eyad
eyad     pts/1        192.168.15.1     Sun Nov 16 21:07   still logged in

wtmp begins Sun Nov 16 00:01:53 2025
[root@RHEL7 ~]#
</pre>
  </details>

</details>
