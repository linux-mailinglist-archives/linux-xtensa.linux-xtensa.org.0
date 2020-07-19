Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 51350224EA6
	for <lists+linux-xtensa@lfdr.de>; Sun, 19 Jul 2020 04:17:07 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7EC8E6494;
	Sun, 19 Jul 2020 02:00:49 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by linux-xtensa.org (Postfix) with ESMTPS id EDF1E6472
 for <linux-xtensa@linux-xtensa.org>; Sun, 19 Jul 2020 02:00:46 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j20so7306559pfe.5
 for <linux-xtensa@linux-xtensa.org>; Sat, 18 Jul 2020 19:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kl14Oyojnz7qNzdRV9kI+oI9qkQq4W7peOgG+/MweoU=;
 b=S0w/Q3abVzMaa0Pd0coBL4i43B8ZKc9v9Yen8P4muuNJs1guw3MlR5AoFEWgL7DKe4
 xo8SGd9JNLlv5siZ13SDqNooEUp2Zwrb4InjZmNlUWu2IMuUEy8lJnPo2NGskEoY11pp
 7nZiKEJ2jLrsSrtZ1X4G4fwMYEW5IVF3WDWQVA47Nl2D7D4mm7OrMySqtSraOUkIC3Ow
 KBNllHlDpR6zZ+8FP1zOKCDi2rAXfF/G9K2R5E8QVAGWWXq0a0g62wLeykkeZAtO+z0K
 wYpVTSv9Uwd+PDuhYi+RCpGJd/z7gpUB8yYxEJDKrXTL1o2Sl5UmL8UU/roe6+fHw/c9
 EWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kl14Oyojnz7qNzdRV9kI+oI9qkQq4W7peOgG+/MweoU=;
 b=GDbekp+SYbfLYfNAcu1mBaxLN6TtgkYRAUvvheDH0jM2Tfha8M7dPN8n5BqFkszcik
 B3YPYV997v5DsfcOcQYb2IxIL6aSsI5GPpiyAdcSzedUJiWESlFOVK3w00x/VdzerWwZ
 XuuR+QrQqFzGKSLiuq56aDFC628lU9sepxUPG5y8swQiir3DJFgvYclfjeUxoDz2J//3
 U88KMGifz8eVC66orjw9cpTfmyrwTUd2Q9/bvAhVEWHvIi948Wg908kcwzioQNaTvNFK
 sdwwuvJDaA7vSYTi/hUAd0EnMPUc6hdFLSc7hc20AnjzCp/ZV8TPo8b0piedOalNWNCz
 0G1A==
X-Gm-Message-State: AOAM532jOcK/L/71qodSRpje66YbP8+PTqtDbBk+u0segbPwZYTLu0Ua
 nYfY2NhQaxGH//YE1U10o9R3Sy1B
X-Google-Smtp-Source: ABdhPJzTUABuF2Vzp+Y9Usd6Hjkm7rZDYp+mvf/3yQZOoG7CAfvk2coMFaxyRLh2S+YAc0Z4L3XduQ==
X-Received: by 2002:a62:834c:: with SMTP id h73mr14490407pfe.221.1595125023447; 
 Sat, 18 Jul 2020 19:17:03 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id a68sm6891159pje.35.2020.07.18.19.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:17:03 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat, 18 Jul 2020 19:16:54 -0700
Message-Id: <20200719021654.25922-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200719021654.25922-1-jcmvbkbc@gmail.com>
References: <20200719021654.25922-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH 3/3] selftests/seccomp: add xtensa support
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

Xtensa returns syscall number can be obtained and changed through the
struct user_pt_regs. Syscall return value register is fixed relatively
to the current register window in the user_pt_regs, so it needs a bit of
special treatment.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 252140a52553..1b445c2e7fbe 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -122,6 +122,8 @@ struct seccomp_data {
 #  define __NR_seccomp 358
 # elif defined(__s390__)
 #  define __NR_seccomp 348
+# elif defined(__xtensa__)
+#  define __NR_seccomp 337
 # else
 #  warning "seccomp syscall number unknown for this architecture"
 #  define __NR_seccomp 0xffff
@@ -1622,6 +1624,14 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define SYSCALL_SYSCALL_NUM regs[4]
 # define SYSCALL_RET	regs[2]
 # define SYSCALL_NUM_RET_SHARE_REG
+#elif defined(__xtensa__)
+# define ARCH_REGS	struct user_pt_regs
+# define SYSCALL_NUM	syscall
+/*
+ * On xtensa syscall return value is in the register
+ * a2 of the current window which is not fixed.
+ */
+#define SYSCALL_RET(reg) a[(reg).windowbase * 4 + 2]
 #else
 # error "Do not know how to find your architecture's registers and syscalls"
 #endif
@@ -1693,7 +1703,8 @@ void change_syscall(struct __test_metadata *_metadata,
 	EXPECT_EQ(0, ret) {}
 
 #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
-	defined(__s390__) || defined(__hppa__) || defined(__riscv)
+	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
+	defined(__xtensa__)
 	{
 		regs.SYSCALL_NUM = syscall;
 	}
@@ -1736,6 +1747,9 @@ void change_syscall(struct __test_metadata *_metadata,
 	if (syscall == -1)
 #ifdef SYSCALL_NUM_RET_SHARE_REG
 		TH_LOG("Can't modify syscall return on this architecture");
+
+#elif defined(__xtensa__)
+		regs.SYSCALL_RET(regs) = result;
 #else
 		regs.SYSCALL_RET = result;
 #endif
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
