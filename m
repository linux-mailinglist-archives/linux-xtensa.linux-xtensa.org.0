Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 31DBC3C2345
	for <lists+linux-xtensa@lfdr.de>; Fri,  9 Jul 2021 14:06:18 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id DA2736543;
	Fri,  9 Jul 2021 11:38:00 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by linux-xtensa.org (Postfix) with ESMTPS id 4BF9D6541
 for <linux-xtensa@linux-xtensa.org>; Fri,  9 Jul 2021 11:37:40 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id x25so10066719lfu.13
 for <linux-xtensa@linux-xtensa.org>; Fri, 09 Jul 2021 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HC3TFVQETt12BDyl6iqYoB6JjOT22n0xQEi68NzER/g=;
 b=JDqPMkLoBFDWAiSLbbp0X/e5Rlas72BS6rdCol34Q2vhzGcDTwlajprSXKrPx7K5Ul
 SwglmConpphoedvpXxkfRbbcG8HOkIFMTjWSpOrKJf9wP5cqIJcpn8FSXBw1TN3Tjjfq
 uStED7FFYE+Z71LZEfnMMKi/h1jekeLjkU5JFTeF2TP1ixOMmaoIKrh1etQN/3V0+wKT
 +oQq0P+NonXAaDXdu6L//bIjy6J49pgNCTtn5q6LUbUnOxRTV5m1sFpXJDmICtkDVcoJ
 mfZ1bYegJf+1FpiofhelbxKmTRtMfCuroik1yJ0qEyRYBWTwSIZTC53rHd4nObvn8Y4h
 c5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HC3TFVQETt12BDyl6iqYoB6JjOT22n0xQEi68NzER/g=;
 b=r1VKZmvVAcVnMuIFdl6WWTNUUYVkd0k/OIPe2QpeDRixK7SIcyQY6qnLmPZFeLuFFA
 Pzn1uuVxDaZ69eL0hTxh6z17BZq2zRkWlNLH2pXl1sIR0QDzY0lCdnxV0akhF9/v1Ix6
 MFpgPK2SZE7nGN9UTSE48Z8SvsXYjm5CeKFLIZJs4Uou3BdnUbtSWM/+bBsH6uQEPuDv
 tnBnbpqjfqAt0pEMhTlrDwmc9/pNO9mCRAAUZFGUnHeq4lSLPklGLl4kq6nNWpHqwRb1
 i1/PCJTYuV3oOd+lykAXFtXAMKbZLQvyKEd6djAxjWoMF2q5w65TP/lLIK1wDF8wrwls
 NsVg==
X-Gm-Message-State: AOAM533ViVYnefWtRzk+KzA6t4USYTMz8AAlnmafl2kcazaMoCydKs7x
 N3Bwgmm7A9nEWaLwbOTK3c2Wep3vj68zeA==
X-Google-Smtp-Source: ABdhPJzAegaVvFnJ0lgzhNSBk18tRRuAn1UZGgi0QGaqH00c4Y2Y60YTShTgw+5NWGIpKQod6qkwQA==
X-Received: by 2002:a19:e05c:: with SMTP id g28mr28826388lfj.299.1625832352025; 
 Fri, 09 Jul 2021 05:05:52 -0700 (PDT)
Received: from octofox.metropolis ([5.18.185.11])
 by smtp.gmail.com with ESMTPSA id q15sm583586ljg.126.2021.07.09.05.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 05:05:51 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri,  9 Jul 2021 05:05:42 -0700
Message-Id: <20210709120542.11551-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: add fairness to IRQ handling
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

Track which IRQs have been served at each level to make sure that no IRQ
is served more than once while other IRQs at the same level are pending.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/traps.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/xtensa/kernel/traps.c b/arch/xtensa/kernel/traps.c
index efc3a29cde80..874b6efc6fb3 100644
--- a/arch/xtensa/kernel/traps.c
+++ b/arch/xtensa/kernel/traps.c
@@ -268,6 +268,7 @@ void do_interrupt(struct pt_regs *regs)
 		XCHAL_INTLEVEL7_MASK,
 	};
 	struct pt_regs *old_regs;
+	unsigned unhandled = ~0u;
 
 	trace_hardirqs_off();
 
@@ -283,6 +284,10 @@ void do_interrupt(struct pt_regs *regs)
 		for (level = LOCKLEVEL; level > 0; --level) {
 			if (int_at_level & int_level_mask[level]) {
 				int_at_level &= int_level_mask[level];
+				if (int_at_level & unhandled)
+					int_at_level &= unhandled;
+				else
+					unhandled |= int_level_mask[level];
 				break;
 			}
 		}
@@ -290,6 +295,8 @@ void do_interrupt(struct pt_regs *regs)
 		if (level == 0)
 			break;
 
+		/* clear lowest pending irq in the unhandled mask */
+		unhandled ^= (int_at_level & -int_at_level);
 		do_IRQ(__ffs(int_at_level), regs);
 	}
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
