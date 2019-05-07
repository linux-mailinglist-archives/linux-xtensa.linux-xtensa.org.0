Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 47DFC1570C
	for <lists+linux-xtensa@lfdr.de>; Tue,  7 May 2019 02:44:32 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E6EE86529;
	Tue,  7 May 2019 00:42:48 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id D8ECC64C3
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 May 2019 00:42:45 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id f23so12715155ljc.0
 for <linux-xtensa@linux-xtensa.org>; Mon, 06 May 2019 17:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z1eOYONJ6U6Bjdr8qZBRa4H9poRtWrKOMJIfOjXRed8=;
 b=rsQ42lqIUxbf4yuwd7AJpL2NuWjshwhkR4hYewjyQLJXOWyrl4f402BsC1g3BjBfzk
 Ek6qHCL7WrjIcfZX5MYr2/zQIz23S5ZK8htDKqPHvtNYBBggIAABZ/mws6nQ9VrMBc8u
 Ejd96oGEyN54qX310p0+pxxUrAXy3mfqKf0v9XrHzH17CuToCUEfam7VguWgyRkCvTbC
 EyD0YMKN2Lp8+EWJXkr1PKZcAuPWZnUZ/q+aRMrd+SX6XN+DKrCgTJPmVdxWmICZbeIa
 /r+9W532d5gsNGZYGzSl+aCa/+2r63vMlkVCuan0IVkQvDGM0XG4VLYkWKwuozHcFIdD
 Uj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z1eOYONJ6U6Bjdr8qZBRa4H9poRtWrKOMJIfOjXRed8=;
 b=p0f9u1szHzu3jDgR5cWnDGxVRDKSDZTDlh9nzgS6B2d587JRFRQplRYWQ6Ux7zJa4z
 o0QojVIxd3b3zp9iFx3b08mM/G268iXEXwwMGOf7AEueYFmyeQLdkP8Pz6F0cK5kYNXT
 N6DnIgwlDFdmgmHYZEo1P5F5huqNWR0hmiBc366bnzAzypVhu1wE71mwRh9iuouTmCXF
 mA5P8w4Hzby779PLZt0Z1Gn3P+SlxOlKzsf6eNs89Ln8MxS7WgPu/h/BAsLLe4+QCMf+
 MMmYIL9e4eDZx7bScX7Cr09WzJMqsor6xthmiMGsBd8JFAR6TjrvZOrAhd+hLI2d5MaO
 Z9sA==
X-Gm-Message-State: APjAAAXE6ucZ9KwUIn14LiI+xH1D53tF+bJjgNLX2qotFIPy77pHT0rC
 fQ7kuE4+0obEhMDOV4ekagopupix
X-Google-Smtp-Source: APXvYqxC138sLrw0UowIFYZ90Y0OQMOqbRU6tkflsedsZlmMIIzcezWLiMqkTIEmrcc5uA7i5VKLqg==
X-Received: by 2002:a2e:8018:: with SMTP id j24mr11900862ljg.149.1557189867476; 
 Mon, 06 May 2019 17:44:27 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm850003lfp.55.2019.05.06.17.44.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 17:44:26 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  6 May 2019 17:44:03 -0700
Message-Id: <20190507004407.6756-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507004407.6756-1-jcmvbkbc@gmail.com>
References: <20190507004407.6756-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/5] xtensa: drop ifdef __KERNEL__ from
	kernel-only headers
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

These headers are not exported to userspace, so they're never used
without __KERNEL__ defined. Drop these ifdef statements.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/atomic.h     | 4 ----
 arch/xtensa/include/asm/bitops.h     | 4 ----
 arch/xtensa/include/asm/futex.h      | 3 ---
 arch/xtensa/include/asm/io.h         | 3 ---
 arch/xtensa/include/asm/pci-bridge.h | 3 ---
 arch/xtensa/include/asm/pci.h        | 4 ----
 arch/xtensa/include/asm/pgalloc.h    | 3 ---
 7 files changed, 24 deletions(-)

diff --git a/arch/xtensa/include/asm/atomic.h b/arch/xtensa/include/asm/atomic.h
index 7de0149e1cf7..4e7311f58ae8 100644
--- a/arch/xtensa/include/asm/atomic.h
+++ b/arch/xtensa/include/asm/atomic.h
@@ -15,8 +15,6 @@
 
 #include <linux/stringify.h>
 #include <linux/types.h>
-
-#ifdef __KERNEL__
 #include <asm/processor.h>
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
@@ -200,6 +198,4 @@ ATOMIC_OPS(xor)
 #define atomic_cmpxchg(v, o, n) ((int)cmpxchg(&((v)->counter), (o), (n)))
 #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 
-#endif /* __KERNEL__ */
-
 #endif /* _XTENSA_ATOMIC_H */
