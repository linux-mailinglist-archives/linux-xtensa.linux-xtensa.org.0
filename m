Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0842AFA0E
	for <lists+linux-xtensa@lfdr.de>; Wed, 11 Nov 2020 21:54:00 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id A818164C6;
	Wed, 11 Nov 2020 20:33:35 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id AC20F64C2
 for <linux-xtensa@linux-xtensa.org>; Wed, 11 Nov 2020 20:33:34 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id j205so5101116lfj.6
 for <linux-xtensa@linux-xtensa.org>; Wed, 11 Nov 2020 12:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yNPB2jlKFvbSRV6c6XL32c51PGoINUdAsOUeABtQLYU=;
 b=j36qxogbv4rKYU+qQ7B3RtrEPZmO7bO/cAnuJgeFFGRp0zL/tzacpUKbHUfmOHq5qB
 evZCzvdnBnPAbjNM7xgwttjVSu664a7dPe5TJ5VI1fuSUH2JiPfuqtriIStxpvD1l11T
 /eEA898f1v1YtttWCQmb5Ge79bs+MH3HIUyAnOgUv7/0TpYz3q8GoJXxv+1vfUpxE3OS
 lKQFT4OzukreB12ElUoDTFQlUTSA5KzrlOHJt2XjKoJ7Zg/CxsC8qwqVa/wFdnoiXi6w
 XIzdWuI3dJOOZYRlu9p0KEnZUQRPjPrBjUxz/bwFDc7KJjDwp6eKJ/IWwruIWMY7ctzf
 FL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yNPB2jlKFvbSRV6c6XL32c51PGoINUdAsOUeABtQLYU=;
 b=IKVn8wB2pmEJeWeu9EufS2I65bO6eI0+KP4WpV0AbHOwvCAfbRhujZNj6YEcNgLZqX
 g/qAo5+yrSV6+XwuUluZ77eiGV+9MzwEoG8268GZYLpvNPJ7tVdGy251ajr92ciVassq
 1RuXZQOALbeivcydNMte/cLH9Jy15sOcg/SWjw4LcCQwxYAo8AYQJq1wC34usjUVAWTJ
 Gx0rkF+UrIKxboCkdBXvTthK5kyXmlflvat2RRyk5J55RWktGOvopCLVU3amq0auZLHF
 HWrwmYUYipvjRxHTNR1J+ngDmjbB8BSX+hGLiXFX803vS/iCAGGZKm4bGOG2M/ybSBzN
 6vpw==
X-Gm-Message-State: AOAM530FelcSWwf2UZs+A0iOtfW/nIlZLgmUgO4G4FD/J2PUeMCHWyW9
 RYdx6D3dumkIrkiCaeBbuUHPpryhY7+P3Q==
X-Google-Smtp-Source: ABdhPJzCo5sUp8St6IlY2ddwi9lEZX/ozXN8Ulor0n283l+kkysMgfoIagpqOQzT9oUsy+auBehyKA==
X-Received: by 2002:a19:615:: with SMTP id 21mr8938864lfg.99.1605128036069;
 Wed, 11 Nov 2020 12:53:56 -0800 (PST)
Received: from octofox.metropolis ([5.19.183.212])
 by smtp.gmail.com with ESMTPSA id x6sm325457lfn.185.2020.11.11.12.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 12:53:55 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Wed, 11 Nov 2020 12:53:49 -0800
Message-Id: <20201111205349.24815-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2] xtensa: fix broken TIF_NOTIFY_SIGNAL
	assembly
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

TIF_NOTIFY_SIGNAL handling in xtensa assembly is implemented
incorrectly: there should be a call to do_notify_resume when either
TIF_SIGPENDING, TIF_NOTIFY_RESUME or TIF_NOTIFY_SIGNAL bit is set in the
thread_info::flags. The straightforward way to do it would be

    _bbsi.l a4, TIF_NEED_RESCHED, 3f
    _bbsi.l a4, TIF_NOTIFY_RESUME, 2f
    _bbsi.l a4, TIF_NOTIFY_SIGNAL, 2f
    _bbci.l a4, TIF_SIGPENDING, 5f

Optimize it a little bit and use bit mask and bnone opcode to skip
do_notify_resume invocation. Shuffle _TIF_* flags a bit so that used bit
mask fits into the immediate field of movi opcode.

Fixes: 4c6a9dcd4d13 ("xtensa: add support for TIF_NOTIFY_SIGNAL")
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- use more canonical order of bnone arguments: tested value first,
  bit mask second.

 arch/xtensa/include/asm/thread_info.h | 7 ++++---
 arch/xtensa/kernel/entry.S            | 5 ++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/xtensa/include/asm/thread_info.h b/arch/xtensa/include/asm/thread_info.h
index 6ea521b8e2ec..a312333a9add 100644
--- a/arch/xtensa/include/asm/thread_info.h
+++ b/arch/xtensa/include/asm/thread_info.h
@@ -111,22 +111,23 @@ static inline struct thread_info *current_thread_info(void)
 #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
 #define TIF_SINGLESTEP		3	/* restore singlestep on return to user mode */
 #define TIF_SYSCALL_TRACEPOINT	4	/* syscall tracepoint instrumentation */
-#define TIF_MEMDIE		5	/* is terminating due to OOM killer */
+#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_RESTORE_SIGMASK	6	/* restore signal mask in do_signal() */
 #define TIF_NOTIFY_RESUME	7	/* callback before returning to user */
 #define TIF_DB_DISABLED		8	/* debug trap disabled for syscall */
 #define TIF_SYSCALL_AUDIT	9	/* syscall auditing active */
 #define TIF_SECCOMP		10	/* secure computing */
-#define TIF_NOTIFY_SIGNAL	11	/* signal notifications exist */
+#define TIF_MEMDIE		11	/* is terminating due to OOM killer */
 
 #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
 #define _TIF_SINGLESTEP		(1<<TIF_SINGLESTEP)
 #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
+#define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
 #define _TIF_SECCOMP		(1<<TIF_SECCOMP)
-#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 
 #define _TIF_WORK_MASK		(_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP | \
 				 _TIF_SYSCALL_TRACEPOINT | \
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 7f733f40fef0..647b162f959b 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -500,9 +500,8 @@ common_exception_return:
 	 */
 
 	_bbsi.l	a4, TIF_NEED_RESCHED, 3f
-	_bbsi.l	a4, TIF_NOTIFY_RESUME, 2f
-	_bbci.l	a4, TIF_SIGPENDING, 5f
-	_bbci.l	a4, TIF_NOTIFY_SIGNAL, 5f
+	movi	a2, _TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL
+	bnone	a4, a2, 5f
 
 2:	l32i	a4, a1, PT_DEPC
 	bgeui	a4, VALID_DOUBLE_EXCEPTION_ADDRESS, 4f
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
