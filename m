Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 2E32E2B4122
	for <lists+linux-xtensa@lfdr.de>; Mon, 16 Nov 2020 11:31:13 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id A81FB58B4;
	Mon, 16 Nov 2020 10:10:40 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 00A9852C6
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 10:10:36 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id f11so24410317lfs.3
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 02:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=04mue/uEXoP8PZbqmoZUBLj/PA+WBVM5ImrqhqasAwA=;
 b=n8UjSBU13vi/1DoOzTOf2lCswxui2v8kJEUfQyXGv7eE0Toi6sf7A/YEtXavvHkONG
 ZeP/rYoLAsDnQZl9SNKKe8BhgG7nsmUHaI1CQlnXhjTcEv7XaaSpfmHPAwvnG2q1wxhl
 lNb0nglJDMEY7pUQQfmQosbjlEtPFk+bY6u5SAL3PPYpxb3716jf/x5p4q7y/Rxj0Tpo
 +JezhYx21nDgG1Rhcf9q1ecioLUyPi5HbokyMJC8l3vY6MwWVcSl9taDLoiy3OTLUiHL
 QnAUMVUnTk4Tv5ouzboyx3mL1PzWj/NbPrD5oC5GqeymooY68HjJrmzwavLTBikFjNcG
 M4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04mue/uEXoP8PZbqmoZUBLj/PA+WBVM5ImrqhqasAwA=;
 b=rBCmnsirPGshyO8omS52IJBf5jk7Ht4bzqLZLoPVv8z+FH3wJ/oDSXGvbmDJKiXsoQ
 usmqwzzGp1JNIJBY0izdxQ2zKJmSa6C0nVcd2/xjLsBOc+OURAXTPngWo7NpMMP1xWtT
 E1pGqb5SUg58rhSbA0Yj6Qk7YTZkguY8RCQeXkatL1EywwPU9Di4lT9VtmoM7/qLxRMt
 D0buaRVhx2XET1Rmbf1pSnqb4AoWsduSfc0SAeQ7Jj+GotVdx9LwRlOw7JHmphQdMDVY
 sG45QxIp+9agJXs4TxOydFVlH3Vs/i6C84/Rwt+NqKf32NHD2NxTxshFlTeT6He9Vx5E
 9N8Q==
X-Gm-Message-State: AOAM5334TElN1IMXGrENgnqj5tvo4ZOVXhBsqRVmTMrydexaqT/VevzE
 ieYAVX83SSWwwKBHS10Ag3cECb8NA+R3vA==
X-Google-Smtp-Source: ABdhPJzEs9ScrXj2Eix0ihoVb3pg0ja6sm28knfa0eSWsjYlOfnCQB/zFTienES6EEOzsJbdPHezlw==
X-Received: by 2002:a19:5f0b:: with SMTP id t11mr5624534lfb.326.1605522667664; 
 Mon, 16 Nov 2020 02:31:07 -0800 (PST)
Received: from octofox.metropolis ([5.19.183.212])
 by smtp.gmail.com with ESMTPSA id f1sm2687362lfm.184.2020.11.16.02.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:31:07 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 16 Nov 2020 02:30:57 -0800
Message-Id: <20201116103058.5461-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116103058.5461-1-jcmvbkbc@gmail.com>
References: <20201116103058.5461-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/2] xtensa: fix TLBTEMP area placement
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

