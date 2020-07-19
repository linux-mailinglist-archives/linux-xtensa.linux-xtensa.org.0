Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B040B224E9A
	for <lists+linux-xtensa@lfdr.de>; Sun, 19 Jul 2020 04:09:24 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5EDDE644E;
	Sun, 19 Jul 2020 01:53:06 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 338B06445
 for <linux-xtensa@linux-xtensa.org>; Sun, 19 Jul 2020 01:53:04 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d1so7088360plr.8
 for <linux-xtensa@linux-xtensa.org>; Sat, 18 Jul 2020 19:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QtHrNXMSpyatUvUEtvk0zy0sYC+0CsUTNDsn+37VAVw=;
 b=RI2u69cAKbx6QZ8BPbBmXTkTXkEOktawEPEaX1J+QA5VSw+EzTA9yQWF2K1pjNPjqU
 of8yPvby9LmdjPFe33L7fgxNnyC4fQPiIjK/8INhZjXsfxvrQw71eIwiqDlA+yn59WBe
 Ofp/460HjewE8QhLTVvQZzLseslWQYELmhj8karfKPF2PvazPhV0f9VZpX5Vcl6GR0xt
 QIBpCtf24Gygt2ilBMACLM3Fe9vIBQWSbqFwKpBj52WWaTLcq406+/fISbqUsgVPPC7x
 S2GNeaEFZxyQkZtvDdcZfBSyFhvh0KIi/GmO/a2KYXg4HfJ2dLVjH+LAAG7aB/IkrwiU
 eCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QtHrNXMSpyatUvUEtvk0zy0sYC+0CsUTNDsn+37VAVw=;
 b=m7fwS6m9pWvSFMhUVVrTxAfHhLBARze3kN8hLnq5x6ASUrqqk3SYYecRf9Leb4WSFp
 iO7jiybEIpHw8BfczrNQhKgA2jn9wdpxcD7iJMA0okIguezV6BHZBROYl0eKeZb8hUuL
 oOCQvn9gA3jCqLwqPwcqvGMzJ/HlqYG1v1kU7jjaPMiqHpqSZrkIDNqakMDseu5CZR+6
 duuVOd78ppCQOVg1DlH2nLTHhz7VNMtcbFKnj6nURzzoh4YBxca4E+ji5qXTW7giTAxe
 47poU0L8YGe3cB4MCwMKu0ZQ4QHAGSry9nS0mOVJNwKI8mzio4ASmERxjZaixDp80HO3
 GFGg==
X-Gm-Message-State: AOAM533qIM68NEz+1ujvT4g2oOpImez+P6p8UiSWf7UUhA8l1dTb76JX
 +xAX+/VjqsnkAS5y5vL1+SqeXEtO
X-Google-Smtp-Source: ABdhPJyDBS0Gryauf7x/s/qj1hi1aRXGhcLlVdBWgIoatOrfH5k5B6FIAGiHE526huC4vqwg2cZ3sA==
X-Received: by 2002:a17:90a:2681:: with SMTP id
 m1mr15468157pje.204.1595124560587; 
 Sat, 18 Jul 2020 19:09:20 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id b8sm5767459pjd.5.2020.07.18.19.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:09:19 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat, 18 Jul 2020 19:09:07 -0700
Message-Id: <20200719020907.25742-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: add audit support
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

All bits needed for syscall audit are present on xtensa. Add
audit_syscall_entry and audit_syscall_exit calls and select
HAVE_ARCH_AUDITSYSCALL in Kconfig.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig                   | 1 +
 arch/xtensa/include/asm/thread_info.h | 4 +++-
 arch/xtensa/kernel/ptrace.c           | 6 ++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 3a9f1e80394a..a7def0991a01 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -21,6 +21,7 @@ config XTENSA
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_STRNCPY_FROM_USER if KASAN
+	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 	select HAVE_ARCH_KASAN if MMU && !XIP_KERNEL
 	select HAVE_ARCH_TRACEHOOK
diff --git a/arch/xtensa/include/asm/thread_info.h b/arch/xtensa/include/asm/thread_info.h
index f092cc3f4e66..c49cc4a1f39a 100644
--- a/arch/xtensa/include/asm/thread_info.h
+++ b/arch/xtensa/include/asm/thread_info.h
@@ -111,15 +111,17 @@ static inline struct thread_info *current_thread_info(void)
 #define TIF_RESTORE_SIGMASK	6	/* restore signal mask in do_signal() */
 #define TIF_NOTIFY_RESUME	7	/* callback before returning to user */
 #define TIF_DB_DISABLED		8	/* debug trap disabled for syscall */
+#define TIF_SYSCALL_AUDIT	9	/* syscall auditing active */
 
 #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
 #define _TIF_SINGLESTEP		(1<<TIF_SINGLESTEP)
 #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
+#define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
 
 #define _TIF_WORK_MASK		(_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP | \
-				 _TIF_SYSCALL_TRACEPOINT)
+				 _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT)
 
 #define THREAD_SIZE KERNEL_STACK_SIZE
 #define THREAD_SIZE_ORDER (KERNEL_STACK_SHIFT - PAGE_SHIFT)
diff --git a/arch/xtensa/kernel/ptrace.c b/arch/xtensa/kernel/ptrace.c
index b4c07bd890fe..0278d7dfb4d6 100644
--- a/arch/xtensa/kernel/ptrace.c
+++ b/arch/xtensa/kernel/ptrace.c
@@ -12,6 +12,7 @@
  * Marc Gauthier<marc@tensilica.com> <marc@alumni.uwaterloo.ca>
  */
 
+#include <linux/audit.h>
 #include <linux/errno.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/kernel.h>
@@ -562,6 +563,9 @@ int do_syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, syscall_get_nr(current, regs));
 
+	audit_syscall_entry(regs->syscall, regs->areg[6],
+			    regs->areg[3], regs->areg[4],
+			    regs->areg[5]);
 	return 1;
 }
 
@@ -569,6 +573,8 @@ void do_syscall_trace_leave(struct pt_regs *regs)
 {
 	int step;
 
+	audit_syscall_exit(regs);
+
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_exit(regs, regs_return_value(regs));
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
