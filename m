Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 76E6E22FFAC
	for <lists+linux-xtensa@lfdr.de>; Tue, 28 Jul 2020 04:39:20 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7AF442631;
	Tue, 28 Jul 2020 02:22:42 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 0023F2623
 for <linux-xtensa@linux-xtensa.org>; Tue, 28 Jul 2020 02:22:39 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d4so11061388pgk.4
 for <linux-xtensa@linux-xtensa.org>; Mon, 27 Jul 2020 19:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUYI/adhyPiJsueR+/blXGuxT74bedpBLyWN5AzH71w=;
 b=CsMPMGwi5qjh99+swfSsReaiMN1qq+LT1t0y0ZOTQIXJLGdNORymR9nu4xE/IM1dER
 79j83O+lMV2cp1RWIIPguXuX+QHPsKMq63S9aoFkycDHNEdPrriBG2+gJ/6SJrVZkfm4
 tfYaVpb3mfRA94cNvS8CbW1Irh15z/HBoVXu0AdcMTsh2ADSw+N8Ie9FefhGNSS1BvLg
 AADSh17QNCD6+1s9Jq/GgXPT8IAaEjbDtCXhxGekzj3TAXbRg5IDlYynSgZU4sGkT2Nq
 i+uNetnqlvLrGcPY7wg5cGkRgPKJbv8IGpyw0rWoOpDYzODQIdxcKZljBtnCQ5VbBNr4
 aBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUYI/adhyPiJsueR+/blXGuxT74bedpBLyWN5AzH71w=;
 b=N69hkqgtqI1pKxgOTrU4Xvfdlm3nKRwNk954Uvtq+G3hleGgc6PUxJDgMrmhJO+Ylp
 rzBZiTCdWIzs6w79AwgplcdnJB3BKJNMXlneMJomWjly+an2ZcoxwGjMD6T0BiyrKf29
 9yYN5vVawxr1pa9BLuh+OMhhoHBSiCqUlxlZXhUi1rupUsbhAa5ba1r6eKFjM5orV+Am
 3+lKkc1RGsNNvOqzKqT7cjp0EpLdP+W6HRPW3fX6WfHuGj5Uze95G+xqJOaQgcO7Zwi+
 hi7nggmfam1NX46VxZcXnq1uPte2Z5ZitKsDgrv5fcASS+tm+YkZ4Z7GMFDEvHSMg52C
 SxRQ==
X-Gm-Message-State: AOAM530jM2IVH8tb6knv2d9rmjiqK2hMSrX+TNL3LB2l70+UcQabUgfX
 X/3nlIx6HyC2Q/IeMPPXvNZ3GlRo
X-Google-Smtp-Source: ABdhPJwEW/i6cr8yKGUV4iUrV+oc9zuODe5AZFGhlurHT47TWT1ZKuVR/jgiS2zUyWoOzg6xYrAKag==
X-Received: by 2002:a63:df54:: with SMTP id h20mr21931159pgj.319.1595903956116; 
 Mon, 27 Jul 2020 19:39:16 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id q66sm16428921pga.29.2020.07.27.19.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 19:39:15 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 27 Jul 2020 19:38:53 -0700
Message-Id: <20200721024751.1257-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id p9sm14336962pgc.77.2020.07.20.19.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:48:03 -0700 (PDT)
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-kernel@vger.kernel.org,
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
Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
Fixes: 8f74afa22d9b ("xtensa: switch to generic version of pte allocation")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Andrew, could you please take this patch as the change that it fixes is
currently in the mm tree?

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
