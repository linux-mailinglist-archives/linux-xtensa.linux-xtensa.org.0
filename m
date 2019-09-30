Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 06EC2C1B09
	for <lists+linux-xtensa@lfdr.de>; Mon, 30 Sep 2019 07:33:43 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 818096499;
	Mon, 30 Sep 2019 05:26:49 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 3F3576489
 for <linux-xtensa@linux-xtensa.org>; Mon, 30 Sep 2019 05:26:48 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 7so8006363ljw.7
 for <linux-xtensa@linux-xtensa.org>; Sun, 29 Sep 2019 22:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=geIzs5uKEQbkaEKT2CApcVTKaH71QjzjM+Sm6xNpyoU=;
 b=b1iDyPwrIsAbpipuYUdbifnLgb6DoaVtaHlcUp0z2niMCuayXaauhiRlyulehiSBlE
 AHxiNNJfWnx63JbAT8HvZxUznCsuNex3nflY/zKRpciSUOG+b6fV4T3T80vKaOmLOOPt
 xz5kNXHU/HMjlBQabqtM7N5YG7G35jJQVsrlNjg2tNkQHWKs7BGSpCStr43meRVM//7q
 ifku93KzjaUwfBCd8PGbT6LSNo6zo20cUO1mfyYHTz4Bku+r6fT+B2f/Q4qC1iB3yJyV
 1e+EgLet3CtsoL7DB3RPJvAdbwf6qyfNUnAIrFyM9UKnKxaUXceAOF3zD147eWnciNsQ
 i1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=geIzs5uKEQbkaEKT2CApcVTKaH71QjzjM+Sm6xNpyoU=;
 b=PGlNNKSJvePCLsC+HXi9mIrATD0itYu2Ga6Og4jOFVGDb+bEaiH15okYQGRWFawjYI
 FixsLuUOu2DWmk9milzGNWhQ3DhpcqUj/lTiBlS8g5/mOUggdHbF4hbyR+z5kc/bJrpB
 J1WJcCnSpycalhcC+EKX0rQ5aAywA/vpsIxIsnmr2yf5dOC7lVmAqMXJggwW2beNLt9t
 O0et0EZVIIELEG5pJy5LtatB0nzQlmlxYROP+gBkEsUBvi2Rog00Lc4H7iNxYvHVI6Rr
 GD8znVFzbg32QUDx7ILRfc9YB5PyXZM0Si3BFd+D6gXqs1smZ/IzVreNTl+1OXfFjwnr
 XhSw==
X-Gm-Message-State: APjAAAVzA6dakv92ss3Erg3TCJ4kiSrO81F5OPvj7nW2Sd/PXf4HA2vI
 niNZQdvSzstWJ++vLi8tqB8ZVqKv
X-Google-Smtp-Source: APXvYqxfDCr/62Weq5G7mh1/Iiwq0HoPeSiRosXV9lYUjW1mq+EctOWMrtvppI7BbkBhL2MaYAWz4A==
X-Received: by 2002:a2e:9118:: with SMTP id m24mr10766475ljg.95.1569821619835; 
 Sun, 29 Sep 2019 22:33:39 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id k23sm2944211ljc.13.2019.09.29.22.33.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Sep 2019 22:33:39 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 29 Sep 2019 22:33:06 -0700
Message-Id: <20190930053306.7029-6-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190930053306.7029-1-jcmvbkbc@gmail.com>
References: <20190930053306.7029-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 5/5] xtensa: add XIP kernel support
X-BeenThere: linux-xtensa@linux-xtensa.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Generic discussions about Linux on Xtensa
 <linux-xtensa.linux-xtensa.org>
List-Unsubscribe: <http://lists.linux-xtensa.org/mailman/options/linux-xtensa>, 
 <mailto:linux-xtensa-request@linux-xtensa.org?subject=unsubscribe>
