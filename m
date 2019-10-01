Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED14C2E79
	for <lists+linux-xtensa@lfdr.de>; Tue,  1 Oct 2019 09:58:16 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id F104E583D;
	Tue,  1 Oct 2019 07:51:19 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 4ECD95821
 for <linux-xtensa@linux-xtensa.org>; Tue,  1 Oct 2019 07:51:19 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m13so12251642ljj.11
 for <linux-xtensa@linux-xtensa.org>; Tue, 01 Oct 2019 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bfCFbWOQshxUp65kWzMHJg3qZ4/iKASndYol1zocUTg=;
 b=g0yIoZ7GMDNBtZgFz9N8v1+waveigs+YAjyN9BUHf+p924+xQWANLrQ8+rTkjLGn0M
 Bt4y1mf/QAEcRZcaf7ThAaAtyizR2q4eI+oPoXLkPaTjR5Pk9WEN+e/khzega50DMoSf
 fztp4iWt0BIS5q1AB0mGynRL8Ax/FhtI0YTGm/cpAtFvyfkPcTKaxUAQ6hUDYHFXOAOW
 bAeW7kyunC4886ZNmaeYySAcaTaphjMN4ziAelH369xVIYUlkPXYBVNRd1hGtgYXTPla
 5/emndCxymJy6BhvMYlruHgeAEGvtnesDJ6fthtExBz5uGtLNdOhcY3pjovJllxVlq2E
 B90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bfCFbWOQshxUp65kWzMHJg3qZ4/iKASndYol1zocUTg=;
 b=Bn4mMS0MrzSBjAWup+qK5PFpWQioN/BuIVVBGyuJlJqxMRE+5/pH21d/d0njnfvErk
 V+uRBRaS3tudS7oE3IWV6k68xuO1/ueiw3vYR8W57gD8dFG/5PqK6Bq7SbmcmmRSfjN4
 19hCngthSavdNKnwCQ18DERscgCcZLulUN3u7FRJDyr6jBSM9QBuSdkq6BF/KcWR3wBM
 LtswHvL5sEKFm+X9u7hAmL46EBds8PNC2uVysKtRII6n5gSSgZWl7AoVDT1UbIuWvLbp
 wUHu+wUu9KD81NK2oaPriERcfGbvv2svvtLpJYJcJVvNaEwt/iBT8ioXfb5Z+j1tqrb1
 QTzw==
X-Gm-Message-State: APjAAAUG57xRiMImDyypbWUxEGHl7nK/a6V0fWDL051vphU47+TMKrGm
 q6MVSKp1uE45dpfqFT3OygB9CLYm
X-Google-Smtp-Source: APXvYqwPgtDy+g79KdPvXVANZAhhnaftz4AH7IYmoMgRiKio7a06gcl6ybzyzW9KCZVVcM3r+bJbOA==
X-Received: by 2002:a05:651c:1102:: with SMTP id
 d2mr15094399ljo.74.1569916693498; 
 Tue, 01 Oct 2019 00:58:13 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm3775562lfm.71.2019.10.01.00.58.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 00:58:12 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  1 Oct 2019 00:57:34 -0700
Message-Id: <20191001075739.32447-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191001075739.32447-1-jcmvbkbc@gmail.com>
References: <20191001075739.32447-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 1/6] xtensa: move XCHAL_KIO_* definitions
	to kmem_layout.h
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
