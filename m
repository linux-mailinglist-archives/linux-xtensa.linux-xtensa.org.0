Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E5492C1B08
	for <lists+linux-xtensa@lfdr.de>; Mon, 30 Sep 2019 07:33:39 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 69AB164AA;
	Mon, 30 Sep 2019 05:26:46 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 683936499
 for <linux-xtensa@linux-xtensa.org>; Mon, 30 Sep 2019 05:26:45 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j19so8043490lja.1
 for <linux-xtensa@linux-xtensa.org>; Sun, 29 Sep 2019 22:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p18OX2g38Sk3qCgt+3M9exfh0aZBsuiEJJd286cBdxE=;
 b=KoCCsn5A/0xx97nfdMEyFnezXuyinh43yqQ6SCdhlk2zINw6c2MXT29p8r3xLfNPCS
 67l1Dgo2jz43wsgMht0Gtjjt1q4nlwnb2KLQXfCtRICgkTU5o0e+OUm75D1x8QpSGVQR
 uMD9TdepzYMWn/za25zkZEQoOhrCcBHy0w8Ty0SfxdshDCFfgZmz7ZBTBxRRNn4T0FT/
 fmOYa4/l6OU57qSSHoDFhja+gUl/C3e/Lu2xL3TCHfbIxQpTL534K3flgsOlJqNs5iQv
 BIj0JANtC0m+niYD7p/oa9h6CAy003zJ2BpMpXe700vaYR0NMQP398bH7RXEhjUFeMe5
 p01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p18OX2g38Sk3qCgt+3M9exfh0aZBsuiEJJd286cBdxE=;
 b=Nqjy0JqkzmFJb4DvjyjrV1uzHIMOhjnUxNGMs4L67/DG82BwzBnqc2zkOTH2+eBmKT
 KAC7sPzuz645/5/RqdxTmW7LBbfsRIMPJwYl6k2B0xhdjCVAfyS2F6WAeE99pSbaXd+b
 nLYXJ/NRKFz+/Jxt07ZSvD4kpKV3D+gpsMinv6BCx4ayuSAaBogBx6P0+EbrWOtXIiUT
 zRTTZmaVXkxHKdITM39A5cCTeju67wsgn/UO32bRIO+mHqyAtWQJ/XZHAWfJDpX0q/Uu
 TD/AxsGtazvnrZ+VtbDsGmZsE3yKn1tnRIgGdXDoTnIZ2t6gJiHLuJ7BaiA2jABxgOva
 I7yg==
X-Gm-Message-State: APjAAAUSMT/nP3BOShbkJmVWE4i+rDRuyU24Zt5EaGflHPbg+cNg+ze4
 M5NQsr9m0cAB91WLDEWjmP34Y1+F
X-Google-Smtp-Source: APXvYqyRd2J5GqsnbFBXo8z+iSAW3qKBcA84+zzJoDpXloQ4oeR/8dptdGQzD1QSe6uhAarMTseILw==
X-Received: by 2002:a2e:9584:: with SMTP id w4mr10890099ljh.145.1569821617375; 
 Sun, 29 Sep 2019 22:33:37 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id k23sm2944211ljc.13.2019.09.29.22.33.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Sep 2019 22:33:36 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 29 Sep 2019 22:33:05 -0700
Message-Id: <20190930053306.7029-5-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190930053306.7029-1-jcmvbkbc@gmail.com>
References: <20190930053306.7029-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 4/5] xtensa: use correct symbol for the end
	of .rodata
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

Use correct symbol for the end of .rodata section when dumping virtual
memory layout. This fixes odd rodata size with XIP kernel.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index 79467c749416..2162b640d3de 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -193,8 +193,8 @@ void __init mem_init(void)
 		((max_low_pfn - min_low_pfn) * PAGE_SIZE) >> 20,
 		(unsigned long)_text, (unsigned long)_etext,
 		(unsigned long)(_etext - _text) >> 10,
-		(unsigned long)__start_rodata, (unsigned long)_sdata,
-		(unsigned long)(_sdata - __start_rodata) >> 10,
+		(unsigned long)__start_rodata, (unsigned long)__end_rodata,
+		(unsigned long)(__end_rodata - __start_rodata) >> 10,
 		(unsigned long)_sdata, (unsigned long)_edata,
 		(unsigned long)(_edata - _sdata) >> 10,
 		(unsigned long)__init_begin, (unsigned long)__init_end,
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
