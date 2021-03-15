Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3CF33A9F2
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Mar 2021 04:21:43 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 73B2D4263;
	Mon, 15 Mar 2021 02:57:26 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by linux-xtensa.org (Postfix) with ESMTPS id AC5E54237
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Mar 2021 02:57:25 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id n9so18680158pgi.7
 for <linux-xtensa@linux-xtensa.org>; Sun, 14 Mar 2021 20:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eBf/sk5E7J2NnRI5SQxV/VesLFcwwvK7iLArpCnMv5Y=;
 b=kLHUejzbCkynKeZB5k+q9YBW0BTGkqZBrTTsvPj4kkRehDzf+E58x5BAv3KBiM1fHA
 7L+yXusaDWv0yIR1AlCDDoy+i6N7aMZ3MjGh3NGjV+myjeE0b0qAFZQaal/EZSZmjctA
 LhyZrJ3DjcF5jbuuhGqwP8J4e8FrsCYKYeUxeACCIecDAiAsh0Gag5gCpxN0tsaoHLOM
 p2C44jQY/kScUlEGgkfphE6bt/90VGzauhSFCiafHIf1uiiFWcaXWwp0z+eDF8DKdRT+
 A0dEDpK28iGmVIvSVK02/P5zQeqsUnwmlTZGiAhm8yu1VRU/ma3ikF96pAcJoXAzl/YM
 Ylhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eBf/sk5E7J2NnRI5SQxV/VesLFcwwvK7iLArpCnMv5Y=;
 b=pR81oOi07My1E4bt4A4wKp9TGsmu+6bzK4EMiMqkuTmxTm45LO0OR1Q4ZEOrZODLYy
 kA9FUYLbrmAjDpwRZSITLvDy/5bfmELSH/uQPvk0Xl5b0B+857TTj5VGvclUvZaRJ/RU
 /r8S9Q7hPw6pOWyUEpKLysAKXsVGfDD6VQUEFHFMSGvRYsOf17GFzRHW+wwPtckXXrTU
 vibE8nIJ+VOnbuQKK8gCVXeQlwd0CaoMAYDhVQmkTYcJeVGjo2JCjfn9niS3+XC1BFEO
 KM8qQ9verhwcNNXA721ds6iGizes7sWpMLaFFvn//zJa5/ZTWtBGCgbu7/UcFDPAlT6q
 0FAQ==
X-Gm-Message-State: AOAM531KL/fEgWRcKC103VCgUgDp0m507EKqMugCsQ2kLOIolY8H+htL
 eYa4SQwn+EK1MjrNvZuQ//nR9KLBckA=
X-Google-Smtp-Source: ABdhPJy3srCuCO8feKWf1LX18wu+f14F7eeV9Ldp8g3AfJIwOCCU4/klkIDE0PpKNngrRSbxocHYVw==
X-Received: by 2002:a63:fa52:: with SMTP id g18mr21409341pgk.193.1615778501164; 
 Sun, 14 Mar 2021 20:21:41 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:6493:2d45:37bd:648d])
 by smtp.gmail.com with ESMTPSA id i2sm10781030pgs.82.2021.03.14.20.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:21:40 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 14 Mar 2021 20:21:28 -0700
Message-Id: <20210315032128.11145-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix pgprot_noncached assumptions
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

pgprot_noncached assumes that cache bypass attribute is represented as
zero. This may not always be true. Fix pgprot_noncached definition by
adding _PAGE_CA_BYPASS to the result.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/pgtable.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 4dc04e6c01d7..d7fc45c920c2 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -280,7 +280,9 @@ static inline pte_t pte_mkyoung(pte_t pte)
 static inline pte_t pte_mkwrite(pte_t pte)
 	{ pte_val(pte) |= _PAGE_WRITABLE; return pte; }
 
-#define pgprot_noncached(prot) (__pgprot(pgprot_val(prot) & ~_PAGE_CA_MASK))
+#define pgprot_noncached(prot) \
+		((__pgprot((pgprot_val(prot) & ~_PAGE_CA_MASK) | \
+			   _PAGE_CA_BYPASS)))
 
 /*
  * Conversion functions: convert a page and protection to a page entry,
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
