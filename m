Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D58B2152647
	for <lists+linux-xtensa@lfdr.de>; Wed,  5 Feb 2020 07:25:51 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 343A2645D;
	Wed,  5 Feb 2020 06:14:55 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 5F96252AD
 for <linux-xtensa@linux-xtensa.org>; Wed,  5 Feb 2020 06:14:54 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id o15so1077825ljg.6
 for <linux-xtensa@linux-xtensa.org>; Tue, 04 Feb 2020 22:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBPJqn6j/44MwJFNfkOL1Xpsg6JFphJdV9erTVX3nyw=;
 b=WIU55OLolLlfXZxq3BL+2eKg19ko68UuRElscpZ+ir6WATxkP3hF6HRNwJyZXlibvs
 4WtSBZ55A7msoFfwPejAseT1vRe0zrqQGgwOE8UqBG2no0d0qSr8fb5gCOx+oieCQaQO
 7m9SRV8qvomHS5xLXl7Qbzs8xzRH583PFnCSTN2Ry7logpKyODbaozFENrcoxJSO+uQk
 s1LSjjsS3BQL3nzjaK40KiGh2pkvtr2yUx8kKLysbYLYOoa827GlGwn55hgMKqX5I9pW
 YUSQg5xEpnaXTClINld/PQ+4Oa4VzMEAkGJuuRGRbMAtRe+r3NNbjothMSg0XoahX27a
 9VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBPJqn6j/44MwJFNfkOL1Xpsg6JFphJdV9erTVX3nyw=;
 b=Z64ooMUgfq6D0zvbPx3o8bQAniYxeYd6DnfEw8eCruhXmd9tzzK9OI/qlrmyIzXagW
 dnxf3B9cGQPUloOtPlE0ACJRE5NKMqAKBwGX1SqJSzfgChmo6ceMV5Dr8109Lx1IFvdq
 bmH6h678tPB69CXgq05+PVXVe4RbOiuGaDAw8eKxdbtb+119jZ0Uy1fSRin42TgcWnIp
 IHw5t5qIs7/P0MYeQWf8FN+Plt+eDdcpdX2Rx01aaCElNNuu1mOHoJcW5aLNt1RJYLTY
 ydWfrEbonhYry8k4jIIbjQ83XGu7ULe2z75zM7WqP6B+9Kj+Krsr9b7CdTKnArbEYxnn
 fLeg==
X-Gm-Message-State: APjAAAUfKSy63GQcKrrJJAaphrYIfBaibt0Y3tdkODMO195DnS64yBvS
 ptxtglrMFO3Zbd3k4XBwGkvRbTi0O8o=
X-Google-Smtp-Source: APXvYqyccH05L2SoHfwRgFlZO/88ftfiyMCsIxT/mK5dVIHujdSCRK4zdKfYrJl/CptIcdiffxkcsA==
X-Received: by 2002:a2e:918c:: with SMTP id f12mr18005066ljg.66.1580883948711; 
 Tue, 04 Feb 2020 22:25:48 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r26sm11545446lfm.82.2020.02.04.22.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 22:25:48 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  4 Feb 2020 22:25:28 -0800
Message-Id: <20200205062529.7046-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205062529.7046-1-jcmvbkbc@gmail.com>
References: <20200205062529.7046-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v3 2/3] xtensa: separate SMP and XIP support
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
Changes v2->v3:
- rename .handler.text to .exception.text to allow referencing it
  from the .fixup section. This fixes section mismatch build warning
  when CONFIG_FAST_SYSCALL_XTENSA is enabled.

 arch/xtensa/kernel/vmlinux.lds.S | 68 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index 37a3205c404c..d9e547810b6c 100644
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
 
-  *(.exception.text)
+    *(.exception.text)
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
-  SECTION_VECTOR (_exception_text,
+  SECTION_VECTOR4 (_exception_text,
 		  .exception.text,
 		  ,
 		  LAST)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
