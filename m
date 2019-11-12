Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 638B8F9D5B
	for <lists+linux-xtensa@lfdr.de>; Tue, 12 Nov 2019 23:45:20 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 398AF6546;
	Tue, 12 Nov 2019 22:37:00 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id D577E6529
 for <linux-xtensa@linux-xtensa.org>; Tue, 12 Nov 2019 22:36:58 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q2so268541ljg.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 12 Nov 2019 14:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dlzc9ZW2QK+Bf04vZsdeB35W1UEikvkDQZdvHiTdHiw=;
 b=fSEHMQ2152EQPx9pY74DdNe3R/DLJhrZrzSt/FcS5QA0aJOwx5p1V2R4kQhGRZ7r+o
 wru3mBbU5BmpXiTjx42QZ9jghV+5sNbfS8baupjOQZ6n25v64Xoo2M+tyzmIPFxZ1dcv
 UGJNRwL+fDOYGUdcvBSiagvT9vYup23aTtnzkcy1uV6qlNrZKUah99IvMOSzx2JAnJWm
 FLW27/ZAa4pjhlb/vIHR+jrqWUrBSTaXbdJUSf2BZK/hYOYf86gPFhVD2EBFVr1JX4nJ
 wzhlzta7m/H0u6+hiZeqBUTnD3aBROdtxrhjL4+mEhpOOUzKvs53XjslZxR/Ns29QnHJ
 QG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dlzc9ZW2QK+Bf04vZsdeB35W1UEikvkDQZdvHiTdHiw=;
 b=LquXIz2vmoPPUqw5rqnhZ99qhIKvq8K+i12/EsgmoabXX9SaDraGzIVvWzi39f3l8J
 olHidz31yJQUbprQHE1tcwuwmyyMdIs8cScEobO0A46Xk9n27EfigqfZNcKHBguv1d7+
 ZN2HykQHd40NiESSnfihSUMlOB0Yqn7GRmyouF+B3N2jvKw7Q4zG0qdVg4k421V5Jthj
 5mEfOvtNK/Pborn608gTF/Hof43TMLqY+LlGDrKUyld8pw5lV5YGAP4cZw9fyqp6zbfp
 p6fnlKY4o1pl2s3YSNMAcX8w9ZgGYJCAEmL25x3e4jCsxVAICNWW8+LH9AjiEVF1VkHN
 pKHA==
X-Gm-Message-State: APjAAAWvOFUfJ9kGsvvjWRrJebUP2IUXXSrgF7ZAKxBJNOuwGZpYM1s6
 YdcFDZw4QDTW6BLTneJ63GrCX0XH
X-Google-Smtp-Source: APXvYqyKR8f+A1blypWPTt6vPOpdDDjtrTZpb+CWB3Fb3V0DJ5Jo0xdGXqfKLevZ7X/JP0euhNYAuQ==
X-Received: by 2002:a05:651c:1117:: with SMTP id
 d23mr139959ljo.90.1573598717383; 
 Tue, 12 Nov 2019 14:45:17 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x16sm38677ljd.69.2019.11.12.14.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 14:45:16 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 12 Nov 2019 14:44:43 -0800
Message-Id: <20191112224443.12267-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191112224443.12267-1-jcmvbkbc@gmail.com>
References: <20191112224443.12267-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Joe Perches <joe@perches.com>
Subject: [Linux-Xtensa] [PATCH v3 2/2] xtensa: make stack dump size
	configurable
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

Introduce Kconfig symbol PRINT_STACK_DEPTH and use it to initialize
kstack_depth_to_print.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2->v3:
- split Kconfig change into separate patch

 arch/xtensa/Kconfig.debug  | 7 +++++++
 arch/xtensa/kernel/traps.c | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

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
index be26ec6c0e0e..87bd68dd7687 100644
--- a/arch/xtensa/kernel/traps.c
+++ b/arch/xtensa/kernel/traps.c
@@ -495,7 +495,7 @@ void show_trace(struct task_struct *task, unsigned long *sp)
 
 #define STACK_DUMP_ENTRY_SIZE 4
 #define STACK_DUMP_LINE_SIZE 32
-static size_t kstack_depth_to_print = 24;
+static size_t kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
 
 void show_stack(struct task_struct *task, unsigned long *sp)
 {
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
