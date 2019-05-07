Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6A21F1570D
	for <lists+linux-xtensa@lfdr.de>; Tue,  7 May 2019 02:44:33 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 0E9076533;
	Tue,  7 May 2019 00:42:50 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 7C180581A
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 May 2019 00:42:48 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id k18so10450139lfj.13
 for <linux-xtensa@linux-xtensa.org>; Mon, 06 May 2019 17:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MyHkoBLy7k1ERbeA8m3+7Q4M7LezFOBxcFp4Gl+DC4g=;
 b=ktKZ/IK20n4sclnX+L2iPg8NCdgE2cRjqkBsIpKTw+cyEkGw1uhsYMVfCoiMnGVnkk
 uthqwNGXg7VGRWqvoRGUbfpXh1PSwUI7rEW0u6KpYRvTF2uZ2lokvyTtPcyVI4GOYpWa
 AcbmyJANha2eSadGmUzoBlBtvTZghqp1NmOcImhsqM+q6FoNAfAgQkXVpgW2Z0eIyh4C
 VxJTOOEeB64RAXU/oPVD+y7Q7EtriMIS7G6bnwIggLxnXAShMxs4ZaFldp1B7g6NyJXd
 JydbazzCif2tDpCPBecc+iMKIZQT90fymNv5Qo+GvdDWqzAGNRJOnqZNhMjJpeMqY1PZ
 z/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MyHkoBLy7k1ERbeA8m3+7Q4M7LezFOBxcFp4Gl+DC4g=;
 b=Hqk3xHIJdteh8kc5o43whkA1jJpG7dlxWXrAyJhQRxb6ydtsr1LC+hxxmPEvgx78bk
 +bWal9LEQCX9bku9Rl2pMifqt6buQRyX7tlmr5yn3srQy6pvfaMjYbMoXkDWZKRW0I6R
 A1skQnYB9B3bLkp2/VjND/HMPLHpoVoB3p7s51uOMCMx5ovchya59oqCFmDwuh8miszS
 VQCPaQxWnKOqGoTCP5xD88Rk9SSay64ITs/NvvG0xcud+Dq+zN9MO5LGcJbKB2GKfFkR
 u26WwNiFqwzp4moThwuXBwUlAQNZyH5bNSPMqG4rnzBszHsdQZ6qK3gDgqIxTIIakqtE
 Iw7A==
X-Gm-Message-State: APjAAAWsuzW4mi8GHSJ6i1S0qYnqnuVq0THicvk5VOub81FvEnLb86tj
 JeWqM/MSummJGheqXFlBtqMGZ5zE
X-Google-Smtp-Source: APXvYqzBpu9TfYg/1Y/23aH8vE5VxqDioaRViZnptGnFCEqJNoiuFFCF59hpAWvxbmzyp4EPZXAs5w==
X-Received: by 2002:a19:e34c:: with SMTP id c12mr7941372lfk.145.1557189870000; 
 Mon, 06 May 2019 17:44:30 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm850003lfp.55.2019.05.06.17.44.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 17:44:29 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  6 May 2019 17:44:04 -0700
Message-Id: <20190507004407.6756-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507004407.6756-1-jcmvbkbc@gmail.com>
References: <20190507004407.6756-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/5] xtensa: replace variant/core.h with
	asm/core.h
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

Introduce the header arch/xtensa/include/asm/core.h that provides
definitions for XCHAL macros missing in older xtensa releases. Use this
header instead of variant/core.h

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/boot/boot-redboot/bootstrap.S                |  2 +-
 arch/xtensa/include/asm/asmmacro.h                       |  2 +-
 arch/xtensa/include/asm/cache.h                          |  2 +-
 arch/xtensa/include/asm/checksum.h                       |  2 +-
 arch/xtensa/include/asm/coprocessor.h                    |  2 +-
 arch/xtensa/include/asm/core.h                           | 13 +++++++++++++
 arch/xtensa/include/asm/initialize_mmu.h                 |  4 ----
 arch/xtensa/include/asm/irq.h                            |  2 +-
 arch/xtensa/include/asm/processor.h                      |  2 +-
 arch/xtensa/include/asm/ptrace.h                         |  2 +-
 arch/xtensa/include/asm/vectors.h                        |  2 +-
 arch/xtensa/kernel/hw_breakpoint.c                       |  2 +-
 arch/xtensa/kernel/vmlinux.lds.S                         |  2 +-
 arch/xtensa/lib/checksum.S                               |  2 +-
 arch/xtensa/lib/memcopy.S                                |  2 +-
 arch/xtensa/lib/memset.S                                 |  2 +-
 arch/xtensa/lib/strncpy_user.S                           |  2 +-
 arch/xtensa/lib/strnlen_user.S                           |  2 +-
 arch/xtensa/lib/usercopy.S                               |  2 +-
 arch/xtensa/platforms/xt2000/include/platform/hardware.h |  2 +-
 arch/xtensa/platforms/xt2000/include/platform/serial.h   |  2 +-
 21 files changed, 32 insertions(+), 23 deletions(-)
 create mode 100644 arch/xtensa/include/asm/core.h

