Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 172B114FB10
	for <lists+linux-xtensa@lfdr.de>; Sun,  2 Feb 2020 01:36:25 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8D059656E;
	Sun,  2 Feb 2020 00:25:34 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 1A15A656E
 for <linux-xtensa@linux-xtensa.org>; Sun,  2 Feb 2020 00:25:32 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id d10so10927499ljl.9
 for <linux-xtensa@linux-xtensa.org>; Sat, 01 Feb 2020 16:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wnPJHUhmjEUGkn9k+SVO+YiQ6u1ZiwnBtgmCK+6Wq/M=;
 b=Q1XZLaa5nOh8M2IKL3QOHG1hIpHblAD0LkKdq9zl+hQhc70xHWCZimGKfUo3ieVQea
 WX74+3XNVEpPZ7n0yKhBKUzOWpr5Hf9oDzEzGJWL8v0S1CPP2KJe6wnC1hluZVTbaX3s
 0s3yFyjupVODAA8J6x/ICneZutnYQKtJrHkHeFbiv84e4Zf+BGXAxBXnrC0R1PDSKi1f
 oLtNmefggjmnhIK+u7FID4y0owvZZ2m31R/fgNHnX7k7u+O8yrEuL8A8pxk4jHauliJA
 QiJ8+GHhcwc6m2gIyQawwYcO7n9+Xn9LcX7/n+JyPNV6GNYycvJaFgXOsg48QHy5Edk4
 rLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wnPJHUhmjEUGkn9k+SVO+YiQ6u1ZiwnBtgmCK+6Wq/M=;
 b=gwusH8Oq1c8hXXJRvalKE+1S/E+1jFIwKt8bTS3AY/wTmaCtSt2pAeM+Q/hrGmPGOc
 JQ/tcFkiiQn/4QDE9ohttB8jH1G6biHjIVeiSzLvbh1F+CJcTUVgqmtjQua687hD1htV
 LRXRkk4fNMehUJTF8br0/OlluiAI1yqeCaRAbOL+yT5otJsv0xcvO7fKHkz8ZZHk1gD1
 N6xVboEO81/nq/jQh+Jlw7inrq6viFhPHNvS3uAD/q8a/DtrK9+jwym9L6MMKpzcFKin
 h3y4ydaf3p4OMinhoC1lUv9PkQ+Y/FNlmiyj0ChCZfaeFA/CAFv46wNgnFpzQpaH4LoO
 t8fw==
X-Gm-Message-State: APjAAAVxlX7ZrMG3btavnH4eM3kM6N2Ghaj88dRHHbgiEpZL/4JJPsdc
 ywUL2MhaugqMZclQNyuV5nmmU5B9qKE=
X-Google-Smtp-Source: APXvYqwbqfYweCbeFA+pVXdplJPxkuTQzAnr7El7AX0S/3hXlzdqlUKwf1hWCLTajJPrStKKm43GEA==
X-Received: by 2002:a2e:8702:: with SMTP id m2mr9744724lji.278.1580603781604; 
 Sat, 01 Feb 2020 16:36:21 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id p26sm6711312lfh.64.2020.02.01.16.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 16:36:21 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat,  1 Feb 2020 16:36:03 -0800
Message-Id: <20200202003604.30767-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200202003604.30767-1-jcmvbkbc@gmail.com>
References: <20200202003604.30767-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/3] xtensa: separate SMP and XIP support
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

There's no real dependency between SMP and XIP, allow them to be
selected together. Always define 2- and 4-argument SECTION_VECTOR
macros, always use 4-argument macro for the secondary reset vector and
always define relocation entry for it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/vmlinux.lds.S | 68 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index 251713fac774..662cee72242f 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -54,8 +54,7 @@ jiffies = jiffies_64;
  * to description recorded in the corresponding RELOCATE_ENTRY.
  */
 
-#ifdef CONFIG_VECTORS_OFFSET
-#define SECTION_VECTOR(sym, section, addr, prevsec)                         \
+#define SECTION_VECTOR4(sym, section, addr, prevsec)			    \
   section addr : AT(((LOADADDR(prevsec) + SIZEOF(prevsec)) + 3) & ~ 3)      \
   {									    \
     . = ALIGN(4);							    \
@@ -63,11 +62,10 @@ jiffies = jiffies_64;
     *(section)								    \
     sym ## _end = ABSOLUTE(.);						    \
   }
