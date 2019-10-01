Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 193DEC2E7A
	for <lists+linux-xtensa@lfdr.de>; Tue,  1 Oct 2019 09:58:18 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 0765B5866;
	Tue,  1 Oct 2019 07:51:22 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 5864D25D3
 for <linux-xtensa@linux-xtensa.org>; Tue,  1 Oct 2019 07:51:21 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f5so12281008ljg.8
 for <linux-xtensa@linux-xtensa.org>; Tue, 01 Oct 2019 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EX2iagCYxbbfVSwNYAvSqT0RRit3O7vA4/pCLIgEK3k=;
 b=dQNhgTAQ84nrzM3K7FZyEoaoRCrpjpqJKNRKoMEVQKwOG46jr8XKOWxc/yfipWiWxP
 SZU1+ntTx3Ag5oh3w2WDwMogvbzLZTL/cyrsjKON5r4WkQO9Jxuf8vb4LoyTUR8f2VIK
 e6gTUjzY8P6mWAj3S6AW+zdabHjcXgB+GnVIc+TEB1Fg4sxQimyfpu5EuFEeHk6EOJOb
 O3fmAxxCLBO8OItcpSEcntl8eAVNq+DOpLwnV16E2LjT2UthfUDU3IvvYYgXT1JtTpln
 DisYNIsq2012WnTWVkqNiywOOq+JQORXmtcjyFnWfyxxhlMzFbODXSRuazKxkUivMp1J
 8daA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EX2iagCYxbbfVSwNYAvSqT0RRit3O7vA4/pCLIgEK3k=;
 b=UzufKAt8H0VnrOg5bw9xiaWSNXu1cgqtsFzV9iaz52qUmxqu4pOcKG/qOOqxHBHwbZ
 as2SmGnGF5p/l0JANaGRGuTeo6wTl4Ki0ImeJs1mzDkSJ2JFn7ejdtr5iijF5wlDdhOE
 Jr7ArogOZvHywSO92I/sCuym5xObQmxsvuZFeMxU096DxuyzQL9V6K+rbe95MlV4B/bD
 Fvs5vDiWW7xnG+hckFhVYJyjYhHugkd+TiFmRRfDz7Za3RzN6Q7Rwp5xCEFxAek4THmL
 LPB0gasn8uiNFPL96Y6fyzW5FZeUb0lQkkYXm34D78aG+qO5ey+0JLIM/KRjmAfnDOaE
 ZWjA==
X-Gm-Message-State: APjAAAWXRhHIBLxpY0B7t54NlmCfLgbeGutDHtuYowH1zwmBD0nLBR4f
 Th843iNsYXIkClqaIJ8p/H4GuiGy
X-Google-Smtp-Source: APXvYqzJC0esF7LiGIcwiOtYwUFmobl9Vv25WchUIogZuWoG09PwZTWqfadz2T92e8L+YR4ej1oARA==
X-Received: by 2002:a2e:9049:: with SMTP id n9mr3990180ljg.45.1569916695631;
 Tue, 01 Oct 2019 00:58:15 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm3775562lfm.71.2019.10.01.00.58.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 00:58:15 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  1 Oct 2019 00:57:35 -0700
Message-Id: <20191001075739.32447-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191001075739.32447-1-jcmvbkbc@gmail.com>
References: <20191001075739.32447-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 2/6] xtensa: move MPU constants from .data
	to .ref.rodata
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
