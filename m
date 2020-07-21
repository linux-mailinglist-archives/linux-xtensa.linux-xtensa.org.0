Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 28E112275FD
	for <lists+linux-xtensa@lfdr.de>; Tue, 21 Jul 2020 04:48:08 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id AA3E25867;
	Tue, 21 Jul 2020 02:31:44 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by linux-xtensa.org (Postfix) with ESMTPS id E8B4C5816
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 02:31:42 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x9so9608693plr.2
 for <linux-xtensa@linux-xtensa.org>; Mon, 20 Jul 2020 19:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cksS06U1qnevoEJIlv+grV0Oemjc9a1w0y2kvjgWiuI=;
 b=HuFuDos0EOAHqmklXCF6gWZVZJzosnL8X6CGvqcgM6Kqt0FAoBhM18o9itrl3wkJ9D
 gfELwTrd2bcEv7VjAZVmMIIWXZQOh1WHsuk5R4BY1m+gd4sHfU41p72+wqttC/euBOku
 w4Aq0LdhD98P7K3hM5FSwH5kDcPkvfiVGvlPo4Xr3FmhbrYzyCAPr4JZ4GdKYCg/DZEU
 BII6Oj/0/CJh2B+PO2MUN/Bh+K8UVqhwykSnDRewsUDKAm+iBqRWKRxu5cn5nf1Tmame
 MoAZZObOq1ucNhnSXD/cFC8bJ2LyWcHg9kt0MvlSvhvZJ87ct10JOnoa/eOg02L7K4bt
 TGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cksS06U1qnevoEJIlv+grV0Oemjc9a1w0y2kvjgWiuI=;
 b=NSWgOUjaEnpXIVmRH4A5s/A0G+aQKPk0nW+Af5uI512FixGUqirI7Gte4JzGVSzR0J
 7VyLnt12KQepZLnNQuMJW/0XCzVNz23ckR2pGrz1xEf5Dko6BFLi/GmNLFTXg1wvOUPp
 DCgTiiMNkW30SxVlEeYh8X7n7mV3rIkkMaD/80E/sAFy25eD5M+b3HXVV0KB5UY39VTk
 LMilkb8fsWtoWS7P0oGPHzX4kR1fNwcU+IlQrxkAtwqJleLlwTAB0kIEw6AP5ZNNypRS
 A8rEgFDJ9uHmrQIQJZZyus94buSCCrOBNlfqJ5pTRlruk2NyQTrMdc1yOFUNqQvkcliN
 w2UA==
X-Gm-Message-State: AOAM531fBJ7PBHx5J+0t+MSOzxEim33LD8OvMecjdGgzROaHsU+Be8uu
 h4g16dVrAgSr5AiGQaeQKC//xj5N
X-Google-Smtp-Source: ABdhPJzEYBvW4gWqRIZtm8Q/iIG1zLRgwM7HyAYiumOOM4fHYbUEO6Z81UKPatzXGRlfXb10duvBtg==
X-Received: by 2002:a17:90a:d684:: with SMTP id
 x4mr2375673pju.62.1595299683886; 
 Mon, 20 Jul 2020 19:48:03 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id p9sm14336962pgc.77.2020.07.20.19.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:48:03 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 20 Jul 2020 19:47:51 -0700
Message-Id: <20200721024751.1257-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Mike Rapoport <rppt@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix closing endif comment
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

Commit 8f74afa22d9b ("xtensa: switch to generic version of pte
allocation") introduced the following build warning for xtensa
  arch/xtensa/include/asm/pgalloc.h:67:8: warning: extra tokens at end of
  #endif directive [-Wendif-labels]
Fix #endif comment.

Cc: Mike Rapoport <rppt@linux.ibm.com>
Fixes: 8f74afa22d9b ("xtensa: switch to generic version of pte allocation")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/pgalloc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/pgalloc.h b/arch/xtensa/include/asm/pgalloc.h
index 699a8fdf9005..d3a22da4d2c9 100644
--- a/arch/xtensa/include/asm/pgalloc.h
+++ b/arch/xtensa/include/asm/pgalloc.h
@@ -64,6 +64,6 @@ static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
 }
 
 #define pmd_pgtable(pmd) pmd_page(pmd)
-#endif CONFIG_MMU
+#endif /* CONFIG_MMU */
 
 #endif /* _XTENSA_PGALLOC_H */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
