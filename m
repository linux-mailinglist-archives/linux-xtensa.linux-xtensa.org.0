Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 720A662A17
	for <lists+linux-xtensa@lfdr.de>; Mon,  8 Jul 2019 22:04:28 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3699564CB;
	Mon,  8 Jul 2019 20:00:30 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id B2B2264C8
 for <linux-xtensa@linux-xtensa.org>; Mon,  8 Jul 2019 20:00:28 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t28so17190373lje.9
 for <linux-xtensa@linux-xtensa.org>; Mon, 08 Jul 2019 13:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UhVLWlI9vR1e2Av7Wr88frCtg+6OQ7AKnm4KTHisnRY=;
 b=Eyk4TIfByginpV+MPKHov/ujm2+S/MV7S2o5WKeE/tAjepjemNTatM1FVB+OBj/gPv
 15c89wPX27OzFXwqRz85nt2e+HQbsz3knZl/+uf0wqfIx5o34tOmdJhuDKsDvyLIHwC1
 DNdVHSEC5GFvE1ScbY1DNJl5AY9uZ4K98JDA6GbkhRLliAKwWaoemgya8BDha8j+RjXi
 uLSaGEqPcQmlWmZfulcGOgnmR7r28WyUtI/3qyM5UHcjbdp3iz76OOMnQg2NzcYQY+Ft
 wP0aL3OFq+TyJac5F8qcZ8kbHVYfhxM/Bk7YMBhXPDoBlvfOnzS0CyKdG5dYQNFY3A/G
 eiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UhVLWlI9vR1e2Av7Wr88frCtg+6OQ7AKnm4KTHisnRY=;
 b=NTzWegTgRH/pW109Tiy8TIlSe3THLzxteLVlA0FfeRSL5nqDRNzAj5ejENHgsKxet0
 NqoGsf+suX74hGCpgWCYMRigwC3rUuH4TpdW3zuAmGkOCbRdNOp3zVFXCP3DEa8R226z
 pZkqR9pVggLBSqIu+rnVIbL+ao52nuPIn5UmByU6RiD8Xlw7ab+qgGdgc34DeQnuHtSh
 grNB4TY/E6IyLLG8PppF1qI8Eb+Vfs7tYBXpnzwuHDpRzu+WpUlwqf/AvWrx70nzBBdN
 M08GwacGFQUIyRXhGG+lTNhe0O0fCJkp4AiqbbMGh1QDoMk/+BcZmbHb/YZ95KO4+gMl
 ITUQ==
X-Gm-Message-State: APjAAAUenkp/R95pLLRn/y8JuWwduAjiOUYAgPBwyjPH3avw+WBVtqU1
 2hlp5G6xfzcHsK3MNdSbOpIYnGB2
X-Google-Smtp-Source: APXvYqweqpur7fMvxZObmVfSqbS547iDCfQASXJgcbt2tQzhx5HiKFq9W7rrMDpUXcABT39j1rNWTA==
X-Received: by 2002:a2e:9a19:: with SMTP id o25mr11569630lji.63.1562616261409; 
 Mon, 08 Jul 2019 13:04:21 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id a18sm3876010ljf.35.2019.07.08.13.04.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 13:04:20 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  8 Jul 2019 13:03:56 -0700
Message-Id: <20190708200356.10685-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: abstract 'entry' and 'retw' in
	assembly code
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

Provide abi_entry, abi_entry_default, abi_ret and abi_ret_default macros
that allocate aligned stack frame in windowed and call0 ABIs.
Provide XTENSA_SPILL_STACK_RESERVE macro that specifies required stack
frame size when register spilling is involved.
Replace all uses of 'entry' and 'retw' with the above macros.
This makes most of the xtensa assembly code ready for XEA3 and call0 ABI.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/asmmacro.h | 46 ++++++++++++++++++++++
 arch/xtensa/kernel/coprocessor.S   |  7 +++-
 arch/xtensa/kernel/entry.S         | 11 +++---
 arch/xtensa/kernel/mcount.S        | 11 +++---
 arch/xtensa/lib/checksum.S         | 12 +++---
 arch/xtensa/lib/memcopy.S          | 38 +++++++++----------
 arch/xtensa/lib/memset.S           | 10 ++---
 arch/xtensa/lib/strncpy_user.S     | 16 ++++----
 arch/xtensa/lib/strnlen_user.S     | 14 +++----
 arch/xtensa/lib/usercopy.S         | 12 +++---
 arch/xtensa/mm/misc.S              | 78 +++++++++++++++++++-------------------
 11 files changed, 153 insertions(+), 102 deletions(-)