-#else
-#define SECTION_VECTOR(section, addr)					    \
+
+#define SECTION_VECTOR2(section, addr)					    \
   . = addr;								    \
   *(section)
-#endif
 
 /*
  *  Mapping of input sections to output sections when linking.
@@ -87,31 +85,31 @@ SECTIONS
     HEAD_TEXT
 
 #ifndef CONFIG_VECTORS_OFFSET
-  . = ALIGN(PAGE_SIZE);
-  _vecbase = .;
+    . = ALIGN(PAGE_SIZE);
+    _vecbase = .;
 
-  SECTION_VECTOR (.WindowVectors.text, WINDOW_VECTORS_VADDR)
+    SECTION_VECTOR2 (.WindowVectors.text, WINDOW_VECTORS_VADDR)
 #if XCHAL_EXCM_LEVEL >= 2
-  SECTION_VECTOR (.Level2InterruptVector.text, INTLEVEL2_VECTOR_VADDR)
+    SECTION_VECTOR2 (.Level2InterruptVector.text, INTLEVEL2_VECTOR_VADDR)
 #endif
 #if XCHAL_EXCM_LEVEL >= 3
-  SECTION_VECTOR (.Level3InterruptVector.text, INTLEVEL3_VECTOR_VADDR)
+    SECTION_VECTOR2 (.Level3InterruptVector.text, INTLEVEL3_VECTOR_VADDR)
 #endif
 #if XCHAL_EXCM_LEVEL >= 4
-  SECTION_VECTOR (.Level4InterruptVector.text, INTLEVEL4_VECTOR_VADDR)
+    SECTION_VECTOR2 (.Level4InterruptVector.text, INTLEVEL4_VECTOR_VADDR)
 #endif
 #if XCHAL_EXCM_LEVEL >= 5
-  SECTION_VECTOR (.Level5InterruptVector.text, INTLEVEL5_VECTOR_VADDR)
+    SECTION_VECTOR2 (.Level5InterruptVector.text, INTLEVEL5_VECTOR_VADDR)
 #endif
 #if XCHAL_EXCM_LEVEL >= 6
-  SECTION_VECTOR (.Level6InterruptVector.text, INTLEVEL6_VECTOR_VADDR)
+    SECTION_VECTOR2 (.Level6InterruptVector.text, INTLEVEL6_VECTOR_VADDR)
 #endif
-  SECTION_VECTOR (.DebugInterruptVector.text, DEBUG_VECTOR_VADDR)
-  SECTION_VECTOR (.KernelExceptionVector.text, KERNEL_VECTOR_VADDR)
-  SECTION_VECTOR (.UserExceptionVector.text, USER_VECTOR_VADDR)
-  SECTION_VECTOR (.DoubleExceptionVector.text, DOUBLEEXC_VECTOR_VADDR)
+    SECTION_VECTOR2 (.DebugInterruptVector.text, DEBUG_VECTOR_VADDR)
+    SECTION_VECTOR2 (.KernelExceptionVector.text, KERNEL_VECTOR_VADDR)
+    SECTION_VECTOR2 (.UserExceptionVector.text, USER_VECTOR_VADDR)
+    SECTION_VECTOR2 (.DoubleExceptionVector.text, DOUBLEEXC_VECTOR_VADDR)
 
-  *(.handler.text)
+    *(.handler.text)
 #endif
 
     IRQENTRY_TEXT
@@ -198,11 +196,10 @@ SECTIONS
 #ifdef CONFIG_XIP_KERNEL
     RELOCATE_ENTRY(_xip_data, .data);
     RELOCATE_ENTRY(_xip_init_data, .init.data);
-#else
+#endif
 #if defined(CONFIG_SMP)
     RELOCATE_ENTRY(_SecondaryResetVector_text,
 		   .SecondaryResetVector.text);
-#endif
 #endif
 
     __boot_reloc_table_end = ABSOLUTE(.) ;
@@ -220,21 +217,24 @@ SECTIONS
   . = ALIGN(4);
   .dummy : { LONG(0) }
 
+#undef LAST
+#define LAST	.dummy
+
 #ifdef CONFIG_VECTORS_OFFSET
   /* The vectors are relocated to the real position at startup time */
 
