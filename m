Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3B6488D6
	for <lists+linux-xtensa@lfdr.de>; Mon, 17 Jun 2019 18:26:44 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2E32C6441;
	Mon, 17 Jun 2019 16:23:34 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id EE08A6435
 for <linux-xtensa@linux-xtensa.org>; Mon, 17 Jun 2019 16:23:30 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id h10so9925645ljg.0
 for <linux-xtensa@linux-xtensa.org>; Mon, 17 Jun 2019 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YN+nlXCoigKXUcX1C4XZ0RGkTwUavyF2p9QJ8i/gIUM=;
 b=MyhpSX3oOkEPMEu8pGJ4kWxYH1tMKUsev1IbDU8svXfa2SK9GcmuN/Z+WWK4v/ME0U
 tR7hoLh64nohmvZ2u1Wc09E5s6JMfSGBZ/f6ZZIExrPBOlvHd42OnIGSYpvNqYF7hn1p
 ShFosO2SMRqcK0rtj4naPUyrwXjfZRuIvH+2IUz8vsyebmIyO1ftDzd6/i1acmqjumdw
 QjPIsT7INoy9TaLbnHEP7n9U4qtnX524+QoA0qBl8yXVnHUan9QQem3elW1TtbZmJffj
 k9uUr8UWuoJxxQ2wFeazzJ+O/0GjzvfrtNCzVy7Js47Ai1NtO7kHUEpcsUM2+WFAZ+/s
 qwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YN+nlXCoigKXUcX1C4XZ0RGkTwUavyF2p9QJ8i/gIUM=;
 b=DSDdb58coUvT3s/YPA5ADZn3apjW1YIuK9GPq0cbRzTcD/gs1S2X4AcvvA7qRjKz3v
 3m0V6zHMvxyMhfNhVQ0934A3n74cerkuZjWrTpfYFnWud8Zr7U2ltP3ADiSfyyTwkTay
 hFDXm18BuOZf0fUgrDCh0GGLHAvuED0mPflqBbQxrkNRZm3edqbUhdR0+Rx5PzITKtBV
 yxXifMSR6cmM+Pw/ZFWLftmBm2PitTo7bDbI8DWiBmz9796CMJ2eDISSbOUtwabyT2IG
 Aw89gQh5qtHgChATvmVm29Co6DobH1Dz1sYF8Ib16YJrA5VT5/nDl29b2acGvH371an9
 LfVA==
X-Gm-Message-State: APjAAAWaDGOpg4RBsYDePPOG0P2E8bBAX2qMK3t+++qDFYHNYypoYO9O
 c1jtDqijz+8SM28T5LMWmNs0o760
X-Google-Smtp-Source: APXvYqz2i9TLqakDlf0dFxe2u0rj6wkf09bifM5O/Hk4txwjK6NJ/UVllf7wODdkqpMy5yNHDUf7Vg==
X-Received: by 2002:a2e:9a96:: with SMTP id p22mr12293516lji.57.1560788799522; 
 Mon, 17 Jun 2019 09:26:39 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id v14sm1834721lfb.50.2019.06.17.09.26.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 09:26:38 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 17 Jun 2019 09:26:22 -0700
Message-Id: <20190617162623.28518-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190617162623.28518-1-jcmvbkbc@gmail.com>
References: <20190617162623.28518-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/2] xtensa: drop dead PCI support code
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

xtensa-specific PCI initialization code has significantly bitrotted over
time because there's no platform that use it. Get rid of remaining
non-functioning initialization and remove platform_pcibios_* interface.
A new platform that would use PCI on xtensa will configure PCI
controller using device tree.

Drop variables pci_ctrl_head, pci_bus_count and functions pcibios_init,
pci_controller_apertures, platform_pcibios_init and
platform_pcibios_fixup.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/platform.h | 10 -----
 arch/xtensa/kernel/pci.c           | 91 --------------------------------------
 arch/xtensa/kernel/platform.c      |  2 -
 arch/xtensa/kernel/setup.c         |  4 --
 4 files changed, 107 deletions(-)

diff --git a/arch/xtensa/include/asm/platform.h b/arch/xtensa/include/asm/platform.h
index 560483356a06..913826dfa838 100644
--- a/arch/xtensa/include/asm/platform.h
+++ b/arch/xtensa/include/asm/platform.h
@@ -55,16 +55,6 @@ extern void platform_idle (void);
 extern void platform_heartbeat (void);
 
 /*
- * platform_pcibios_init is called to allow the platform to setup the pci bus.
- */
-extern void platform_pcibios_init (void);
-
-/*
- * platform_pcibios_fixup allows to modify the PCI configuration.
- */
-extern int platform_pcibios_fixup (void);
-
-/*
  * platform_calibrate_ccount calibrates cpu clock freq (CONFIG_XTENSA_CALIBRATE)
  */
 extern void platform_calibrate_ccount (void);