diff --git a/arch/xtensa/boot/boot-redboot/bootstrap.S b/arch/xtensa/boot/boot-redboot/bootstrap.S
index bbf3b4b080cd..48ba5a232d94 100644
--- a/arch/xtensa/boot/boot-redboot/bootstrap.S
+++ b/arch/xtensa/boot/boot-redboot/bootstrap.S
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <variant/core.h>
+#include <asm/core.h>
 #include <asm/regs.h>
 #include <asm/asmmacro.h>
 #include <asm/cacheasm.h>
diff --git a/arch/xtensa/include/asm/asmmacro.h b/arch/xtensa/include/asm/asmmacro.h
index 7f2ae5872151..8308a9c3abb2 100644
--- a/arch/xtensa/include/asm/asmmacro.h
+++ b/arch/xtensa/include/asm/asmmacro.h
@@ -11,7 +11,7 @@
 #ifndef _XTENSA_ASMMACRO_H
 #define _XTENSA_ASMMACRO_H
 
-#include <variant/core.h>
+#include <asm/core.h>
 
 /*
  * Some little helpers for loops. Use zero-overhead-loops
diff --git a/arch/xtensa/include/asm/cache.h b/arch/xtensa/include/asm/cache.h
index d2fd932fdb4d..b21fd133ff62 100644
--- a/arch/xtensa/include/asm/cache.h
+++ b/arch/xtensa/include/asm/cache.h
@@ -11,7 +11,7 @@
 #ifndef _XTENSA_CACHE_H
 #define _XTENSA_CACHE_H
 
-#include <variant/core.h>
+#include <asm/core.h>
 
 #define L1_CACHE_SHIFT	XCHAL_DCACHE_LINEWIDTH
 #define L1_CACHE_BYTES	XCHAL_DCACHE_LINESIZE
diff --git a/arch/xtensa/include/asm/checksum.h b/arch/xtensa/include/asm/checksum.h
index f302ef57973a..8b687176ad72 100644
--- a/arch/xtensa/include/asm/checksum.h
+++ b/arch/xtensa/include/asm/checksum.h
@@ -13,7 +13,7 @@
 
 #include <linux/in6.h>
 #include <linux/uaccess.h>
-#include <variant/core.h>
+#include <asm/core.h>
 
 /*
  * computes the checksum of a memory block at buff, length len,
diff --git a/arch/xtensa/include/asm/coprocessor.h b/arch/xtensa/include/asm/coprocessor.h
index 6712929a27c9..0fbe2a740b8d 100644
--- a/arch/xtensa/include/asm/coprocessor.h
+++ b/arch/xtensa/include/asm/coprocessor.h
@@ -12,8 +12,8 @@
 #ifndef _XTENSA_COPROCESSOR_H
 #define _XTENSA_COPROCESSOR_H
 
-#include <variant/core.h>
 #include <variant/tie.h>
+#include <asm/core.h>
 #include <asm/types.h>
 
 #ifdef __ASSEMBLY__
diff --git a/arch/xtensa/include/asm/core.h b/arch/xtensa/include/asm/core.h
new file mode 100644
index 000000000000..b1f57519df49
--- /dev/null
+++ b/arch/xtensa/include/asm/core.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2019 Cadence Design Systems Inc. */
+
+#ifndef _ASM_XTENSA_CORE_H
+#define _ASM_XTENSA_CORE_H
+
+#include <variant/core.h>
+
+#ifndef XCHAL_SPANNING_WAY
+#define XCHAL_SPANNING_WAY 0
+#endif
+
+#endif
diff --git a/arch/xtensa/include/asm/initialize_mmu.h b/arch/xtensa/include/asm/initialize_mmu.h
index 10e9852b2fb4..d719785e54f7 100644
--- a/arch/xtensa/include/asm/initialize_mmu.h
+++ b/arch/xtensa/include/asm/initialize_mmu.h
@@ -33,10 +33,6 @@
 #define CA_WRITEBACK	(0x4)
 #endif
 
