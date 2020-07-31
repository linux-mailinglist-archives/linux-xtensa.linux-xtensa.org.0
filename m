Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 20C11234CD5
	for <lists+linux-xtensa@lfdr.de>; Fri, 31 Jul 2020 23:20:35 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 612E164A3;
	Fri, 31 Jul 2020 21:03:49 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by linux-xtensa.org (Postfix) with ESMTPS id DE9B964A1
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jul 2020 21:03:47 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s15so5126970pgc.8
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jul 2020 14:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6huKTddjtAjrZ/iwRFjM+2AULsbiPYjTMrOwzG3sgfE=;
 b=BREcwqEOTjsBQUAipx7bV4+HTi3foe1OxegRgGmMPapX6mED1n8qS4/3saXXj37b7p
 SP+YUhZnEeCjWCg32Wl2s/yI976/UAJ+kosL4yPJQr6WccuTRjUpgZ3Ng3r3BKM9eFZi
 alYcmW84eGjNXIbTdK7KxmmMxhFKBSJCmg+X0SgRf56Wata50NZ8CSlrOk+1v+rg2vB+
 zNnuXQvBwHMqt+GhGeKOOCc+4HSc6kxabBhJkzbOXQY5toHO59xSx8Js6lFHJND7LIlO
 b3iavsrfBQs07BTrlOd4iAKOsFj1webFzeLx6alFaR7NydCNZnXIOHttxk19q/H7jMuU
 cqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6huKTddjtAjrZ/iwRFjM+2AULsbiPYjTMrOwzG3sgfE=;
 b=ecpxBLgn2PWs7DW5KQUwWPTVefU+RRH6UnDpEoE9yBLhV7UXXtjAyHYaGoZzmyXcph
 9LcPD2t4dIGn6n3HJRA/jJsv+LFLVojI6VHwJpWWUm+kxcVYYQlfpD2vdd1k1V+PtpOy
 Hz4Nuq6jVKQciyGWZ6OfnacUfPDCFeF0zMczYQbr7uPSxGsXJ76m831WDKd3+MPREzYI
 JxRVMcO0TpCR/pelVgWz4MiwHFBKpkeJmPIrNs/Grr+2EYjNISKSaLxR0whk0lPMaVX7
 6wFqeku+EJkCPnijyi0bu8ee08CwgpwirFCBoLbSzyQ+5FLTze5qx1GJPKuQSLml4ek0
 ECeg==
X-Gm-Message-State: AOAM532MlD9QnZDjHzIb9lnaI9MTy7nRrx2WW2IRkzkmwFbKl5xm+OtU
 ct5teEcPfxMcpgYD4BWDefyhZA3H
X-Google-Smtp-Source: ABdhPJyt/di1ICCZrqqjM7cJwVLyYlymB8Td3iv6afRKt9ktK5weCZ+Hw5PQt4s3Kp+sDPtGpEhWfw==
X-Received: by 2002:aa7:952d:: with SMTP id c13mr5713978pfp.198.1596230432315; 
 Fri, 31 Jul 2020 14:20:32 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id g23sm11163855pfo.95.2020.07.31.14.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 14:20:31 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 31 Jul 2020 14:20:17 -0700
Message-Id: <20200731212017.26851-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: add missing exclusive access state
	management
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

The result of the s32ex opcode is recorded in the ATOMCTL special
register and must be retrieved with the getex opcode. Context switch
between s32ex and getex may trash the ATOMCTL register and result in
duplicate update or missing update of the atomic variable.
Add atomctl8 field to the struct thread_info and use getex to swap
ATOMCTL bit 8 as a part of context switch.
Clear exclusive access monitor on kernel entry.

Cc: stable@vger.kernel.org
Fixes: f7c34874f04a ("xtensa: add exclusive atomics support")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/thread_info.h |  4 ++++
 arch/xtensa/kernel/asm-offsets.c      |  3 +++
 arch/xtensa/kernel/entry.S            | 11 +++++++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/xtensa/include/asm/thread_info.h b/arch/xtensa/include/asm/thread_info.h
index 8918f0f20c53..6acbbe0d87d3 100644
--- a/arch/xtensa/include/asm/thread_info.h
+++ b/arch/xtensa/include/asm/thread_info.h
@@ -55,6 +55,10 @@ struct thread_info {
 	mm_segment_t		addr_limit;	/* thread address space */
 
 	unsigned long		cpenable;
+#if XCHAL_HAVE_EXCLUSIVE
+	/* result of the most recent exclusive store */
+	unsigned long		atomctl8;
+#endif
 
 	/* Allocate storage for extra user states and coprocessor states. */
 #if XTENSA_HAVE_COPROCESSORS
diff --git a/arch/xtensa/kernel/asm-offsets.c b/arch/xtensa/kernel/asm-offsets.c
index 33a257b33723..dc5c83cad9be 100644
--- a/arch/xtensa/kernel/asm-offsets.c
+++ b/arch/xtensa/kernel/asm-offsets.c
@@ -93,6 +93,9 @@ int main(void)
 	DEFINE(THREAD_RA, offsetof (struct task_struct, thread.ra));
 	DEFINE(THREAD_SP, offsetof (struct task_struct, thread.sp));
 	DEFINE(THREAD_CPENABLE, offsetof (struct thread_info, cpenable));
+#if XCHAL_HAVE_EXCLUSIVE
+	DEFINE(THREAD_ATOMCTL8, offsetof (struct thread_info, atomctl8));
+#endif
 #if XTENSA_HAVE_COPROCESSORS
 	DEFINE(THREAD_XTREGS_CP0, offsetof(struct thread_info, xtregs_cp.cp0));
 	DEFINE(THREAD_XTREGS_CP1, offsetof(struct thread_info, xtregs_cp.cp1));
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 98515c24d9b2..703cf6205efe 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -374,6 +374,11 @@ common_exception:
 	s32i	a2, a1, PT_LCOUNT
 #endif
 
+#if XCHAL_HAVE_EXCLUSIVE
+	/* Clear exclusive access monitor set by interrupted code */
+	clrex
+#endif
+
 	/* It is now save to restore the EXC_TABLE_FIXUP variable. */
 
 	rsr	a2, exccause
@@ -2020,6 +2025,12 @@ ENTRY(_switch_to)
 	s32i	a3, a4, THREAD_CPENABLE
 #endif
 
+#if XCHAL_HAVE_EXCLUSIVE
+	l32i	a3, a5, THREAD_ATOMCTL8
+	getex	a3
+	s32i	a3, a4, THREAD_ATOMCTL8
+#endif
+
 	/* Flush register file. */
 
 	spill_registers_kernel
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
