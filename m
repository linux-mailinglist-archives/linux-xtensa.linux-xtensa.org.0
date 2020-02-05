Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C4712152646
	for <lists+linux-xtensa@lfdr.de>; Wed,  5 Feb 2020 07:25:49 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 262D16449;
	Wed,  5 Feb 2020 06:14:53 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 961D352AD
 for <linux-xtensa@linux-xtensa.org>; Wed,  5 Feb 2020 06:14:51 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 9so608155lfq.10
 for <linux-xtensa@linux-xtensa.org>; Tue, 04 Feb 2020 22:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMgCxPFNP2UtfItA7t99dpycClZ7AueVlpNmH11xBfU=;
 b=l4HzFaayU3fWGtk6NOMasSZWB/6Nmng6duEyT9n13jogDMlEHQUxFW0CrPyZbYWVsO
 gGIJsEOsMoKGa3LTSe6EVf5IJC+rXw+vAcr01c7IdCp0LwiIEh7yBR4SC/Q1UfO951dY
 1e5sGL5VuMCqQNIxxmuvsiawS4bpM6AIdDMlmP0WaIpQX6OuipA4ig8PWTZsS5FjszdX
 35ZyMGqF51ZNqEsZtE8iSobkdio0L3ikzkC270xqJ1QsAjkNaqCCDrIYb3C7O67O8vK6
 lsbJzB5HvtfioMZP93TDxkhPZtozOjCvQTTgDGaBWAwR90iVsv3Vy7eoKBdusMLGfoVv
 K3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMgCxPFNP2UtfItA7t99dpycClZ7AueVlpNmH11xBfU=;
 b=svxW2ziymKZ92K3czfIJ95yZGZVYnytpGfepjY2Vf05jQB4xPoA9ml28DWB+teBEVw
 aavvJ886xKquce2liPTRDJGmrSBoRpql8qN9KnCfcCWAt7ooJAV7mGtraGh2Egvay4Ez
 omjDp5FLc6K9PnVh5ofzQU4LkkJ8Qb9TcVRsQ8/OQamgZKuHsa0vy3ehAdqTKpCjPuoB
 MW/wzCcByYUSWmQUymG0IRVYK4RyuinUaELdNZftiwaqC2Ill+TxcE1tGRgRhB2kYy30
 iea6ot2N4zsLn5Ni9uACnDOG8oQw5kZ2/nbVJztfwb+LDD7wExgLW6O59NMC483VblQr
 8WzA==
X-Gm-Message-State: APjAAAVV0cz6rPBNF07DMROttse6EylCkK1wYl8Ptkw2oCffe4SRcX7g
 QjM/j04aM+itUmAFUHP02btkgufyn3U=
X-Google-Smtp-Source: APXvYqwjlZsww3/qvHRXdiO4Hdh0uA2ScvWWSI46eRCew/oertRmbEZuwORkvTeZzcxh+qn3n5F3jA==
X-Received: by 2002:a19:5013:: with SMTP id e19mr16875775lfb.8.1580883946209; 
 Tue, 04 Feb 2020 22:25:46 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r26sm11545446lfm.82.2020.02.04.22.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 22:25:45 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  4 Feb 2020 22:25:27 -0800
Message-Id: <20200205062529.7046-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205062529.7046-1-jcmvbkbc@gmail.com>
References: <20200205062529.7046-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v3 1/3] xtensa: move fast exception handlers
	close to vectors
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

On XIP kernels it makes sense to have exception vectors and fast
exception handlers together (in a fast memory). In addition, with MTD
XIP support both vectors and fast exception handlers must be outside of
the FLASH.

Add section .exception.text and move fast exception handlers to it.
Put it together with vectors when vectors are outside of the .text.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2->v3:
- rename .handler.text to .exception.text to allow referencing it
  from the .fixup section. This fixes section mismatch build warning
  when CONFIG_FAST_SYSCALL_XTENSA is enabled.

Changes v1->v2:
- add .literal_position to handlers section in entry.S

 arch/xtensa/include/asm/asmmacro.h |  2 ++
 arch/xtensa/kernel/coprocessor.S   |  5 ++---
 arch/xtensa/kernel/entry.S         | 18 ++++++++++++------
 arch/xtensa/kernel/setup.c         |  4 ++++
 arch/xtensa/kernel/vectors.S       |  3 ++-
 arch/xtensa/kernel/vmlinux.lds.S   | 19 ++++++++++++++++---
 6 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/arch/xtensa/include/asm/asmmacro.h b/arch/xtensa/include/asm/asmmacro.h