-#ifndef XCHAL_SPANNING_WAY
-#define XCHAL_SPANNING_WAY 0
-#endif
-
 #ifdef __ASSEMBLY__
 
 #define XTENSA_HWVERSION_RC_2009_0 230000
diff --git a/arch/xtensa/include/asm/irq.h b/arch/xtensa/include/asm/irq.h
index 6c6ed23e0c79..0f71a51dab25 100644
--- a/arch/xtensa/include/asm/irq.h
+++ b/arch/xtensa/include/asm/irq.h
@@ -12,7 +12,7 @@
 #define _XTENSA_IRQ_H
 
 #include <linux/init.h>
-#include <variant/core.h>
+#include <asm/core.h>
 
 #ifdef CONFIG_PLATFORM_NR_IRQS
 # define PLATFORM_NR_IRQS CONFIG_PLATFORM_NR_IRQS
diff --git a/arch/xtensa/include/asm/processor.h b/arch/xtensa/include/asm/processor.h
index 0c14018d1c26..19f6b54e358b 100644
--- a/arch/xtensa/include/asm/processor.h
+++ b/arch/xtensa/include/asm/processor.h
@@ -10,7 +10,7 @@
 #ifndef _XTENSA_PROCESSOR_H
 #define _XTENSA_PROCESSOR_H
 
-#include <variant/core.h>
+#include <asm/core.h>
 
 #include <linux/compiler.h>
 #include <linux/stringify.h>
diff --git a/arch/xtensa/include/asm/ptrace.h b/arch/xtensa/include/asm/ptrace.h
index 62a58d2567e9..b109416dc07e 100644
--- a/arch/xtensa/include/asm/ptrace.h
+++ b/arch/xtensa/include/asm/ptrace.h
@@ -80,7 +80,7 @@ struct pt_regs {
 	unsigned long areg[16];
 };
 
-#include <variant/core.h>
+#include <asm/core.h>
 
 # define arch_has_single_step()	(1)
 # define task_pt_regs(tsk) ((struct pt_regs*) \
diff --git a/arch/xtensa/include/asm/vectors.h b/arch/xtensa/include/asm/vectors.h
index 7111280c8842..79fe3007919e 100644
--- a/arch/xtensa/include/asm/vectors.h
+++ b/arch/xtensa/include/asm/vectors.h
@@ -18,7 +18,7 @@
 #ifndef _XTENSA_VECTORS_H
 #define _XTENSA_VECTORS_H
 
-#include <variant/core.h>
+#include <asm/core.h>
 #include <asm/kmem_layout.h>
 
 #if XCHAL_HAVE_PTP_MMU
diff --git a/arch/xtensa/kernel/hw_breakpoint.c b/arch/xtensa/kernel/hw_breakpoint.c
index 4f20416061fb..285fb2942b06 100644
--- a/arch/xtensa/kernel/hw_breakpoint.c
+++ b/arch/xtensa/kernel/hw_breakpoint.c
@@ -12,7 +12,7 @@
 #include <linux/log2.h>
 #include <linux/percpu.h>
 #include <linux/perf_event.h>
-#include <variant/core.h>
+#include <asm/core.h>
 
 /* Breakpoint currently in use for each IBREAKA. */
 static DEFINE_PER_CPU(struct perf_event *, bp_on_reg[XCHAL_NUM_IBREAK]);
diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index b80a430453b1..943f10639a93 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -18,8 +18,8 @@
 #include <asm/page.h>
 #include <asm/thread_info.h>
 
+#include <asm/core.h>
 #include <asm/vectors.h>
-#include <variant/core.h>
 
 OUTPUT_ARCH(xtensa)
 ENTRY(_start)
diff --git a/arch/xtensa/lib/checksum.S b/arch/xtensa/lib/checksum.S
index 528fe0dd9339..d82c20c1fb7a 100644
--- a/arch/xtensa/lib/checksum.S
+++ b/arch/xtensa/lib/checksum.S
@@ -16,8 +16,8 @@
 
 #include <linux/errno.h>
 #include <linux/linkage.h>