diff --git a/arch/xtensa/include/asm/asmmacro.h b/arch/xtensa/include/asm/asmmacro.h
index 8308a9c3abb2..71a7e846bc1f 100644
--- a/arch/xtensa/include/asm/asmmacro.h
+++ b/arch/xtensa/include/asm/asmmacro.h
@@ -191,4 +191,50 @@
 #endif
 	.endm
 
+#define XTENSA_STACK_ALIGNMENT		16
+
+#if defined(__XTENSA_WINDOWED_ABI__)
+#define XTENSA_FRAME_SIZE_RESERVE	16
+#define XTENSA_SPILL_STACK_RESERVE	32
+
+#define abi_entry(frame_size) \
+	entry sp, (XTENSA_FRAME_SIZE_RESERVE + \
+		   (((frame_size) + XTENSA_STACK_ALIGNMENT - 1) & \
+		    -XTENSA_STACK_ALIGNMENT))
+#define abi_entry_default abi_entry(0)
+
+#define abi_ret(frame_size) retw
+#define abi_ret_default retw
+
+#elif defined(__XTENSA_CALL0_ABI__)
+
+#define XTENSA_SPILL_STACK_RESERVE	0
+
+#define abi_entry(frame_size) __abi_entry (frame_size)
+
+	.macro	__abi_entry frame_size
+	.ifgt \frame_size
+	addi sp, sp, -(((\frame_size) + XTENSA_STACK_ALIGNMENT - 1) & \
+		       -XTENSA_STACK_ALIGNMENT)
+	.endif
+	.endm
+
+#define abi_entry_default
+
+#define abi_ret(frame_size) __abi_ret (frame_size)
+
+	.macro	__abi_ret frame_size
+	.ifgt \frame_size
+	addi sp, sp, (((\frame_size) + XTENSA_STACK_ALIGNMENT - 1) & \
+		      -XTENSA_STACK_ALIGNMENT)
+	.endif
+	ret
+	.endm
+
+#define abi_ret_default ret
+
+#else
+#error Unsupported Xtensa ABI
+#endif
+
 #endif /* _XTENSA_ASMMACRO_H */
diff --git a/arch/xtensa/kernel/coprocessor.S b/arch/xtensa/kernel/coprocessor.S
index 92bf24a9da92..60c220020054 100644
--- a/arch/xtensa/kernel/coprocessor.S
+++ b/arch/xtensa/kernel/coprocessor.S
@@ -121,7 +121,9 @@
 
 ENTRY(coprocessor_flush)
 
-	entry	a1, 32
+	/* reserve 4 bytes on stack to save a0 */
+	abi_entry(4)
+
 	s32i	a0, a1, 0
 	movi	a0, .Lsave_cp_regs_jump_table
 	addx8	a3, a3, a0
@@ -131,7 +133,8 @@ ENTRY(coprocessor_flush)
 	beqz	a3, 1f
 	callx0	a3
 1:	l32i	a0, a1, 0
-	retw
+
+	abi_ret(4)
 
 ENDPROC(coprocessor_flush)
 
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index e54af8b7e0f8..183fa8e0bb5b 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -1842,7 +1842,8 @@ ENDPROC(fast_store_prohibited)
 
 ENTRY(system_call)
 
-	entry	a1, 32
+	/* reserve 4 bytes on stack for function parameter */
+	abi_entry(4)
 
 	/* regs->syscall = regs->areg[2] */
 
@@ -1892,7 +1893,7 @@ ENTRY(system_call)
 
 	s32i	a6, a2, PT_AREG2
 	bnez	a3, 1f
-	retw
+	abi_ret(4)
 
 1:
 	l32i	a4, a1, 4
@@ -1901,7 +1902,7 @@ ENTRY(system_call)
 	mov	a6, a2
 	call4	do_syscall_trace_leave
 	s32i	a3, a2, PT_SYSCALL
-	retw
+	abi_ret(4)
 
 ENDPROC(system_call)
 
@@ -1952,7 +1953,7 @@ ENDPROC(system_call)
 
 ENTRY(_switch_to)
 
