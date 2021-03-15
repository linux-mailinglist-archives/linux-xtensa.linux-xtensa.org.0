Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id BF4CF33A9EB
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Mar 2021 04:19:50 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 405BB4263;
	Mon, 15 Mar 2021 02:55:33 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by linux-xtensa.org (Postfix) with ESMTPS id 47ACC4237
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Mar 2021 02:55:31 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so1262358pjb.1
 for <linux-xtensa@linux-xtensa.org>; Sun, 14 Mar 2021 20:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52jDCpACoTIEuffvjZ0FAKa55GCX1c3VhDbpnUSdB4w=;
 b=V4M8gjZUJTNpilU+9Dx4ftVZeGNfwNNXH/to/yYD71Pu6tyaFXBjPlGWS+f+A7/TFP
 vAtgj9e3cGWL17QRwpIlVXpBScQl+e1ng3aufOeWfzpedjwjwZopnghNEwBEjsXYXkST
 PrTo+9CmnTtrPYe1u/Ida3EF3veaRbjs14A4GN6vgWhYvpvQLUedv5JqnGY1SHcaPRUU
 JVi/ZzrArB2yhMBo1Jg+B+R2bzvdMNC/ueMJAecvZhNEhg0YINJexIcNGLIgi8fU095r
 TB8VsKJdluyZyRFfDey8FUjpsIvnJw4MbVdqM0TtizjvVkdHB3YgdSYQUUIb/NG/DyUk
 Koug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52jDCpACoTIEuffvjZ0FAKa55GCX1c3VhDbpnUSdB4w=;
 b=pdtvA6Kg65JR/DLfVU2O2TvyzG7A6yVWO1JS+vZ3hTKzsF0KnZrntgML3f0klDsjmP
 5QAvRTBWr545nO/8qAL9qWKYk5raC69Wx79BMuAH13IdbwHPUQM8ughTaWKbGnwn4X7x
 CJ+QHWHy2UpIp3xcUrlk2NnC1qOn7A1kk3FZb5WPA0zER2ZVM+enDTUXlr9fh6qDg0l6
 QtrZu5d029v14RuQxjdMYpD/oJn5Tu5k1QkkSWOH82wOeyrb6wfm935mYfkQzIvagmdE
 PS+OxsQIehE9C8zVsjLJwqGGk3WxI2n6akEeaqKYAVD43S+OfWSkHRYpoxiJGd/6tLlO
 GtyA==
X-Gm-Message-State: AOAM530BH3m46f62zBdBpTx91GJccXnxD83KFjMljdV6mhDzYZ9u1zLL
 RcWmUa0/qkMy/PWmlWH+hbeXz93le3Q=
X-Google-Smtp-Source: ABdhPJxbRnHH0HDUBnyyumLJRbrHgXzaP7PBLmJbaMKgIF4OiEkhoOtAg8l0iaYZmeSshnGQinSHZA==
X-Received: by 2002:a17:902:f686:b029:e5:de44:af60 with SMTP id
 l6-20020a170902f686b02900e5de44af60mr9994638plg.64.1615778386317; 
 Sun, 14 Mar 2021 20:19:46 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:6493:2d45:37bd:648d])
 by smtp.gmail.com with ESMTPSA id y29sm11790540pfp.206.2021.03.14.20.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:19:45 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 14 Mar 2021 20:19:31 -0700
Message-Id: <20210315031931.11007-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: simplify coherent_kvaddr logic
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

Functions coherent_kvaddr, clear_page_alias and copy_page_alias use
physical address 0 as a special value that means 'this page is in the
KSEG mapping and its existing virtual address has the same color as the
virtual address of its future mapping, so don't map it to the
TLBTEMP_BASE area'.

Simplify this logic and drop special handling of low memory pages/pages
with coherent mapping and always use TLBTEMP_BASE area.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/mm/cache.c |  9 ++-------
 arch/xtensa/mm/misc.S  | 36 +++++-------------------------------
 2 files changed, 7 insertions(+), 38 deletions(-)

