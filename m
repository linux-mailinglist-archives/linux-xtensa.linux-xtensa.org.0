Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 67C22F3D04
	for <lists+linux-xtensa@lfdr.de>; Fri,  8 Nov 2019 01:45:04 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 505CA6553;
	Fri,  8 Nov 2019 00:36:52 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 991906551
 for <linux-xtensa@linux-xtensa.org>; Fri,  8 Nov 2019 00:36:50 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id z12so3046171lfj.9
 for <linux-xtensa@linux-xtensa.org>; Thu, 07 Nov 2019 16:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SncMCZY11gPJIfKbfsmrvxmuN/67o00wSU4yUgQ2zL0=;
 b=JG+3TGFrcv/9M9GIXFwmuqadILvxRaOJD6hZNFXM928X+RZ2USWGkQ1+IuQWVZ/NMK
 ZtJo2s+KTeIF3ceufpu/jBJzuz/WxGSbfnss4XgB+ne5tX73CYGixbfD6KrymjvndVkE
 JHQ8+4jmZA81gPeoTmM61ZEQIZ5dwHFQ3W6Nrjl6bxU7KxkA54JtN0tHzz6jx1kXvsD7
 JQMRWR+qlCJyR7aOroxmXMaMZzfw+GRo10VTJPgRmNk5acjYCYT+NzPYorkCFbaa+nVm
 FMLdBRKPu4JE02giveSEKuwW0owEIaumTYmRfU0C00ZIJ1VvWv7vp/UV9hefbUcpWcNE
 FB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SncMCZY11gPJIfKbfsmrvxmuN/67o00wSU4yUgQ2zL0=;
 b=c1EW3+dnAycwHLZQMC5FKGkIfRahnhb6n4fvRQbC/6DycDuNCmmkDOQS1njeXKsaRV
 rCrlQlpdsUeP7RAmACVnS2qpAqGvMakI7ObOapDxRpqBFco8iSVwgDmN/fyZKPnXf0S9
 axpQmqEu/PNosBgR0LhzDSQ6JvDBAW1YcAzddHHLIL20FActSULqbfNiqnE76PjN6k8d
 b6LywU3BPB7AxT/fh4JsjlkOt8H5qKrC0s7WmLbAPK6Yv76rVK8vA4DIaXMSa4KjiRBW
 JUDOkaTLEvvjvFTJWMVBhSZk1Oy4RylBklYTkMiJlAs1ZDmvGwWQIEA47Mwifuv8RJ/w
 bHkg==
X-Gm-Message-State: APjAAAW0Tdx8zIT+DSFZpRbDbSHl7T5zqGItgIjrUIVQ88rombd6aVAt
 bg9y9ULYGOmwtbyJ0lWgC9Ghn4fk
X-Google-Smtp-Source: APXvYqwM1abusWEJ9GBD5a7TrzO7cvXBlvs/lyTxJwFfjI971RgSgp9eXL8yJ0PQ6mYK4iAlrdWITA==
X-Received: by 2002:a19:fc1e:: with SMTP id a30mr4467814lfi.167.1573173899613; 
 Thu, 07 Nov 2019 16:44:59 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id y6sm2029544ljn.40.2019.11.07.16.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 16:44:58 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Thu,  7 Nov 2019 16:44:48 -0800
Message-Id: <20191108004448.5386-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Joe Perches <joe@perches.com>
Subject: [Linux-Xtensa] [PATCH v2] xtensa: improve stack dumping
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
Make size of stack dump configurable.
Drop extra newline output in show_trace as its output format does not
depend on CONFIG_KALLSYMS.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- use print_hex_dump.

 arch/xtensa/Kconfig.debug  |  7 +++++++
 arch/xtensa/kernel/traps.c | 24 ++++++++----------------
 2 files changed, 15 insertions(+), 16 deletions(-)

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
index 4a6c495ce9b6..fe090ab1cab8 100644
--- a/arch/xtensa/kernel/traps.c
+++ b/arch/xtensa/kernel/traps.c
@@ -491,32 +491,24 @@ void show_trace(struct task_struct *task, unsigned long *sp)
 
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
-	int i = 0;
-	unsigned long *stack;
+	size_t len;
 
 	if (!sp)
 		sp = stack_pointer(task);
-	stack = sp;
 
-	pr_info("Stack:\n");
+	len = min((-(unsigned long)sp) & (THREAD_SIZE - 4),
+		  kstack_depth_to_print * 4ul);
 
-	for (i = 0; i < kstack_depth_to_print; i++) {
-		if (kstack_end(sp))
-			break;
-		pr_cont(" %08lx", *sp++);
-		if (i % 8 == 7)
-			pr_cont("\n");
-	}
-	show_trace(task, stack);
+	pr_info("Stack:\n");
+	print_hex_dump(KERN_INFO, " ", DUMP_PREFIX_NONE, 32, 4,
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