diff --git a/arch/xtensa/kernel/pci.c b/arch/xtensa/kernel/pci.c
index e0235e34e1ba..14effa40eb7d 100644
--- a/arch/xtensa/kernel/pci.c
+++ b/arch/xtensa/kernel/pci.c
@@ -24,22 +24,6 @@
 #include <asm/pci-bridge.h>
 #include <asm/platform.h>
 
-/* PCI Controller */
-
-
-/*
- * pcibios_alloc_controller
- * pcibios_enable_device
- * pcibios_fixups
- * pcibios_align_resource
- * pcibios_fixup_bus
- * pci_bus_add_device
- */
-
-static struct pci_controller *pci_ctrl_head;
-
-static int pci_bus_count;
-
 /*
  * We need to avoid collisions with `mirrored' VGA ports
  * and other strange ISA hardware, so we always want the
@@ -74,81 +58,6 @@ pcibios_align_resource(void *data, const struct resource *res,
 	return start;
 }
 
-static void __init pci_controller_apertures(struct pci_controller *pci_ctrl,
-					    struct list_head *resources)
-{
-	struct resource *res;
-	unsigned long io_offset;
-	int i;
-
-	io_offset = (unsigned long)pci_ctrl->io_space.base;
-	res = &pci_ctrl->io_resource;
-	if (!res->flags) {
-		if (io_offset)
-			pr_err("I/O resource not set for host bridge %d\n",
-			       pci_ctrl->index);
-		res->start = 0;
-		res->end = IO_SPACE_LIMIT;
-		res->flags = IORESOURCE_IO;
-	}
-	res->start += io_offset;
-	res->end += io_offset;
-	pci_add_resource_offset(resources, res, io_offset);
-
-	for (i = 0; i < 3; i++) {
-		res = &pci_ctrl->mem_resources[i];
-		if (!res->flags) {
-			if (i > 0)
-				continue;
-			pr_err("Memory resource not set for host bridge %d\n",
-			       pci_ctrl->index);
-			res->start = 0;
-			res->end = ~0U;
-			res->flags = IORESOURCE_MEM;
-		}
-		pci_add_resource(resources, res);
-	}
-}
-
-static int __init pcibios_init(void)
-{
-	struct pci_controller *pci_ctrl;
-	struct list_head resources;
-	struct pci_bus *bus;
-	int next_busno = 0, ret;
-
-	pr_info("PCI: Probing PCI hardware\n");
-
-	/* Scan all of the recorded PCI controllers.  */
-	for (pci_ctrl = pci_ctrl_head; pci_ctrl; pci_ctrl = pci_ctrl->next) {
-		pci_ctrl->last_busno = 0xff;
-		INIT_LIST_HEAD(&resources);
-		pci_controller_apertures(pci_ctrl, &resources);
-		bus = pci_scan_root_bus(NULL, pci_ctrl->first_busno,
-					pci_ctrl->ops, pci_ctrl, &resources);
-		if (!bus)
-			continue;
-
-		pci_ctrl->bus = bus;
-		pci_ctrl->last_busno = bus->busn_res.end;
-		if (next_busno <= pci_ctrl->last_busno)
-			next_busno = pci_ctrl->last_busno+1;
-	}
-	pci_bus_count = next_busno;
-	ret = platform_pcibios_fixup();
-	if (ret)
-		return ret;
-
-	for (pci_ctrl = pci_ctrl_head; pci_ctrl; pci_ctrl = pci_ctrl->next) {
-		if (pci_ctrl->bus)
-			pci_bus_add_devices(pci_ctrl->bus);
-	}
-
-	return 0;
-}
-
-subsys_initcall(pcibios_init);
-
 void pcibios_fixup_bus(struct pci_bus *bus)
 {
 	if (bus->parent) {
diff --git a/arch/xtensa/kernel/platform.c b/arch/xtensa/kernel/platform.c
index 1cf008284dd2..a95ba05b0abe 100644
--- a/arch/xtensa/kernel/platform.c
+++ b/arch/xtensa/kernel/platform.c
@@ -34,8 +34,6 @@ _F(void, halt, (void), { while(1); });
 _F(void, power_off, (void), { while(1); });
 _F(void, idle, (void), { __asm__ __volatile__ ("waiti 0" ::: "memory"); });
 _F(void, heartbeat, (void), { });
-_F(int,  pcibios_fixup, (void), { return 0; });
-_F(void, pcibios_init, (void), { });
 
 #ifdef CONFIG_XTENSA_CALIBRATE_CCOUNT
 _F(void, calibrate_ccount, (void),
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 176cb46bcf12..5cb8a62e091c 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -405,10 +405,6 @@ void __init setup_arch(char **cmdline_p)
 	conswitchp = &dummy_con;
 # endif
 #endif
-
-#ifdef CONFIG_PCI
-	platform_pcibios_init();
-#endif
 }
 
 static DEFINE_PER_CPU(struct cpu, cpu_data);
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
