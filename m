Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 61F5E34AF5E
	for <lists+linux-xtensa@lfdr.de>; Fri, 26 Mar 2021 20:32:00 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6A156643D;
	Fri, 26 Mar 2021 19:07:20 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by linux-xtensa.org (Postfix) with ESMTPS id AEDFB57E3
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 19:07:18 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id i22so5289598pgl.4
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 12:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rgwOa0IfcBkGXZ8kv5yPBCE/hHrsadL7wyEJXwn96KQ=;
 b=blwXMHouACKUoV61lxjZggQuqMWjmoJczLtgZOv2JZT0rbHRd9PT4WHISoehpWIcB2
 69ici3komcULBqdv8/hsXYnCzeiHrd5due0j7O9g4I98QrQBSjq9B1rvNy59Z2YD3/9K
 lJ8tvcSER/muHfMEidvu9ACOFGf3pK6ye3G5awQ+0Px0hN1qojhZI/G6pdxuyt1ewVXb
 3mgZpO7HbSdbMycydSj0gt0Dbl68kgjjrVjUs6BzBTHpG2Ju9sLB+APtWhT24Xl4ei9I
 SUzmDjIo5+q0SFs+Q1ImEKDBtouupOHGpijcbwIIPw5p6f3w7173Q0FOV9IELAg6M9vh
 GV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rgwOa0IfcBkGXZ8kv5yPBCE/hHrsadL7wyEJXwn96KQ=;
 b=XSY0zho2J9iNv0eDRQWW1S3781EAn4avNReU4y7FJ97IzzgP9YvaQM9p7A+ZMutkcH
 XTw3GT4eS5OnhdOpHu0TnZYsoHjaER57vAqf6ANE4GQelS8ejSc7P3ov3lQtmVR//jHb
 mYPO2yKxMQSjm/gjACxWgxWS74ZZ+VFOs/tRxVI4mR3rc8WDIoiKGFnrRJ/nYlsjUT1g
 ADZx2p9bozO3S615zOO6S1Gxaa/U9m7zIKg/aA6pQ4Thd88S/5qQg5j4oP9eutStBYl7
 /q4SmXUQ4U7St6Z4sbo1ImjCxa5dXMMrK+RqgIuxubWxnAvn9BTkhGQwHGXbImBPVjJq
 mGzQ==
X-Gm-Message-State: AOAM530NV2kTG98vkKpSRHTIphdstQmKI+2tJ8wp5vYY7dy0r5Ow8amp
 SMHO9JPJln/U1ODgIuW6rWKu7TWbK6I=
X-Google-Smtp-Source: ABdhPJzwfnxhZYi/UWDGysd+0BLyHdsPgdk/tipZ8fnpyx7ZmIP56sapJmtCIjryrwbrE7uB4pFOkg==
X-Received: by 2002:a05:6a00:b47:b029:20d:1c65:75f0 with SMTP id
 p7-20020a056a000b47b029020d1c6575f0mr14126854pfo.9.1616787116949; 
 Fri, 26 Mar 2021 12:31:56 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id q10sm9086789pgs.44.2021.03.26.12.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 12:31:56 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 26 Mar 2021 12:31:43 -0700
Message-Id: <20210326193143.21016-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326193143.21016-1-jcmvbkbc@gmail.com>
References: <20210326193143.21016-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/2] xtensa: ISS: add GDBIO implementation to
	semihosting interface
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

Add GDBIO implementation for the xtensa semihosting interface. It offers
less functions than the simcall interface, so make some semihosting
functions optional and return error when implementation is not
available.
Add Kconfig menu to select semihosting implementation and add simcall and
GDBIO choices there.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig                           | 22 ++++++++++++
 .../iss/include/platform/simcall-gdbio.h      | 34 ++++++++++++++++++
 .../platforms/iss/include/platform/simcall.h  | 36 +++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 arch/xtensa/platforms/iss/include/platform/simcall-gdbio.h

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index d637b396f81c..6ad4c1161518 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -393,6 +393,28 @@ config PARSE_BOOTPARAM
 
 	  If unsure, say Y.
 
+choice
+	prompt "Semihosting interface"
+	default XTENSA_SIMCALL_ISS
+	depends on XTENSA_PLATFORM_ISS
+	help
+	  Choose semihosting interface that will be used for serial port,
+	  block device and networking.
+
+config XTENSA_SIMCALL_ISS
+	bool "simcall"
+	help
+	  Use simcall instruction. simcall is only available on simulators,
+	  it does nothing on hardware.
+
+config XTENSA_SIMCALL_GDBIO
+	bool "GDBIO"
+	help
+	  Use break instruction. It is available on real hardware when GDB
+	  is attached to it via JTAG.
+
+endchoice
+
 config BLK_DEV_SIMDISK
 	tristate "Host file-based simulated block device support"
 	default n
