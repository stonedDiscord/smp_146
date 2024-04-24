The toolchain wants GCC 3, easiest route to get a system that will build with this is to install [Fedora Core 3](https://archives.fedoraproject.org/pub/archive/fedora/linux/core/3/i386/iso/FC3-i386-DVD.iso) and add the [genromfs rpm](https://archives.fedoraproject.org/pub/archive/fedora/linux/core/3/i386/os/Fedora/RPMS/genromfs-0.5.1-1.i386.rpm)

The included buildroot based scripts are going to (try to) download a lot of open-source projects, you'll want to set up a http server on your network and point the scripts at that using `make menuconfig`
