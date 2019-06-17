Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 90B7D488D7
	for <lists+linux-xtensa@lfdr.de>; Mon, 17 Jun 2019 18:26:45 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 492DC644A;
	Mon, 17 Jun 2019 16:23:35 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 38AE86435
 for <linux-xtensa@linux-xtensa.org>; Mon, 17 Jun 2019 16:23:33 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y17so7007194lfe.0
 for <linux-xtensa@linux-xtensa.org>; Mon, 17 Jun 2019 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+EF/DLlc5OPA1ztK7k8MJSQO8RnJGY+j7agy7KdOgII=;
 b=BbNZ/+1uXkQzU3vL9qrh5wMGEufv/b4wIvYfPSbYXVjepaopRTxaG1jsCGAV1IGavy
 FpuTo+F5EHaKV5rKK0UVyPoq1zzXzkdj7gRVkiZjAJV9Pybzmg/M1UJFRkmEku/zo8gU
 zoH3usNstyJ/Fhp/5muXIQjvz622FIBWZ/CwRTDNakWmJwMsgXKS5mjdw1RUq6BhUGNG
 pGep7LKY6oa9hUJ++iQudtjRBE3PjUGSTIz6rVgJS8gfv6G6DhVk0af7aZnraP2XiGtq
 UifubBr5Oge+XTq/FLsE8RfwYS4wXUtngMWD4mLZr2dd7gpJiWPrB1u2uKd/k87uJrO2
 Qrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+EF/DLlc5OPA1ztK7k8MJSQO8RnJGY+j7agy7KdOgII=;
 b=uBMmiduGkQhTNTG9xHz01+03eM2LI2l7tgskL/+ekXCQPyCh+NY+TxiwACQqZpEZ3m
 rjj+6eXM7hQ16ceubIIj28JhFa/ShDG6AdlQIpU7tREY3fmK3tlwddSAMmM5sgC+Hi89
 dJ/ltcqy9hz4u5g0WXC1CCQIPAqgOoJe6u0b822iomEhnMF50KZshYGt2ldea8TxnajC
 gR2yDRIS0u+3IOXUrGO2mm3ste+bw6nUttIuD6DtHkW6dMfDjLcaAd6NIctN2y8wsAv+
 y3cX4BJvPl76JOh633q33L0Ix7Dqe6d7TeWpZi3j66xRIPZRl+JBATsp/9vByTu530JH
 MjnQ==
X-Gm-Message-State: APjAAAWcbrBsT/CUrBRviI2b1Nm8XNyV+BvZcZDoR5WkbrZAsthwh/oJ
 rvpET+hqAULlOMTxOdoRvO7o3b5G
X-Google-Smtp-Source: APXvYqyX5caaKuu9fgY3szAunqcWzkopEMUKf7zev3A3yaSsO8zGZWvDyfxTBXhp91qggF1SBWrx6w==
X-Received: by 2002:a19:9f84:: with SMTP id
 i126mr56288236lfe.142.1560788801519; 
 Mon, 17 Jun 2019 09:26:41 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id v14sm1834721lfb.50.2019.06.17.09.26.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 09:26:41 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 17 Jun 2019 09:26:23 -0700
Message-Id: <20190617162623.28518-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190617162623.28518-1-jcmvbkbc@gmail.com>
References: <20190617162623.28518-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/2] xtensa: use generic pcibios_set_master
	and pcibios_enable_device
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

Both functions don't do anything xtensa-specific and there are generic
implementations for both. Drop both and use generic versions.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/pci.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/arch/xtensa/kernel/pci.c b/arch/xtensa/kernel/pci.c
index 14effa40eb7d..3f32e275997a 100644
--- a/arch/xtensa/kernel/pci.c
+++ b/arch/xtensa/kernel/pci.c
@@ -66,38 +66,6 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 	}
 }
 
-void pcibios_set_master(struct pci_dev *dev)
-{
-	/* No special bus mastering setup handling */
-}
-
-int pcibios_enable_device(struct pci_dev *dev, int mask)
-{
-	u16 cmd, old_cmd;
-	int idx;
-	struct resource *r;
-
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	old_cmd = cmd;
-	for (idx=0; idx<6; idx++) {
-		r = &dev->resource[idx];
-		if (!r->start && r->end) {
-			pci_err(dev, "can't enable device: resource collisions\n");
-			return -EINVAL;
-		}
-		if (r->flags & IORESOURCE_IO)
-			cmd |= PCI_COMMAND_IO;
-		if (r->flags & IORESOURCE_MEM)
-			cmd |= PCI_COMMAND_MEMORY;
-	}
-	if (cmd != old_cmd) {
-		pci_info(dev, "enabling device (%04x -> %04x)\n", old_cmd, cmd);
-		pci_write_config_word(dev, PCI_COMMAND, cmd);
-	}
-
-	return 0;
-}
-
 /*
  * Platform support for /proc/bus/pci/X/Y mmap()s.
  *  -- paulus.
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