List-Archive: <http://lists.linux-xtensa.org/pipermail/linux-xtensa>
List-Post: <mailto:linux-xtensa@linux-xtensa.org>
List-Help: <mailto:linux-xtensa-request@linux-xtensa.org?subject=help>
List-Subscribe: <http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa>, 
 <mailto:linux-xtensa-request@linux-xtensa.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

XIP (eXecute In Place) kernel image is the image that can be run
directly from ROM, using RAM only for writable data.

XIP xtensa kernel differs from regular xtensa kernel in the following
ways:
- it has exception/IRQ vectors merged into text section. No vectors
  relocation takes place at kernel startup.
- .data/.bss location must be specified in the kernel configuration,
  its content is copied there in the _startup function.
- .init.text is merged with the rest of text and is executed from ROM.
- when MMU is used the virtual address where the kernel will be mapped
  must be specified in the kernel configuration. It may be in the KSEG
  or in the KIO, __pa macro is adjusted to be able to handle both.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig                     |  39 +++++++++++
 arch/xtensa/Makefile                    |   3 +-
 arch/xtensa/boot/Makefile               |   5 ++
 arch/xtensa/configs/xip_kc705_defconfig | 120 ++++++++++++++++++++++++++++++++
 arch/xtensa/include/asm/cache.h         |   6 ++
 arch/xtensa/include/asm/page.h          |  11 +++
 arch/xtensa/include/asm/vectors.h       |   4 ++
 arch/xtensa/kernel/head.S               |   7 ++
 arch/xtensa/kernel/setup.c              |   7 ++
 arch/xtensa/kernel/vmlinux.lds.S        |  52 +++++++++++++-
 10 files changed, 251 insertions(+), 3 deletions(-)
 create mode 100644 arch/xtensa/configs/xip_kc705_defconfig

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index ebc135bda921..633c1dfd7bf0 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -275,6 +275,34 @@ config MEMMAP_CACHEATTR
 	    3: WT cache,
 	    4: cache bypass.
 
+config XIP_KERNEL
+	bool "Kernel Execute-In-Place from ROM"
+	help
+	  Execute-In-Place allows the kernel to run from non-volatile storage
+	  directly addressable by the CPU, such as NOR flash. This saves RAM
+	  space since the text section of the kernel is not loaded from flash
+	  to RAM.  Read-write sections, such as the data section and stack,
+	  are still copied to RAM.  The XIP kernel is not compressed since
+	  it has to run directly from flash, so it will take more space to
+	  store it. The flash address used to link the kernel object files,
+	  and for storing it, is configuration dependent. Therefore, if you
+	  say Y here, you must know the proper physical address where to
+	  store the kernel image depending on your own flash memory usage.
+
+	  Also note that the make target becomes "make xipImage" rather than
+	  "make Image" or "make uImage".  The final kernel binary to put in
+	  ROM memory will be arch/xtensa/boot/xipImage.
+
+	  If unsure, say N.
+
+config XIP_DATA_ADDR
+	hex "XIP kernel data virtual address"
+	depends on XIP_KERNEL
+	default 0x00000000
+	help
+	  This is the virtual address where XIP kernel data is copied.
+	  It must be within KSEG if MMU is used.
+
 config KSEG_PADDR
 	hex "Physical address of the KSEG mapping"
 	depends on INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX && MMU
@@ -288,6 +316,16 @@ config KSEG_PADDR
 
 	  If unsure, leave the default value here.
 
+config KERNEL_VIRTUAL_ADDRESS
+	hex "Kernel virtual address"
+	depends on MMU && XIP_KERNEL
+	default 0xd0003000
+	help
+	  This is the virtual address where the XIP kernel is mapped.
+	  XIP kernel may be mapped into KSEG or KIO region, virtual address
+	  provided here must match kernel load address provided in
+	  KERNEL_LOAD_ADDRESS.
+
 config KERNEL_LOAD_ADDRESS
 	hex "Kernel load address"
 	default 0x60003000 if !MMU
