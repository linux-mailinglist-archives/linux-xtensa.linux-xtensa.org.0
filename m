Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 417BB62B00
	for <lists+linux-xtensa@lfdr.de>; Mon,  8 Jul 2019 23:34:06 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 095C164D2;
	Mon,  8 Jul 2019 21:30:10 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 2B88664CD
 for <linux-xtensa@linux-xtensa.org>; Mon,  8 Jul 2019 21:30:08 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id x25so10695562ljh.2
 for <linux-xtensa@linux-xtensa.org>; Mon, 08 Jul 2019 14:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nRxDUN11+7aw3FDfEOOsat6CydtI16sHNb+Eovf4V84=;
 b=FqW/ypRNmjw3uzu588i931KdX0hY2x3/AJAIzBVOC7vis3U7rhAoWOEHmR1OUgHCpl
 lgS3UsSesyAUkjStmGQo4i2uDFJx9NCrhbp2Ml3Gt1ArtfoarK8/NuIHZOymcWW70fRm
 fVzCcYnYFWOVowO5ozraVI/RMLK1Xf2POb5coRCNCpUyIbAuTWs5zlX83USN+A1yMAP8
 5tjiNV0FbstKHxaLsRos0e1Lx+1WTZRbS0r20W882Batd2zv01ccw+kwKNmk+L5pMW51
 pTyJmkrKQENzPq9GQUozBkmNS2yMhc4lagGVSYEKb/wk87bsma8OJ/oCiZXVTCVZYwmQ
 Lr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nRxDUN11+7aw3FDfEOOsat6CydtI16sHNb+Eovf4V84=;
 b=YdvsfY9aFLpSxazs1VRXUZ4yVgRsW/vIphnUSYs1c75n/aswlWp7z2+4TaQRXsMjsz
 E9VAQf9mUDJc25wO5l7AxM5Ql4iSO+gQ/my+vGiD7xYBzuyilPPG/1ITcWY34dEbJ3D7
 rkC8k4+OrQY+Ip5l+Z9TM8VVIdDAVABJVg+C1yT2IV32OHhAYeMOiykDgpqsZwmVxSfm
 g+X0pwTOQx/SU8u1FbN+xmu6VBoFeuloLrFFErar3uSWhg7X/xa56YVngmt7maDyFOjs
 epqpoaGLlkMm2/du0heEJJGYB7txHrDV+IR6gXYFcEVNKAOIzBuRVzrBnKIoumEWzeGh
 j4OQ==
X-Gm-Message-State: APjAAAUnmS1FiZzSwwmjsuvSTix4wMqprR5ZSH7QewKVw8ZZnSp6ATZi
 aUhkZVbeXUO+5+Kw3Dc9gZjK6/R+oUk=
X-Google-Smtp-Source: APXvYqxxG1t3mhvfHur3blOjfRYcm/aGnbwH85ANwk3Dm7i5W9MU7DXn4UzF+j+WS/kNJELNg2shHQ==
X-Received: by 2002:a2e:6c07:: with SMTP id h7mr9111992ljc.177.1562621641569; 
 Mon, 08 Jul 2019 14:34:01 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id b9sm3894025ljj.92.2019.07.08.14.33.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 14:34:01 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  8 Jul 2019 14:33:52 -0700
Message-Id: <20190708213352.23031-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: virt: add defconfig and DTS
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

Add defconfig and DTS for a virt board. Defconfig enables PCIe host and
a number of virtio devices. DTS routes legacy PCI IRQs to the first four
level-triggered external IRQ lines. CPU core with edge-triggered IRQs
among the first four may need a custom DTS to work correctly.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/boot/dts/virt.dts      |  72 +++++++++++++++++++++++
 arch/xtensa/configs/virt_defconfig | 113 +++++++++++++++++++++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 arch/xtensa/boot/dts/virt.dts
 create mode 100644 arch/xtensa/configs/virt_defconfig

diff --git a/arch/xtensa/boot/dts/virt.dts b/arch/xtensa/boot/dts/virt.dts
new file mode 100644
index 000000000000..6aecbc0f3549
--- /dev/null
+++ b/arch/xtensa/boot/dts/virt.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+/ {
+	compatible = "cdns,xtensa-iss";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&pic>;
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8 debug";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu@0 {
+			compatible = "cdns,xtensa-cpu";
+			reg = <0>;
+			clocks = <&osc>;
+		};
+	};
+
+	clocks {
+		osc: osc {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+		};
+	};
+
+	pic: pic {
+		compatible = "cdns,xtensa-pic";
+		/* one cell: internal irq number,
+		 * two cells: second cell == 0: internal irq number
+		 *            second cell == 1: external irq number
+		 */
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+	};
+
+	pci {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <0x1>;
+
+		bus-range = <0x0 0x3f>;
+		reg = <0xc0000000 0x04000000>;
+
+		     // BUS_ADDRESS(3)  CPU_PHYSICAL(1)  SIZE(2)
+		ranges = <0x01000000 0x0 0xc4000000  0xc4000000  0x0 0x04000000>,
+			 <0x02000000 0x0 0xc8000000  0xc8000000  0x0 0x18000000>;
+
+		     // PCI_DEVICE(3)  INT#(1)  CONTROLLER(PHANDLE)  CONTROLLER_DATA(2)
+		interrupt-map = <
+			0x0000 0x0 0x0  0x1  &pic  0x0 0x1
+			0x0800 0x0 0x0  0x1  &pic  0x1 0x1
+			0x1000 0x0 0x0  0x1  &pic  0x2 0x1
+			0x1800 0x0 0x0  0x1  &pic  0x3 0x1
+			>;
+
+		interrupt-map-mask = <0x1800 0x0 0x0  0x7>;
+	};
+};
diff --git a/arch/xtensa/configs/virt_defconfig b/arch/xtensa/configs/virt_defconfig
new file mode 100644
index 000000000000..bfc45a138e72
--- /dev/null
+++ b/arch/xtensa/configs/virt_defconfig
@@ -0,0 +1,113 @@
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
+CONFIG_PERF_EVENTS=y
+CONFIG_XTENSA_VARIANT_DC233C=y
+CONFIG_XTENSA_UNALIGNED_USER=y
+CONFIG_VECTORS_OFFSET=0x00002000
+CONFIG_XTENSA_KSEG_512M=y
+CONFIG_HIGHMEM=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=0x80000000@0"
+CONFIG_USE_OF=y
+CONFIG_BUILTIN_DTB_SOURCE="virt"
+# CONFIG_PARSE_BOOTPARAM is not set
+CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
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
+CONFIG_PCI=y
+CONFIG_PCI_HOST_GENERIC=y
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+# CONFIG_ETHERNET is not set
+# CONFIG_WLAN is not set
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+# CONFIG_HWMON is not set
+CONFIG_DRM=y
+CONFIG_DRM_VGEM=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB_MODE_HELPERS=y
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_USB_SUPPORT is not set
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_INPUT=y
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
+CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_FONTS=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_MAGIC_SYSRQ=y
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
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