-  SECTION_VECTOR (_WindowVectors_text,
+  SECTION_VECTOR4 (_WindowVectors_text,
 		  .WindowVectors.text,
 		  WINDOW_VECTORS_VADDR,
 		  .dummy)
-  SECTION_VECTOR (_DebugInterruptVector_text,
+  SECTION_VECTOR4 (_DebugInterruptVector_text,
 		  .DebugInterruptVector.text,
 		  DEBUG_VECTOR_VADDR,
 		  .WindowVectors.text)
 #undef LAST
 #define LAST	.DebugInterruptVector.text
 #if XCHAL_EXCM_LEVEL >= 2
-  SECTION_VECTOR (_Level2InterruptVector_text,
+  SECTION_VECTOR4 (_Level2InterruptVector_text,
 		  .Level2InterruptVector.text,
 		  INTLEVEL2_VECTOR_VADDR,
 		  LAST)
@@ -242,7 +242,7 @@ SECTIONS
 # define LAST	.Level2InterruptVector.text
 #endif
 #if XCHAL_EXCM_LEVEL >= 3
-  SECTION_VECTOR (_Level3InterruptVector_text,
+  SECTION_VECTOR4 (_Level3InterruptVector_text,
 		  .Level3InterruptVector.text,
 		  INTLEVEL3_VECTOR_VADDR,
 		  LAST)
@@ -250,7 +250,7 @@ SECTIONS
 # define LAST	.Level3InterruptVector.text
 #endif
 #if XCHAL_EXCM_LEVEL >= 4
-  SECTION_VECTOR (_Level4InterruptVector_text,
+  SECTION_VECTOR4 (_Level4InterruptVector_text,
 		  .Level4InterruptVector.text,
 		  INTLEVEL4_VECTOR_VADDR,
 		  LAST)
@@ -258,7 +258,7 @@ SECTIONS
 # define LAST	.Level4InterruptVector.text
 #endif
 #if XCHAL_EXCM_LEVEL >= 5
-  SECTION_VECTOR (_Level5InterruptVector_text,
+  SECTION_VECTOR4 (_Level5InterruptVector_text,
 		  .Level5InterruptVector.text,
 		  INTLEVEL5_VECTOR_VADDR,
 		  LAST)
@@ -266,41 +266,41 @@ SECTIONS
 # define LAST	.Level5InterruptVector.text
 #endif
 #if XCHAL_EXCM_LEVEL >= 6
-  SECTION_VECTOR (_Level6InterruptVector_text,
+  SECTION_VECTOR4 (_Level6InterruptVector_text,
 		  .Level6InterruptVector.text,
 		  INTLEVEL6_VECTOR_VADDR,
 		  LAST)
 # undef LAST
 # define LAST	.Level6InterruptVector.text
 #endif
-  SECTION_VECTOR (_KernelExceptionVector_text,
+  SECTION_VECTOR4 (_KernelExceptionVector_text,
 		  .KernelExceptionVector.text,
 		  KERNEL_VECTOR_VADDR,
 		  LAST)
 #undef LAST
-  SECTION_VECTOR (_UserExceptionVector_text,
+  SECTION_VECTOR4 (_UserExceptionVector_text,
 		  .UserExceptionVector.text,
 		  USER_VECTOR_VADDR,
 		  .KernelExceptionVector.text)
-  SECTION_VECTOR (_DoubleExceptionVector_text,
+  SECTION_VECTOR4 (_DoubleExceptionVector_text,
 		  .DoubleExceptionVector.text,
 		  DOUBLEEXC_VECTOR_VADDR,
 		  .UserExceptionVector.text)
 #define LAST .DoubleExceptionVector.text
 
 #endif
-#if !defined(CONFIG_XIP_KERNEL) && defined(CONFIG_SMP)
+#if defined(CONFIG_SMP)
 
-  SECTION_VECTOR (_SecondaryResetVector_text,
+  SECTION_VECTOR4 (_SecondaryResetVector_text,
 		  .SecondaryResetVector.text,
 		  RESET_VECTOR1_VADDR,
-		  .DoubleExceptionVector.text)
+		  LAST)
 #undef LAST
 #define LAST .SecondaryResetVector.text
 
 #endif
 #ifdef CONFIG_VECTORS_OFFSET
-  SECTION_VECTOR (_handler_text,
+  SECTION_VECTOR4 (_handler_text,
 		  .handler.text,
 		  ,
 		  LAST)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
