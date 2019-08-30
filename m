Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC58A3DF0
	for <lists+linux-xtensa@lfdr.de>; Fri, 30 Aug 2019 20:50:11 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id CA7C1642F;
	Fri, 30 Aug 2019 18:44:22 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 06F46581B
 for <linux-xtensa@linux-xtensa.org>; Fri, 30 Aug 2019 18:44:20 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r134so5195765lff.12
 for <linux-xtensa@linux-xtensa.org>; Fri, 30 Aug 2019 11:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p+OO6RWDItYSV1KwOrr7xB/bOQMmuW3w+Ire99GNxC4=;
 b=oqm6kWad+O/QU8C9toQM0qEcxpKM+dJKqBlGVeVoIESnZE1SuQc8TtIJz94Xf9HSH8
 FpQWQk9wJeXV3xDxKi+nTIqjK92Oj+rEdOng7fm6Bt3+NSBcHXJeUgR6LWqazZjXQ+Kk
 RmViCJgt1ki7AaFwV1ThCzcJkwRTdXtAxyzW9DhFzq/ErFXk0EfyBQvcTPxZ/8F7HmXf
 QLZCvDmw6jY7gDNLecDjce2TxLiEHucwdX13H1dRojJ8ZCPhM75itNFzyDPRpa+FO7H2
 cA61UxerJzeQH8nnLmwrlQ7l7H8diKI2g6i3J/WbziivSUG8JsaYIhkpQOgusLSLvcve
 6tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p+OO6RWDItYSV1KwOrr7xB/bOQMmuW3w+Ire99GNxC4=;
 b=Ypq/eHLJa/QkUuIkmZbjxjFZeczWaO/LMaZC6omoGuIanPDzJkedIjciPCHmbj77zh
 Hr2R7WZbXtwZh3aad9+WOelenCREjCgJLAwWGjVgGe+gvqYDEp8M+EVnwgqHqcUJC+cx
 Vf+86nPSW7Gp6ErSpiQq2zmti3tVe4S51tOj80dskqLC+Vh631mn9yQjYlFyCPulWWF/
 AW7uvCSvmYPJqcDs8OefElTvmbGUPpSWY0Tx2SbLV8z4HNBfzQdC0menz7f4xa8vUosv
 on5gmjqYOWYvf2oD3rnAkaHP510lUUoPmYdfQUOkw2D/TrzTrZ4upQX8w1r+cqUG/M6R
 IjlQ==
X-Gm-Message-State: APjAAAU3GjnQ39pFAk0Qpfvlc22OvNcBKAroj/cFT95yHa9OTgQ9t2jB
 1hP1Xa1xTxJLHBuKy+yjr+ho5Gsy
X-Google-Smtp-Source: APXvYqxx6xZCS1EuTmv5GYcbC+KIlggRvqnC5q+NWpLo2WSv2WKeRYVkiPZe17gr9+78w+2En5KpLA==
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr2109434lfi.57.1567191008059;
 Fri, 30 Aug 2019 11:50:08 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id u13sm970890ljj.40.2019.08.30.11.50.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 11:50:07 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 30 Aug 2019 11:49:51 -0700
Message-Id: <20190830184951.31083-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190830184951.31083-1-jcmvbkbc@gmail.com>
References: <20190830184951.31083-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/2] xtensa: add support for call0 ABI in
	userspace
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

Provide a Kconfig choice to select whether only the default ABI, only
call0 ABI or both are supported. The default for XEA2 is windowed, but
it may change for XEA3. Call0 only runs userspace with PS.WOE disabled.
Supporting both windowed and call0 ABIs is tricky, as there's no
indication in the ELF binaries which ABI they use. So it is done by
probing: each process is started with PS.WOE disabled, but the handler
of an illegal instruction exception taken with PS.WOE retries faulting
instruction after enabling PS.WOE. It must happen before any signal is
delivered to the process, otherwise it may be delivered incorrectly.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig                 | 48 +++++++++++++++++++++++++++++++++++++
 arch/xtensa/include/asm/processor.h |  9 ++++++-
 arch/xtensa/kernel/entry.S          | 34 ++++++++++++++++++++++++++
 arch/xtensa/kernel/signal.c         | 26 +++++++++++++-------
 arch/xtensa/kernel/stacktrace.c     |  5 ++++
 arch/xtensa/kernel/traps.c          |  4 ++++
 6 files changed, 117 insertions(+), 9 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index ebc135bda921..fb64469ca8f0 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -385,6 +385,54 @@ config FAST_SYSCALL_SPILL_REGISTERS
 
 	  If unsure, say N.
 