-#include <variant/core.h>
 #include <asm/asmmacro.h>
+#include <asm/core.h>
 
 /*
  * computes a partial checksum, e.g. for TCP/UDP fragments
diff --git a/arch/xtensa/lib/memcopy.S b/arch/xtensa/lib/memcopy.S
index c0f6981719d6..efecfd7ed8cc 100644
--- a/arch/xtensa/lib/memcopy.S
+++ b/arch/xtensa/lib/memcopy.S
@@ -10,8 +10,8 @@
  */
 
 #include <linux/linkage.h>
-#include <variant/core.h>
 #include <asm/asmmacro.h>
+#include <asm/core.h>
 
 /*
  * void *memcpy(void *dst, const void *src, size_t len);
diff --git a/arch/xtensa/lib/memset.S b/arch/xtensa/lib/memset.S
index 276747dec300..8632eacbdc80 100644
--- a/arch/xtensa/lib/memset.S
+++ b/arch/xtensa/lib/memset.S
@@ -12,8 +12,8 @@
  */
 
 #include <linux/linkage.h>
-#include <variant/core.h>
 #include <asm/asmmacro.h>
+#include <asm/core.h>
 
 /*
  * void *memset(void *dst, int c, size_t length)
diff --git a/arch/xtensa/lib/strncpy_user.S b/arch/xtensa/lib/strncpy_user.S
index 5fce16b67dca..c4c6c8578d59 100644
--- a/arch/xtensa/lib/strncpy_user.S
+++ b/arch/xtensa/lib/strncpy_user.S
@@ -13,8 +13,8 @@
 
 #include <linux/errno.h>
 #include <linux/linkage.h>
-#include <variant/core.h>
 #include <asm/asmmacro.h>
+#include <asm/core.h>
 
 /*
  * char *__strncpy_user(char *dst, const char *src, size_t len)
diff --git a/arch/xtensa/lib/strnlen_user.S b/arch/xtensa/lib/strnlen_user.S
index 0b956ce7f386..1f2ca2bb2ab3 100644
--- a/arch/xtensa/lib/strnlen_user.S
+++ b/arch/xtensa/lib/strnlen_user.S
@@ -12,8 +12,8 @@
  */
 
 #include <linux/linkage.h>
-#include <variant/core.h>
 #include <asm/asmmacro.h>
+#include <asm/core.h>
 
 /*
  * size_t __strnlen_user(const char *s, size_t len)
diff --git a/arch/xtensa/lib/usercopy.S b/arch/xtensa/lib/usercopy.S
index 64ab1971324f..228607e30bc2 100644
--- a/arch/xtensa/lib/usercopy.S
+++ b/arch/xtensa/lib/usercopy.S
@@ -54,8 +54,8 @@
  */
 
 #include <linux/linkage.h>
-#include <variant/core.h>
 #include <asm/asmmacro.h>
+#include <asm/core.h>
 
 	.text
 ENTRY(__xtensa_copy_user)
diff --git a/arch/xtensa/platforms/xt2000/include/platform/hardware.h b/arch/xtensa/platforms/xt2000/include/platform/hardware.h
index 8e5e0d6a81ec..9f213f573330 100644
--- a/arch/xtensa/platforms/xt2000/include/platform/hardware.h
+++ b/arch/xtensa/platforms/xt2000/include/platform/hardware.h
@@ -15,7 +15,7 @@
 #ifndef _XTENSA_XT2000_HARDWARE_H
 #define _XTENSA_XT2000_HARDWARE_H
 
-#include <variant/core.h>
+#include <asm/core.h>
 
 /*
  * On-board components.
diff --git a/arch/xtensa/platforms/xt2000/include/platform/serial.h b/arch/xtensa/platforms/xt2000/include/platform/serial.h
index 7226cf732b47..cde804827626 100644
--- a/arch/xtensa/platforms/xt2000/include/platform/serial.h
+++ b/arch/xtensa/platforms/xt2000/include/platform/serial.h
@@ -11,7 +11,7 @@
 #ifndef _XTENSA_XT2000_SERIAL_H
 #define _XTENSA_XT2000_SERIAL_H
 
-#include <variant/core.h>
+#include <asm/core.h>
 #include <asm/io.h>
 
 /*  National-Semi PC16552D DUART:  */
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
