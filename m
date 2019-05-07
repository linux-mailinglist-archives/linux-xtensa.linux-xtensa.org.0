Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 970BE15710
	for <lists+linux-xtensa@lfdr.de>; Tue,  7 May 2019 02:44:39 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 50FD36529;
	Tue,  7 May 2019 00:42:56 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id ACC50581A
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 May 2019 00:42:55 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d8so10457961lfb.8
 for <linux-xtensa@linux-xtensa.org>; Mon, 06 May 2019 17:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5PdoEJusKxb+xMaJ8gcYqfbHbv3uqebPCbsBnyYwppg=;
 b=AOo9ocjZ7CBFzj/zEJPJcNWDDPXjDf2IMVEqbcxh6DNxsWrn5RqH7CO3vibem8Mlgr
 hXI53E0QDHLQBmR0wnLFYlb7K3bbdUWKn8mvG7MeormbNXv1DYJaezcRiNNmkHfa1Uv4
 eSghxJBVxr2i9N7fAXvqM+zOlz3c2ReU+DHpVvjO7+N+l4gjRHO0bC0HRSBUia3QYNl0
 tDLR6NOLg2YlprL6O3ZSiMMtp1msgq088cDQiwobk3dLTgNYWVyZJSE+Ii4FIl8zUlPQ
 /IN6ilYhbIo8IAlSkJWUsIhcgyyMejkxwUidLFGN9OBOF3EG8Js/7qqPZKxAUPA2oRlO
 LJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5PdoEJusKxb+xMaJ8gcYqfbHbv3uqebPCbsBnyYwppg=;
 b=egOU4tA0PYW302YHv/H5cQY7No7W7+2uEwEPTGtkqOQLXdeuBF9SkdfuOFl9mftbdt
 TbZcmKtYt8rX6+ZzgMuyaYKDbixkG/G0C/jv3Ap5894jEBVpYMdTKeGBefpmjlxY+4JB
 3eWDCpZR23z5TTELE0+obvC70dvxKaipiZp7Zv6nrHrQuCsqdUuDRoIfhHdKA1/HBOF8
 P3/cVtd0uf/ZYMx4dqW8Wl+vKYc3u5L0e96Q3BdpBOA/6Vf0ijxo3oWMgFEh4E7/jIcC
 ZsG6ssMXfvJgRhabXSgkmFCw1XZ5WzjC9+R0M9L1oLFuV0iQxrA+9vZZmoFNKPRFefuf
 qvxg==
X-Gm-Message-State: APjAAAWv6cWVWN3Fp/Z+spnCPoX0rLQGhhC5HcZFNi4HIzDopbutptss
 sxlPbVokSXKP1rybhqaJldtTq5zu1qw=
X-Google-Smtp-Source: APXvYqxf9KbcQ1o52Xo/fRdZjS9bxcRJyqbQ9TWa6jlDemNk3+hNZ/eKuPElKSG/1heXUdoeLgNbtw==
X-Received: by 2002:a19:6a06:: with SMTP id u6mr15357325lfu.26.1557189877313; 
 Mon, 06 May 2019 17:44:37 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm850003lfp.55.2019.05.06.17.44.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 17:44:36 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  6 May 2019 17:44:07 -0700
Message-Id: <20190507004407.6756-6-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507004407.6756-1-jcmvbkbc@gmail.com>
References: <20190507004407.6756-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 5/5] xtensa: implement initialize_cacheattr
	for MPU cores
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

Use CONFIG_MEMMAP_CACHEATTR to initialize MPU as described in the Xtensa
LSP RM document. Coalesce adjacent regions with the same cacheattr.
Update Kconfig help text.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig                      | 26 ++++++++++++++++++------
 arch/xtensa/include/asm/core.h           |  4 ++++
 arch/xtensa/include/asm/initialize_mmu.h | 34 +++++++++++++++++++++++++++++++-
 3 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 4b9aafe766c5..f081751db229 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -256,12 +256,26 @@ config MEMMAP_CACHEATTR
 	  region: bits 0..3 -- for addresses 0x00000000..0x1fffffff,
 	  bits 4..7 -- for addresses 0x20000000..0x3fffffff, and so on.
 
