Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7ED2AFA00
	for <lists+linux-xtensa@lfdr.de>; Wed, 11 Nov 2020 21:47:36 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 1842664C4;
	Wed, 11 Nov 2020 20:27:11 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 13FA864C1
 for <linux-xtensa@linux-xtensa.org>; Wed, 11 Nov 2020 20:27:10 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 11so3629266ljf.2
 for <linux-xtensa@linux-xtensa.org>; Wed, 11 Nov 2020 12:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kqXzWPcn/O/4CLOVfdqt2sWTguSFm5QeKMfYExO6Es0=;
 b=GECEhQ1mi8lg9CRGuy+xJpcNXzJmDeYnBwiiuNZcN/mWFilVjdYlB4F6LhtZH6pmJH
 1HnZyC2Z38vrnyUbjp3jPnWI0nniDsCjZdFRR9ifF2M56scO9VW29NOZhvo6lecArxYI
 /80OM61hLATiEA267w/X7ja34tNhn/NKroYZw2b8SzT9MEsMUzWWQb/YmlnbHGIh+VSZ
 eyebZ+6STGqx4mNKzix1cFBKfMaTZEga7XIVgGCI4mhU6XirWI8lupsdgD1ZmAnHAdPW
 my9XLIlpspU+61ocMhnKv/s9TD4vRUqbWeYTG0gqqe+1rIgTP0u6qQGUTo2LD73oOE3i
 MozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kqXzWPcn/O/4CLOVfdqt2sWTguSFm5QeKMfYExO6Es0=;
 b=EtuFqSCz4JWmGVh9c79KaOOcNo2apeW2HbYkQ5Q9CFpLMyEsuaErXZJ7pEOh1M9FjT
 e686VVHao0xV4D7SN27CU3liP4j89Ng7bQggkfsXKQEgoHOtSWBldQe7XVX3yAeOCk2t
 hbcz8z24tpxuaQAgBqvvdwlqu9mjXwuhvSaOch+7MJRksKWxw5UamoIABMNZnqwKmNcm
 7mBSQQJReAyiARSuTsSzustsdEaAn8J1Z8GiftGfiN9uVWxEF3NPw2D2OvajFIYDTBcH
 aRwCS5q19ujMq1/BgtVanSgwNuz698G8A+tBkOZXpkOeJyUeOwkWS44CSNkMh/2yCZge
 a0qQ==
X-Gm-Message-State: AOAM533PA5dg5Ezzy2WpFSLtWBrZ3J6py0U/nyiZNVUAF7fzwUD8Hn1V
 DAL8vAGOyiIo9J7Gs1RNua0uFuYROzIz8g==
X-Google-Smtp-Source: ABdhPJwqT2b3RDMdIpLUc62Fp4ganTpJzm6XRy/RIgwv2RAwlcc7NslxV3tIBd3qngHgRaGEn9nR2g==
X-Received: by 2002:a2e:8845:: with SMTP id z5mr10793727ljj.281.1605127651376; 
 Wed, 11 Nov 2020 12:47:31 -0800 (PST)
Received: from octofox.metropolis ([5.19.183.212])
 by smtp.gmail.com with ESMTPSA id f1sm330971ljp.65.2020.11.11.12.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 12:47:30 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Wed, 11 Nov 2020 12:47:23 -0800
Message-Id: <20201111204723.21634-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix broken TIF_NOTIFY_SIGNAL assembly
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
index 7f733f40fef0..a367c464217d 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -500,9 +500,8 @@ common_exception_return:
 	 */
 
 	_bbsi.l	a4, TIF_NEED_RESCHED, 3f
-	_bbsi.l	a4, TIF_NOTIFY_RESUME, 2f
-	_bbci.l	a4, TIF_SIGPENDING, 5f
-	_bbci.l	a4, TIF_NOTIFY_SIGNAL, 5f
+	movi	a2, _TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL
+	bnone	a2, a4, 5f
 
 2:	l32i	a4, a1, PT_DEPC
 	bgeui	a4, VALID_DOUBLE_EXCEPTION_ADDRESS, 4f
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
