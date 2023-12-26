# QEMU-FULL

Build a full qemu docker image including **all** targets, which sometimes your distribution doesn't ship.

Tags:

- `latest`: the latest qemu master version
- `vx.x.x`: The qemu build of version `vx.x.x`

QEMU are installed to `/opt/{qemu_system, qemu_user, qemu_user_static}` and see `/opt/qemu_system/build_hash` for the commit hash.

As of v8.1.4, we have:

```
root@d2106eb05d5e:/work# qemu-
Display all 109 possibilities? (y or n)
qemu-aarch64              qemu-hexagon              qemu-microblaze-static    qemu-mipsn32el-static     qemu-riscv32-static       qemu-sparc64-static       qemu-system-mips64        qemu-system-sparc64
qemu-aarch64-static       qemu-hexagon-static       qemu-microblazeel         qemu-nbd                  qemu-riscv64              qemu-storage-daemon       qemu-system-mips64el      qemu-system-tricore
qemu-aarch64_be           qemu-hppa                 qemu-microblazeel-static  qemu-nios2                qemu-riscv64-static       qemu-system-aarch64       qemu-system-mipsel        qemu-system-x86_64
qemu-aarch64_be-static    qemu-hppa-static          qemu-mips                 qemu-nios2-static         qemu-s390x                qemu-system-alpha         qemu-system-nios2         qemu-system-xtensa
qemu-alpha                qemu-i386                 qemu-mips-static          qemu-or1k                 qemu-s390x-static         qemu-system-arm           qemu-system-or1k          qemu-system-xtensaeb
qemu-alpha-static         qemu-i386-static          qemu-mips64               qemu-or1k-static          qemu-sh4                  qemu-system-avr           qemu-system-ppc           qemu-x86_64
qemu-arm                  qemu-img                  qemu-mips64-static        qemu-ppc                  qemu-sh4-static           qemu-system-cris          qemu-system-ppc64         qemu-x86_64-static
qemu-arm-static           qemu-io                   qemu-mips64el             qemu-ppc-static           qemu-sh4eb                qemu-system-hppa          qemu-system-riscv32       qemu-xtensa
qemu-armeb                qemu-keymap               qemu-mips64el-static      qemu-ppc64                qemu-sh4eb-static         qemu-system-i386          qemu-system-riscv64       qemu-xtensa-static
qemu-armeb-static         qemu-loongarch64          qemu-mipsel               qemu-ppc64-static         qemu-sparc                qemu-system-loongarch64   qemu-system-rx            qemu-xtensaeb
qemu-cris                 qemu-loongarch64-static   qemu-mipsel-static        qemu-ppc64le              qemu-sparc-static         qemu-system-m68k          qemu-system-s390x         qemu-xtensaeb-static
qemu-cris-static          qemu-m68k                 qemu-mipsn32              qemu-ppc64le-static       qemu-sparc32plus          qemu-system-microblaze    qemu-system-sh4           
qemu-edid                 qemu-m68k-static          qemu-mipsn32-static       qemu-pr-helper            qemu-sparc32plus-static   qemu-system-microblazeel  qemu-system-sh4eb         
qemu-ga                   qemu-microblaze           qemu-mipsn32el            qemu-riscv32              qemu-sparc64              qemu-system-mips          qemu-system-sparc
```