diff --git a/arch/xtensa/include/asm/bitops.h b/arch/xtensa/include/asm/bitops.h
index d3490189792b..345d28aead65 100644
--- a/arch/xtensa/include/asm/bitops.h
+++ b/arch/xtensa/include/asm/bitops.h
@@ -13,8 +13,6 @@
 #ifndef _XTENSA_BITOPS_H
 #define _XTENSA_BITOPS_H
 
-#ifdef __KERNEL__
-
 #ifndef _LINUX_BITOPS_H
 #error only <linux/bitops.h> can be included directly
 #endif
@@ -232,6 +230,4 @@ test_and_change_bit(unsigned int bit, volatile unsigned long *p)
 #include <asm-generic/bitops/lock.h>
 #include <asm-generic/bitops/sched.h>
 
-#endif	/* __KERNEL__ */
-
 #endif	/* _XTENSA_BITOPS_H */
diff --git a/arch/xtensa/include/asm/futex.h b/arch/xtensa/include/asm/futex.h
index 505d09eff184..0fd58b7521aa 100644
--- a/arch/xtensa/include/asm/futex.h
+++ b/arch/xtensa/include/asm/futex.h
@@ -15,8 +15,6 @@
 #ifndef _ASM_XTENSA_FUTEX_H
 #define _ASM_XTENSA_FUTEX_H
 
-#ifdef __KERNEL__
-
 #include <linux/futex.h>
 #include <linux/uaccess.h>
 #include <linux/errno.h>
@@ -123,5 +121,4 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	return ret;
 }
 
-#endif /* __KERNEL__ */
 #endif /* _ASM_XTENSA_FUTEX_H */
diff --git a/arch/xtensa/include/asm/io.h b/arch/xtensa/include/asm/io.h
index acc5bb2cf1c7..da3e783f896b 100644
--- a/arch/xtensa/include/asm/io.h
+++ b/arch/xtensa/include/asm/io.h
@@ -11,7 +11,6 @@
 #ifndef _XTENSA_IO_H
 #define _XTENSA_IO_H
 
-#ifdef __KERNEL__
 #include <asm/byteorder.h>
 #include <asm/page.h>
 #include <asm/vectors.h>
@@ -78,8 +77,6 @@ static inline void iounmap(volatile void __iomem *addr)
 
 #endif /* CONFIG_MMU */
 
-#endif	/* __KERNEL__ */
-
 #include <asm-generic/io.h>
 
 #endif	/* _XTENSA_IO_H */
diff --git a/arch/xtensa/include/asm/pci-bridge.h b/arch/xtensa/include/asm/pci-bridge.h
index 0b68c76ec1e6..405526912d9a 100644
--- a/arch/xtensa/include/asm/pci-bridge.h
+++ b/arch/xtensa/include/asm/pci-bridge.h
@@ -11,8 +11,6 @@
 #ifndef _XTENSA_PCI_BRIDGE_H
 #define _XTENSA_PCI_BRIDGE_H
 
-#ifdef __KERNEL__
-
 struct device_node;
 struct pci_controller;
 
@@ -84,5 +82,4 @@ int early_write_config_byte(struct pci_controller*, int, int, int, u8);
 int early_write_config_word(struct pci_controller*, int, int, int, u16);
 int early_write_config_dword(struct pci_controller*, int, int, int, u32);
 
-#endif	/* __KERNEL__ */
 #endif	/* _XTENSA_PCI_BRIDGE_H */
diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
index 883024054b05..8e2b48a268db 100644
--- a/arch/xtensa/include/asm/pci.h
+++ b/arch/xtensa/include/asm/pci.h
@@ -11,8 +11,6 @@
 #ifndef _XTENSA_PCI_H
 #define _XTENSA_PCI_H
 
-#ifdef __KERNEL__
-
 /* Can be used to override the logic in pci_scan_bus for skipping
  * already-configured bus numbers - to be used for buggy BIOSes
  * or architectures with incomplete PCI setup by the loader
@@ -45,8 +43,6 @@
 #define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
 #define arch_can_pci_mmap_io()		1
 
-#endif /* __KERNEL__ */
-
 /* Generic PCI */
 #include <asm-generic/pci.h>
 
diff --git a/arch/xtensa/include/asm/pgalloc.h b/arch/xtensa/include/asm/pgalloc.h
index b3b388ff2f01..368284c972e7 100644
--- a/arch/xtensa/include/asm/pgalloc.h
+++ b/arch/xtensa/include/asm/pgalloc.h
@@ -11,8 +11,6 @@
 #ifndef _XTENSA_PGALLOC_H
 #define _XTENSA_PGALLOC_H
 
-#ifdef __KERNEL__
-
 #include <linux/highmem.h>
 #include <linux/slab.h>
 
@@ -79,5 +77,4 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t pte)
 }
 #define pmd_pgtable(pmd) pmd_page(pmd)
 
-#endif /* __KERNEL__ */
 #endif /* _XTENSA_PGALLOC_H */
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
