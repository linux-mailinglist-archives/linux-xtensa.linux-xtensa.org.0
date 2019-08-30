Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 97AEAA3DEF
	for <lists+linux-xtensa@lfdr.de>; Fri, 30 Aug 2019 20:50:09 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id BE6655811;
	Fri, 30 Aug 2019 18:44:20 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 946C857E4
 for <linux-xtensa@linux-xtensa.org>; Fri, 30 Aug 2019 18:44:18 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id u15so7404320ljl.3
 for <linux-xtensa@linux-xtensa.org>; Fri, 30 Aug 2019 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mNzJG0JKQWUqv8PlQGCVnCUQF6SCfRINLGeQPBwJtCc=;
 b=JxPzExzYC3WmnErE610inCxVWnICAAahLSOmuGKD8U87v0DcF5y2coGghoMg5oI9y5
 tNYCVU4dzTZf792QYWSSd89tDs5ckuHyVk4/qymni6ygXpdht3yjfV7ZTre2EUsbAJV6
 8pX2vcjnfw/ghpL/N4RnqbnXaVBUWNwKdHyREJevMK/w1AUDaVg2kfecvzLuIdMdaP83
 Dy5brENBRe6mT+WQqhRJNCITLIMbWpkLmKYqNmuuJwr7QhpPxkWN5N+Sjy9LMFVe7YAZ
 o8nurHcUcFKi2BVUFGZ+VqDHqwhurArV0BbTKj1Ofe9AwGNzn/SDsIsLgs1Vz1l7FbCg
 VICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mNzJG0JKQWUqv8PlQGCVnCUQF6SCfRINLGeQPBwJtCc=;
 b=KUt5fL9dLBfcCP6yT69HrKaUjDmSKvcYzcx6JWt6Now44x2LZwRTeqfUmgyNwk9ico
 i6TW+N5K29fz0gj6k2OvsgWdFLqt7JKAXFp4wdvVjtyy1QWAHLZYmVXOxLKsXHYxCdDm
 vqSVUrwcUAc6lsta7nTYUH4XmZC4qA5oqnNyHMf5Em2uBo1ZzBXFZwaREcR5gHTV632f
 2jSspFq0edOedWsQz7TjwMg8dk9rD0+QupWKGZa+9ukVZm1QTSm/fxAzKxc6+4/WoU1t
 TH3STpUXgEynxoTpZRTft8tlSPODBYmjMDG3RJveqrVKIPDT/Wb05m3bSC/ru/PRh/hh
 V0nQ==
X-Gm-Message-State: APjAAAXsZwvtVuYwC88G0HBBdy5IZmoimpQHEzRNSb/NUTd/NMudEv15
 2TAy/QXnAjGgOQHykqCR4SIYnqVv
X-Google-Smtp-Source: APXvYqzAGS9rKJHj3ljqamfJcCJS/cxnihZPTA3me2d0x6c/Z1inU/x8b5j/9wUnx/xvZWs7r89mWw==
X-Received: by 2002:a2e:978e:: with SMTP id y14mr9462534lji.10.1567191005778; 
 Fri, 30 Aug 2019 11:50:05 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id u13sm970890ljj.40.2019.08.30.11.50.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 11:50:05 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 30 Aug 2019 11:49:50 -0700
Message-Id: <20190830184951.31083-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190830184951.31083-1-jcmvbkbc@gmail.com>
References: <20190830184951.31083-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/2] xtensa: clean up PS_WOE_BIT usage
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

PS_WOE_BIT is mainly used to generate PS.WOE mask in the code. Introduce
PS_WOE_MASK macro and use it instead.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/processor.h | 2 +-
 arch/xtensa/include/asm/regs.h      | 1 +
 arch/xtensa/kernel/entry.S          | 8 ++++----
 arch/xtensa/kernel/head.S           | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/xtensa/include/asm/processor.h b/arch/xtensa/include/asm/processor.h
index 19f6b54e358b..0b4efec9e19e 100644
--- a/arch/xtensa/include/asm/processor.h
+++ b/arch/xtensa/include/asm/processor.h
@@ -179,7 +179,7 @@ struct thread_struct {
  * Note: We set-up ps as if we did a call4 to the new pc.
  *       set_thread_state in signal.c depends on it.
  */
-#define USER_PS_VALUE ((1 << PS_WOE_BIT) |				\
+#define USER_PS_VALUE (PS_WOE_MASK |					\
 		       (1 << PS_CALLINC_SHIFT) |			\
 		       (USER_RING << PS_RING_SHIFT) |			\
 		       (1 << PS_UM_BIT) |				\
diff --git a/arch/xtensa/include/asm/regs.h b/arch/xtensa/include/asm/regs.h
index 477594e5817f..ce184e7dee91 100644
--- a/arch/xtensa/include/asm/regs.h
+++ b/arch/xtensa/include/asm/regs.h
@@ -81,6 +81,7 @@
 /*  PS register fields.  */
 
 #define PS_WOE_BIT		18
+#define PS_WOE_MASK		0x00040000
 #define PS_CALLINC_SHIFT	16
 #define PS_CALLINC_MASK		0x00030000
 #define PS_OWB_SHIFT		8
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 183fa8e0bb5b..9afe8f612f23 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -414,7 +414,7 @@ common_exception:
 	movi	a3, LOCKLEVEL
 
 .Lexception:
-	movi	a0, 1 << PS_WOE_BIT
+	movi	a0, PS_WOE_MASK
 	or	a3, a3, a0
 #else
 	addi	a2, a2, -EXCCAUSE_LEVEL1_INTERRUPT
@@ -422,7 +422,7 @@ common_exception:
 	extui	a3, a3, PS_INTLEVEL_SHIFT, PS_INTLEVEL_WIDTH
 					# a3 = PS.INTLEVEL
 	moveqz	a3, a0, a2		# a3 = LOCKLEVEL iff interrupt
-	movi	a2, 1 << PS_WOE_BIT
+	movi	a2, PS_WOE_MASK
 	or	a3, a3, a2
 	rsr	a2, exccause
 #endif
@@ -922,7 +922,7 @@ ENTRY(unrecoverable_exception)
 	wsr	a1, windowbase
 	rsync
 
-	movi	a1, (1 << PS_WOE_BIT) | LOCKLEVEL
+	movi	a1, PS_WOE_MASK | LOCKLEVEL
 	wsr	a1, ps
 	rsync
 
@@ -1359,7 +1359,7 @@ ENTRY(fast_syscall_spill_registers)
 	rsr	a3, excsave1
 	l32i	a1, a3, EXC_TABLE_KSTK
 
-	movi	a4, (1 << PS_WOE_BIT) | LOCKLEVEL
+	movi	a4, PS_WOE_MASK | LOCKLEVEL
 	wsr	a4, ps
 	rsync
 
diff --git a/arch/xtensa/kernel/head.S b/arch/xtensa/kernel/head.S
index 7f009719304e..4ae998b5a348 100644
--- a/arch/xtensa/kernel/head.S
+++ b/arch/xtensa/kernel/head.S
@@ -193,7 +193,7 @@ ENTRY(_startup)
 	movi	a1, start_info
 	l32i	a1, a1, 0
 
-	movi	a2, (1 << PS_WOE_BIT) | LOCKLEVEL
+	movi	a2, PS_WOE_MASK | LOCKLEVEL
 					# WOE=1, INTLEVEL=LOCKLEVEL, UM=0
 	wsr	a2, ps			# (enable reg-windows; progmode stack)
 	rsync
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
