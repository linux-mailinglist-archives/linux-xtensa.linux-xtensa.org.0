Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 89B762B4123
	for <lists+linux-xtensa@lfdr.de>; Mon, 16 Nov 2020 11:31:13 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B32B1647F;
	Mon, 16 Nov 2020 10:10:40 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by linux-xtensa.org (Postfix) with ESMTPS id F24525289
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 10:10:37 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id u18so24364175lfd.9
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 02:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M8U2uahDK/HgIULrCVBIlkVKMme83q7hHqIjlyyGKkQ=;
 b=SQQMa9VSujfRXEUqaNQwQIUQd5QTRuFGIXmJQR/dzuhoJ+t345Fx5p5lCGmy4gkeV8
 m0ZVLme5Zjb8YgJDqEQo2eDUIP8kSvbQrI+rNwOptqlfcxVQiT+7Y2KFvNHX9u/jAS7H
 HYg395VMyjDVw4xwXMEkkIgJVifg6iH9b6koMH28T2HoqSH6h0nhTuXqS7ddvrDMaCAz
 BF1NAA1hrQxeM3rhtQawnpP3v23lt6zCRSP+6Ygu4j5gIOXIiLNGVKIqH+hkk2lpGtIY
 UGinyjp36GuMeJlFm/lN4wu3rTGdliK6AVi6+huxkCWG/RQQ7LqZ1Y/c5NSRJSYCgHWm
 HY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M8U2uahDK/HgIULrCVBIlkVKMme83q7hHqIjlyyGKkQ=;
 b=TaL2N56Kh6gD/5LK6F61v1LkLY9ZuRgoUYXphaHXX//oXH2n4Ag83V6vmOl/idzrFZ
 9KeyWTz54KiW6dKXfg8P6PG1A89VwfsIwVK2M600DrZAK67ZrW69UCtgvf7yCnbZlg74
 cfT2wLt/WflOHiKcvCaqdfo//gs2VZewPVdZORLUs+q0TBx3CF3OXHb8lLNSJjE/A7v4
 MQ0CUXe54yFFVHWhcRkgDqvo7N41nu2wZnxkXcUsRSmWhUeCsYWD3LAIZHT1qjIXCh+9
 WLjBxVQGSktTxzmQ85Xs8kOux4/79WcQ8Y7uz6KMTDlqoELGuAoahmbxfugA2yJnUoN1
 Bvlg==
X-Gm-Message-State: AOAM532M2jT9jAJb38NuZyu+9tf+NQpj09qlnsBH4b/X4lEZ0RVt1Mac
 vUFW8ph/3sLXUzvckGb5EPxFmZd/VZxu7Q==
X-Google-Smtp-Source: ABdhPJzEbY5eNCmIZ+hSKplu6+gcVA08M9MOCaSOpFAXnhkXI8G5tVR56A+mXwi+qvWtNzSgvI2Myg==
X-Received: by 2002:a19:cc16:: with SMTP id c22mr4778889lfg.75.1605522668657; 
 Mon, 16 Nov 2020 02:31:08 -0800 (PST)
Received: from octofox.metropolis ([5.19.183.212])
 by smtp.gmail.com with ESMTPSA id f1sm2687362lfm.184.2020.11.16.02.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:31:07 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 16 Nov 2020 02:30:58 -0800
Message-Id: <20201116103058.5461-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116103058.5461-1-jcmvbkbc@gmail.com>
References: <20201116103058.5461-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/2] xtensa: disable preemption around cache
	alias management calls
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

Although cache alias management calls set up and tear down TLB entries
and fast_second_level_miss is able to restore TLB entry should it be
evicted they absolutely cannot preempt each other because they use the
same TLBTEMP area for different purposes.
Disable preemption around all cache alias management calls to enforce
that.

