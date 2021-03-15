Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B476B33AA19
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Mar 2021 04:45:43 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3E95E5289;
	Mon, 15 Mar 2021 03:21:26 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by linux-xtensa.org (Postfix) with ESMTPS id E76CD2634
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Mar 2021 03:21:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id e2so9353222pld.9
 for <linux-xtensa@linux-xtensa.org>; Sun, 14 Mar 2021 20:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZXwTrKTQx/OD6J1Cdgr6noLCkJcjXYe7PmZkNPxSLw=;
 b=GW+3M0F4XTrVee2/9JkZlTXDDFvjDx9LnhyGu3Fz7YcGkOtCZjg6/M345D7nHUgOxv
 RMb9CEfp4fuasgYTcW9hx/wI5G9vJN0G3L0Az6g7Dtlyys6soNQ+Rp7Wk8FvocVSBIxG
 tOg8Mijm6o7NzOt8q74VMyruY3+LxGhRTsVjgxAHVYm0ytdPNgVICCtufQ16aXgUr6VI
 Eq//xgdPhgfXbmaz+wct4yZKow3TIn4pdG07xNjmv0hpLMFMGJ74iAvWeSOa53XL0o3A
 5cgYRKcP55NJRyPcNQXcWFUP6y4ZjDfCuDlLUNl+twexj/oCBufOGaVVYmTnTqjkyqhz
 5hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZXwTrKTQx/OD6J1Cdgr6noLCkJcjXYe7PmZkNPxSLw=;
 b=URGoPa8NGbYxcIqeP/D1W+A5lvz1k+JEMfHZezHh8QNy1VqTrvKFwlJ4SwGzvq9VMG
 7SWzZQZ6FgSdGEzSuqJ3wW36+IFHfyxd2RDosuN6VkwJISruWvTjllBJXd8xp8ext8Vy
 8fhZGJWpBRVyX49NaUm4kl3C8hyoozWGUYnjRAXlQwsM7hs/D6VvRPZLrn0CAg6HbXHS
 6TWqhHtMoxuqE6zeJTKo19kVfc8a4ugRmW+5k9cVsbmkOTgw0bjkTGt2JF71WJTI0ZXj
 o8TmZwNo0zD3daE/4BdVOfjFrKsfpe3jR83KWgKDGac6ADjbyfGVLRHzlhXvxgWVSVeC
 pyXw==
X-Gm-Message-State: AOAM530CBaycCd45L48REMOyNIa+YX9I/MB7WGSkRqET40cazzfD3rNa
 IJxAofIoPeZvwrETTs8j1T9XCGnhVUY=
X-Google-Smtp-Source: ABdhPJzPpq5RIU2aIz5fDXpDTCJ1X17Eoipi87SCTLHI72uyBaqOG78NBM2kPoYCy8F5mcqtwbzYdQ==
X-Received: by 2002:a17:90a:7045:: with SMTP id
 f63mr10517644pjk.35.1615779940495; 
 Sun, 14 Mar 2021 20:45:40 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:6493:2d45:37bd:648d])
 by smtp.gmail.com with ESMTPSA id e11sm11761771pfm.24.2021.03.14.20.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:45:40 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 14 Mar 2021 20:45:33 -0700
Message-Id: <20210315034533.20643-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: drop extraneous register load from
	initialize_mmu
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

Commit a9f2fc628e3a ("xtensa: cleanup MMU setup and kernel layout macros")
removed the use of a2 in the beginning of the initialize_mmu macro, but
left the register load that is no longer used. Remove it as well.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/initialize_mmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/initialize_mmu.h b/arch/xtensa/include/asm/initialize_mmu.h
index 05cb13dfe6f4..9793b49fc641 100644
--- a/arch/xtensa/include/asm/initialize_mmu.h
+++ b/arch/xtensa/include/asm/initialize_mmu.h
@@ -73,7 +73,7 @@
 	_j	2f
 
 	.align	4
-1:	movi	a2, 0x10000000
+1:
 
 #if CONFIG_KERNEL_LOAD_ADDRESS < 0x40000000ul
 #define TEMP_MAPPING_VADDR 0x40000000
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