index 71a7e846bc1f..bfc89e11f469 100644
--- a/arch/xtensa/include/asm/asmmacro.h
+++ b/arch/xtensa/include/asm/asmmacro.h
@@ -237,4 +237,6 @@
 #error Unsupported Xtensa ABI
 #endif
 
+#define __XTENSA_HANDLER	.section ".exception.text", "ax"
+
 #endif /* _XTENSA_ASMMACRO_H */
diff --git a/arch/xtensa/kernel/coprocessor.S b/arch/xtensa/kernel/coprocessor.S
index c53ce6d8794f..c426b846beef 100644
--- a/arch/xtensa/kernel/coprocessor.S
+++ b/arch/xtensa/kernel/coprocessor.S
@@ -58,6 +58,8 @@
 	.endif;								\
 	.long THREAD_XTREGS_CP##x
 
+	__XTENSA_HANDLER
+
 	SAVE_CP_REGS(0)
 	SAVE_CP_REGS(1)
 	SAVE_CP_REGS(2)
@@ -76,7 +78,6 @@
 	LOAD_CP_REGS(6)
 	LOAD_CP_REGS(7)
 
-	.section ".rodata", "a"
 	.align 4
 .Lsave_cp_regs_jump_table:
 	SAVE_CP_REGS_TAB(0)
@@ -98,8 +99,6 @@
 	LOAD_CP_REGS_TAB(6)
 	LOAD_CP_REGS_TAB(7)
 
-	.previous
-
 /*
  * coprocessor_flush(struct thread_info*, index)
  *                             a2        a3
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index be897803834a..9d2e22d9f3c3 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -939,6 +939,9 @@ ENDPROC(unrecoverable_exception)
 
 /* -------------------------- FAST EXCEPTION HANDLERS ----------------------- */
 
+	__XTENSA_HANDLER
+	.literal_position
+
 /*
  * Fast-handler for alloca exceptions
  *
@@ -1024,7 +1027,7 @@ ENDPROC(fast_alloca)
 ENTRY(fast_illegal_instruction_user)
 
 	rsr	a0, ps
-	bbsi.l	a0, PS_WOE_BIT, user_exception
+	bbsi.l	a0, PS_WOE_BIT, 1f
 	s32i	a3, a2, PT_AREG3
 	movi	a3, PS_WOE_MASK
 	or	a0, a0, a3
@@ -1033,6 +1036,8 @@ ENTRY(fast_illegal_instruction_user)
 	l32i	a0, a2, PT_AREG0
 	rsr	a2, depc
 	rfe
+1:
+	call0	user_exception
 
 ENDPROC(fast_illegal_instruction_user)
 #endif
@@ -1071,7 +1076,7 @@ ENTRY(fast_syscall_user)
 	_beqz	a0, fast_syscall_spill_registers
 	_beqi	a0, __NR_xtensa, fast_syscall_xtensa
 
-	j	user_exception
+	call0	user_exception
 
 ENDPROC(fast_syscall_user)
 
@@ -1762,8 +1767,8 @@ ENTRY(fast_second_level_miss)
 
 	rsr	a2, ps
 	bbsi.l	a2, PS_UM_BIT, 1f
-	j	_kernel_exception
-1:	j	_user_exception
+	call0	_kernel_exception
+1:	call0	_user_exception
 
 ENDPROC(fast_second_level_miss)
 
@@ -1859,13 +1864,14 @@ ENTRY(fast_store_prohibited)
 
 	rsr	a2, ps
 	bbsi.l	a2, PS_UM_BIT, 1f
-	j	_kernel_exception
-1:	j	_user_exception
+	call0	_kernel_exception
+1:	call0	_user_exception
 
 ENDPROC(fast_store_prohibited)
 
 #endif /* CONFIG_MMU */
 