diff --git a/arch/xtensa/platforms/iss/include/platform/simcall-gdbio.h b/arch/xtensa/platforms/iss/include/platform/simcall-gdbio.h
new file mode 100644
index 000000000000..e642860e25a8
--- /dev/null
+++ b/arch/xtensa/platforms/iss/include/platform/simcall-gdbio.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2021 Cadence Design Systems Inc. */
+
+#ifndef _XTENSA_PLATFORM_ISS_SIMCALL_GDBIO_H
+#define _XTENSA_PLATFORM_ISS_SIMCALL_GDBIO_H
+
+/*
+ *  System call like services offered by the GDBIO host.
+ */
+
+#define SYS_open	-2
+#define SYS_close	-3
+#define SYS_read	-4
+#define SYS_write	-5
+#define SYS_lseek	-6
+
+static int errno;
+
+static inline int __simc(int a, int b, int c, int d)
+{
+	register int a1 asm("a2") = a;
+	register int b1 asm("a6") = b;
+	register int c1 asm("a3") = c;
+	register int d1 asm("a4") = d;
+	__asm__ __volatile__ (
+			"break 1, 14\n"
+			: "+r"(a1), "+r"(c1)
+			: "r"(b1), "r"(d1)
+			: "memory");
+	errno = c1;
+	return a1;
+}
+
+#endif /* _XTENSA_PLATFORM_ISS_SIMCALL_GDBIO_H */
diff --git a/arch/xtensa/platforms/iss/include/platform/simcall.h b/arch/xtensa/platforms/iss/include/platform/simcall.h
index 612080bf0b3d..e1ec50ce39ee 100644
--- a/arch/xtensa/platforms/iss/include/platform/simcall.h
+++ b/arch/xtensa/platforms/iss/include/platform/simcall.h
@@ -12,11 +12,23 @@
 #ifndef _XTENSA_PLATFORM_ISS_SIMCALL_H
 #define _XTENSA_PLATFORM_ISS_SIMCALL_H
 
+#include <linux/bug.h>
+
+#ifdef CONFIG_XTENSA_SIMCALL_ISS
 #include <platform/simcall-iss.h>
+#endif
+#ifdef CONFIG_XTENSA_SIMCALL_GDBIO
+#include <platform/simcall-gdbio.h>
+#endif
 
 static inline int simc_exit(int exit_code)
 {
+#ifdef SYS_exit
 	return __simc(SYS_exit, exit_code, 0, 0);
+#else
+	WARN_ONCE(1, "%s: not implemented\n", __func__);
+	return -1;
+#endif
 }
 
 static inline int simc_open(const char *file, int flags, int mode)
@@ -31,7 +43,12 @@ static inline int simc_close(int fd)
 
 static inline int simc_ioctl(int fd, int request, void *arg)
 {
+#ifdef SYS_ioctl
 	return __simc(SYS_ioctl, fd, request, (int) arg);
+#else
+	WARN_ONCE(1, "%s: not implemented\n", __func__);
+	return -1;
+#endif
 }
 
 static inline int simc_read(int fd, void *buf, size_t count)
@@ -46,9 +63,14 @@ static inline int simc_write(int fd, const void *buf, size_t count)
 
 static inline int simc_poll(int fd)
 {
+#ifdef SYS_select_one
 	long timeval[2] = { 0, 0 };
 
 	return __simc(SYS_select_one, fd, XTISS_SELECT_ONE_READ, (int)&timeval);
+#else
+	WARN_ONCE(1, "%s: not implemented\n", __func__);
+	return -1;
+#endif
 }
 
 static inline int simc_lseek(int fd, uint32_t off, int whence)
@@ -58,17 +80,31 @@ static inline int simc_lseek(int fd, uint32_t off, int whence)
 
 static inline int simc_argc(void)
 {
+#ifdef SYS_iss_argc
 	return __simc(SYS_iss_argc, 0, 0, 0);
+#else
+	WARN_ONCE(1, "%s: not implemented\n", __func__);
+	return 0;
+#endif
 }
 
 static inline int simc_argv_size(void)
 {
+#ifdef SYS_iss_argv_size
 	return __simc(SYS_iss_argv_size, 0, 0, 0);
+#else
+	WARN_ONCE(1, "%s: not implemented\n", __func__);
+	return 0;
+#endif
 }
 
 static inline void simc_argv(void *buf)
 {
+#ifdef SYS_iss_set_argv
 	__simc(SYS_iss_set_argv, (int)buf, 0, 0);
+#else
+	WARN_ONCE(1, "%s: not implemented\n", __func__);
+#endif
 }
 
 #endif /* _XTENSA_PLATFORM_ISS_SIMCALL_H */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