-	entry	a1, 48
+	abi_entry(XTENSA_SPILL_STACK_RESERVE)
 
 	mov	a11, a3			# and 'next' (a3)
 
@@ -2013,7 +2014,7 @@ ENTRY(_switch_to)
 	wsr	a14, ps
 	rsync
 
-	retw
+	abi_ret(XTENSA_SPILL_STACK_RESERVE)
 
 ENDPROC(_switch_to)
 
diff --git a/arch/xtensa/kernel/mcount.S b/arch/xtensa/kernel/mcount.S
index 0eeda2e4a25e..5e4619f52858 100644
--- a/arch/xtensa/kernel/mcount.S
+++ b/arch/xtensa/kernel/mcount.S
@@ -11,6 +11,7 @@
  */
 
 #include <linux/linkage.h>
+#include <asm/asmmacro.h>
 #include <asm/ftrace.h>
 
 /*
@@ -21,13 +22,13 @@
 
 ENTRY(_mcount)
 
-	entry	a1, 16
+	abi_entry_default
 
 	movi	a4, ftrace_trace_function
 	l32i	a4, a4, 0
 	movi	a3, ftrace_stub
 	bne	a3, a4, 1f
-	retw
+	abi_ret_default
 
 1: 	xor	a7, a2, a1
 	movi	a3, 0x3fffffff
@@ -40,11 +41,11 @@ ENTRY(_mcount)
 	addi	a6, a6, -MCOUNT_INSN_SIZE
 	callx4	a4
 
-	retw
+	abi_ret_default
 
 ENDPROC(_mcount)
 
 ENTRY(ftrace_stub)
-	entry	a1, 16
-	retw
+	abi_entry_default
+	abi_ret_default
 ENDPROC(ftrace_stub)
diff --git a/arch/xtensa/lib/checksum.S b/arch/xtensa/lib/checksum.S
index c6e73b12e519..4cb9ca58d9ad 100644
--- a/arch/xtensa/lib/checksum.S
+++ b/arch/xtensa/lib/checksum.S
@@ -43,7 +43,7 @@ ENTRY(csum_partial)
 	 * Experiments with Ethernet and SLIP connections show that buf
 	 * is aligned on either a 2-byte or 4-byte boundary.
 	 */
-	entry	sp, 32
+	abi_entry_default
 	extui	a5, a2, 0, 2
 	bnez	a5, 8f		/* branch if 2-byte aligned */
 	/* Fall-through on common case, 4-byte alignment */
@@ -107,7 +107,7 @@ ENTRY(csum_partial)
 	ONES_ADD(a4, a6)
 7:
 	mov	a2, a4
-	retw
+	abi_ret_default
 
 	/* uncommon case, buf is 2-byte aligned */
 8:
@@ -195,7 +195,7 @@ unsigned int csum_partial_copy_generic (const char *src, char *dst, int len,
 
 ENTRY(csum_partial_copy_generic)
 
-	entry	sp, 32
+	abi_entry_default
 	mov	a12, a3
 	mov	a11, a4
 	or	a10, a2, a3
@@ -316,7 +316,7 @@ EX(11f)	s8i	a9, a3, 0
 	ONES_ADD(a5, a9)
 8:
 	mov	a2, a5
-	retw
+	abi_ret_default
 
 5:
 	/* Control branch to here when either src or dst is odd.  We
@@ -383,12 +383,12 @@ ENDPROC(csum_partial_copy_generic)
 	blt	a12, a11, .Leloop
 #endif
 2:
-	retw
+	abi_ret_default
 
 11:
 	movi	a2, -EFAULT
 	s32i	a2, a7, 0	/* dst_err_ptr */
 	movi	a2, 0
-	retw
+	abi_ret_default
 
 .previous
diff --git a/arch/xtensa/lib/memcopy.S b/arch/xtensa/lib/memcopy.S
index efecfd7ed8cc..582d817979ed 100644
--- a/arch/xtensa/lib/memcopy.S
+++ b/arch/xtensa/lib/memcopy.S
@@ -79,7 +79,7 @@
 	bne	a3, a7, .Lnextbyte # continue loop if $a3:src != $a7:src_end
 #endif /* !XCHAL_HAVE_LOOPS */
 .Lbytecopydone:
-	retw
+	abi_ret_default
 
 /*
  * Destination is unaligned
@@ -112,7 +112,7 @@
 ENTRY(__memcpy)
 WEAK(memcpy)
 
-	entry	sp, 16		# minimal stack frame
+	abi_entry_default
 	# a2/ dst, a3/ src, a4/ len
 	mov	a5, a2		# copy dst so that a2 is return value
 .Lcommon:
@@ -161,7 +161,7 @@ WEAK(memcpy)
 	bbsi.l	a4, 2, .L3
 	bbsi.l	a4, 1, .L4
 	bbsi.l	a4, 0, .L5
-	retw
+	abi_ret_default
 .L3:
 	# copy 4 bytes
 	l32i	a6, a3,  0
@@ -170,7 +170,7 @@ WEAK(memcpy)
 	addi	a5, a5,  4
 	bbsi.l	a4, 1, .L4
 	bbsi.l	a4, 0, .L5
-	retw
+	abi_ret_default
 .L4:
 	# copy 2 bytes
 	l16ui	a6, a3,  0
@@ -178,12 +178,12 @@ WEAK(memcpy)
 	s16i	a6, a5,  0
 	addi	a5, a5,  2
 	bbsi.l	a4, 0, .L5
-	retw
+	abi_ret_default
 .L5:
 	# copy 1 byte
 	l8ui	a6, a3,  0
 	s8i	a6, a5,  0
-	retw
+	abi_ret_default
 
 /*
  * Destination is aligned, Source is unaligned
@@ -255,7 +255,7 @@ WEAK(memcpy)
 #endif
 	bbsi.l	a4, 1, .L14
 	bbsi.l	a4, 0, .L15
-.Ldone:	retw
+.Ldone:	abi_ret_default
 .L14:
 	# copy 2 bytes
 	l8ui	a6, a3,  0
@@ -265,12 +265,12 @@ WEAK(memcpy)
 	s8i	a7, a5,  1
 	addi	a5, a5,  2
 	bbsi.l	a4, 0, .L15
-	retw
+	abi_ret_default
 .L15:
 	# copy 1 byte
 	l8ui	a6, a3,  0
 	s8i	a6, a5,  0
-	retw
+	abi_ret_default
 
 ENDPROC(__memcpy)
 
@@ -280,7 +280,7 @@ ENDPROC(__memcpy)
 
 ENTRY(bcopy)
 
-	entry	sp, 16		# minimal stack frame
+	abi_entry_default
 	# a2=src, a3=dst, a4=len
 	mov	a5, a3
 	mov	a3, a2
@@ -346,7 +346,7 @@ ENDPROC(bcopy)
 				       # $a3:src != $a7:src_start
 #endif /* !XCHAL_HAVE_LOOPS */
 .Lbackbytecopydone:
-	retw
+	abi_ret_default
 
 /*
  * Destination is unaligned
@@ -380,7 +380,7 @@ ENDPROC(bcopy)
 ENTRY(__memmove)
 WEAK(memmove)
 
-	entry	sp, 16		# minimal stack frame
+	abi_entry_default
 	# a2/ dst, a3/ src, a4/ len
 	mov	a5, a2		# copy dst so that a2 is return value
 .Lmovecommon:
@@ -435,7 +435,7 @@ WEAK(memmove)
 	bbsi.l	a4, 2, .Lback3
 	bbsi.l	a4, 1, .Lback4
 	bbsi.l	a4, 0, .Lback5
-	retw
+	abi_ret_default
 .Lback3:
 	# copy 4 bytes
 	addi	a3, a3, -4
@@ -444,7 +444,7 @@ WEAK(memmove)
 	s32i	a6, a5,  0
 	bbsi.l	a4, 1, .Lback4
 	bbsi.l	a4, 0, .Lback5
-	retw
+	abi_ret_default
 .Lback4:
 	# copy 2 bytes
 	addi	a3, a3, -2
@@ -452,14 +452,14 @@ WEAK(memmove)
 	addi	a5, a5, -2
 	s16i	a6, a5,  0
 	bbsi.l	a4, 0, .Lback5
-	retw
+	abi_ret_default
 .Lback5:
 	# copy 1 byte
 	addi	a3, a3, -1
 	l8ui	a6, a3,  0
 	addi	a5, a5, -1
 	s8i	a6, a5,  0
-	retw
+	abi_ret_default
 
 /*
  * Destination is aligned, Source is unaligned
@@ -531,7 +531,7 @@ WEAK(memmove)
 	bbsi.l	a4, 1, .Lback14
 	bbsi.l	a4, 0, .Lback15
 .Lbackdone:
-	retw
+	abi_ret_default
 .Lback14:
 	# copy 2 bytes
 	addi	a3, a3, -2
@@ -541,13 +541,13 @@ WEAK(memmove)
 	s8i	a6, a5,  0
 	s8i	a7, a5,  1
 	bbsi.l	a4, 0, .Lback15
-	retw
+	abi_ret_default
 .Lback15:
 	# copy 1 byte
 	addi	a3, a3, -1
 	addi	a5, a5, -1
 	l8ui	a6, a3,  0
 	s8i	a6, a5,  0
-	retw
+	abi_ret_default
 
 ENDPROC(__memmove)
diff --git a/arch/xtensa/lib/memset.S b/arch/xtensa/lib/memset.S
index 8632eacbdc80..59b1524fd601 100644
--- a/arch/xtensa/lib/memset.S
+++ b/arch/xtensa/lib/memset.S
@@ -34,7 +34,7 @@
 ENTRY(__memset)
 WEAK(memset)
 
-	entry	sp, 16		# minimal stack frame
+	abi_entry_default
 	# a2/ dst, a3/ c, a4/ length
 	extui	a3, a3, 0, 8	# mask to just 8 bits
 	slli	a7, a3, 8	# duplicate character in all bytes of word
@@ -48,7 +48,7 @@ WEAK(memset)
 	srli	a7, a4, 4	# number of loop iterations with 16B
 				# per iteration
 	bnez	a4, .Laligned
-	retw
+	abi_ret_default
 
 /*
  * Destination is word-aligned.
@@ -95,7 +95,7 @@ EX(10f) s16i	a3, a5,  0
 EX(10f) s8i	a3, a5,  0
 .L5:
 .Lret1:
-	retw
+	abi_ret_default
 
 /*
  * Destination is unaligned
@@ -139,7 +139,7 @@ EX(10f) s8i	a3, a5, 0
 	blt	a5, a6, .Lbyteloop
 #endif /* !XCHAL_HAVE_LOOPS */
 .Lbytesetdone:
-	retw
+	abi_ret_default
 
 ENDPROC(__memset)
 
@@ -150,4 +150,4 @@ ENDPROC(__memset)
 
 10:
 	movi	a2, 0
-	retw
+	abi_ret_default
diff --git a/arch/xtensa/lib/strncpy_user.S b/arch/xtensa/lib/strncpy_user.S
index c4c6c8578d59..4faf46fe3f38 100644
--- a/arch/xtensa/lib/strncpy_user.S
+++ b/arch/xtensa/lib/strncpy_user.S
@@ -50,7 +50,7 @@
 .text
 ENTRY(__strncpy_user)
 
-	entry	sp, 16		# minimal stack frame
+	abi_entry_default
 	# a2/ dst, a3/ src, a4/ len
 	mov	a11, a2		# leave dst in return value register
 	beqz	a4, .Lret	# if len is zero
@@ -93,7 +93,7 @@ EX(10f)	s8i	a9, a11, 0		# store byte 0
 	bnez	a4, .Lsrcaligned	# if len is nonzero
 .Lret:
 	sub	a2, a11, a2		# compute strlen
-	retw
+	abi_ret_default
 
 /*
  * dst is word-aligned, src is word-aligned
@@ -148,14 +148,14 @@ EX(10f)	s8i	a9, a11, 0
 .Lz3:	# byte 3 is zero
 	addi	a11, a11, 3		# advance dst pointer
 	sub	a2, a11, a2		# compute strlen
-	retw
+	abi_ret_default
 .Lz0:	# byte 0 is zero
 #ifdef __XTENSA_EB__
 	movi	a9, 0
 #endif /* __XTENSA_EB__ */
 EX(10f)	s8i	a9, a11, 0
 	sub	a2, a11, a2		# compute strlen
-	retw
+	abi_ret_default
 .Lz1:	# byte 1 is zero
 #ifdef __XTENSA_EB__
 	extui   a9, a9, 16, 16
@@ -163,7 +163,7 @@ EX(10f)	s8i	a9, a11, 0
 EX(10f)	s16i	a9, a11, 0
 	addi	a11, a11, 1		# advance dst pointer
 	sub	a2, a11, a2		# compute strlen
-	retw
+	abi_ret_default
 .Lz2:	# byte 2 is zero
 #ifdef __XTENSA_EB__
 	extui   a9, a9, 16, 16
@@ -173,7 +173,7 @@ EX(10f)	s16i	a9, a11, 0
 EX(10f)	s8i	a9, a11, 2
 	addi	a11, a11, 2		# advance dst pointer
 	sub	a2, a11, a2		# compute strlen
-	retw
+	abi_ret_default
 
 	.align	4		# 1 mod 4 alignment for LOOPNEZ
 	.byte	0		# (0 mod 4 alignment for LBEG)
@@ -199,7 +199,7 @@ EX(10f)	s8i	a9, a11, 0
 
 .Lunalignedend:
 	sub	a2, a11, a2		# compute strlen
-	retw
+	abi_ret_default
 
 ENDPROC(__strncpy_user)
 
@@ -214,4 +214,4 @@ ENDPROC(__strncpy_user)
 10:
 11:
 	movi	a2, -EFAULT
-	retw
+	abi_ret_default
diff --git a/arch/xtensa/lib/strnlen_user.S b/arch/xtensa/lib/strnlen_user.S
index 1f2ca2bb2ab3..3d391dca3efb 100644
--- a/arch/xtensa/lib/strnlen_user.S
+++ b/arch/xtensa/lib/strnlen_user.S
@@ -45,7 +45,7 @@
 .text
 ENTRY(__strnlen_user)
 
-	entry	sp, 16		# minimal stack frame
+	abi_entry_default
 	# a2/ s, a3/ len
 	addi	a4, a2, -4	# because we overincrement at the end;
 				# we compensate with load offsets of 4
@@ -96,7 +96,7 @@ EX(10f)	l32i	a9, a4, 4	# load 4 bytes for remaining checks
 	addi	a4, a4, 1	# advance string pointer
 .L101:
 	sub	a2, a4, a2	# compute length
-	retw
+	abi_ret_default
 
 # NOTE that in several places below, we point to the byte just after
 # the zero byte in order to include the NULL terminator in the count.
@@ -106,15 +106,15 @@ EX(10f)	l32i	a9, a4, 4	# load 4 bytes for remaining checks
 .Lz0:	# byte 0 is zero
 	addi	a4, a4, 1	# point just beyond zero byte
 	sub	a2, a4, a2	# subtract to get length
-	retw
+	abi_ret_default
 .Lz1:	# byte 1 is zero
 	addi	a4, a4, 1+1	# point just beyond zero byte
 	sub	a2, a4, a2	# subtract to get length
-	retw
+	abi_ret_default
 .Lz2:	# byte 2 is zero
 	addi	a4, a4, 2+1	# point just beyond zero byte
 	sub	a2, a4, a2	# subtract to get length
-	retw
+	abi_ret_default
 
 .L1mod2:	# address is odd
 EX(10f)	l8ui	a9, a4, 4		# get byte 0
@@ -130,7 +130,7 @@ EX(10f)	l32i	a9, a4, 0	# get word with first two bytes of string
 	# byte 3 is zero
 	addi	a4, a4, 3+1	# point just beyond zero byte
 	sub	a2, a4, a2	# subtract to get length
-	retw
+	abi_ret_default
 
 ENDPROC(__strnlen_user)
 
@@ -138,4 +138,4 @@ ENDPROC(__strnlen_user)
 	.align	4
 10:
 	movi	a2, 0
-	retw
+	abi_ret_default
diff --git a/arch/xtensa/lib/usercopy.S b/arch/xtensa/lib/usercopy.S
index 228607e30bc2..a0aa4047f94a 100644
--- a/arch/xtensa/lib/usercopy.S
+++ b/arch/xtensa/lib/usercopy.S
@@ -60,7 +60,7 @@
 	.text
 ENTRY(__xtensa_copy_user)
 
-	entry	sp, 16		# minimal stack frame
+	abi_entry_default
 	# a2/ dst, a3/ src, a4/ len
 	mov	a5, a2		# copy dst so that a2 is return value
 	mov	a11, a4		# preserve original len for error case
@@ -75,7 +75,7 @@ ENTRY(__xtensa_copy_user)
 	__ssa8	a3		# set shift amount from byte offset
 	bnez	a4, .Lsrcunaligned
 	movi	a2, 0		# return success for len==0
-	retw
+	abi_ret_default
 
 /*
  * Destination is unaligned
@@ -127,7 +127,7 @@ EX(10f)	s8i	a6, a5, 0
 #endif /* !XCHAL_HAVE_LOOPS */
 .Lbytecopydone:
 	movi	a2, 0		# return success for len bytes copied
-	retw
+	abi_ret_default
 
 /*
  * Destination and source are word-aligned.
@@ -187,7 +187,7 @@ EX(10f)	l8ui	a6, a3,  0
 EX(10f)	s8i	a6, a5,  0
 .L5:
 	movi	a2, 0		# return success for len bytes copied
-	retw
+	abi_ret_default
 
 /*
  * Destination is aligned, Source is unaligned
@@ -264,7 +264,7 @@ EX(10f)	l8ui	a6, a3,  0
 EX(10f)	s8i	a6, a5,  0
 .L15:
 	movi	a2, 0		# return success for len bytes copied
-	retw
+	abi_ret_default
 
 ENDPROC(__xtensa_copy_user)
 
@@ -281,4 +281,4 @@ ENDPROC(__xtensa_copy_user)
 10:
 	sub	a2, a5, a2	/* a2 <-- bytes copied */
 	sub	a2, a11, a2	/* a2 <-- bytes not copied */
-	retw
+	abi_ret_default
diff --git a/arch/xtensa/mm/misc.S b/arch/xtensa/mm/misc.S
index 11a01c3e9cea..6aa036c427c3 100644
--- a/arch/xtensa/mm/misc.S
+++ b/arch/xtensa/mm/misc.S
@@ -30,7 +30,7 @@
 
 ENTRY(clear_page)
 
-	entry	a1, 16
+	abi_entry_default
 
 	movi	a3, 0
 	__loopi	a2, a7, PAGE_SIZE, 32
@@ -44,7 +44,7 @@ ENTRY(clear_page)
 	s32i	a3, a2, 28
 	__endla	a2, a7, 32
 
-	retw
+	abi_ret_default
 
 ENDPROC(clear_page)
 
@@ -57,7 +57,7 @@ ENDPROC(clear_page)
 
 ENTRY(copy_page)
 
-	entry	a1, 16
+	abi_entry_default
 
 	__loopi a2, a4, PAGE_SIZE, 32
 
@@ -86,7 +86,7 @@ ENTRY(copy_page)
 
 	__endl  a2, a4
 
-	retw
+	abi_ret_default
 
 ENDPROC(copy_page)
 
@@ -116,7 +116,7 @@ ENTRY(__tlbtemp_mapping_start)
 
 ENTRY(clear_page_alias)
 
-	entry	a1, 32
+	abi_entry_default
 
 	/* Skip setting up a temporary DTLB if not aliased low page. */
 
@@ -144,14 +144,14 @@ ENTRY(clear_page_alias)
 	__endla	a2, a7, 32
 
 	bnez	a6, 1f
-	retw
+	abi_ret_default
 
 	/* We need to invalidate the temporary idtlb entry, if any. */
 
 1:	idtlb	a4
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(clear_page_alias)
 
@@ -164,7 +164,7 @@ ENDPROC(clear_page_alias)
 
 ENTRY(copy_page_alias)
 
-	entry	a1, 32
+	abi_entry_default
 
 	/* Skip setting up a temporary DTLB for destination if not aliased. */
 
@@ -221,19 +221,19 @@ ENTRY(copy_page_alias)
 
 	bnez	a6, 1f
 	bnez	a7, 2f
-	retw
+	abi_ret_default
 
 1:	addi	a2, a2, -PAGE_SIZE
 	idtlb	a2
 	dsync
 	bnez	a7, 2f
-	retw
+	abi_ret_default
 
 2:	addi	a3, a3, -PAGE_SIZE+1
 	idtlb	a3
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(copy_page_alias)
 
@@ -248,7 +248,7 @@ ENDPROC(copy_page_alias)
 
 ENTRY(__flush_invalidate_dcache_page_alias)
 
-	entry	sp, 16
+	abi_entry_default
 
 	movi	a7, 0			# required for exception handler
 	addi	a6, a3, (PAGE_KERNEL | _PAGE_HW_WRITE)
@@ -261,7 +261,7 @@ ENTRY(__flush_invalidate_dcache_page_alias)
 	idtlb	a4
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__flush_invalidate_dcache_page_alias)
 
