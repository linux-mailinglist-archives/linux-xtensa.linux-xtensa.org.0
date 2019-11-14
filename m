Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6EADBFBD52
	for <lists+linux-xtensa@lfdr.de>; Thu, 14 Nov 2019 02:08:47 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id BF4F964E6;
	Thu, 14 Nov 2019 01:00:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 6A8B264A6
 for <linux-xtensa@linux-xtensa.org>; Thu, 14 Nov 2019 01:00:23 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id o65so3521687lff.13
 for <linux-xtensa@linux-xtensa.org>; Wed, 13 Nov 2019 17:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wBQHB2EzlG/RSRWYzzXHGHn7Pgw3gzypxOnIpXuT5fc=;
 b=dLdhF2PzyQ/jFoL4zrJ4qhDA2R7hCREOwWVwawyuVHALBhJHtbEXnCQz1uUxkzTNLq
 wCyutaWHNPjDEhXkiQn8T65OcpDyFgntNJWyA9noEO11ZSotKuO8nD+93Q+0PS/BMbYD
 JF+fT85rjf2Z0MQfsES+fuUDd5zXynLC9SCN8gKCYXwzdfNUnQRZNJLTgOch7duW1qyU
 6X31e2ITWOiWXpzgnOrTxuO9KfNtX7z6XWxKSt17khUaC/c68B05BjDz5rhqOdIUuXHy
 ZOY9HXj8XNP4Ox8HFRpuAZaoE/ALG4L6YOVT7bqNFoE0bxAJ/IiJeUggbYcKtM4roz5S
 pw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wBQHB2EzlG/RSRWYzzXHGHn7Pgw3gzypxOnIpXuT5fc=;
 b=dm2GU+IqpjZvcK8v27zOIbZIutwHxL7v9zSwbq+cHQxVc6dUGo3weZHXK6efk4LYC+
 DYIPRnlupuY/HSfINBo6foK/IYHufKqgeF+beIaIfFC3vwRF87wqo6beM004vLW4tSZs
 ZTulwKbfR4WHi7rN3YHkzvYcjKx0c6H1WUuqXRdl9s2g2JxDcFy/ImFdJKsKFr4FSIn9
 lZYYyfgVeeCPLX2zm2tRZy41OaIKU+p+BPHIAgFQlbgumWyPNiAMYLMmZI+AQAGhmg92
 WeASUB/molGKggc+Pi8TYckRKUsbJXIobuRKLbFWb/kz7VGnME+lD7+/gJr21oyUu235
 lzeQ==
X-Gm-Message-State: APjAAAW9z8u/S80j47ofS3j/S3NTX/9D3qrjGnjglcTpYYgxr865tw8N
 i5QiOtVwL6JitfR1aQY60PXa4EdOjDU=
X-Google-Smtp-Source: APXvYqyjODrUidyRiNtKsHWwCmupyjlQdwCeGsh09cvSNBIORfw8Pm8KVk1OyhKrkpCWYVOWGegIsg==
X-Received: by 2002:a19:ee17:: with SMTP id g23mr4590004lfb.121.1573693723677; 
 Wed, 13 Nov 2019 17:08:43 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id b14sm1726678lfa.14.2019.11.13.17.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 17:08:43 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Wed, 13 Nov 2019 17:08:24 -0800
Message-Id: <20191114010824.29540-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: use MEMBLOCK_ALLOC_ANYWHERE for
	KASAN shadow map
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

KASAN shadow map doesn't need to be accessible through the linear kernel
mapping, allocate its pages with MEMBLOCK_ALLOC_ANYWHERE so that high
memory can be used. This frees up to ~100MB of low memory on xtensa
configurations with KASAN and high memory.

Cc: stable@vger.kernel.org # v5.1+
Fixes: f240ec09bb8a ("memblock: replace memblock_alloc_base(ANYWHERE)
		     with memblock_phys_alloc")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/mm/kasan_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index 9c957791bb33..e3baa21ff24c 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -60,7 +60,9 @@ static void __init populate(void *start, void *end)
 
 		for (k = 0; k < PTRS_PER_PTE; ++k, ++j) {
 			phys_addr_t phys =
-				memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+				memblock_phys_alloc_range(PAGE_SIZE, PAGE_SIZE,
+							  0,
+							  MEMBLOCK_ALLOC_ANYWHERE);
 
 			if (!phys)
 				panic("Failed to allocate page table page\n");
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