@@ -303,6 +341,7 @@ config KERNEL_LOAD_ADDRESS
 config VECTORS_OFFSET
 	hex "Kernel vectors offset"
 	default 0x00003000
+	depends on !XIP_KERNEL
 	help
 	  This is the offset of the kernel image from the relocatable vectors
 	  base.
diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
index 1542018c9e57..67a7d151d1e7 100644
--- a/arch/xtensa/Makefile
+++ b/arch/xtensa/Makefile
@@ -87,7 +87,7 @@ drivers-$(CONFIG_OPROFILE)	+= arch/xtensa/oprofile/
 
 boot		:= arch/xtensa/boot
 
-all Image zImage uImage: vmlinux
+all Image zImage uImage xipImage: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $@
 
 archheaders:
@@ -97,4 +97,5 @@ define archhelp
   @echo '* Image       - Kernel ELF image with reset vector'
   @echo '* zImage      - Compressed kernel image (arch/xtensa/boot/images/zImage.*)'
   @echo '* uImage      - U-Boot wrapped image'
+  @echo '  xipImage    - XIP image'
 endef
diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
index 294846117fc2..efb91bfda2b4 100644
--- a/arch/xtensa/boot/Makefile
+++ b/arch/xtensa/boot/Makefile
@@ -29,6 +29,7 @@ all: $(boot-y)
 Image: boot-elf
 zImage: boot-redboot
 uImage: $(obj)/uImage
+xipImage: $(obj)/xipImage
 
 boot-elf boot-redboot: $(addprefix $(obj)/,$(subdir-y))
 	$(Q)$(MAKE) $(build)=$(obj)/$@ $(MAKECMDGOALS)
@@ -50,3 +51,7 @@ UIMAGE_COMPRESSION = gzip
 $(obj)/uImage: vmlinux.bin.gz FORCE
 	$(call if_changed,uimage)
 	$(Q)$(kecho) '  Kernel: $@ is ready'
+
+$(obj)/xipImage: vmlinux FORCE
+	$(call if_changed,objcopy)
+	$(Q)$(kecho) '  Kernel: $@ is ready'
diff --git a/arch/xtensa/configs/xip_kc705_defconfig b/arch/xtensa/configs/xip_kc705_defconfig
new file mode 100644
index 000000000000..88d716dc047e
--- /dev/null
+++ b/arch/xtensa/configs/xip_kc705_defconfig
@@ -0,0 +1,120 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IRQ_TIME_ACCOUNTING=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_MEMCG=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_DEBUG=y
+CONFIG_NAMESPACES=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_RELAY=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_PROFILING=y
+CONFIG_XTENSA_VARIANT_DC233C=y
+CONFIG_XTENSA_UNALIGNED_USER=y
+CONFIG_XIP_KERNEL=y
+CONFIG_XIP_DATA_ADDR=0xd0000000
+CONFIG_KERNEL_VIRTUAL_ADDRESS=0xe6000000
+CONFIG_KERNEL_LOAD_ADDRESS=0xf6000000
+CONFIG_XTENSA_KSEG_512M=y
+CONFIG_HIGHMEM=y
+CONFIG_XTENSA_PLATFORM_XTFPGA=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x38000000@0"
+CONFIG_USE_OF=y
+CONFIG_BUILTIN_DTB_SOURCE="kc705"
+# CONFIG_PARSE_BOOTPARAM is not set
+CONFIG_OPROFILE=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_COMPACTION is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+# CONFIG_IPV6 is not set
+CONFIG_NETFILTER=y
+# CONFIG_WIRELESS is not set
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_AURORA is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_MARVELL_PHY=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_DEVKMEM=y
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+CONFIG_SOFT_WATCHDOG=y
+# CONFIG_VGA_CONSOLE is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT3_FS=y
+CONFIG_FANOTIFY=y
+CONFIG_VFAT_FS=y
+CONFIG_PROC_KCORE=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_SWAP=y
+CONFIG_ROOT_NFS=y
+CONFIG_SUNRPC_DEBUG=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DETECT_HUNG_TASK=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_SCHEDSTATS=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_STACKTRACE=y
+CONFIG_RCU_TRACE=y
+# CONFIG_FTRACE is not set
+# CONFIG_S32C1I_SELFTEST is not set
diff --git a/arch/xtensa/include/asm/cache.h b/arch/xtensa/include/asm/cache.h
index b21fd133ff62..54e147ac26bf 100644
--- a/arch/xtensa/include/asm/cache.h
+++ b/arch/xtensa/include/asm/cache.h
@@ -31,4 +31,10 @@
 
 #define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
 
