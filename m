Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3014E14F328
	for <lists+linux-xtensa@lfdr.de>; Fri, 31 Jan 2020 21:28:22 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id C409E645D;
	Fri, 31 Jan 2020 20:17:33 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 339DA6464
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jan 2020 20:17:32 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z18so5783433lfe.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jan 2020 12:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cp8WM/bDx8ZI4sk7ACj6rJijMQPmVKvelurkwfOg69M=;
 b=IzeX7lvYgZQmlvxrRE9Xhco+yYpGLIm99hnntroIBHZB7pAO6LbG2LcWTakVoCl9Bj
 CIep8400OriE/gQCwpt+WCfc/mZ3SibXeXIgiN4JKo61VUrwMqpJRM/zW2C+BOX9fr7n
 QbQI4PSTmnH3iBfz0Tmfu5OmTG1TcqGrKg+/xuZs3t5CSrVWXwBrTdm8AbMll6R0GjiJ
 6wCdtd84ECCLA6bTowtP/kSSEv6HQuxY/bt3VK+OOX7dwyqs60q9bD/QXLJ1KU93NrKH
 5ODtScldjazv+7IgEHL01Ldnruji4ie/76i9Z2/eVIYpltZrfutw97k0gVQivQMdUWsO
 Zo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cp8WM/bDx8ZI4sk7ACj6rJijMQPmVKvelurkwfOg69M=;
 b=N3Ezq2Y2WdNVeM6/KoqwboebnxwL/1+ifvPiKNQw7YxhgTarkxpgZt2GD9RB6pybKs
 yR/UBGrVwNT22hZnS1GN1eaNBlHriN4nPNejrlQ8rcoTKpIXAplyY5DTfA6QCAT5rUvl
 hre5ufpGzpuWplRCbk755M1pQwppjhmi22mibh7spxWDze2IWJM7fK/QBW8yyxqg90Qp
 b7NbtlmYckrsGiaIyQ/yxMZWaigNTtTDnhU/Hl6sO6hdlxZBg8e9HyU0dedPcWUH6WZm
 7diAgKblEIAmtuF4BafDkMaZx4Sa96WBdtNJDcYASCT9U72hGWSD3epLyO6kOCdSjJ6Q
 RCFg==
X-Gm-Message-State: APjAAAUsZWXUirzE68rGsAGHeOAMqIbLpVoKQws2/+bsOebHMpHgdSFt
 qFOojFHOkETP0B82MbrkHMoukhSa
X-Google-Smtp-Source: APXvYqxOxAVsuXy5n2NSFcJiRPrAePeF7/BCLa7YHFQYpdMEAqGUa4JrKNJvMWy97cFIcmN1A0voTg==
X-Received: by 2002:ac2:5f68:: with SMTP id c8mr6176026lfc.196.1580502498755; 
 Fri, 31 Jan 2020 12:28:18 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 5sm5215216lju.69.2020.01.31.12.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 12:28:18 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 31 Jan 2020 12:27:51 -0800
Message-Id: <20200131202751.10375-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131202751.10375-1-jcmvbkbc@gmail.com>
References: <20200131202751.10375-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 3/3] xtensa: drop empty platform_* functions
	from platforms
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

Provide missing default implementation for platform_init and drop copies
of default platform_init, platform_setup and platform_heartbeet from
platforms/*/setup.c

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/platform.c        |  1 +
 arch/xtensa/platforms/iss/setup.c    |  9 +--------
 arch/xtensa/platforms/xtfpga/setup.c | 16 ----------------
 3 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/arch/xtensa/kernel/platform.c b/arch/xtensa/kernel/platform.c
index 25fd2cf1fe08..ac1e0e566995 100644
--- a/arch/xtensa/kernel/platform.c
+++ b/arch/xtensa/kernel/platform.c
@@ -26,6 +26,7 @@
  * (Please, refer to include/asm-xtensa/platform.h for more information)
  */
 
+_F(void, init, (bp_tag_t *first), { });
 _F(void, setup, (char** cmd), { });
 _F(void, restart, (void), { while(1); });
 _F(void, halt, (void), { while(1); });
diff --git a/arch/xtensa/platforms/iss/setup.c b/arch/xtensa/platforms/iss/setup.c
index 554758823ff5..ed519aee0ec8 100644
--- a/arch/xtensa/platforms/iss/setup.c
+++ b/arch/xtensa/platforms/iss/setup.c
@@ -23,10 +23,6 @@
 #include <platform/simcall.h>
 
 
-void __init platform_init(bp_tag_t* bootparam)
-{
-}
-
 void platform_halt(void)
 {
 	pr_info(" ** Called platform_halt() **\n");
@@ -38,6 +34,7 @@ void platform_power_off(void)
 	pr_info(" ** Called platform_power_off() **\n");
 	simc_exit(0);
 }
+
 void platform_restart(void)
 {
 	/* Flush and reset the mmu, simulate a processor reset, and
@@ -46,10 +43,6 @@ void platform_restart(void)
 	/* control never gets here */
 }
 
-void platform_heartbeat(void)
-{
-}
-
 static int
 iss_panic_event(struct notifier_block *this, unsigned long event, void *ptr)
 {
diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
index b7e4580d3636..4f7d6142d41f 100644
--- a/arch/xtensa/platforms/xtfpga/setup.c
+++ b/arch/xtensa/platforms/xtfpga/setup.c
@@ -57,22 +57,6 @@ void platform_restart(void)
 	/* control never gets here */
 }
 
-void __init platform_setup(char **cmdline)
-{
-}
-
-/* early initialization */
-
-void __init platform_init(bp_tag_t *first)
-{
-}
-
-/* Heartbeat. */
-
-void platform_heartbeat(void)
-{
-}
-
 #ifdef CONFIG_XTENSA_CALIBRATE_CCOUNT
 
 void __init platform_calibrate_ccount(void)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
