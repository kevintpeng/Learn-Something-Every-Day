# Unix File Structure
Single rooted tree at `/`. Instead of separate trees (as with disk partitioning), volumes can be *mounted* on a directory. Two-disk setups used to be common, with first disk with startup programs and second mounted as `/usr`.

### `/bin`
Contains binaries, including fundamental utilities like `ls` and `cp` used to mount `/usr`. This is loaded in the $PATH which exposes these binaries as commands from your shell.

### `/boot`
Contains files required for booting process

### `/etc`
System-wide configuration files and system databases.

### `/dev`
Location of special or device files. Files here can represent external devices like speakers, or data volumes.
- contains partitions of hard drives (hd1, hd2). Representing devices as files means that we can write data to a file and it is consumed by the device, the speaker file will play sound if you write text into it.
- `fdisk -l` shows disk devices and their partitions
  - for manipulating disk partition tables
  - `sda` for example might be partitioned into `sda1`, `sda2`, etc
- `df` shows disk space by volume on the system
- `lsblk` (list block) shows name, type and mountpoint for all available block devices *which is probably the same as the output of fdisk -l; it excludes RAM disks*

### `/home`
Contains user home directories. OSX useds `/Users` instead.

### `lib`
Contains shared libraries needed by programs in `/bin`

### `/media`
Default mount point for removable devices

### `/opt`
Locally installed software. 

### `/proc`
procfs virtual filesystem showing informaiton about processes as files

### `/root`
Home directory for superuser "root". 

### `/sbin`
System binaries, containing fundamental utilities like `init` for start, maintain, and recovery of system.

### `/usr`
User file system. Holds executables , libraries, shared resources not system critical.
- `/include` stores development header files.
- `/lib` stores required libraries and data files for programs stored in `/usr`
- `local` custom programs or files 

### `/var`
Variable, place for files that change often.
- `/log` contains system log files
- `/tmp` directory for temporary files which should be preserved between system reboots
