Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 76608D822B
	for <lists+linux-xtensa@lfdr.de>; Tue, 15 Oct 2019 23:27:54 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9806B6459;
	Tue, 15 Oct 2019 21:20:25 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 82E04643E
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Oct 2019 21:20:20 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y23so21747630lje.9
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Oct 2019 14:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVHn2NsX5B43le8B3EzhzIe6h5tssyt0eUzyXr5fRms=;
 b=fFMRjYmuNY/EYaYPvODMmokfwxbkt954msSOcq8ybTuZgxihReM7+van6dQnlyIZX0
 tzLDOY0yYHQ5i1bm66t+XAn2jhutPxAl1K0enno6VdNamNUMx3bbGq6aAES7fkU1Jksz
 t05xxP2Mv/PMj5hExJRLshmsGptfuTwy/8zfBB0PrHs6Xwb2Q2kRNJZ39AhvVfCBO+2a
 NwdoWPE8oLGuejQM/7VgcBMvBBKw5vzDf5BXDiayiat/eF2SGSTKnb4Foh/vy0noLzAe
 fRGJoVLq5PEemmvE71DlN9w7eQ7umh1KwUmfQ7lZGfWcVeh00ZJejhRTRNvyrrPGUCZ/
 d3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EVHn2NsX5B43le8B3EzhzIe6h5tssyt0eUzyXr5fRms=;
 b=r3TGVAbprlrZhdEsatGg1mbS4B5P3kS+Ea/+yER1F2Zuw9cnm28+Y8/z3ckhLy+dxJ
 xl+WAZi+QGaWhc9XIMtG033rVVtktZ3x5dSF+Gtvm1P6o/bVc6vlKErJkd5JKbXa5OT/
 iDIQKeKQjkzR7PfFjZyNUUnmqXjTgXmQL0t/aEgdT87ZphPlmZXpwHtO+P77EBlF6y6B
 4tCL8TrZZfKojDfXBSMHLxWgDG5xKjie6rXz7Psk7BzXUWNJCQGaw3/EVTcL/9bnBG/8
 S4C/GVz4t6cSYyzpti7moy16s54FrXr8dzjdAzXrkIQh273qCy5horWgEpBMtfWYepet
 1k2Q==
X-Gm-Message-State: APjAAAUqDUxvuDyCp1iAUMKpZAtMvo6Mlo4h6GAtv4CMIpfaFeCZoWH0
 eoo3nN853dWu1g7XebjWK2pJc2f5+8E=
X-Google-Smtp-Source: APXvYqyiozfzDnQC1amBm6yNL2SxT+UJbl/whBsyzrUlYhwUlmmMcg0aa7IfIzIr7QasZHbmzYpQEQ==
X-Received: by 2002:a2e:9ec2:: with SMTP id h2mr20570006ljk.85.1571174864377; 
 Tue, 15 Oct 2019 14:27:44 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id j127sm6489849lfd.63.2019.10.15.14.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 14:27:43 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 15 Oct 2019 14:27:32 -0700
Message-Id: <20191015212732.1992-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: virt: fix PCI IO ports mapping
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

virt device tree incorrectly uses 0xf0000000 on both sides of PCI IO
ports address space mapping. This results in incorrect port address
assignment in PCI IO BARs and subsequent crash on attempt to access
them. Use 0 as base address in PCI IO ports address space.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/boot/dts/virt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/boot/dts/virt.dts b/arch/xtensa/boot/dts/virt.dts
index a9dcd87b6eb1..611b98a02a65 100644
--- a/arch/xtensa/boot/dts/virt.dts
+++ b/arch/xtensa/boot/dts/virt.dts
@@ -56,7 +56,7 @@
 		reg = <0xf0100000 0x03f00000>;
 
 		     // BUS_ADDRESS(3)  CPU_PHYSICAL(1)  SIZE(2)
-		ranges = <0x01000000 0x0 0xf0000000  0xf0000000  0x0 0x00010000>,
+		ranges = <0x01000000 0x0 0x00000000  0xf0000000  0x0 0x00010000>,
 			 <0x02000000 0x0 0xf4000000  0xf4000000  0x0 0x08000000>;
 
 		     // PCI_DEVICE(3)  INT#(1)  CONTROLLER(PHANDLE)  CONTROLLER_DATA(2)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
