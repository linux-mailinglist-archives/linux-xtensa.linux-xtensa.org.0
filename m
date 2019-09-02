Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 04D7CA4F88
	for <lists+linux-xtensa@lfdr.de>; Mon,  2 Sep 2019 09:08:33 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 64DAA65BD;
	Mon,  2 Sep 2019 07:02:38 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 6CC9065BB
 for <linux-xtensa@linux-xtensa.org>; Mon,  2 Sep 2019 07:02:35 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 7so2311336ljw.7
 for <linux-xtensa@linux-xtensa.org>; Mon, 02 Sep 2019 00:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=w0zPlcAZK22GuojA8uniz3UJOWXLEpIqOizQTyA/cQ0=;
 b=rrdNfWonIRTmwjVKqny4XfPDBdfOTASdIPG2HYzW5qttF8+3Xdl8YLCBqtlCZKfdfy
 dlcC0hHfiBWdOl/uzn9W/2dKM6Z+hLOSt3anjTYmwF00rwIO8rb21Mpw33Yqa8BKf3DR
 oIOok+Z7lIzH9cRRB5zlhIUUHGmYP1dRifWCvz3CKKnhkx+TCHvFezEBHYmk129aXwAa
 lxxZPOfXfdTrd1AWMwKQbWqsqZEfV3V6LMFTlVUTq+JPJBm9ELFeTA6nfZuQ1qKaWj+u
 edPxzxkEy7wAIuk6QfR0wV+OG51prJPLjYq77k5sg2ajLxWk+T32OjdHq0CM5dTn6EGi
 +CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=w0zPlcAZK22GuojA8uniz3UJOWXLEpIqOizQTyA/cQ0=;
 b=tR3FFLdLF4EeTfsUE/EFfQT4Y4ypk5f0OiDhDaCmkoDz1SMzmKbDWCQm+A6IPLT9SG
 GSAMuqgkcVW02Zw+EnXPCIZUfMUHaE8eB7ccPcBU1gtX2JP1UymLNEUm5crFNSFBdn7l
 R1AkvuvzwupoqMBXTkeeVczYAI3TOy2vdC5s4q4rg3kBwQnkXCRH0RnfLrwbUapVsbG1
 nWzwvQjp7ulPl80K3+lX/8e7/dPD258ar2Ogw0QoAUurjCZiWjfe+DfDgCvtRcJJJxKX
 eSGMgDhXvlnSEmLMQpRZXnStJhFhH6EEADWmsIRVuc7HlbCLe9GxHKr0bJt1Ljd0TBnU
 shCQ==
X-Gm-Message-State: APjAAAWYMEDn3pmSgvrHvVDfnYvvuIppnv8y2uizt4K9FQDY/zBX3hUL
 DBEuYDJPKHaG2s6XgHGTWVgBSYD8
X-Google-Smtp-Source: APXvYqxzD4B0Pmd5ccEzFWrlUKEm48GeR7NYCt8H1gtKumeH1Kmgo+ksPSltSMt/2WxZOg2wCkO0Lg==
X-Received: by 2002:a2e:b601:: with SMTP id r1mr5659611ljn.4.1567408107497;
 Mon, 02 Sep 2019 00:08:27 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id q24sm2316675lfa.94.2019.09.02.00.08.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 00:08:26 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  2 Sep 2019 00:08:04 -0700
Message-Id: <20190902070804.17661-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: virt: move PCI root complex to KIO
	range
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

Move PCI configuration space, MMIO and memory to the KIO range to free
vmalloc area and use static TLB to access them. Move MMIO to the
beginning of KIO and define PCI_IOBASE as XCHAL_KIO_BYPASS_VADDR to
match it. Reduce number of supported PCI buses to 0x3f so that ECAM
window fits into first 64MB of the KIO. Reduce size of the PCI memory
window to 128MB so that it fits into KIO.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/boot/dts/virt.dts | 8 ++++----
 arch/xtensa/include/asm/io.h  | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/xtensa/boot/dts/virt.dts b/arch/xtensa/boot/dts/virt.dts
index 6aecbc0f3549..a9dcd87b6eb1 100644
--- a/arch/xtensa/boot/dts/virt.dts
+++ b/arch/xtensa/boot/dts/virt.dts
@@ -52,12 +52,12 @@
 		#size-cells = <2>;
 		#interrupt-cells = <0x1>;
 
-		bus-range = <0x0 0x3f>;
-		reg = <0xc0000000 0x04000000>;
+		bus-range = <0x0 0x3e>;
+		reg = <0xf0100000 0x03f00000>;
 
 		     // BUS_ADDRESS(3)  CPU_PHYSICAL(1)  SIZE(2)
-		ranges = <0x01000000 0x0 0xc4000000  0xc4000000  0x0 0x04000000>,
-			 <0x02000000 0x0 0xc8000000  0xc8000000  0x0 0x18000000>;
+		ranges = <0x01000000 0x0 0xf0000000  0xf0000000  0x0 0x00010000>,
+			 <0x02000000 0x0 0xf4000000  0xf4000000  0x0 0x08000000>;
 
 		     // PCI_DEVICE(3)  INT#(1)  CONTROLLER(PHANDLE)  CONTROLLER_DATA(2)
 		interrupt-map = <
diff --git a/arch/xtensa/include/asm/io.h b/arch/xtensa/include/asm/io.h
index da3e783f896b..988e08530a5c 100644
--- a/arch/xtensa/include/asm/io.h
+++ b/arch/xtensa/include/asm/io.h
@@ -21,6 +21,7 @@
 
 #define IOADDR(x)		(XCHAL_KIO_BYPASS_VADDR + (x))
 #define IO_SPACE_LIMIT ~0
+#define PCI_IOBASE		((void __iomem *)XCHAL_KIO_BYPASS_VADDR)
 
 #ifdef CONFIG_MMU
 
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
