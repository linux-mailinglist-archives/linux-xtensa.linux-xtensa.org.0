Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8F38E228FBA
	for <lists+linux-xtensa@lfdr.de>; Wed, 22 Jul 2020 07:34:36 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id D8E8952EA;
	Wed, 22 Jul 2020 05:18:11 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 22A022D7F
 for <linux-xtensa@linux-xtensa.org>; Wed, 22 Jul 2020 05:18:10 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 207so587340pfu.3
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPdtIeRiCWto7/r2HlIJUB1ELu9p8kFXxKGN0Kv2RV8=;
 b=RK6y0inkf644bH7HMH3f/Y3S/+Xz7UIkD7tQsi3+aNhRQ84SHE7xF9nBpzfxSMlD3p
 OC+DYYoDu5CUgzP3mqX9ER/P9Wswja7uydNhG7vnkpBlQRBd6Pz0Bq79Sunex+DwwPtj
 VhOYnXD8+pBRtUKs0US5PEKDkrGa0qbsxn+YtVn7ljszUtg0wjUrdK1c0NJGKM62Gp9c
 pXFXpIhhE+3J05/bDZP4HQjN/GLchnqv6XxMBJA0/hEcoJR9ANdW3H3tY+P0jfpWg/lW
 5sPf7zGNvB021voSG5oHznkTTM+rO7ceybTn7MWkWsFsde3/hGDjWzYbosDNvIfeUUqk
 vC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPdtIeRiCWto7/r2HlIJUB1ELu9p8kFXxKGN0Kv2RV8=;
 b=qPIAnAkVPNtkz4EFOd0tVKDHII4tacsCgY0uRCHicsX1FGKAV6EoCTewPojeskgHVC
 Tmb3bh/3kQRkLJ9JhX0KAIkmznaupUSEBcZWN2/YOw9dU6uT07AVSaLj9YooFT+xQkpp
 wz26w9I/E4hs80/qK6yxqTxCH4gBaWHbS6og1BDG50r9enF+MculqhhNnL2Q9Ydeni4X
 rWGHd5rgShCmAb+IzmRYs4rsF+J6p8QiSQlf4kSbehxYRV/9eRHaMqFYSbT0qbObiUhP
 Z0yO+X7Dl9S1bBgG54wQmtmgRPI1Gh850yD4/yvGHdGYxGYWSzGV1aleiSgUpnFA98tV
 NI2g==
X-Gm-Message-State: AOAM5318B0kwoODivPtoXs9A+MRou6PfQ2iNrIkKtJYbpdnQN0FEpokx
 F6mKJLU/eGfJZlsYYEJoL9h01fFg
X-Google-Smtp-Source: ABdhPJzEnds+PLkKN8eDNmkYK4uD6SHGLPBFNNcLnzAPmEtZz/Xo2QR9+lBpb5bJda5G1L3k/3hTBw==
X-Received: by 2002:a63:e057:: with SMTP id n23mr24950973pgj.368.1595396073565; 
 Tue, 21 Jul 2020 22:34:33 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id q5sm22536608pfc.130.2020.07.21.22.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 22:34:33 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 21 Jul 2020 22:34:17 -0700
Message-Id: <20200722053417.5915-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722053417.5915-1-jcmvbkbc@gmail.com>
References: <20200722053417.5915-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: [Linux-Xtensa] [PATCH 2/2] xtensa: add uImage and xipImage to
	targets
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

uImage and xipImage are always rebuilt in the xtensa kernel build
process. Add them to 'targets' to avoid that.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/boot/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
index 801fe30b4dfe..f6bb352f94b4 100644
--- a/arch/xtensa/boot/Makefile
+++ b/arch/xtensa/boot/Makefile
@@ -18,6 +18,7 @@ export BIG_ENDIAN
 
 subdir-y	:= lib
 targets		+= vmlinux.bin vmlinux.bin.gz
+targets		+= uImage xipImage
 
 # Subdirs for the boot loader(s)
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