@@ -272,7 +272,7 @@ ENDPROC(__flush_invalidate_dcache_page_alias)
 
 ENTRY(__invalidate_dcache_page_alias)
 
-	entry	sp, 16
+	abi_entry_default
 
 	movi	a7, 0			# required for exception handler
 	addi	a6, a3, (PAGE_KERNEL | _PAGE_HW_WRITE)
@@ -285,7 +285,7 @@ ENTRY(__invalidate_dcache_page_alias)
 	idtlb	a4
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__invalidate_dcache_page_alias)
 #endif
@@ -296,7 +296,7 @@ ENTRY(__tlbtemp_mapping_itlb)
 	
 ENTRY(__invalidate_icache_page_alias)
 
-	entry	sp, 16
+	abi_entry_default
 
 	addi	a6, a3, (PAGE_KERNEL_EXEC | _PAGE_HW_WRITE)
 	mov	a4, a2
@@ -307,7 +307,7 @@ ENTRY(__invalidate_icache_page_alias)
 
 	iitlb	a4
 	isync
-	retw
+	abi_ret_default
 
 ENDPROC(__invalidate_icache_page_alias)
 
@@ -325,12 +325,12 @@ ENTRY(__tlbtemp_mapping_end)
 
 ENTRY(__invalidate_icache_page)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___invalidate_icache_page a2 a3
 	isync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__invalidate_icache_page)
 
