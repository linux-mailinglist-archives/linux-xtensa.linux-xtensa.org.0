Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 187A514F327
	for <lists+linux-xtensa@lfdr.de>; Fri, 31 Jan 2020 21:28:21 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id A70C464A2;
	Fri, 31 Jan 2020 20:17:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id CB4576443
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jan 2020 20:17:29 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id l18so5796551lfc.1
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jan 2020 12:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRC/UTtWQyL3UmKMYJSD6/n2Zwg6trbf7acaHttdCtY=;
 b=nj8Ws2JdgXdWf64OZ4K7k41F3hXLIaGgCEqjKBatyRJUS092QI8icl4mrXTq64aqtT
 mkpA4dqcvPuF47URjz6hSlWDuJUhxzOcdKov8QFBA7y5XkWWR/vIm+gIK26KG1/BhK8H
 COSZ4MRf2Tw/VLuv/xcJmczx0ahzATomIukMhYToNHXhoxlvvQlFK8ro/zcTNLIfnnYa
 SPtcjNRhYV0aEZxvXP/G24EgIhNuPUb2dqOSuOQCOHNEZjuOo6Ui9a3Le078wVXmo4y/
 XaxD0XRMP/DSYE0kKW5OEcT7/2WxlzlztjY80sIpoyjJtV9LF5gPWWwE2ur8tiam962+
 iIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRC/UTtWQyL3UmKMYJSD6/n2Zwg6trbf7acaHttdCtY=;
 b=iKEgY9l7J/M44btFE3nhxzEhUKCcyZAarLeyrrW1qk3q4Ec6NqxLMqQyIVhAaJXAWz
 bKSpB91dmwYVXW4AlsVBb1PAQgUVJyRo0gIhP3jo3eMy6o3T2TBzcKth/8uNbAvWYZUN
 ncVtR+C8+wOp9XW03+m62UYns20l+tujUd+MbqtNyfdDqyem4PxJT4YxrOeaoxr+fUd6
 fxcfURLqWAMAn2Gn2QKWrfzD6r/ABsyIWaenTWLRvG1mwskYe5el3G0SlYmAAOumM/j+
 nf+a5sg18/1WPIzFR1aL+Q0vok/Nz5KL1DNxbavHKSIWLPU3ApPTQT1J7JY9rtV5WdOD
 IG2g==
X-Gm-Message-State: APjAAAWdceCh7xgoEDiBhH5dhLLt9OB9yvy4mGKiXR8QvSObqaG6qbzM
 MVusxbfZsiVNBB34gWVqZ2K8eYRY
X-Google-Smtp-Source: APXvYqxShzM+p+LfdJU10Zlw9DlMIyxI7aSgAlWCAfxatdxpfOR3WJKUpzRAIKSiSeG9kHPjD2n2+w==
X-Received: by 2002:ac2:5196:: with SMTP id u22mr5938611lfi.123.1580502496468; 
 Fri, 31 Jan 2020 12:28:16 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 5sm5215216lju.69.2020.01.31.12.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 12:28:15 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 31 Jan 2020 12:27:50 -0800
Message-Id: <20200131202751.10375-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131202751.10375-1-jcmvbkbc@gmail.com>
References: <20200131202751.10375-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/3] xtensa: clean up platform headers
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

Drop include directives for irrelevant headers in asm/platform.h and its
users. Sort remaining headers.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/platform.h   |  2 --
 arch/xtensa/kernel/platform.c        |  4 +---
 arch/xtensa/platforms/iss/setup.c    | 16 +++-------------
 arch/xtensa/platforms/xtfpga/setup.c |  1 +
 4 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/arch/xtensa/include/asm/platform.h b/arch/xtensa/include/asm/platform.h
index f2c48522c5a1..354ca942de40 100644
--- a/arch/xtensa/include/asm/platform.h
+++ b/arch/xtensa/include/asm/platform.h
@@ -12,8 +12,6 @@
 #define _XTENSA_PLATFORM_H
 
 #include <linux/types.h>
-#include <linux/pci.h>
-
 #include <asm/bootparam.h>
 
 /*
diff --git a/arch/xtensa/kernel/platform.c b/arch/xtensa/kernel/platform.c
index a95ba05b0abe..25fd2cf1fe08 100644
--- a/arch/xtensa/kernel/platform.c
+++ b/arch/xtensa/kernel/platform.c
@@ -12,12 +12,10 @@
  * Chris Zankel <chris@zankel.net>
  */
 
+#include <linux/printk.h>
 #include <linux/types.h>
-#include <linux/pci.h>
-#include <linux/time.h>
 #include <asm/platform.h>
 #include <asm/timex.h>
-#include <asm/param.h>		/* HZ */
 
 #define _F(r,f,a,b)							\
 	r __platform_##f a b;                                   	\
diff --git a/arch/xtensa/platforms/iss/setup.c b/arch/xtensa/platforms/iss/setup.c
index e28dd53d7df5..554758823ff5 100644
--- a/arch/xtensa/platforms/iss/setup.c
+++ b/arch/xtensa/platforms/iss/setup.c
@@ -11,23 +11,13 @@
  * Copyright 2001 - 2005 Tensilica Inc.
  * Copyright 2017 Cadence Design Systems Inc.
  */
-#include <linux/memblock.h>
-#include <linux/stddef.h>
-#include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/errno.h>
-#include <linux/reboot.h>
-#include <linux/kdev_t.h>
-#include <linux/types.h>
-#include <linux/major.h>
-#include <linux/blkdev.h>
-#include <linux/console.h>
-#include <linux/delay.h>
-#include <linux/stringify.h>
+#include <linux/kernel.h>
 #include <linux/notifier.h>
+#include <linux/printk.h>
+#include <linux/string.h>
 
 #include <asm/platform.h>
-#include <asm/bootparam.h>
 #include <asm/setup.h>
 
 #include <platform/simcall.h>
diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
index 829115bb381f..b7e4580d3636 100644
--- a/arch/xtensa/platforms/xtfpga/setup.c
+++ b/arch/xtensa/platforms/xtfpga/setup.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
+#include <linux/slab.h>
 
 #include <asm/timex.h>
 #include <asm/processor.h>
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
