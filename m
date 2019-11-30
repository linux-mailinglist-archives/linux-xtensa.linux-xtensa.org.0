Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5750110DC48
	for <lists+linux-xtensa@lfdr.de>; Sat, 30 Nov 2019 04:45:16 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2E09B6589;
	Sat, 30 Nov 2019 03:36:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 22A186579
 for <linux-xtensa@linux-xtensa.org>; Sat, 30 Nov 2019 03:36:23 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b20so23940801lfp.4
 for <linux-xtensa@linux-xtensa.org>; Fri, 29 Nov 2019 19:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4AQRc5UpE71EIlhTuNk73TpGDdUifUHEZcrpF9LUyMs=;
 b=gp2DIxs2B6r1XVG2OVMvXMhUdRKiGU/k/vnAMpd7q9Xd45k/x9/1q2E+kV7SR4/PTj
 PMlasq8YHQK1EU3p1XsG3314D3aX3YiZeMF8vhdaK9waJ80gBToy1XTEcbSKFytma4/u
 NGVbocffg4xdFBb2NJJbkKRNM8oPZeqNzdjLCdAqzePb0iOT2AtnKwjGiUFlKmzSxqWa
 j11vQ1ngkm8xFwynNsdHBbbmPOlVEDgpR1Z95bcrUbwhrh0b/LhB/i6HI84YC9jHr2sl
 X7aOwKX9eiSNekOawLm5EqADpRmCgKKaljdbCFmk2hOiuwdWp/E/gWzUdEzon8o3D3CW
 VJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4AQRc5UpE71EIlhTuNk73TpGDdUifUHEZcrpF9LUyMs=;
 b=REiFXag0r6HAOWyvjiX0+aqfsbM7bPKmOfAJNRPJHD4Zp1g6sYwwuAPShuFoXhf9mP
 yiF5HiP35hnVMgljelbab/ALjii+jmeB5gSzeIJp+gawu5tcqNnTTdWj6whyoJMYsjgn
 C2QFQRDJExTBg68knD9w9P/4JP45nuzLxp0sCntcw8+DrKtnBzxval6PrVbQAJHIc4xP
 3Y+m9yGWxiY8HM6c1F5oNFuXmkijT9L2c7SqClfC5bN/OwZ4opN5XDg7B+Ce0BQ5NqcF
 bjY8JRrLQwr+ofeNBELbEnlF6lZCPXYGpOdBaguKIgb8T1y1xBUL8ck7Tha5SpiYatdn
 OmAA==
X-Gm-Message-State: APjAAAWBVbzAcqVyO160dbGWMoOUpssMeSPGKSlejPt7O3VZcMuYXMvt
 LKaoK2ycSb93FikyY94ZVuUeF+PbVsY=
X-Google-Smtp-Source: APXvYqzqK/VabnaQ2LI8juvjQyFqkNf5B4Zj5dG09jItt1ohm9E9Th0RM6tQmpRyNQWk4yENJDqivQ==
X-Received: by 2002:ac2:4c31:: with SMTP id u17mr1889468lfq.57.1575085513595; 
 Fri, 29 Nov 2019 19:45:13 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id z9sm2920528ljm.40.2019.11.29.19.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 19:45:12 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 29 Nov 2019 19:44:49 -0800
Message-Id: <20191130034450.25507-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130034450.25507-1-jcmvbkbc@gmail.com>
References: <20191130034450.25507-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/3] xtensa: fix system_call interaction with
	ptrace
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

Don't overwrite return value if system call was cancelled at entry by
ptrace. Return status code from do_syscall_trace_enter so that
pt_regs::syscall doesn't need to be changed to skip syscall.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/entry.S  |  4 ++--
 arch/xtensa/kernel/ptrace.c | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 59af494d9940..138469e26560 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -1892,6 +1892,7 @@ ENTRY(system_call)
 
 	mov	a6, a2
 	call4	do_syscall_trace_enter
+	beqz	a6, .Lsyscall_exit
 	l32i	a7, a2, PT_SYSCALL
 
 1:
@@ -1904,8 +1905,6 @@ ENTRY(system_call)
 
 	addx4	a4, a7, a4
 	l32i	a4, a4, 0
-	movi	a5, sys_ni_syscall;
-	beq	a4, a5, 1f
 
 	/* Load args: arg0 - arg5 are passed via regs. */
 
@@ -1925,6 +1924,7 @@ ENTRY(system_call)
 
 	s32i	a6, a2, PT_AREG2
 	bnez	a3, 1f
+.Lsyscall_exit:
 	abi_ret(4)
 
 1:
diff --git a/arch/xtensa/kernel/ptrace.c b/arch/xtensa/kernel/ptrace.c
index b964f0b2d886..145742d70a9f 100644
--- a/arch/xtensa/kernel/ptrace.c
+++ b/arch/xtensa/kernel/ptrace.c
@@ -542,14 +542,28 @@ long arch_ptrace(struct task_struct *child, long request,
 	return ret;
 }
 
-void do_syscall_trace_enter(struct pt_regs *regs)
+void do_syscall_trace_leave(struct pt_regs *regs);
+int do_syscall_trace_enter(struct pt_regs *regs)
 {
+	if (regs->syscall == NO_SYSCALL)
+		regs->areg[2] = -ENOSYS;
+
 	if (test_thread_flag(TIF_SYSCALL_TRACE) &&
-	    tracehook_report_syscall_entry(regs))
+	    tracehook_report_syscall_entry(regs)) {
+		regs->areg[2] = -ENOSYS;
 		regs->syscall = NO_SYSCALL;
+		return 0;
+	}
+
+	if (regs->syscall == NO_SYSCALL) {
+		do_syscall_trace_leave(regs);
+		return 0;
+	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, syscall_get_nr(current, regs));
+
+	return 1;
 }
 
 void do_syscall_trace_leave(struct pt_regs *regs)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
