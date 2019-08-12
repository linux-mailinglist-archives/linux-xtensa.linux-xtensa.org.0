Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 81DCF8AA25
	for <lists+linux-xtensa@lfdr.de>; Tue, 13 Aug 2019 00:09:19 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9786765C2;
	Mon, 12 Aug 2019 22:04:08 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id F2A996492
 for <linux-xtensa@linux-xtensa.org>; Mon, 12 Aug 2019 22:04:06 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id u15so4735939ljl.3
 for <linux-xtensa@linux-xtensa.org>; Mon, 12 Aug 2019 15:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jv4vjvon820rdz2/ZYNeWVdf9J0eLgu+Z1XIwQm8nz0=;
 b=FEtwW4Hpn9BaQfo1umVm9B1zGDFm7rTZiEdF8GZ1V60fH/qFKT8c7kJd5QZQ80uBCE
 kGKLu7KU3gZZgKx63Yy4xmb7sLjCJ77QpWA30bYbYI93Y4Sfif+BMncW494531ptSrPM
 F1mqBFxc3N/CT7VQO5pqE2H2wy2/s99zAewZuJNmzabck7O4Oi0Rftcr2+EyUB7OWJTk
 NWNoTWq8y3lXDRMokm1pyquc0G88QW6xQt3dYEv3NqDn5gwOZh/TzWHi2UU0eNLiu9aq
 XX6q5RrnxGwrn7qMZ7DaalXXYpvfRuHLjyBVOTySSo4B7m7uGgR7fezp/YFRi8Q35OOK
 ZliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jv4vjvon820rdz2/ZYNeWVdf9J0eLgu+Z1XIwQm8nz0=;
 b=AEVFWPSHbShG/rwwVX6de09c1E5RE+fZx5BRL+Khf5okR0Tp9PzVJe7wnzbx5piIvT
 G4g1svJ/0iErWcLqX8QcAQ4SaUDQnc53LqjapZfe6bi84Nzz9i//FSMnUtH+VIw6UeKU
 6jaZUE6c8j1hrGam45kWHl0ttcDSLnql6nPcHdlPOJMa/d2KfRTpW0MCOV8hzO1a2+dv
 JjXZKY94KRYrmP6f1lmMKwFxBukfv0XqsZhmvCHBVqjntxiHheVQJfkoz14WP2lAcDf/
 mkmEai0zWWVhfW38r3zwhn2gyJnnjSFarjF83aOdH/iJpH9rLkEIuNfIaw0tWPGT1p51
 8rdg==
X-Gm-Message-State: APjAAAWCrZbNu+nDlo7AlN38nw8v+xtV5TFbiEX3vbdCY9v1j9jkfJ/6
 X8khzPq1Vit0p6tSmUpZ3PXMVDOz
X-Google-Smtp-Source: APXvYqxYVcpJ35sgtJAE0YpfqL1T+98suH53WOw2dlocdGYxbAWmBtorbCl6O8OuWxnboMZVKCfuLw==
X-Received: by 2002:a2e:29cb:: with SMTP id p72mr5959711ljp.31.1565647755438; 
 Mon, 12 Aug 2019 15:09:15 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id a13sm19452468lfi.57.2019.08.12.15.09.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 15:09:13 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 12 Aug 2019 15:08:47 -0700
Message-Id: <20190812220847.14624-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: stable@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: add missing isync to the cpu_reset
	TLB code
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

ITLB entry modifications must be followed by the isync instruction
before the new entries are possibly used. cpu_reset lacks one isync
between ITLB way 6 initialization and jump to the identity mapping.
Add missing isync to xtensa cpu_reset.

Cc: stable@vger.kernel.org
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 5cb8a62e091c..7c3106093c75 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -511,6 +511,7 @@ void cpu_reset(void)
 				      "add	%2, %2, %7\n\t"
 				      "addi	%0, %0, -1\n\t"
 				      "bnez	%0, 1b\n\t"
+				      "isync\n\t"
 				      /* Jump to identity mapping */
 				      "jx	%3\n"
 				      "2:\n\t"
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