-	  Cache attribute values are specific for the MMU type, so e.g.
-	  for region protection MMUs: 2 is cache bypass, 4 is WB cached,
-	  1 is WT cached, f is illegal. For ful MMU: bit 0 makes it executable,
-	  bit 1 makes it writable, bits 2..3 meaning is 0: cache bypass,
-	  1: WB cache, 2: WT cache, 3: special (c and e are illegal, f is
-	  reserved).
+	  Cache attribute values are specific for the MMU type.
+	  For region protection MMUs:
+	    1: WT cached,
+	    2: cache bypass,
+	    4: WB cached,
+	    f: illegal.
+	  For ful MMU:
+	    bit 0: executable,
+	    bit 1: writable,
+	    bits 2..3:
+	      0: cache bypass,
+	      1: WB cache,
+	      2: WT cache,
+	      3: special (c and e are illegal, f is reserved).
+	  For MPU:
+	    0: illegal,
+	    1: WB cache,
+	    2: WB, no-write-allocate cache,
+	    3: WT cache,
+	    4: cache bypass.
 
 config KSEG_PADDR
 	hex "Physical address of the KSEG mapping"
diff --git a/arch/xtensa/include/asm/core.h b/arch/xtensa/include/asm/core.h
index ee02e164b673..5b4acb7d1c07 100644
--- a/arch/xtensa/include/asm/core.h
+++ b/arch/xtensa/include/asm/core.h
@@ -10,6 +10,10 @@
 #define XCHAL_HAVE_EXCLUSIVE 0
 #endif
 
+#ifndef XCHAL_HAVE_MPU
+#define XCHAL_HAVE_MPU 0
+#endif
+
 #ifndef XCHAL_SPANNING_WAY
 #define XCHAL_SPANNING_WAY 0
 #endif
diff --git a/arch/xtensa/include/asm/initialize_mmu.h b/arch/xtensa/include/asm/initialize_mmu.h
index d719785e54f7..323d05789159 100644
--- a/arch/xtensa/include/asm/initialize_mmu.h
+++ b/arch/xtensa/include/asm/initialize_mmu.h
@@ -177,11 +177,42 @@
 
 	.macro	initialize_cacheattr
 
-#if !defined(CONFIG_MMU) && XCHAL_HAVE_TLBS
+#if !defined(CONFIG_MMU) && (XCHAL_HAVE_TLBS || XCHAL_HAVE_MPU)
 #if CONFIG_MEMMAP_CACHEATTR == 0x22222222 && XCHAL_HAVE_PTP_MMU
 #error Default MEMMAP_CACHEATTR of 0x22222222 does not work with full MMU.
 #endif
 
+#if XCHAL_HAVE_MPU
+	.data
+	.align	4
+.Lattribute_table:
+	.long 0x000000, 0x1fff00, 0x1ddf00, 0x1eef00
+	.long 0x006600, 0x000000, 0x000000, 0x000000
+	.long 0x000000, 0x000000, 0x000000, 0x000000
+	.long 0x000000, 0x000000, 0x000000, 0x000000
+	.previous
+
+	movi	a3, .Lattribute_table
+	movi	a4, CONFIG_MEMMAP_CACHEATTR
+	movi	a5, 1
+	movi	a6, XCHAL_MPU_ENTRIES
+	movi	a10, 0x20000000
+	movi	a11, -1
+1:
+	sub	a5, a5, a10
+	extui	a8, a4, 28, 4
+	beq	a8, a11, 2f
+	addi	a6, a6, -1
+	mov	a11, a8
+2:
+	addx4	a9, a8, a3
+	l32i	a9, a9, 0
+	or	a9, a9, a6
+	wptlb	a9, a5
+	slli	a4, a4, 4
+	bgeu	a5, a10, 1b
+
+#else
 	movi	a5, XCHAL_SPANNING_WAY
 	movi	a6, ~_PAGE_ATTRIB_MASK
 	movi	a4, CONFIG_MEMMAP_CACHEATTR
@@ -204,6 +235,7 @@
 
 	isync
 #endif
+#endif
 
 	.endm
 
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
