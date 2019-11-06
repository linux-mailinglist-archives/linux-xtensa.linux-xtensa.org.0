Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 15876F1D4E
	for <lists+linux-xtensa@lfdr.de>; Wed,  6 Nov 2019 19:16:45 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B4A5C64EE;
	Wed,  6 Nov 2019 18:08:35 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id E2F7E64EC
 for <linux-xtensa@linux-xtensa.org>; Wed,  6 Nov 2019 18:08:33 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r7so18541769ljg.2
 for <linux-xtensa@linux-xtensa.org>; Wed, 06 Nov 2019 10:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xT8iUzv28AccBALCzubNLTgJqXnu61TsgsHE/dDWhrM=;
 b=r/eQWTe/mz/PiMRmWAOPO09nJRU7KWxRCz+PhtRqScjowOS3NAMuGMfOEC+UGAD5ou
 E7DrVWBlm75uEUrk6j6kWo4bYobY/eYzZ6z9g/6Rc5rf/wezJOUyh21FUtkyY09ROYUH
 BPZ71nklPlzf1SZ5DhOws/ac3xmCbDx2luvwlKuuCC0yYY0wZNP6TOOX4KPArMKf5JnG
 t3GIeDHZGkY7iX7gx25Ppn7uKrdM3tVPO+3xovdQ8GO5rMEUtCj4NdNYAoWtHEnlHKvv
 C+hb6Hw+xLZg/WEzWms7pPYiSFL9bn+pI1Awp2VEhqZoacNlidZaAnc0QihEx/N6mNdt
 RJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xT8iUzv28AccBALCzubNLTgJqXnu61TsgsHE/dDWhrM=;
 b=T9uDoMcOaIO3ac3TMVtAVuD1ASPFe+Mc2ctBrzmrTycHv3jfJYOaD007SoGZ1mzN9b
 iVFeSDLAh/9dscOySr5Cp5UiQuF3sG+UeD6AYCyEjRbaFzAabrn4Qk4PasOeD0QYj3IZ
 AUWeSbBNfxtCVquPnkDY6Pg5rA7+CSB939gdVR7oqVuwr2bBoFb83WkOeFLPXNUoDwfm
 nznSmMKEYWppJgrznDj86p7jjvv36Rpw634LaZSmEvIuk7RvlKqvVcVyk/tpRY+CVuJK
 3OZ8IV9HLzvfkkdWYv47oWPwfEVdiaUA4vo55lJ3YK12mZiroUmf3oYYviyooX3pHV7O
 8Kog==
X-Gm-Message-State: APjAAAUJIkIpcMjMpOh9AQ74+5c9bzdAUzze8smCxrRHi9iAJafDHyTo
 76nSyNm2DAxYpC3eTC8bWqCTx407
X-Google-Smtp-Source: APXvYqxVZqs41D0CX2V7LeMkINUOFsrvTXPdCEHvmi9XfmCDf8wQacmREboXQxenEPTsuj/4vJ/DUg==
X-Received: by 2002:a2e:90b:: with SMTP id 11mr2873372ljj.233.1573064200610;
 Wed, 06 Nov 2019 10:16:40 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id l82sm11318139lfd.81.2019.11.06.10.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 10:16:40 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Wed,  6 Nov 2019 10:16:17 -0800
Message-Id: <20191106181617.1832-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: improve stack dumping
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

Collect whole stack dump lines in a buffer and print the whole buffer
when it's ready with pr_info instead of pr_cont. This makes stack dump
lines consistent in SMP case and relies less on pr_cont/printk
differences related to timestamps.
Make size of stack dump configurable.
Drop extra newline output in show_trace as its output format does not
depend on CONFIG_KALLSYMS.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig.debug  |  7 +++++++
 arch/xtensa/kernel/traps.c | 12 ++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/xtensa/Kconfig.debug b/arch/xtensa/Kconfig.debug
index 39de98e20018..83cc8d12fa0e 100644
--- a/arch/xtensa/Kconfig.debug
+++ b/arch/xtensa/Kconfig.debug
@@ -31,3 +31,10 @@ config S32C1I_SELFTEST
 	  It is easy to make wrong hardware configuration, this test should catch it early.
 
 	  Say 'N' on stable hardware.
+
+config PRINT_STACK_DEPTH
+	int "Stack depth to print" if DEBUG_KERNEL
+	default 64
+	help
+	  This option allows you to set the stack depth that the kernel
+	  prints in stack traces.
diff --git a/arch/xtensa/kernel/traps.c b/arch/xtensa/kernel/traps.c
index 4a6c495ce9b6..b0c952652c73 100644
--- a/arch/xtensa/kernel/traps.c
+++ b/arch/xtensa/kernel/traps.c
@@ -491,17 +491,15 @@ void show_trace(struct task_struct *task, unsigned long *sp)
 
 	pr_info("Call Trace:\n");
 	walk_stackframe(sp, show_trace_cb, NULL);
-#ifndef CONFIG_KALLSYMS
-	pr_cont("\n");
-#endif
 }
 
-static int kstack_depth_to_print = 24;
+static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
 
 void show_stack(struct task_struct *task, unsigned long *sp)
 {
 	int i = 0;
 	unsigned long *stack;
+	char buf[9 * 8 + 1];
 
 	if (!sp)
 		sp = stack_pointer(task);
@@ -512,10 +510,12 @@ void show_stack(struct task_struct *task, unsigned long *sp)
 	for (i = 0; i < kstack_depth_to_print; i++) {
 		if (kstack_end(sp))
 			break;
-		pr_cont(" %08lx", *sp++);
+		sprintf(buf + (i % 8) * 9, " %08lx", *sp++);
 		if (i % 8 == 7)
-			pr_cont("\n");
+			pr_info("%s\n", buf);
 	}
+	if (i % 8)
+		pr_info("%s\n", buf);
 	show_trace(task, stack);
 }
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