diff --git a/arch/xtensa/mm/cache.c b/arch/xtensa/mm/cache.c
index 085b8c77b9d9..19e5a478a7e8 100644
--- a/arch/xtensa/mm/cache.c
+++ b/arch/xtensa/mm/cache.c
@@ -81,13 +81,8 @@ static inline void kmap_invalidate_coherent(struct page *page,
 static inline void *coherent_kvaddr(struct page *page, unsigned long base,
 				    unsigned long vaddr, unsigned long *paddr)
 {
-	if (PageHighMem(page) || !DCACHE_ALIAS_EQ(page_to_phys(page), vaddr)) {
-		*paddr = page_to_phys(page);
-		return (void *)(base + (vaddr & DCACHE_ALIAS_MASK));
-	} else {
-		*paddr = 0;
-		return page_to_virt(page);
-	}
+	*paddr = page_to_phys(page);
+	return (void *)(base + (vaddr & DCACHE_ALIAS_MASK));
 }
 
 void clear_user_highpage(struct page *page, unsigned long vaddr)
diff --git a/arch/xtensa/mm/misc.S b/arch/xtensa/mm/misc.S
index 25cd67debee6..0527bf6e3211 100644
--- a/arch/xtensa/mm/misc.S
+++ b/arch/xtensa/mm/misc.S
@@ -118,20 +118,13 @@ ENTRY(clear_page_alias)
 
 	abi_entry_default
 
-	/* Skip setting up a temporary DTLB if not aliased low page. */
-
 	movi	a5, PAGE_OFFSET
-	movi	a6, 0
-	beqz	a3, 1f
-
-	/* Setup a temporary DTLB for the addr. */
-
 	addi	a6, a3, (PAGE_KERNEL | _PAGE_HW_WRITE)
 	mov	a4, a2
 	wdtlb	a6, a2
 	dsync
 
-1:	movi	a3, 0
+	movi	a3, 0
 	__loopi	a2, a7, PAGE_SIZE, 32
 	s32i	a3, a2, 0
 	s32i	a3, a2, 4
@@ -143,12 +136,9 @@ ENTRY(clear_page_alias)
 	s32i	a3, a2, 28
 	__endla	a2, a7, 32
 
-	bnez	a6, 1f
-	abi_ret_default
-
-	/* We need to invalidate the temporary idtlb entry, if any. */
+	/* We need to invalidate the temporary dtlb entry. */
 
-1:	idtlb	a4
+	idtlb	a4
 	dsync
 
 	abi_ret_default
@@ -166,22 +156,12 @@ ENTRY(copy_page_alias)
 
 	abi_entry_default
 
-	/* Skip setting up a temporary DTLB for destination if not aliased. */
-
-	movi	a6, 0
-	movi	a7, 0
-	beqz	a4, 1f
-
 	/* Setup a temporary DTLB for destination. */
 
 	addi	a6, a4, (PAGE_KERNEL | _PAGE_HW_WRITE)
 	wdtlb	a6, a2
 	dsync
 
-	/* Skip setting up a temporary DTLB for source if not aliased. */
-
-1:	beqz	a5, 1f
-
 	/* Setup a temporary DTLB for source. */
 
 	addi	a7, a5, PAGE_KERNEL
@@ -219,17 +199,11 @@ ENTRY(copy_page_alias)
 
 	/* We need to invalidate any temporary mapping! */
 
-	bnez	a6, 1f
-	bnez	a7, 2f
-	abi_ret_default
-
-1:	addi	a2, a2, -PAGE_SIZE
+	addi	a2, a2, -PAGE_SIZE
 	idtlb	a2
 	dsync
-	bnez	a7, 2f
-	abi_ret_default
 
-2:	addi	a3, a3, -PAGE_SIZE+1
+	addi	a3, a3, -PAGE_SIZE+1
 	idtlb	a3
 	dsync
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
