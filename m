Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id BFB90C1B05
	for <lists+linux-xtensa@lfdr.de>; Mon, 30 Sep 2019 07:33:33 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3707E649F;
	Mon, 30 Sep 2019 05:26:40 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id CC86C649E
 for <linux-xtensa@linux-xtensa.org>; Mon, 30 Sep 2019 05:26:38 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n14so7981502ljj.10
 for <linux-xtensa@linux-xtensa.org>; Sun, 29 Sep 2019 22:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bfCFbWOQshxUp65kWzMHJg3qZ4/iKASndYol1zocUTg=;
 b=PVwNd00CQmvQ/B0TjgadmEE6U7Z+QRpfPHkpjybv2Zxco5tEZXhux5foC049usCukC
 a6V2d8CcXgcOZlUwz8t6u1QICal7eCKUatv/Z4rStn15I8cvlBixWsA4XT9BHTxTUJbi
 pgS146p+uJQvd+7aJAgEMrAxVBHxFL+tdQiBQf9tUomSODmxr3JGTewxBEjkrKjHmak3
 ozyiLaYM0osptH0Hl7bTFLhs+h60OnZ0xy2UajhNdIR5KOjqKDO8anS7Xk9k6V117zXS
 oSdBOXXXzQYFQDcC5/ZA85/uAegNNpDOl48cwqUo08e8mRDSJ3dDHOKI1Lkp/cxbmW66
 SDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bfCFbWOQshxUp65kWzMHJg3qZ4/iKASndYol1zocUTg=;
 b=ZpVZ6kyEcA9eID4xApum4SxNfuJ42+0i4gZqNoo1IUo/zgJCc8W+EZfEdrup9ICkpf
 S0kH90cOCaMBax9Tbsd8umIR3LiHoCo7tDMBUQ8varEK/y5zqlWYWHNAd7rKFXZodeJx
 /fUjpcWQ3YKkkLnJ35gqtQODPmQQGTZdi8vsKfxFAMf9LNX1NLlxaJeq+oGv3mErylu7
 DpvEnVotzrrfpozzitDGzF+y6D51r+34n6M+Q96Kmfh/xUWPWFuNLnX44Bb+qBGi9vhR
 mKRelWTvUvfhjQqRGpwuvBecnJGsppluj+miI0+Y3g8nhwVmx2vmxJrFfznrgEDPHrpJ
 I3dA==
X-Gm-Message-State: APjAAAVz8O7AWwxpsihp2P4rZv2SS9v/0P1G0wos55qB0dhTTZnOQLv5
 cSFuHw4jAHW5Hhv1PhACfUvpFiPf
X-Google-Smtp-Source: APXvYqxsLbORKp5phefq/t1xymrwSYRBceZGREWMVr7/msb2RhwwtaH7n+em4RUeBQC2gecA/KNckQ==
X-Received: by 2002:a2e:878b:: with SMTP id n11mr10836714lji.13.1569821610683; 
 Sun, 29 Sep 2019 22:33:30 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id k23sm2944211ljc.13.2019.09.29.22.33.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Sep 2019 22:33:30 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 29 Sep 2019 22:33:02 -0700
Message-Id: <20190930053306.7029-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190930053306.7029-1-jcmvbkbc@gmail.com>
References: <20190930053306.7029-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/5] xtensa: move XCHAL_KIO_* definitions to
	kmem_layout.h
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

These address and size definitions define xtensa kernel memory layout,
move them from vectors.h to the kmem_layout.h

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/kmem_layout.h | 29 ++++++++++++++++++++++++
 arch/xtensa/include/asm/vectors.h     | 42 +++--------------------------------
 2 files changed, 32 insertions(+), 39 deletions(-)

diff --git a/arch/xtensa/include/asm/kmem_layout.h b/arch/xtensa/include/asm/kmem_layout.h
index 9c12babc016c..7cbf68ca7106 100644
--- a/arch/xtensa/include/asm/kmem_layout.h
+++ b/arch/xtensa/include/asm/kmem_layout.h
@@ -11,6 +11,7 @@
 #ifndef _XTENSA_KMEM_LAYOUT_H
 #define _XTENSA_KMEM_LAYOUT_H
 
+#include <asm/core.h>
 #include <asm/types.h>
 
 #ifdef CONFIG_MMU
@@ -65,6 +66,34 @@
 
 #endif
 
