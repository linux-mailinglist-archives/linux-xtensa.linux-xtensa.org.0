Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 24262D8224
	for <lists+linux-xtensa@lfdr.de>; Tue, 15 Oct 2019 23:26:00 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 14DC15866;
	Tue, 15 Oct 2019 21:18:30 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id B6A6D583D
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Oct 2019 21:18:26 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id f23so133884lfk.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Oct 2019 14:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TupgV0MHjA8yhWmBL3cewNdEfIAySH9lA2snhT2KSA0=;
 b=gU0FNH+YkmD9qkMKyKIVtHQfL7lcArLVLw6hAZPGPh9wu58EpZ+OqTE5ywg4R6bFY+
 pkXIAD4EvoB/gq5QY5gfkd6tVajJJ+I7cgDFtE8U3E9XxbgIDHsFg5+ggcrBta64PCLp
 cCQ6uS/yBUw6Qefb03aimc23o9T6g2wc3Sg2H/xgKMAC3Af+08SLkLOBKVyduCs/ak54
 Tvc5EFS+2zAcirOKtZE0J6UoCXUvPvyOdFgeYoIimjMc9CxfwajW5OJrVyopbuEmmlhy
 eokWvZ336DJO9Kbbe0n+eEvJVpXqF+xa1u4SlwDxi8nEmoYHMz9QKwp/a233ViLfOUnU
 5Sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TupgV0MHjA8yhWmBL3cewNdEfIAySH9lA2snhT2KSA0=;
 b=KzGngnAt6gW2X6l8IbmKXD03wVTSlpeXzk7N5a0MyLCeaRQ0qlz0x6dTZeuwCehVuK
 p71mv7Cn2qbEQEY3UKgHGcwmOWrUH8WGJ9Nb9MgETptNLS34yJ5TVNZuVr1uM8KXXn7T
 evxtyCEtD1edd4lySQqf5wmd5n/toqvOtMxYvDRhR41TLwuuuD1LDXwHfqje+C5fJ8JA
 OxYHTJhyRQLv0bF5oDOKeNdxFmAVmxuierQGonA8UuaSzA976xu4qcIuQbhiQFwRe6Rj
 v5ag7DneJArHBGp9Qr66Si5V8Hamj8jKbbVS/wTUH9DtmmThesbjjN+2Thb9cKTtN3f0
 cx6g==
X-Gm-Message-State: APjAAAW3Aubza7f7BO7qyfATcxzQ37gwUcJjyCgILqcMQ5+PXcn3fdpt
 mIcajzytFc6b1RbT0dOtCic4uUb+iKg=
X-Google-Smtp-Source: APXvYqwYi9FHUGev/22Lws4+0G8iiMlMBA/PDnRq6muX/tFrhu8jEDv03Ihqb6Wd32ENbMM1SI5v7A==
X-Received: by 2002:ac2:44c3:: with SMTP id d3mr21412169lfm.109.1571174750137; 
 Tue, 15 Oct 2019 14:25:50 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id w30sm5313233lfn.82.2019.10.15.14.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 14:25:49 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 15 Oct 2019 14:25:26 -0700
Message-Id: <20191015212526.1775-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH] xtensa: implement arch_dma_coherent_to_pfn
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

Add trivial implementation for arch_dma_coherent_to_pfn.
This change enables communication with PCI ALSA devices through mmapped
buffers.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/Kconfig          | 1 +
 arch/xtensa/kernel/pci-dma.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index bf492f9e1f75..f78e6b6f8b6f 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -3,6 +3,7 @@ config XTENSA
 	def_bool y
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_BINFMT_FLAT if !MMU
+	select ARCH_HAS_DMA_COHERENT_TO_PFN
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_USE_QUEUED_RWLOCKS
diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
index 154979d62b73..6a114ce23084 100644
--- a/arch/xtensa/kernel/pci-dma.c
+++ b/arch/xtensa/kernel/pci-dma.c
@@ -200,3 +200,9 @@ void arch_dma_free(struct device *dev, size_t size, void *vaddr,
 	if (!dma_release_from_contiguous(dev, page, count))
 		__free_pages(page, get_order(size));
 }
+
+long arch_dma_coherent_to_pfn(struct device *dev, void *cpu_addr,
+			      dma_addr_t dma_addr)
+{
+	return __phys_to_pfn(dma_to_phys(dev, dma_addr));
+}
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
