Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6353F2B5136
	for <lists+linux-xtensa@lfdr.de>; Mon, 16 Nov 2020 20:33:19 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id D3BAB6494;
	Mon, 16 Nov 2020 19:12:45 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 6172558B4
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 19:12:44 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r9so26755546lfn.11
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 11:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gr7/0AcuSZBBrA15W/1FJGq5v2PueaNB49fPFvR5Exc=;
 b=rsejUTVk7poK+BzI2iqr7PkIIkc9jyEc3Qo0uJa3rjvR4HyRYf9RFiSVETA0eLOooh
 ELwcpwKPqn51Lf1N2KjmBDgjmYfScmFvoQRO8a/V84PypM8zHsWjxDmuoqoDoZX6f6m9
 Bjn/cquuAvYIjRhVBlOUPc6cz/9Wy42q2xPeawbZ47N0NuWg+Tq4/ekHwhyQ6tYOIiYC
 z273BHvnMP4GK0exxtDfzXS5zVoLnE7SgIumULu899KMdScKXVt/yoHQdiVsLbPoZL28
 WxCgg3ZzswO9dCg0l8iq4tALnGdoWmEydat2j7MBFybG7RQBA3jGRMQqdmlaGOA5xEKn
 vTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gr7/0AcuSZBBrA15W/1FJGq5v2PueaNB49fPFvR5Exc=;
 b=cW45+W7nJlou2m77OEVpiNUIuYjZqzomNiKL/vV+ZOMiO4taXoDZGd3LpCSPBc2T9t
 hlw8Lrs3H+Nssoh0B4kYryy0WqBdNpKj26Bk0HP6fUQkYf0FCoj1bE9ka21TPv3s4zjH
 jBYkv2WJ/kQWHxR7/wuzKOExGMbD/9ljEg9KY+BvvOvUpOHw/PZ1q9ayXosyw83+kbqy
 2i2MA7CcYQFeEXFI8yx1cKwrDb/r1NDF2kqVL3FCunS5mq+CFNYpIbvmIx+Ssni1YhiZ
 q/U3kfhzHyETaIDg9PQaL5IJdhGcTWsZ54W63/scX7umLb74xjC1qAr4vojvU0NcvOZC
 a45g==
X-Gm-Message-State: AOAM530EJ1+BJ2NKYGuD5vf7u+svLjpqO5cxJc36oijpiRndJTeyRMso
 oQxbqj1wHb6+HcGh1e6t1FL8wXA+3uyfcA==
X-Google-Smtp-Source: ABdhPJy66aLKhD1/ykEJfAp1Mrj4P5OXYwXQwFo3mPJt1toc7U/KpJKRTdVp4zN4WgRjlESWupqsBA==
X-Received: by 2002:a19:857:: with SMTP id 84mr308880lfi.235.1605555195309;
 Mon, 16 Nov 2020 11:33:15 -0800 (PST)
Received: from octofox.metropolis ([5.19.183.212])
 by smtp.gmail.com with ESMTPSA id m16sm2697771lfa.57.2020.11.16.11.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 11:33:14 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 16 Nov 2020 11:32:53 -0800
Message-Id: <20201116193253.23875-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2] xtensa/mm/highmem: Make generic
	kmap_atomic() work correctly
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

From: Thomas Gleixner <tglx@linutronix.de>

The conversion to the generic kmap_atomic() implementation missed the fact
that xtensa's fixmap works bottom up while all other implementations work
top down. There is no real reason why xtensa needs to work that way.

Cure it by:

  - Using the generic fix_to_virt()/virt_to_fix() functions which work top
    down
  - Adjusting the mapping defines
  - Using the generic index calculation for the non cache aliasing case
  - Making the cache colour offset reverse so the effective index is correct

While at it, remove the outdated and misleading comment above the fixmap
enum which originates from the initial copy&pasta of this code from i386.

Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Fixes: 629ed3f7dad2 ("xtensa/mm/highmem: Switch to generic kmap atomic")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- fix off-by-one error in kmap_idx calculation

 arch/xtensa/include/asm/fixmap.h  | 55 ++++---------------------------
 arch/xtensa/include/asm/highmem.h | 15 +++++----
 arch/xtensa/mm/highmem.c          | 18 ++++++----
 arch/xtensa/mm/init.c             |  4 +--
 arch/xtensa/mm/mmu.c              |  3 +-
 5 files changed, 31 insertions(+), 64 deletions(-)