+	.text
 /*
  * System Calls.
  *
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 0f93b67c7a5a..fefbdce1db99 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -284,6 +284,8 @@ extern char _UserExceptionVector_text_start;
 extern char _UserExceptionVector_text_end;
 extern char _DoubleExceptionVector_text_start;
 extern char _DoubleExceptionVector_text_end;
+extern char _exception_text_start;
+extern char _exception_text_end;
 #if XCHAL_EXCM_LEVEL >= 2
 extern char _Level2InterruptVector_text_start;
 extern char _Level2InterruptVector_text_end;
@@ -363,6 +365,8 @@ void __init setup_arch(char **cmdline_p)
 	mem_reserve(__pa(&_DoubleExceptionVector_text_start),
 		    __pa(&_DoubleExceptionVector_text_end));
 
+	mem_reserve(__pa(&_exception_text_start),
+		    __pa(&_exception_text_end));
 #if XCHAL_EXCM_LEVEL >= 2
 	mem_reserve(__pa(&_Level2InterruptVector_text_start),
 		    __pa(&_Level2InterruptVector_text_end));
diff --git a/arch/xtensa/kernel/vectors.S b/arch/xtensa/kernel/vectors.S
index 841503d3307c..95ad1e773991 100644
--- a/arch/xtensa/kernel/vectors.S
+++ b/arch/xtensa/kernel/vectors.S
@@ -43,6 +43,7 @@
  */
 
 #include <linux/linkage.h>
+#include <asm/asmmacro.h>
 #include <asm/ptrace.h>
 #include <asm/current.h>
 #include <asm/asm-offsets.h>
@@ -477,7 +478,6 @@ _DoubleExceptionVector_handle_exception:
 
 ENDPROC(_DoubleExceptionVector)
 
-	.text
 /*
  * Fixup handler for TLB miss in double exception handler for window owerflow.
  * We get here with windowbase set to the window that was being spilled and
@@ -505,6 +505,7 @@ ENDPROC(_DoubleExceptionVector)
  * a3: exctable, original value in excsave1
  */
 
+	__XTENSA_HANDLER
 	.literal_position
 
 ENTRY(window_overflow_restore_a0_fixup)
diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index 409c05cac15e..37a3205c404c 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -110,6 +110,8 @@ SECTIONS
   SECTION_VECTOR (.KernelExceptionVector.text, KERNEL_VECTOR_VADDR)
   SECTION_VECTOR (.UserExceptionVector.text, USER_VECTOR_VADDR)
   SECTION_VECTOR (.DoubleExceptionVector.text, DOUBLEEXC_VECTOR_VADDR)
+
+  *(.exception.text)
 #endif
 
     IRQENTRY_TEXT
@@ -190,6 +192,8 @@ SECTIONS
 		   .DoubleExceptionVector.text);
     RELOCATE_ENTRY(_DebugInterruptVector_text,
 		   .DebugInterruptVector.text);
+    RELOCATE_ENTRY(_exception_text,
+		   .exception.text);
 #endif
 #ifdef CONFIG_XIP_KERNEL
     RELOCATE_ENTRY(_xip_data, .data);
@@ -282,8 +286,7 @@ SECTIONS
 		  .DoubleExceptionVector.text,
 		  DOUBLEEXC_VECTOR_VADDR,
 		  .UserExceptionVector.text)
-
-  . = (LOADADDR( .DoubleExceptionVector.text ) + SIZEOF( .DoubleExceptionVector.text ) + 3) & ~ 3;
+#define LAST .DoubleExceptionVector.text
 
 #endif
 #if !defined(CONFIG_XIP_KERNEL) && defined(CONFIG_SMP)
@@ -292,10 +295,20 @@ SECTIONS
 		  .SecondaryResetVector.text,
 		  RESET_VECTOR1_VADDR,
 		  .DoubleExceptionVector.text)
+#undef LAST
+#define LAST .SecondaryResetVector.text
 
-  . = LOADADDR(.SecondaryResetVector.text)+SIZEOF(.SecondaryResetVector.text);
+#endif
+#ifdef CONFIG_VECTORS_OFFSET
+  SECTION_VECTOR (_exception_text,
+		  .exception.text,
+		  ,
+		  LAST)
+#undef LAST
+#define LAST .exception.text
 
 #endif
+  . = (LOADADDR(LAST) + SIZEOF(LAST) + 3) & ~ 3;
 
   . = ALIGN(PAGE_SIZE);
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