@@ -340,12 +340,12 @@ ENDPROC(__invalidate_icache_page)
 
 ENTRY(__invalidate_dcache_page)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___invalidate_dcache_page a2 a3
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__invalidate_dcache_page)
 
@@ -355,12 +355,12 @@ ENDPROC(__invalidate_dcache_page)
 
 ENTRY(__flush_invalidate_dcache_page)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___flush_invalidate_dcache_page a2 a3
 
 	dsync
-	retw
+	abi_ret_default
 
 ENDPROC(__flush_invalidate_dcache_page)
 
@@ -370,12 +370,12 @@ ENDPROC(__flush_invalidate_dcache_page)
 
 ENTRY(__flush_dcache_page)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___flush_dcache_page a2 a3
 
 	dsync
-	retw
+	abi_ret_default
 
 ENDPROC(__flush_dcache_page)
 
@@ -385,12 +385,12 @@ ENDPROC(__flush_dcache_page)
 
 ENTRY(__invalidate_icache_range)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___invalidate_icache_range a2 a3 a4
 	isync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__invalidate_icache_range)
 
@@ -400,12 +400,12 @@ ENDPROC(__invalidate_icache_range)
 
 ENTRY(__flush_invalidate_dcache_range)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___flush_invalidate_dcache_range a2 a3 a4
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__flush_invalidate_dcache_range)
 