+config USER_ABI_CALL0
+	bool
+
+choice
+	prompt "Userspace ABI"
+	default USER_ABI_DEFAULT
+	help
+	  Select supported userspace ABI.
+
+	  If unsure, choose the default ABI.
+
+config USER_ABI_DEFAULT
+	bool "Default ABI only"
+	help
+	  Assume default userspace ABI. For XEA2 cores it is windowed ABI.
+	  call0 ABI binaries may be run on such kernel, but signal delivery
+	  will not work correctly for them.
+
+config USER_ABI_CALL0_ONLY
+	bool "Call0 ABI only"
+	select USER_ABI_CALL0
+	help
+	  Select this option to support only call0 ABI in userspace.
+	  Windowed ABI binaries will crash with a segfault caused by
+	  an illegal instruction exception on the first 'entry' opcode.
+
+	  Choose this option if you're planning to run only user code
+	  built with call0 ABI.
+
+config USER_ABI_CALL0_PROBE
+	bool "Support both windowed and call0 ABI by probing"
+	select USER_ABI_CALL0
+	help
+	  Select this option to support both windowed and call0 userspace
+	  ABIs. When enabled all processes are started with PS.WOE disabled
+	  and a fast user exception handler for an illegal instruction is
+	  used to turn on PS.WOE bit on the first 'entry' opcode executed by
+	  the userspace.
+
+	  This option should be enabled for the kernel that must support
+	  both call0 and windowed ABIs in userspace at the same time.
+
+	  Note that Xtensa ISA does not guarantee that entry opcode will
+	  raise an illegal instruction exception on cores with XEA2 when
+	  PS.WOE is disabled, check whether the target core supports it.
+
+endchoice
+
 endmenu
 
 config XTENSA_CALIBRATE_CCOUNT
diff --git a/arch/xtensa/include/asm/processor.h b/arch/xtensa/include/asm/processor.h
index 0b4efec9e19e..7495520d7a3e 100644
--- a/arch/xtensa/include/asm/processor.h
+++ b/arch/xtensa/include/asm/processor.h
@@ -176,14 +176,21 @@ struct thread_struct {
 
 /*
  * Do necessary setup to start up a newly executed thread.
- * Note: We set-up ps as if we did a call4 to the new pc.
+ * Note: When windowed ABI is used for userspace we set-up ps
+ *       as if we did a call4 to the new pc.
  *       set_thread_state in signal.c depends on it.
  */
+#if IS_ENABLED(CONFIG_USER_ABI_CALL0)
+#define USER_PS_VALUE ((USER_RING << PS_RING_SHIFT) |			\
+		       (1 << PS_UM_BIT) |				\
+		       (1 << PS_EXCM_BIT))
+#else
 #define USER_PS_VALUE (PS_WOE_MASK |					\
 		       (1 << PS_CALLINC_SHIFT) |			\
 		       (USER_RING << PS_RING_SHIFT) |			\
 		       (1 << PS_UM_BIT) |				\
 		       (1 << PS_EXCM_BIT))
+#endif
 
 /* Clearing a0 terminates the backtrace. */
 #define start_thread(regs, new_pc, new_sp) \
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 9afe8f612f23..9e3676879168 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -1003,7 +1003,41 @@ ENTRY(fast_alloca)
 4:	j	_WindowUnderflow4
 ENDPROC(fast_alloca)
 
+#ifdef CONFIG_USER_ABI_CALL0_PROBE
 /*
+ * fast illegal instruction handler.
+ *
+ * This is used to fix up user PS.WOE on the exception caused
+ * by the first opcode related to register window. If PS.WOE is
+ * already set it goes directly to the common user exception handler.
+ *
+ * Entry condition:
+ *
+ *   a0:	trashed, original value saved on stack (PT_AREG0)
+ *   a1:	a1
+ *   a2:	new stack pointer, original in DEPC
+ *   a3:	a3
+ *   depc:	a2, original value saved on stack (PT_DEPC)
+ *   excsave_1:	dispatch table
+ */
+
+ENTRY(fast_illegal_instruction_user)
+
+	rsr	a0, ps
+	bbsi.l	a0, PS_WOE_BIT, user_exception
+	s32i	a3, a2, PT_AREG3
+	movi	a3, PS_WOE_MASK
+	or	a0, a0, a3
+	wsr	a0, ps
+	l32i	a3, a2, PT_AREG3
+	l32i	a0, a2, PT_AREG0
+	rsr	a2, depc
+	rfe
+
+ENDPROC(fast_illegal_instruction_user)
+#endif
+
+	/*
  * fast system calls.
  *
  * WARNING:  The kernel doesn't save the entire user context before
diff --git a/arch/xtensa/kernel/signal.c b/arch/xtensa/kernel/signal.c
index fbedf2aba09d..dae83cddd6ca 100644
--- a/arch/xtensa/kernel/signal.c
+++ b/arch/xtensa/kernel/signal.c
@@ -335,7 +335,8 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe *frame;
 	int err = 0, sig = ksig->sig;
-	unsigned long sp, ra, tp;
+	unsigned long sp, ra, tp, ps;
+	unsigned int base;
 
 	sp = regs->areg[1];
 
@@ -385,17 +386,26 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 
 	/* Set up registers for signal handler; preserve the threadptr */
 	tp = regs->threadptr;