+/*
+ * R/O after init is actually writable, it cannot go to .rodata
+ * according to vmlinux linker script.
+ */
+#define __ro_after_init __read_mostly
+
 #endif	/* _XTENSA_CACHE_H */
diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/page.h
index 09c56cba442e..f4771c29c7e9 100644
--- a/arch/xtensa/include/asm/page.h
+++ b/arch/xtensa/include/asm/page.h
@@ -169,7 +169,18 @@ static inline unsigned long ___pa(unsigned long va)
 	if (off >= XCHAL_KSEG_SIZE)
 		off -= XCHAL_KSEG_SIZE;
 
+#ifndef CONFIG_XIP_KERNEL
 	return off + PHYS_OFFSET;
+#else
+	if (off < XCHAL_KSEG_SIZE)
+		return off + PHYS_OFFSET;
+
+	off -= XCHAL_KSEG_SIZE;
+	if (off >= XCHAL_KIO_SIZE)
+		off -= XCHAL_KIO_SIZE;
+
+	return off + XCHAL_KIO_PADDR;
+#endif
 }
 #define __pa(x)	___pa((unsigned long)(x))
 #else
diff --git a/arch/xtensa/include/asm/vectors.h b/arch/xtensa/include/asm/vectors.h
index 4220c6dac44f..fd99b25037a7 100644
--- a/arch/xtensa/include/asm/vectors.h
+++ b/arch/xtensa/include/asm/vectors.h
@@ -22,9 +22,13 @@
 #include <asm/kmem_layout.h>
 
 #if defined(CONFIG_MMU) && XCHAL_HAVE_PTP_MMU && XCHAL_HAVE_SPANNING_WAY
+#ifdef CONFIG_KERNEL_VIRTUAL_ADDRESS
+#define KERNELOFFSET			CONFIG_KERNEL_VIRTUAL_ADDRESS
+#else
 #define KERNELOFFSET			(CONFIG_KERNEL_LOAD_ADDRESS + \
 					 XCHAL_KSEG_CACHED_VADDR - \
 					 XCHAL_KSEG_PADDR)
+#endif
 #else
 #define KERNELOFFSET			CONFIG_KERNEL_LOAD_ADDRESS
 #endif
diff --git a/arch/xtensa/kernel/head.S b/arch/xtensa/kernel/head.S
index c60ce905274f..788f3a87afb5 100644
--- a/arch/xtensa/kernel/head.S
+++ b/arch/xtensa/kernel/head.S
@@ -260,6 +260,13 @@ ENTRY(_startup)
 	___invalidate_icache_all a2 a3
 	isync
 
+#ifdef CONFIG_XIP_KERNEL
+	/* Setup bootstrap CPU stack in XIP kernel */
+
+	movi	a1, start_info
+	l32i	a1, a1, 0
+#endif
+
 	movi	a6, 0
 	xsr	a6, excsave1
 
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 7c3106093c75..5933f2ca6222 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -309,6 +309,10 @@ extern char _Level6InterruptVector_text_end;
 extern char _SecondaryResetVector_text_start;
 extern char _SecondaryResetVector_text_end;
 #endif
