Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7E54230AF
	for <lists+linux-xtensa@lfdr.de>; Tue,  5 Oct 2021 21:21:26 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9625B7706;
	Tue,  5 Oct 2021 18:50:05 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by linux-xtensa.org (Postfix) with ESMTPS id B47DA7700
 for <linux-xtensa@linux-xtensa.org>; Tue,  5 Oct 2021 18:50:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id y5so151942pll.3
 for <linux-xtensa@linux-xtensa.org>; Tue, 05 Oct 2021 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dp7Oi0QvrWBA209df2TQmdc5am4px2pX99t2tf1pAOA=;
 b=qeegXRnHsBlkibk5tUFoabMfu3zzlKUEKQH7rYQ28kZj6ymxw4SS/GEpOGOgEU5luQ
 9f3CLmT4pDRCeIkZPL3qADZe7KgRF4pPRr189hXw5RQnYwKwX3VWzo1O7Yk0OybN69yN
 JdH+1YDGcI9p9tzvNzNT6IKMCCmR/S4fXDM1D8Wj/SmpGyUp8UN9l7JeHOCmqUWAb5oz
 GBG3ecNgmff2cNvvaXs3Q8Z2uldi6ztVehlpjtZM1REmnoVRR681ihHeCpcNEDH/Lb7b
 tm4iiAokTt3t3P57gIsxPRxdtUAy9TJNFKYGtjWLrmo7eXmmTSBI5BWM6TLZSIWQuiN7
 SecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dp7Oi0QvrWBA209df2TQmdc5am4px2pX99t2tf1pAOA=;
 b=MKRnGu5tp/RpkOlbrUq93w6XMynhdpsHLwaRNG52Ca3cjij2x+Voev5vsfFQIAVXHH
 hZhl07ZumcdhUqdz/KwOtjizYw8KgsW4R3+RUvQ176XFfATX3jR2QBmm9x+C9jra3EuZ
 RMgV7urj9IWaWqzzZ5Vk/6H2sZHHSRQMhAnNItVz7Uu1K7kg/FB70RcN/PPC6NvvkQ1Q
 WhmiZquB82Thq1oI83s0VEgaXPIridoFfyXKmi9LDetjV8fuP7csU1TmJ0EHWD6OTGHw
 g2qSzdJeRuuGCiSNKDt8Uz68detRQ14N7F05k2lrUxv/PvaNv0mAN91QaX9ymdlrpZ3r
 Hxrg==
X-Gm-Message-State: AOAM532pJVU41/wu4ZF1/5/zVCycKvE08fb1vYm3D1S9BFTEpU+7nLm1
 bZoL7i+ZGasfzR/U8QB9WVKg1lsXPrU=
X-Google-Smtp-Source: ABdhPJyJTPXzQzt2fRdm8g4PPQOf0uG3dyJc5pU2jYIUzBuSTXMcR1kvR1pDwVkT0Bq1U+iQTBRFzg==
X-Received: by 2002:a17:90a:a88a:: with SMTP id
 h10mr5779808pjq.226.1633461681055; 
 Tue, 05 Oct 2021 12:21:21 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:ecea:c8ec:ff7b:52])
 by smtp.gmail.com with ESMTPSA id s19sm1482211pfh.18.2021.10.05.12.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 12:21:20 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  5 Oct 2021 12:21:11 -0700
Message-Id: <20211005192111.14732-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: xtfpga: use CONFIG_USE_OF instead of
	CONFIG_OF
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

Use platform data to initialize xtfpga device drivers when CONFIG_USE_OF
is not selected. This fixes xtfpga networking when CONFIG_USE_OF is not
selected but CONFIG_OF is.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/platforms/xtfpga/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
index 4f7d6142d41f..59b7f11f2a3e 100644
--- a/arch/xtensa/platforms/xtfpga/setup.c
+++ b/arch/xtensa/platforms/xtfpga/setup.c
@@ -66,7 +66,7 @@ void __init platform_calibrate_ccount(void)
 
 #endif
 
-#ifdef CONFIG_OF
+#ifdef CONFIG_USE_OF
 
 static void __init xtfpga_clk_setup(struct device_node *np)
 {
@@ -284,4 +284,4 @@ static int __init xtavnet_init(void)
  */
 arch_initcall(xtavnet_init);
 
-#endif /* CONFIG_OF */
+#endif /* CONFIG_USE_OF */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
