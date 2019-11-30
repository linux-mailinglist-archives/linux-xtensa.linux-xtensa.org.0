Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6A23E10DC49
	for <lists+linux-xtensa@lfdr.de>; Sat, 30 Nov 2019 04:45:19 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 42864658B;
	Sat, 30 Nov 2019 03:36:27 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 74A216579
 for <linux-xtensa@linux-xtensa.org>; Sat, 30 Nov 2019 03:36:25 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q6so922695lfb.6
 for <linux-xtensa@linux-xtensa.org>; Fri, 29 Nov 2019 19:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b0/RSZtZa/8k0SsBOdWVOHCkbjUz+w0oVuNtCkTS7c8=;
 b=NrmVCCj3OF1nsro0wjwnvMpXQsZ2tewscAGSbbL4R4xeF2aLPnvPz4QDUdYStMgu68
 9x0yY6Q2GVWjog8qojRYMyHlrAz/trL9FdudpOVJKKmFjY95+Cb5gIBZfvFM0GERNsOS
 OfxtkeyoilXshGQUQLJr3C9RQWk4wUqJk6QE3lVazV8BQRcBmRTWTTPqQZHc8EEKf4zv
 At+czu4k+wz+CVuPMmTdTPQZiqYR5jXHDdYtyJUUe0CYqLpdCQn5KKcxGK8DYdGBlaXh
 h6wm8QbVW0/s7p2NH4jXmCSmZ2rXqWHmIAhlh7vapuv1gTkOKGcacjK5co85YhEHDptf
 CTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0/RSZtZa/8k0SsBOdWVOHCkbjUz+w0oVuNtCkTS7c8=;
 b=Wqlc93dgNqVO+Kp4B4QFboNkv6VxabeaeN+iTHUXy4HQaU+NjimLHGNYq/nSSPMPwh
 YoaDIaDwpzSwWsqP6WgB1zMezdzxIwphlHmSfliPWccZ62UmGqeEBDWVXByJI46+67Zc
 9pT5NF3OmwvQPAR9kllPyZGeyPCOPea8+cfjDqJMWS4VRSp4SL0BVkuZE7anZj1shX5W
 bfzowtTaX89984cOn5Ki0qGsLPwDm47twA0lL0Alf9ZDfFvWsLJ+uQPsoGaH42XQQVH8
 QeLhaVfRpVoszZfdIbXxHMBv8qXJ/hja5dnq5zzsv90EyEnf1fR3ktQmhrbfJeb0nERI
 S1WA==
X-Gm-Message-State: APjAAAWalLyXsgwA4cmAuIcr0eL94plHghBDeqtOsdm0HJQEQ7tUqZvO
 yKtLG/2BfViB27ahLlWPr+1a5EkqItQ=
X-Google-Smtp-Source: APXvYqykNu1XlTg0Fz3aLqBpQIDZ9hmTmW0se4r8GExnWvOkLsPWqCkoWXtzcy3plrV+JgQqKIvahA==
X-Received: by 2002:a05:6512:284:: with SMTP id
 j4mr25552792lfp.109.1575085515914; 
 Fri, 29 Nov 2019 19:45:15 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id z9sm2920528ljm.40.2019.11.29.19.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 19:45:15 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 29 Nov 2019 19:44:50 -0800
Message-Id: <20191130034450.25507-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130034450.25507-1-jcmvbkbc@gmail.com>
References: <20191130034450.25507-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 3/3] xtensa: clean up
	system_call/xtensa_rt_sigreturn interaction
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

system_call assembly code always pushes pointer to struct pt_regs as the
last additional parameter for all system calls. The only user of this
feature is xtensa_rt_sigreturn.
Avoid this special case. Define xtensa_rt_sigreturn as accepting no
argiments. Use current_pt_regs to get pointer to struct pt_regs in
xtensa_rt_sigreturn. Don't pass additional parameter from system_call
code.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/syscall.h |  2 +-
 arch/xtensa/kernel/entry.S        | 10 +++-------
 arch/xtensa/kernel/signal.c       |  4 ++--
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
index c90fb944f9d8..f9a671cbf933 100644
--- a/arch/xtensa/include/asm/syscall.h
+++ b/arch/xtensa/include/asm/syscall.h
@@ -79,7 +79,7 @@ static inline void syscall_set_arguments(struct task_struct *task,
 		regs->areg[reg[i]] = args[i];
 }
 
-asmlinkage long xtensa_rt_sigreturn(struct pt_regs*);
+asmlinkage long xtensa_rt_sigreturn(void);
 asmlinkage long xtensa_shmat(int, char __user *, int);
 asmlinkage long xtensa_fadvise64_64(int, int,
 				    unsigned long long, unsigned long long);
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 138469e26560..be897803834a 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -1876,8 +1876,7 @@ ENDPROC(fast_store_prohibited)
 
 ENTRY(system_call)
 
-	/* reserve 4 bytes on stack for function parameter */
-	abi_entry(4)
+	abi_entry_default
 
 	/* regs->syscall = regs->areg[2] */
 
@@ -1915,9 +1914,6 @@ ENTRY(system_call)
 	l32i	a10, a2, PT_AREG8
 	l32i	a11, a2, PT_AREG9
 
-	/* Pass one additional argument to the syscall: pt_regs (on stack) */
-	s32i	a2, a1, 0
-
 	callx4	a4
 
 1:	/* regs->areg[2] = return_value */
@@ -1925,12 +1921,12 @@ ENTRY(system_call)
 	s32i	a6, a2, PT_AREG2
 	bnez	a3, 1f
 .Lsyscall_exit:
-	abi_ret(4)
+	abi_ret_default
 
 1:
 	mov	a6, a2
 	call4	do_syscall_trace_leave
-	abi_ret(4)
+	abi_ret_default
 
 ENDPROC(system_call)
 
diff --git a/arch/xtensa/kernel/signal.c b/arch/xtensa/kernel/signal.c
index dae83cddd6ca..76cee341507b 100644
--- a/arch/xtensa/kernel/signal.c
+++ b/arch/xtensa/kernel/signal.c
@@ -236,9 +236,9 @@ restore_sigcontext(struct pt_regs *regs, struct rt_sigframe __user *frame)
  * Do a signal return; undo the signal stack.
  */
 
-asmlinkage long xtensa_rt_sigreturn(long a0, long a1, long a2, long a3,
-				    long a4, long a5, struct pt_regs *regs)
+asmlinkage long xtensa_rt_sigreturn(void)
 {
+	struct pt_regs *regs = current_pt_regs();
 	struct rt_sigframe __user *frame;
 	sigset_t set;
 	int ret;
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