@@ -415,12 +415,12 @@ ENDPROC(__flush_invalidate_dcache_range)
 
 ENTRY(__flush_dcache_range)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___flush_dcache_range a2 a3 a4
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__flush_dcache_range)
 
@@ -430,11 +430,11 @@ ENDPROC(__flush_dcache_range)
 
 ENTRY(__invalidate_dcache_range)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___invalidate_dcache_range a2 a3 a4
 
-	retw
+	abi_ret_default
 
 ENDPROC(__invalidate_dcache_range)
 
@@ -444,12 +444,12 @@ ENDPROC(__invalidate_dcache_range)
 
 ENTRY(__invalidate_icache_all)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___invalidate_icache_all a2 a3
 	isync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__invalidate_icache_all)
 
@@ -459,12 +459,12 @@ ENDPROC(__invalidate_icache_all)
 
 ENTRY(__flush_invalidate_dcache_all)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___flush_invalidate_dcache_all a2 a3
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__flush_invalidate_dcache_all)
 
@@ -474,11 +474,11 @@ ENDPROC(__flush_invalidate_dcache_all)
 
 ENTRY(__invalidate_dcache_all)
 
-	entry	sp, 16
+	abi_entry_default
 
 	___invalidate_dcache_all a2 a3
 	dsync
 
-	retw
+	abi_ret_default
 
 ENDPROC(__invalidate_dcache_all)
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