Cc: stable@vger.kernel.org
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/mm/cache.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/xtensa/mm/cache.c b/arch/xtensa/mm/cache.c
index 5835406b3cec..085b8c77b9d9 100644
--- a/arch/xtensa/mm/cache.c
+++ b/arch/xtensa/mm/cache.c
@@ -70,8 +70,10 @@ static inline void kmap_invalidate_coherent(struct page *page,
 			kvaddr = TLBTEMP_BASE_1 +
 				(page_to_phys(page) & DCACHE_ALIAS_MASK);
 
+			preempt_disable();
 			__invalidate_dcache_page_alias(kvaddr,
 						       page_to_phys(page));
+			preempt_enable();
 		}
 	}
 }
@@ -156,6 +158,7 @@ void flush_dcache_page(struct page *page)
 		if (!alias && !mapping)
 			return;
 
+		preempt_disable();
 		virt = TLBTEMP_BASE_1 + (phys & DCACHE_ALIAS_MASK);
 		__flush_invalidate_dcache_page_alias(virt, phys);
 
@@ -166,6 +169,7 @@ void flush_dcache_page(struct page *page)
 
 		if (mapping)
 			__invalidate_icache_page_alias(virt, phys);
+		preempt_enable();
 	}
 
 	/* There shouldn't be an entry in the cache for this page anymore. */
@@ -199,8 +203,10 @@ void local_flush_cache_page(struct vm_area_struct *vma, unsigned long address,
 	unsigned long phys = page_to_phys(pfn_to_page(pfn));
 	unsigned long virt = TLBTEMP_BASE_1 + (address & DCACHE_ALIAS_MASK);
 
+	preempt_disable();
 	__flush_invalidate_dcache_page_alias(virt, phys);
 	__invalidate_icache_page_alias(virt, phys);
+	preempt_enable();
 }
 EXPORT_SYMBOL(local_flush_cache_page);
 
@@ -227,11 +233,13 @@ update_mmu_cache(struct vm_area_struct * vma, unsigned long addr, pte_t *ptep)
 		unsigned long phys = page_to_phys(page);
 		unsigned long tmp;
 
+		preempt_disable();
 		tmp = TLBTEMP_BASE_1 + (phys & DCACHE_ALIAS_MASK);
 		__flush_invalidate_dcache_page_alias(tmp, phys);
 		tmp = TLBTEMP_BASE_1 + (addr & DCACHE_ALIAS_MASK);
 		__flush_invalidate_dcache_page_alias(tmp, phys);
 		__invalidate_icache_page_alias(tmp, phys);
+		preempt_enable();
 
 		clear_bit(PG_arch_1, &page->flags);
 	}
@@ -265,7 +273,9 @@ void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
 
 	if (alias) {
 		unsigned long t = TLBTEMP_BASE_1 + (vaddr & DCACHE_ALIAS_MASK);
+		preempt_disable();
 		__flush_invalidate_dcache_page_alias(t, phys);
+		preempt_enable();
 	}
 
 	/* Copy data */
@@ -280,9 +290,11 @@ void copy_to_user_page(struct vm_area_struct *vma, struct page *page,
 	if (alias) {
 		unsigned long t = TLBTEMP_BASE_1 + (vaddr & DCACHE_ALIAS_MASK);
 
+		preempt_disable();
 		__flush_invalidate_dcache_range((unsigned long) dst, len);
 		if ((vma->vm_flags & VM_EXEC) != 0)
 			__invalidate_icache_page_alias(t, phys);
+		preempt_enable();
 
 	} else if ((vma->vm_flags & VM_EXEC) != 0) {
 		__flush_dcache_range((unsigned long)dst,len);
@@ -304,7 +316,9 @@ extern void copy_from_user_page(struct vm_area_struct *vma, struct page *page,
 
 	if (alias) {
 		unsigned long t = TLBTEMP_BASE_1 + (vaddr & DCACHE_ALIAS_MASK);
+		preempt_disable();
 		__flush_invalidate_dcache_page_alias(t, phys);
+		preempt_enable();
 	}
 
 	memcpy(dst, src, len);
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
