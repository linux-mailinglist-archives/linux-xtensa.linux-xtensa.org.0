Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 762CE58F9C
	for <lists+linux-xtensa@lfdr.de>; Fri, 28 Jun 2019 03:18:30 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2398264BF;
	Fri, 28 Jun 2019 01:14:57 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 2AA0164BC
 for <linux-xtensa@linux-xtensa.org>; Fri, 28 Jun 2019 01:14:55 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id q26so2845907lfc.3
 for <linux-xtensa@linux-xtensa.org>; Thu, 27 Jun 2019 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FdrladOMf5TABxNjyjNPdPtP4U4TccCWoqjaGYv1yIk=;
 b=f04d+RwuwKIjOh+/Xm4sYT74Zia/OrkCIl3FKW0uZj5gCqKBelNXfEXlJ3opMLNpJF
 4wB/BXBaD58Qrw4FJdBh03Ih+T8vptwKo6GfVdye7hamCxR69sO897FRoz6Ga9QUTU1f
 a8QLhyi7V5TULbbkU0Czfx31iB4GXbktjzsPLkOPsxzIcscu0uFqsLRVC/LJ6Cvw+lvO
 c06DMYF+bR0ncxA1b0dFxnK7yBwEi+g2Pw2DJ+nz/qW/myo1mi7klO4yP3Q6S/qaQ499
 ObDnnJuAI7+2VkgoGV5sRY1o6UM408jZT7jmfSkOQ+8ZDNGrA1MzZT0R0ik61U3wZQa4
 8R4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FdrladOMf5TABxNjyjNPdPtP4U4TccCWoqjaGYv1yIk=;
 b=CAJW/MZmE5tPt+Sa7+xjbGsr7LTw4dXTw+6xuC5evDQSx5vP+ZAaS+gSEYn3+2bZBI
 gtKMCA3qn1+OdN2dr4du4NljQAIyLvLhI5AGEenuCf2t70ol9Wvz6z8pYbd7t9jjyUu8
 NhnYwrRb7mTYWQh2ZCRTXxv0rOuZYfaqgQr2bi3ZIW4mA3XNkDPDCl7gH63ENrRHECk/
 3CMq9/t4YsEcIQvIBdLkvouPWU1mdvssFLQB5aVs+ovoOuEARI4dB+Be7zp0Y01OAcLt
 1Ikvcpj+y8oCOnPeg3Fn/95hKVajGzvZAjwUkvOYFmT1g6NZ+zdGWqUPrAve1+8yEyW/
 95JA==
X-Gm-Message-State: APjAAAXQqE2sv7EGj0OConDMh20bm8vzQ3uXnJVpYKENDv1fPSgkQRDf
 TqpNYdl8cHmzCUkgu0bqZbiTd7tq
X-Google-Smtp-Source: APXvYqwpC1fBG9+6KbAOWFl8V1PbiqZK9dFmzaJzp7twMSYWnWcxCpA+c6jisC7NlcimAfeOReN4Ag==
X-Received: by 2002:a19:5046:: with SMTP id z6mr3618691lfj.185.1561684705233; 
 Thu, 27 Jun 2019 18:18:25 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id e26sm210150ljl.33.2019.06.27.18.18.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 18:18:24 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Thu, 27 Jun 2019 18:18:14 -0700
Message-Id: <20190628011814.5797-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: remove
	arch/xtensa/include/asm/types.h
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

Xtensa does not define CONFIG_64BIT. The generic definition of
BITS_PER_LONG in include/asm-generic/bitsperlong.h should work.
With that definition removed from arch/xtensa/include/asm/types.h
it does nothing but including arch/xtensa/include/uapi/asm/types.h
Remove the arch/xtensa/include/asm/types.h header.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/types.h | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 arch/xtensa/include/asm/types.h

diff --git a/arch/xtensa/include/asm/types.h b/arch/xtensa/include/asm/types.h
deleted file mode 100644
index 2b410b8c7f79..000000000000
--- a/arch/xtensa/include/asm/types.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * include/asm-xtensa/types.h
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2001 - 2005 Tensilica Inc.
- */
-#ifndef _XTENSA_TYPES_H
-#define _XTENSA_TYPES_H
-
-#include <uapi/asm/types.h>
-
-#ifndef __ASSEMBLY__
-/*
- * These aren't exported outside the kernel to avoid name space clashes
- */
-
-#define BITS_PER_LONG 32
-
-#endif
-#endif	/* _XTENSA_TYPES_H */
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