diff --git a/arch/xtensa/include/asm/fixmap.h b/arch/xtensa/include/asm/fixmap.h
index 92049b61c351..1c65dc1d3397 100644
--- a/arch/xtensa/include/asm/fixmap.h
+++ b/arch/xtensa/include/asm/fixmap.h
@@ -17,63 +17,22 @@
 #include <linux/threads.h>
 #include <linux/pgtable.h>
 #include <asm/kmap_size.h>
-#endif
 
-/*
- * Here we define all the compile-time 'special' virtual
- * addresses. The point is to have a constant address at
- * compile time, but to set the physical address only
- * in the boot process. We allocate these special addresses
- * from the start of the consistent memory region upwards.
- * Also this lets us do fail-safe vmalloc(), we
- * can guarantee that these special addresses and
- * vmalloc()-ed addresses never overlap.
- *
- * these 'compile-time allocated' memory buffers are
- * fixed-size 4k pages. (or larger if used with an increment
- * higher than 1) use fixmap_set(idx,phys) to associate
- * physical memory with fixmap indices.
- */
+/* The map slots for temporary mappings via kmap_atomic/local(). */
 enum fixed_addresses {
-#ifdef CONFIG_HIGHMEM
-	/* reserved pte's for temporary kernel mappings */
 	FIX_KMAP_BEGIN,
 	FIX_KMAP_END = FIX_KMAP_BEGIN +
 		(KM_MAX_IDX * NR_CPUS * DCACHE_N_COLORS) - 1,
-#endif
 	__end_of_fixed_addresses
 };
 
-#define FIXADDR_TOP     (XCHAL_KSEG_CACHED_VADDR - PAGE_SIZE)
+#define FIXADDR_END     (XCHAL_KSEG_CACHED_VADDR - PAGE_SIZE)
 #define FIXADDR_SIZE	(__end_of_fixed_addresses << PAGE_SHIFT)
-#define FIXADDR_START	((FIXADDR_TOP - FIXADDR_SIZE) & PMD_MASK)
+/* Enforce that FIXADDR_START is PMD aligned to handle cache aliasing */
+#define FIXADDR_START	((FIXADDR_END - FIXADDR_SIZE) & PMD_MASK)
+#define FIXADDR_TOP	(FIXADDR_START + FIXADDR_SIZE - PAGE_SIZE)
 
-#define __fix_to_virt(x)	(FIXADDR_START + ((x) << PAGE_SHIFT))
-#define __virt_to_fix(x)	(((x) - FIXADDR_START) >> PAGE_SHIFT)
-
-#ifndef __ASSEMBLY__
-/*
- * 'index to address' translation. If anyone tries to use the idx
- * directly without translation, we catch the bug with a NULL-deference
- * kernel oops. Illegal ranges of incoming indices are caught too.
- */
-static __always_inline unsigned long fix_to_virt(const unsigned int idx)
-{
-	/* Check if this memory layout is broken because fixmap overlaps page
-	 * table.
-	 */
-	BUILD_BUG_ON(FIXADDR_START <
-		     TLBTEMP_BASE_1 + TLBTEMP_SIZE);
-	BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
-	return __fix_to_virt(idx);
-}
-
-static inline unsigned long virt_to_fix(const unsigned long vaddr)
-{
-	BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
-	return __virt_to_fix(vaddr);
-}
-
-#endif
+#include <asm-generic/fixmap.h>
 
+#endif /* CONFIG_HIGHMEM */
 #endif
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index 0fc3b1cebc56..34b8b620e7f1 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -12,6 +12,7 @@
 #ifndef _XTENSA_HIGHMEM_H
 #define _XTENSA_HIGHMEM_H
 
+#ifdef CONFIG_HIGHMEM
 #include <linux/wait.h>
 #include <linux/pgtable.h>
 #include <asm/cacheflush.h>