+#ifdef CONFIG_XIP_KERNEL
+extern char _xip_start[];
+extern char _xip_end[];
+#endif
 
 static inline int __init_memblock mem_reserve(unsigned long start,
 					      unsigned long end)
@@ -342,6 +346,9 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	mem_reserve(__pa(_stext), __pa(_end));
+#ifdef CONFIG_XIP_KERNEL
+	mem_reserve(__pa(_xip_start), __pa(_xip_end));
+#endif
 
 #ifdef CONFIG_VECTORS_OFFSET
 	mem_reserve(__pa(&_WindowVectors_text_start),
diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index 943f10639a93..01e3112cdb27 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -134,6 +134,9 @@ SECTIONS
   NOTES
   /* Data section */
 
+#ifdef CONFIG_XIP_KERNEL
+  INIT_TEXT_SECTION(PAGE_SIZE)
+#else
   _sdata = .;
   RW_DATA_SECTION(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
   _edata = .;
@@ -147,6 +150,11 @@ SECTIONS
   .init.data :
   {
     INIT_DATA
+  }
+#endif
+
+  .init.rodata :
+  {
     . = ALIGN(0x4);
     __tagtable_begin = .;
     *(.taglist)
@@ -187,12 +195,16 @@ SECTIONS
     RELOCATE_ENTRY(_DebugInterruptVector_text,
 		   .DebugInterruptVector.text);
 #endif
+#ifdef CONFIG_XIP_KERNEL
+    RELOCATE_ENTRY(_xip_data, .data);
+    RELOCATE_ENTRY(_xip_init_data, .init.data);
+#else
 #if defined(CONFIG_SMP)
     RELOCATE_ENTRY(_SecondaryResetVector_text,
 		   .SecondaryResetVector.text);
 #endif
+#endif
 
-  
     __boot_reloc_table_end = ABSOLUTE(.) ;
 
     INIT_SETUP(XCHAL_ICACHE_LINESIZE)
@@ -278,7 +290,7 @@ SECTIONS
   . = (LOADADDR( .DoubleExceptionVector.text ) + SIZEOF( .DoubleExceptionVector.text ) + 3) & ~ 3;
 
 #endif
-#if defined(CONFIG_SMP)
+#if !defined(CONFIG_XIP_KERNEL) && defined(CONFIG_SMP)
 
   SECTION_VECTOR (_SecondaryResetVector_text,
 		  .SecondaryResetVector.text,
@@ -291,12 +303,48 @@ SECTIONS
 
   . = ALIGN(PAGE_SIZE);
 
+#ifndef CONFIG_XIP_KERNEL
   __init_end = .;
 
   BSS_SECTION(0, 8192, 0)
+#endif
 
   _end = .;
 
+#ifdef CONFIG_XIP_KERNEL
+  . = CONFIG_XIP_DATA_ADDR;
+
+  _xip_start = .;
+
+#undef LOAD_OFFSET
+#define LOAD_OFFSET \
+  (CONFIG_XIP_DATA_ADDR - (LOADADDR(.dummy) + SIZEOF(.dummy) + 3) & ~ 3)
+
+  _xip_data_start = .;
+  _sdata = .;
+  RW_DATA_SECTION(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
+  _edata = .;
+  _xip_data_end = .;
+
+  /* Initialization data: */
+
+  STRUCT_ALIGN();
+
+  _xip_init_data_start = .;
+  __init_begin = .;
+  .init.data :
+  {
+    INIT_DATA
+  }
+  _xip_init_data_end = .;
+  __init_end = .;
+  BSS_SECTION(0, 8192, 0)
+
+  _xip_end = .;
+
+#undef LOAD_OFFSET
+#endif
+
   DWARF_DEBUG
 
   .xt.prop 0 : { KEEP(*(.xt.prop .xt.prop.* .gnu.linkonce.prop.*)) }
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