+	ps = regs->ps;
 	start_thread(regs, (unsigned long) ksig->ka.sa.sa_handler,
 		     (unsigned long) frame);
 
-	/* Set up a stack frame for a call4
-	 * Note: PS.CALLINC is set to one by start_thread
-	 */
-	regs->areg[4] = (((unsigned long) ra) & 0x3fffffff) | 0x40000000;
-	regs->areg[6] = (unsigned long) sig;
-	regs->areg[7] = (unsigned long) &frame->info;
-	regs->areg[8] = (unsigned long) &frame->uc;
+	/* Set up a stack frame for a call4 if userspace uses windowed ABI */
+	if (ps & PS_WOE_MASK) {
+		base = 4;
+		regs->areg[base] =
+			(((unsigned long) ra) & 0x3fffffff) | 0x40000000;
+		ps = (ps & ~(PS_CALLINC_MASK | PS_OWB_MASK)) |
+			(1 << PS_CALLINC_SHIFT);
+	} else {
+		base = 0;
+		regs->areg[base] = (unsigned long) ra;
+	}
+	regs->areg[base + 2] = (unsigned long) sig;
+	regs->areg[base + 3] = (unsigned long) &frame->info;
+	regs->areg[base + 4] = (unsigned long) &frame->uc;
 	regs->threadptr = tp;
+	regs->ps = ps;
 
 	pr_debug("SIG rt deliver (%s:%d): signal=%d sp=%p pc=%08lx\n",
 		 current->comm, current->pid, sig, frame, regs->pc);
diff --git a/arch/xtensa/kernel/stacktrace.c b/arch/xtensa/kernel/stacktrace.c
index b9f82510c650..c822abb93d20 100644
--- a/arch/xtensa/kernel/stacktrace.c
+++ b/arch/xtensa/kernel/stacktrace.c
@@ -44,6 +44,11 @@ void xtensa_backtrace_user(struct pt_regs *regs, unsigned int depth,
 	if (pc == 0 || pc >= TASK_SIZE || ufn(&frame, data))
 		return;
 
+	if (IS_ENABLED(CONFIG_USER_ABI_CALL0_ONLY) ||
+	    (IS_ENABLED(CONFIG_USER_ABI_CALL0_PROBE) &&
+	     !(regs->ps & PS_WOE_MASK)))
+		return;
+
 	/* Two steps:
 	 *
 	 * 1. Look through the register window for the
diff --git a/arch/xtensa/kernel/traps.c b/arch/xtensa/kernel/traps.c
index f060348c1b23..4a6c495ce9b6 100644
--- a/arch/xtensa/kernel/traps.c
+++ b/arch/xtensa/kernel/traps.c
@@ -51,6 +51,7 @@
 extern void kernel_exception(void);
 extern void user_exception(void);
 
+extern void fast_illegal_instruction_user(void);
 extern void fast_syscall_user(void);
 extern void fast_alloca(void);
 extern void fast_unaligned(void);
@@ -87,6 +88,9 @@ typedef struct {
 
 static dispatch_init_table_t __initdata dispatch_init_table[] = {
 
+#ifdef CONFIG_USER_ABI_CALL0_PROBE
+{ EXCCAUSE_ILLEGAL_INSTRUCTION,	USER,	   fast_illegal_instruction_user },
+#endif
 { EXCCAUSE_ILLEGAL_INSTRUCTION,	0,	   do_illegal_instruction},
 { EXCCAUSE_SYSTEM_CALL,		USER,	   fast_syscall_user },
 { EXCCAUSE_SYSTEM_CALL,		0,	   system_call },
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