@@ -58,6 +59,13 @@ static inline wait_queue_head_t *get_pkmap_wait_queue_head(unsigned int color)
 {
 	return pkmap_map_wait_arr + color;
 }
+
+enum fixed_addresses kmap_local_map_idx(int type, unsigned long pfn);
+#define arch_kmap_local_map_idx		kmap_local_map_idx
+
+enum fixed_addresses kmap_local_unmap_idx(int type, unsigned long addr);
+#define arch_kmap_local_unmap_idx	kmap_local_unmap_idx
+
 #endif
 
 extern pte_t *pkmap_page_table;
@@ -67,15 +75,10 @@ static inline void flush_cache_kmaps(void)
 	flush_cache_all();
 }
 
-enum fixed_addresses kmap_local_map_idx(int type, unsigned long pfn);
-#define arch_kmap_local_map_idx		kmap_local_map_idx
-
-enum fixed_addresses kmap_local_unmap_idx(int type, unsigned long addr);
-#define arch_kmap_local_unmap_idx	kmap_local_unmap_idx
-
 #define arch_kmap_local_post_unmap(vaddr)	\
 	local_flush_tlb_kernel_range(vaddr, vaddr + PAGE_SIZE)
 
 void kmap_init(void);
 
+#endif /* CONFIG_HIGHMEM */
 #endif
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 0735ca5e8f86..35c4f7d4a333 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -23,16 +23,16 @@ static void __init kmap_waitqueues_init(void)
 	for (i = 0; i < ARRAY_SIZE(pkmap_map_wait_arr); ++i)
 		init_waitqueue_head(pkmap_map_wait_arr + i);
 }
-#else
-static inline void kmap_waitqueues_init(void)
-{
-}
-#endif
 
 static inline enum fixed_addresses kmap_idx(int type, unsigned long color)
 {
-	return (type + KM_MAX_IDX * smp_processor_id()) * DCACHE_N_COLORS +
-		color;
+	int idx = (type + KM_MAX_IDX * smp_processor_id()) * DCACHE_N_COLORS;
+
+	/*
+	 * The fixmap operates top down, so the color offset needs to be
+	 * reverse as well.
+	 */
+	return idx + DCACHE_N_COLORS - 1 - color;
 }
 
 enum fixed_addresses kmap_local_map_idx(int type, unsigned long pfn)
@@ -45,6 +45,10 @@ enum fixed_addresses kmap_local_unmap_idx(int type, unsigned long addr)
 	return kmap_idx(type, DCACHE_ALIAS(addr));
 }
 
+#else
+static inline void kmap_waitqueues_init(void) { }
+#endif
+
 void __init kmap_init(void)
 {
 	/* Check if this memory layout is broken because PKMAP overlaps
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index 8731b7ad9308..2daeba9e454e 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -147,8 +147,8 @@ void __init mem_init(void)
 #ifdef CONFIG_HIGHMEM
 		PKMAP_BASE, PKMAP_BASE + LAST_PKMAP * PAGE_SIZE,
 		(LAST_PKMAP*PAGE_SIZE) >> 10,
-		FIXADDR_START, FIXADDR_TOP,
-		(FIXADDR_TOP - FIXADDR_START) >> 10,
+		FIXADDR_START, FIXADDR_END,
+		(FIXADDR_END - FIXADDR_START) >> 10,
 #endif
 		PAGE_OFFSET, PAGE_OFFSET +
 		(max_low_pfn - min_low_pfn) * PAGE_SIZE,
diff --git a/arch/xtensa/mm/mmu.c b/arch/xtensa/mm/mmu.c
index fd2193df8a14..7e4d97dc8bd8 100644
--- a/arch/xtensa/mm/mmu.c
+++ b/arch/xtensa/mm/mmu.c
@@ -52,7 +52,8 @@ static void * __init init_pmd(unsigned long vaddr, unsigned long n_pages)
 
 static void __init fixedrange_init(void)
 {
-	init_pmd(__fix_to_virt(0), __end_of_fixed_addresses);
+	BUILD_BUG_ON(FIXADDR_START < TLBTEMP_BASE_1 + TLBTEMP_SIZE);
+	init_pmd(FIXADDR_START, __end_of_fixed_addresses);
 }
 #endif
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
