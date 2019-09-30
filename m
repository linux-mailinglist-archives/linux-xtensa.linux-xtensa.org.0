Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id CBA30C1B06
	for <lists+linux-xtensa@lfdr.de>; Mon, 30 Sep 2019 07:33:35 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 4CAFC64A6;
	Mon, 30 Sep 2019 05:26:42 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 003B06489
 for <linux-xtensa@linux-xtensa.org>; Mon, 30 Sep 2019 05:26:41 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id b20so8015671ljj.5
 for <linux-xtensa@linux-xtensa.org>; Sun, 29 Sep 2019 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EX2iagCYxbbfVSwNYAvSqT0RRit3O7vA4/pCLIgEK3k=;
 b=BTSC+ywEzAsZ+CWcpXIMpwxOVr4IgVpr8bugpLObWbhfxXbIoeEHKrBV8VDmSci2ed
 H1fVj5X1fLaNudPGpnGZLEt15iqUptIrg2R37q0yJXSdNhZACSitnDZGe5DwYKk2RFVo
 nLlRVrkt0xPniiGa8Je6blBiH6xwUz5QmItGW1zrXqpswPl0eK08CLJBVEpJpchJczeO
 epOB2/6H1nwExTJmu/TbXTasMRxnn8Wp2bufbFGwJHFspRYkMXhT2AA/3s1uewg6+3fK
 BwqYRlm8wCWYcKMc8BQahpv1cDYzmXXV7B1MVZvw9fzHuGZS86eu+gxyiOBpsU0XLu8C
 m5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EX2iagCYxbbfVSwNYAvSqT0RRit3O7vA4/pCLIgEK3k=;
 b=skr6lgM3/p2/pnkwUCHvsgnCYgt7P89F0h1EBavvsKp5592pWGItI1kMajs8IjuB04
 zcvJ3KSgYHq8/a2qHE+oX+3goxFRADRfkCr4aefDERqYC97iFrRc19urYUu2B1y4eDdi
 F8OZQDKYUtxZLJFuOhGK0l++BVuzQDYgLKOKhbQVsJiBngMQX1SZO3ElrtXUuXSpzifr
 UTSx/9RyUxe8z9WByMLpQIr5jISSPEmyAyOFrwfMdSj9GUPsWFxZeEALThoZi3uluqO8
 ZY6KLQapCsJ7g8xlzvx9mrfhPAXfI2fGvR09jv6K9s9Mi6+pXHNi9udtzGAQJMDC5a6O
 zXrA==
X-Gm-Message-State: APjAAAXWDZhESQQcEUrzZVf3Y/az8nnLB7Z5/KvLhlyQZt1NQxun1DcZ
 LYkq1hEZyzHWxaUWYxNUUS4rjwj0
X-Google-Smtp-Source: APXvYqytAV2l2Xi35Zip6ns5etJhccB97zqNPoRkqCGSk4OpVWs0juxIalOLeDyUX8n/wqZSkqUGvQ==
X-Received: by 2002:a2e:1415:: with SMTP id u21mr11124112ljd.22.1569821612915; 
 Sun, 29 Sep 2019 22:33:32 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id k23sm2944211ljc.13.2019.09.29.22.33.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Sep 2019 22:33:32 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 29 Sep 2019 22:33:03 -0700
Message-Id: <20190930053306.7029-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190930053306.7029-1-jcmvbkbc@gmail.com>
References: <20190930053306.7029-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/5] xtensa: move MPU constants from .data to
	.ref.rodata
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

MPU attribute mapping table is R/O, move it from .data to __REFCONST
(as the rest of the _startup code where initialize_cacheattr is used is
in the __REF section). This allows executing initialize_cacheattr before
the data section of the XIP kernel is relocated to its place.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/initialize_mmu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/initialize_mmu.h b/arch/xtensa/include/asm/initialize_mmu.h
index 3b054d2bede0..e3e1d9a1ef69 100644
--- a/arch/xtensa/include/asm/initialize_mmu.h
+++ b/arch/xtensa/include/asm/initialize_mmu.h
@@ -23,6 +23,7 @@
 #ifndef _XTENSA_INITIALIZE_MMU_H
 #define _XTENSA_INITIALIZE_MMU_H
 
+#include <linux/init.h>
 #include <asm/pgtable.h>
 #include <asm/vectors.h>
 
@@ -183,7 +184,7 @@
 #endif
 
 #if XCHAL_HAVE_MPU
-	.data
+	__REFCONST
 	.align	4
 .Lattribute_table:
 	.long 0x000000, 0x1fff00, 0x1ddf00, 0x1eef00
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
