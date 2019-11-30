Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 56E6610DC47
	for <lists+linux-xtensa@lfdr.de>; Sat, 30 Nov 2019 04:45:14 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 1EA6A6586;
	Sat, 30 Nov 2019 03:36:22 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by linux-xtensa.org (Postfix) with ESMTPS id BCCDD6585
 for <linux-xtensa@linux-xtensa.org>; Sat, 30 Nov 2019 03:36:20 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r15so21001620lff.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 29 Nov 2019 19:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iXFjuLX0iGyT38UQPN5PdmevuxsDCgeWiwiIr+JE2yE=;
 b=iepCG9D9M6R42N1YIWFN7wTcftZI5g0d/BRBGIt+N8VeUSceqBrqQXiGs9hk1kXOzy
 VbbJ0xP4m8ajh5Pn2doZLtseUFDrDtemA8FlceRq3KOlO2nsXqEmFjJXWglopNYMpSAo
 QxcueFMIXNBzgKxAPgCac8+8LmA6a4vOglPXx405jjX86wbrPIHnEGW9TsWeIXni3S1z
 4H5J4XicSMh8iVdTMjZVfrqyeNir/QHe4V/T/auT6GHkA5vCnr9TLPyFYPfTWo9HOQyl
 LkVf9LGexcPvfLLWJ2lVX9AHOMjnn3DZsgtKEAr75E3NOUyfFMNR0YxXj+II5D1YuVJh
 ud6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iXFjuLX0iGyT38UQPN5PdmevuxsDCgeWiwiIr+JE2yE=;
 b=j8ETfUrQc/pkOq0ub2tcmW1/72YJ41OBHXovK2hxMHhbJfYE83tC3oYI4CeSe4iaiD
 sbU2/JcFCIrxtBcnPOYWszhp7g1FEw7+LClU4C7cuWRczRbPnkxcArppPGc4Znb4svmA
 qcU/kcCmCYWRpkmGtOVCcpaRc9cfy/rry2Ssdrzw40SOZ2TCLA42c4ZCiBF8ljFiCJW1
 dfJ5DxlzBAcUW/6O4xKgEchqJk14EcEwvkFjhnh0hcv1zvug6TijjOqyHf2ywcptoCHh
 QavlUD9lICzCaaxRIsUMIhMJd4/Wupwm8IHcJ1VcdVKQI+2kXm93weTDVLNGF9cvs3gK
 fuJw==
X-Gm-Message-State: APjAAAX3Jxr7t7JBBjG7yhT1vhMrCONnSvsAq7pwqDyI6l1ZPiv5tUxz
 k31VGGep7+EXfXp2crfy73esM7VG53M=
X-Google-Smtp-Source: APXvYqywrRMUk3N59Fjbt9YNDjcHZQXBtO0MEFD/a3pO1PFPKQXy6ENr8+ADRr41KI20wvcJfXk5IQ==
X-Received: by 2002:a19:e20b:: with SMTP id z11mr37242630lfg.171.1575085511201; 
 Fri, 29 Nov 2019 19:45:11 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id z9sm2920528ljm.40.2019.11.29.19.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 19:45:10 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 29 Nov 2019 19:44:48 -0800
Message-Id: <20191130034450.25507-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130034450.25507-1-jcmvbkbc@gmail.com>
References: <20191130034450.25507-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/3] xtensa: rearrange syscall tracing
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

system_call saves and restores syscall number across system call to make
clone and execv entry and exit tracing match. This complicates things
when syscall code may be changed by ptrace.
Preserve syscall code in copy_thread and start_thread directly instead of
doing tricks in system_call.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/processor.h | 3 ++-
 arch/xtensa/kernel/entry.S          | 6 ------
 arch/xtensa/kernel/process.c        | 2 ++
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/xtensa/include/asm/processor.h b/arch/xtensa/include/asm/processor.h
index 7495520d7a3e..6fa903daf2a2 100644
--- a/arch/xtensa/include/asm/processor.h
+++ b/arch/xtensa/include/asm/processor.h
@@ -195,6 +195,7 @@ struct thread_struct {
 /* Clearing a0 terminates the backtrace. */
 #define start_thread(regs, new_pc, new_sp) \
 	do { \
+		unsigned long syscall = (regs)->syscall; \
 		memset((regs), 0, sizeof(*(regs))); \
 		(regs)->pc = (new_pc); \
 		(regs)->ps = USER_PS_VALUE; \
@@ -204,7 +205,7 @@ struct thread_struct {
 		(regs)->depc = 0; \
 		(regs)->windowbase = 0; \
 		(regs)->windowstart = 1; \
-		(regs)->syscall = NO_SYSCALL; \
+		(regs)->syscall = syscall; \
 	} while (0)
 
 /* Forward declaration */
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 2ca209e71565..59af494d9940 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -1895,8 +1895,6 @@ ENTRY(system_call)
 	l32i	a7, a2, PT_SYSCALL
 
 1:
-	s32i	a7, a1, 4
-
 	/* syscall = sys_call_table[syscall_nr] */
 
 	movi	a4, sys_call_table
@@ -1930,12 +1928,8 @@ ENTRY(system_call)
 	abi_ret(4)
 
 1:
-	l32i	a4, a1, 4
-	l32i	a3, a2, PT_SYSCALL
-	s32i	a4, a2, PT_SYSCALL
 	mov	a6, a2
 	call4	do_syscall_trace_leave
-	s32i	a3, a2, PT_SYSCALL
 	abi_ret(4)
 
 ENDPROC(system_call)
diff --git a/arch/xtensa/kernel/process.c b/arch/xtensa/kernel/process.c
index db278a9e80c7..9e1c49134c07 100644
--- a/arch/xtensa/kernel/process.c
+++ b/arch/xtensa/kernel/process.c
@@ -264,6 +264,8 @@ int copy_thread(unsigned long clone_flags, unsigned long usp_thread_fn,
 			       &regs->areg[XCHAL_NUM_AREGS - len/4], len);
 		}
 
+		childregs->syscall = regs->syscall;
+
 		/* The thread pointer is passed in the '4th argument' (= a5) */
 		if (clone_flags & CLONE_SETTLS)
 			childregs->threadptr = childregs->areg[5];
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