fast_second_level_miss handler for the TLBTEMP area has an assumption
that page table directory entry for the TLBTEMP address range is 0. For
it to be true the TLBTEMP area must be aligned to 4MB boundary and not
share its 4MB region with anything that may use a page table. This is
not true currently: TLBTEMP shares space with vmalloc space which
results in the following kinds of runtime errors when
fast_second_level_miss loads page table directory entry for the vmalloc
space instead of fixing up the TLBTEMP area:

 Unable to handle kernel paging request at virtual address c7ff0e00
  pc = d0009275, ra = 90009478
 Oops: sig: 9 [#1] PREEMPT
 CPU: 1 PID: 61 Comm: kworker/u9:2 Not tainted 5.10.0-rc3-next-20201110-00007-g1fe4962fa983-dirty #58
 Workqueue: xprtiod xs_stream_data_receive_workfn
 a00: 90009478 d11e1dc0 c7ff0e00 00000020 c7ff0000 00000001 7f8b8107 00000000
 a08: 900c5992 d11e1d90 d0cc88b8 5506e97c 00000000 5506e97c d06c8074 d11e1d90
 pc: d0009275, ps: 00060310, depc: 00000014, excvaddr: c7ff0e00
 lbeg: d0009275, lend: d0009287 lcount: 00000003, sar: 00000010
 Call Trace:
   xs_stream_data_receive_workfn+0x43c/0x770
   process_one_work+0x1a1/0x324
   worker_thread+0x1cc/0x3c0
   kthread+0x10d/0x124
   ret_from_kernel_thread+0xc/0x18

Cc: stable@vger.kernel.org
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 Documentation/xtensa/mmu.rst      | 9 ++++++---
 arch/xtensa/include/asm/pgtable.h | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/xtensa/mmu.rst b/Documentation/xtensa/mmu.rst
index e52a12960fdc..450573afa31a 100644
--- a/Documentation/xtensa/mmu.rst
+++ b/Documentation/xtensa/mmu.rst
@@ -82,7 +82,8 @@ Default MMUv2-compatible layout::
   +------------------+
   | VMALLOC area     |  VMALLOC_START            0xc0000000  128MB - 64KB
   +------------------+  VMALLOC_END
-  | Cache aliasing   |  TLBTEMP_BASE_1           0xc7ff0000  DCACHE_WAY_SIZE
+  +------------------+
+  | Cache aliasing   |  TLBTEMP_BASE_1           0xc8000000  DCACHE_WAY_SIZE
   | remap area 1     |
   +------------------+
   | Cache aliasing   |  TLBTEMP_BASE_2                       DCACHE_WAY_SIZE
@@ -124,7 +125,8 @@ Default MMUv2-compatible layout::
   +------------------+
   | VMALLOC area     |  VMALLOC_START            0xa0000000  128MB - 64KB
   +------------------+  VMALLOC_END
-  | Cache aliasing   |  TLBTEMP_BASE_1           0xa7ff0000  DCACHE_WAY_SIZE
+  +------------------+
+  | Cache aliasing   |  TLBTEMP_BASE_1           0xa8000000  DCACHE_WAY_SIZE
   | remap area 1     |
   +------------------+
   | Cache aliasing   |  TLBTEMP_BASE_2                       DCACHE_WAY_SIZE
@@ -167,7 +169,8 @@ Default MMUv2-compatible layout::
   +------------------+
   | VMALLOC area     |  VMALLOC_START            0x90000000  128MB - 64KB
   +------------------+  VMALLOC_END
-  | Cache aliasing   |  TLBTEMP_BASE_1           0x97ff0000  DCACHE_WAY_SIZE
+  +------------------+
+  | Cache aliasing   |  TLBTEMP_BASE_1           0x98000000  DCACHE_WAY_SIZE
   | remap area 1     |
   +------------------+
   | Cache aliasing   |  TLBTEMP_BASE_2                       DCACHE_WAY_SIZE
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index fa054a1772e1..4dc04e6c01d7 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -69,7 +69,7 @@
  */
 #define VMALLOC_START		(XCHAL_KSEG_CACHED_VADDR - 0x10000000)
 #define VMALLOC_END		(VMALLOC_START + 0x07FEFFFF)
-#define TLBTEMP_BASE_1		(VMALLOC_END + 1)
+#define TLBTEMP_BASE_1		(VMALLOC_START + 0x08000000)
 #define TLBTEMP_BASE_2		(TLBTEMP_BASE_1 + DCACHE_WAY_SIZE)
 #if 2 * DCACHE_WAY_SIZE > ICACHE_WAY_SIZE
 #define TLBTEMP_SIZE		(2 * DCACHE_WAY_SIZE)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
