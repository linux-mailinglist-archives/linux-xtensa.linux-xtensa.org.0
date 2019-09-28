Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 1622FC0F07
	for <lists+linux-xtensa@lfdr.de>; Sat, 28 Sep 2019 02:43:28 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 436AF52DA;
	Sat, 28 Sep 2019 00:36:39 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 8C79052D3
 for <linux-xtensa@linux-xtensa.org>; Sat, 28 Sep 2019 00:36:38 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u28so3173500lfc.5
 for <linux-xtensa@linux-xtensa.org>; Fri, 27 Sep 2019 17:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1tSjfpPimD/34jCR9zXpm47r4Z/4tfKvbErjvzDZFGs=;
 b=FAMpsdOkj/iAmOhXhTMlZRxmvDSSkGWKXLzuTTxRR0kk+8O258OP+8iUWQppDGt7Qr
 NQGrno95F6KQ4m1o7nqupsVzv+bRjxrmtuPmenMkzspc9fviOLKjsrzkUwX0duaDo/gP
 bcoK3uCajQniL99evSgMU1oHGJjlc6vwhYproSj5wfmPJUc521Y/m5qGk9JpgLMH/uUI
 IYweb78/zun3f4+U9oHFB4pAihI0J/gw96TaX84AZpi/EeCLUv1WQ7gC+bnuT8HUzKA0
 ZU9Ec8J05k/6PGrS2WTrOvMHJVZ6EJ+e3zL7N1jHeOK4XGWPVFJyUiSFOwo16m4oBEaP
 b38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1tSjfpPimD/34jCR9zXpm47r4Z/4tfKvbErjvzDZFGs=;
 b=Xp8GiIPAfvhMA7z9sK4hh2AUGX/yuU8UlbGdW0NsRxHyIJ/OY5YIiW6Q+JoHFpSRdd
 0pwGJIl7s4GmuXr6BV8SSPODaBXJ8A7o5n64kvXT/vqXD7f+c2ZQToiGSR4+oSyqnnL4
 5HkEShDd9bTgm1KBkVnXBOEJS+SKwK5tkNUGXtDwRmILdUi5dgogJZWorBKDKst5Vdxx
 NNDeHsRXnbk73p5Hm72DgWZ1JwDGAOW3fxVXPP9Zipdq9hD81jX0QmEOCYEq9cKFpOVQ
 ptcV+fDvkt0S+r7Xbx654wImyIYVPgR4aONUlUQquaLg8EtyepSOTx9bBVdo9FNhZgGq
 llaQ==
X-Gm-Message-State: APjAAAUTwfLA7xXabFQdh56J5M4uPwBhKQb+vSPpOah/SwKkL1M9Ybab
 SMr/H4cLwG4o7HzcFRLyUj7VqqY8d44=
X-Google-Smtp-Source: APXvYqwWp6hHEmVDjyN0pUopPjfWB/Em+XnQd/gPR2RI467Wj2aGCvhBElKy4+ms97evNPqf1lHMYA==
X-Received: by 2002:a19:ee02:: with SMTP id g2mr4594156lfb.113.1569631405624; 
 Fri, 27 Sep 2019 17:43:25 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 207sm1026320lfn.0.2019.09.27.17.43.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 17:43:25 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 27 Sep 2019 17:43:12 -0700
Message-Id: <20190928004312.22245-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: clean up empty include files
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

Remove empty hw_irq.h and user.h from arch/xtensa/include/asm and use
generic versions instead.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/Kbuild   |  2 ++
 arch/xtensa/include/asm/hw_irq.h | 14 --------------
 arch/xtensa/include/asm/user.h   | 20 --------------------
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 arch/xtensa/include/asm/hw_irq.h
 delete mode 100644 arch/xtensa/include/asm/user.h

diff --git a/arch/xtensa/include/asm/Kbuild b/arch/xtensa/include/asm/Kbuild
index ffa0cf7f66c3..3acc31e55e02 100644
--- a/arch/xtensa/include/asm/Kbuild
+++ b/arch/xtensa/include/asm/Kbuild
@@ -11,6 +11,7 @@ generic-y += exec.h
 generic-y += extable.h
 generic-y += fb.h
 generic-y += hardirq.h
+generic-y += hw_irq.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
 generic-y += kdebug.h
@@ -30,6 +31,7 @@ generic-y += qspinlock.h
 generic-y += sections.h
 generic-y += topology.h
 generic-y += trace_clock.h
+generic-y += user.h
 generic-y += vga.h
 generic-y += word-at-a-time.h
 generic-y += xor.h
diff --git a/arch/xtensa/include/asm/hw_irq.h b/arch/xtensa/include/asm/hw_irq.h
deleted file mode 100644
index 3ddbea759b2b..000000000000
--- a/arch/xtensa/include/asm/hw_irq.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * include/asm-xtensa/hw_irq.h
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License.  See the file "COPYING" in the main directory of
- * this archive for more details.
- *
- * Copyright (C) 2002 - 2005 Tensilica Inc.
- */
-
-#ifndef _XTENSA_HW_IRQ_H
-#define _XTENSA_HW_IRQ_H
-
-#endif
diff --git a/arch/xtensa/include/asm/user.h b/arch/xtensa/include/asm/user.h
deleted file mode 100644
index 2c3ed23354a8..000000000000
--- a/arch/xtensa/include/asm/user.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/*
- * include/asm-xtensa/user.h
- *
- * Xtensa Processor version.
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2001 - 2005 Tensilica Inc.
- */
-
-#ifndef _XTENSA_USER_H
-#define _XTENSA_USER_H
-
-/* This file usually defines a 'struct user' structure. However, it it only
- * used for a.out file, which are not supported on Xtensa.
- */
-
-#endif	/* _XTENSA_USER_H */
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