+/* KIO definition */
+
+#if XCHAL_HAVE_PTP_MMU
+#define XCHAL_KIO_CACHED_VADDR		0xe0000000
+#define XCHAL_KIO_BYPASS_VADDR		0xf0000000
+#define XCHAL_KIO_DEFAULT_PADDR		0xf0000000
+#else
+#define XCHAL_KIO_BYPASS_VADDR		XCHAL_KIO_PADDR
+#define XCHAL_KIO_DEFAULT_PADDR		0x90000000
+#endif
+#define XCHAL_KIO_SIZE			0x10000000
+
+#if (!XCHAL_HAVE_PTP_MMU || XCHAL_HAVE_SPANNING_WAY) && defined(CONFIG_OF)
+#define XCHAL_KIO_PADDR			xtensa_get_kio_paddr()
+#ifndef __ASSEMBLY__
+extern unsigned long xtensa_kio_paddr;
+
+static inline unsigned long xtensa_get_kio_paddr(void)
+{
+	return xtensa_kio_paddr;
+}
+#endif
+#else
+#define XCHAL_KIO_PADDR			XCHAL_KIO_DEFAULT_PADDR
+#endif
+
+/* KERNEL_STACK definition */
+
 #ifndef CONFIG_KASAN
 #define KERNEL_STACK_SHIFT	13
 #else
diff --git a/arch/xtensa/include/asm/vectors.h b/arch/xtensa/include/asm/vectors.h
index 79fe3007919e..4220c6dac44f 100644
--- a/arch/xtensa/include/asm/vectors.h
+++ b/arch/xtensa/include/asm/vectors.h
@@ -21,50 +21,14 @@
 #include <asm/core.h>
 #include <asm/kmem_layout.h>
 
-#if XCHAL_HAVE_PTP_MMU
-#define XCHAL_KIO_CACHED_VADDR		0xe0000000
-#define XCHAL_KIO_BYPASS_VADDR		0xf0000000
-#define XCHAL_KIO_DEFAULT_PADDR		0xf0000000
-#else
-#define XCHAL_KIO_BYPASS_VADDR		XCHAL_KIO_PADDR
-#define XCHAL_KIO_DEFAULT_PADDR		0x90000000
-#endif
-#define XCHAL_KIO_SIZE			0x10000000
-
-#if (!XCHAL_HAVE_PTP_MMU || XCHAL_HAVE_SPANNING_WAY) && defined(CONFIG_OF)
-#define XCHAL_KIO_PADDR			xtensa_get_kio_paddr()
-#ifndef __ASSEMBLY__
-extern unsigned long xtensa_kio_paddr;
-
-static inline unsigned long xtensa_get_kio_paddr(void)
-{
-	return xtensa_kio_paddr;
-}
-#endif
-#else
-#define XCHAL_KIO_PADDR			XCHAL_KIO_DEFAULT_PADDR
-#endif
-
-#if defined(CONFIG_MMU)
-
-#if XCHAL_HAVE_PTP_MMU && XCHAL_HAVE_SPANNING_WAY
-/* Image Virtual Start Address */
-#define KERNELOFFSET			(XCHAL_KSEG_CACHED_VADDR + \
-					 CONFIG_KERNEL_LOAD_ADDRESS - \
+#if defined(CONFIG_MMU) && XCHAL_HAVE_PTP_MMU && XCHAL_HAVE_SPANNING_WAY
+#define KERNELOFFSET			(CONFIG_KERNEL_LOAD_ADDRESS + \
+					 XCHAL_KSEG_CACHED_VADDR - \
 					 XCHAL_KSEG_PADDR)
 #else
 #define KERNELOFFSET			CONFIG_KERNEL_LOAD_ADDRESS
 #endif
 
-#else /* !defined(CONFIG_MMU) */
-  /* MMU Not being used - Virtual == Physical */
-
-/* Location of the start of the kernel text, _start */
-#define KERNELOFFSET			CONFIG_KERNEL_LOAD_ADDRESS
-
-
-#endif /* CONFIG_MMU */
-
 #define RESET_VECTOR1_VADDR		(XCHAL_RESET_VECTOR1_VADDR)
 #ifdef CONFIG_VECTORS_OFFSET
 #define VECBASE_VADDR			(KERNELOFFSET - CONFIG_VECTORS_OFFSET)
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
