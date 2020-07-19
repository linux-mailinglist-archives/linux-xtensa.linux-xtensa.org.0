Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A1680224EA3
	for <lists+linux-xtensa@lfdr.de>; Sun, 19 Jul 2020 04:17:06 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 1668C647B;
	Sun, 19 Jul 2020 02:00:48 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 32AC36472
 for <linux-xtensa@linux-xtensa.org>; Sun, 19 Jul 2020 02:00:45 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id j19so8596772pgm.11
 for <linux-xtensa@linux-xtensa.org>; Sat, 18 Jul 2020 19:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKQ+jPswJ6aZORF426luVyMBU9cUsZPqYFTvseLkrPI=;
 b=QeMfzKUCa0/I88fPw+UuWyRXoioRZxeXygfFm1O+FLeceu4YmcQaBO6Nnbkdng42vJ
 HjhFN5fnT+u6IDZIoL4SVRiQHOTmSV9OlTjL7ZwdL5Z1s7OTNNZZcUNLi4K5iwEG0Z3d
 /oJ7K8TEBUh6tLTvav+KJf9l/NQ6e5YV6JlHUgvgVqNWPpldvpISXt5+nCRRkIV1uU7J
 M+DCZLXvgIcDIZCKuaXNVfJxI0uN8E4JQ1vkNPp9VvXHxSVwtmPPKJzAS5GYPWNtvpWf
 VPl/aLdOftDeqryXvU4Xyhm/67mZ9GLl0mRoJZ3ErR8D+pRVZqEsnIVVTuNs5jZFgijN
 uRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKQ+jPswJ6aZORF426luVyMBU9cUsZPqYFTvseLkrPI=;
 b=nwAIdXUSdYmjD0+vSiVtX16GUiuYQUWJLXK000t1KccRg0gyFbkaW/mudiBLtCoVvm
 oDpzXCccMi0PgOvk+OiacNl/s7OYXgAthrU0Yi6/ZeBpVbfigG2V5HZ0bo7xaWIFT/bg
 8eRcLlbq33qUFqRoSQV+tPBAZtH6NpIIuX4J7RJ07PRCgSPOF7M17/KqGU9Asz/reQD7
 N/uoZUBTPUwSMZ+JnjipKtvEcnpZsoQmtPwb19K+8EI//AURFssEbyTJvh70Ff/SQXu+
 PY3bwy0GFqL/pjpe3wOHGsza/Ottcx4IujTaDaT36WVMIAHAAewLaSzViwnx8lwX/JmO
 1V6A==
X-Gm-Message-State: AOAM532f4qIqbt1Aqr97xy0F71splbUlYqO+pn0VYsLGbx2bLuMhsyjk
 scHXL5Xy36BCPQ7Q2QZdwtWY9iNT
X-Google-Smtp-Source: ABdhPJxcDyCKYGRJbb5Nov+ZCut8MmvgE/EK7YwVMfVfP0yOwvZUclmD9gj5wL+f/Lxyh4Z8Xahgng==
X-Received: by 2002:a62:7e51:: with SMTP id z78mr14046172pfc.3.1595125021805; 
 Sat, 18 Jul 2020 19:17:01 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id a68sm6891159pje.35.2020.07.18.19.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:17:01 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat, 18 Jul 2020 19:16:52 -0700
Message-Id: <20200719021654.25922-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200719021654.25922-1-jcmvbkbc@gmail.com>
References: <20200719021654.25922-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH 1/3] xtensa: expose syscall through
	user_pt_regs
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

Use one of the reserved slots in struct user_pt_regs to return syscall
number in the GPR regset. Update syscall number from the GPR regset only
when it's non-zero.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/uapi/asm/ptrace.h | 3 ++-
 arch/xtensa/kernel/ptrace.c           | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/include/uapi/asm/ptrace.h b/arch/xtensa/include/uapi/asm/ptrace.h
index 2ec0f9100a06..50db3e0a6341 100644
--- a/arch/xtensa/include/uapi/asm/ptrace.h
+++ b/arch/xtensa/include/uapi/asm/ptrace.h
@@ -50,7 +50,8 @@ struct user_pt_regs {
 	__u32 windowstart;
 	__u32 windowbase;
 	__u32 threadptr;
-	__u32 reserved[7 + 48];
+	__u32 syscall;
+	__u32 reserved[6 + 48];
 	__u32 a[64];
 };
 
diff --git a/arch/xtensa/kernel/ptrace.c b/arch/xtensa/kernel/ptrace.c
index 0278d7dfb4d6..437b4297948d 100644
--- a/arch/xtensa/kernel/ptrace.c
+++ b/arch/xtensa/kernel/ptrace.c
@@ -52,6 +52,7 @@ static int gpr_get(struct task_struct *target,
 		.threadptr = regs->threadptr,
 		.windowbase = regs->windowbase,
 		.windowstart = regs->windowstart,
+		.syscall = regs->syscall,
 	};
 
 	memcpy(newregs.a,
@@ -91,6 +92,9 @@ static int gpr_set(struct task_struct *target,
 	regs->sar = newregs.sar;
 	regs->threadptr = newregs.threadptr;
 
+	if (newregs.syscall)
+		regs->syscall = newregs.syscall;
+
 	if (newregs.windowbase != regs->windowbase ||
 	    newregs.windowstart != regs->windowstart) {
 		u32 rotws, wmask;
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
