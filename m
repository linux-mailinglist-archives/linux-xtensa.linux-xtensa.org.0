Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7DCF9D5A
	for <lists+linux-xtensa@lfdr.de>; Tue, 12 Nov 2019 23:45:17 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2912C6539;
	Tue, 12 Nov 2019 22:36:57 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 036396529
 for <linux-xtensa@linux-xtensa.org>; Tue, 12 Nov 2019 22:36:56 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 139so299297ljf.1
 for <linux-xtensa@linux-xtensa.org>; Tue, 12 Nov 2019 14:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqdCzBL4fzIXodZM8rkfZwLaj0b1Yk/Q6aPJ7Os6kwc=;
 b=P/1fMe+wWJX6jbZLLBGY43qw5To0b0bMXsmhg4Xzi7df/LmWiEtUG+9FZJBIKjgq77
 jGsBMRPolKqk+zUbDMcWiKiGsB/TMmUncwm8yq9/OD1frdeqR6jsN+CTw/68ahtqlOK5
 EpMoXR+iQhtsyjDCmkz31fNJ6Qm6/S9Vr23Hx+WRxcZiIjLj2oJCG1uac83V9UbZBqt6
 rd9lteccBEdsmaKpBby6jWo3CAI0Xgfx9AbBKtGlWr+hUmE/6ha3+FT/Gw7YqEpLXOL8
 piF2PbrZS2lZTF1UjPa/z3ukWhK71JU2BsBlbp2UE/33GkUw7z8HPF71PiZuDMTz3aB3
 kgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqdCzBL4fzIXodZM8rkfZwLaj0b1Yk/Q6aPJ7Os6kwc=;
 b=FeYqBXeeRgVi23YZGxnymGjDo7ZY5LujU6K06znkICWAZE7YrHKqpGAP2bOZj6/OMG
 UMRBqoYTSfiDUpz6rQOKERdGekm5txdh0aDFV6hBfYTs7h37zWbgNFDqGrabfI7ICO5n
 F/z/lSppofedOGdioi+UdrRPZ1LLdCKLIdhrkr/x1OQZGlFCtGOo9NL09RlzCZ0O+xZi
 Bd5J7FAYLxxMLbSBHZCnvec53oBh4XWGhe8DM4cPWBXNc8hb4NcvX0k91QO3vUBQcX85
 Y6f4WLG+Yx6bVS9+Cl7aIuUdoZ6spyUoGuUpYLVWKKJxqlSVsnt7WGo/zJ8Q8hFSK+06
 Z2Qw==
X-Gm-Message-State: APjAAAX49OOzsy5yeGQ+9uTuddKGS38HunrH31KAudEFqhGCrfLiL4d0
 GGDy7MDsnVeWMID/YryicmWuwiaY
X-Google-Smtp-Source: APXvYqz+T2TMWjJnUBOSvqZJioA+3O5QAvhm3vOu3bzPdA6fARtUGFlh1R1OJY3Lyl+yQ1eNyLuJXw==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr127776ljg.154.1573598714419; 
 Tue, 12 Nov 2019 14:45:14 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x16sm38677ljd.69.2019.11.12.14.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 14:45:13 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 12 Nov 2019 14:44:42 -0800
Message-Id: <20191112224443.12267-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191112224443.12267-1-jcmvbkbc@gmail.com>
References: <20191112224443.12267-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Joe Perches <joe@perches.com>
Subject: [Linux-Xtensa] [PATCH v3 1/2] xtensa: improve stack dumping
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

Calculate printable stack size and use print_hex_dump instead of
opencoding it.
Drop extra newline output in show_trace as its output format does not
depend on CONFIG_KALLSYMS.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2->v3:
- split Kconfig change into separate patch
- use symbolic names instead of hardcoded numbers

Changes v1->v2:
- use print_hex_dump.

 arch/xtensa/kernel/traps.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/xtensa/kernel/traps.c b/arch/xtensa/kernel/traps.c
index 4a6c495ce9b6..be26ec6c0e0e 100644
--- a/arch/xtensa/kernel/traps.c
+++ b/arch/xtensa/kernel/traps.c
@@ -491,32 +491,27 @@ void show_trace(struct task_struct *task, unsigned long *sp)
 
 	pr_info("Call Trace:\n");
 	walk_stackframe(sp, show_trace_cb, NULL);
-#ifndef CONFIG_KALLSYMS
-	pr_cont("\n");
-#endif
 }
 
-static int kstack_depth_to_print = 24;
+#define STACK_DUMP_ENTRY_SIZE 4
+#define STACK_DUMP_LINE_SIZE 32
+static size_t kstack_depth_to_print = 24;
 
 void show_stack(struct task_struct *task, unsigned long *sp)
 {
-	int i = 0;
-	unsigned long *stack;
+	size_t len;
 
 	if (!sp)
 		sp = stack_pointer(task);
-	stack = sp;
 
-	pr_info("Stack:\n");
+	len = min((-(size_t)sp) & (THREAD_SIZE - STACK_DUMP_ENTRY_SIZE),
+		  kstack_depth_to_print * STACK_DUMP_ENTRY_SIZE);
 
-	for (i = 0; i < kstack_depth_to_print; i++) {
-		if (kstack_end(sp))
-			break;
-		pr_cont(" %08lx", *sp++);
-		if (i % 8 == 7)
-			pr_cont("\n");
-	}
-	show_trace(task, stack);
+	pr_info("Stack:\n");
+	print_hex_dump(KERN_INFO, " ", DUMP_PREFIX_NONE,
+		       STACK_DUMP_LINE_SIZE, STACK_DUMP_ENTRY_SIZE,
+		       sp, len, false);
+	show_trace(task, sp);
 }
 
 DEFINE_SPINLOCK(die_lock);
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
