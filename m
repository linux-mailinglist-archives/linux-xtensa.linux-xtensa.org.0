Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 66F1B69A15
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Jul 2019 19:44:52 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id DB60052A7;
	Mon, 15 Jul 2019 17:40:41 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 949753566
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jul 2019 17:40:39 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z28so17187837ljn.4
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jul 2019 10:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lN7NolkvgcEAi2xoTGIqWk3kYzQk+ol6Awu1yLItqUA=;
 b=ZLrQKjaj7huMHrfrkDQqhRaPPeLbmbgXI5QvCRdJEPV7lBgNacx2aDqK1gtjTkLxpk
 8fxivqeUkGQTFlcVEnjw6Jvvgn5XNfKXhp7AinsJ9jLrYfKckS8WLiMb9vV1M6C84ifq
 u3mGPGGpr+Q0p3o1i7yfLr692BFeIvadk/FvCC6Je53GAgh+K8uB3HndKud08fHIBLFc
 4AkCGIgjz5LsDc5nMxvrP07VO/9rgz/6d9zbcprP7YPAOy1D/2Syjm09lJAIsjLPmrsl
 2vLyGpvRnBzd+y5zrU59d55vM2pwVDmwbFB4aSLtXgDoNaVVtmIyMa7CsnkcnrKLR8ec
 npkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lN7NolkvgcEAi2xoTGIqWk3kYzQk+ol6Awu1yLItqUA=;
 b=Uiai2uEPzI8LjrBJDQqKLZyCPuKTcotG9eun8AFdDU936BOsqSQD0saFQ4vJhY04DG
 8DG4L5eJKFl1+0JgL2rS4oU93KaC3HrSWa7kzUfc45RSTsPtGeMhsVSKqI8K5cc2Fh3e
 CfgkqMUU5N34MoA8CqJnTmrML3fJIswFEIh9PUHGoKrLBrnworW2wqfrNMqHY6CP8SRF
 u6RvQmANmQkGYyLH4wWfrdXiXyRJd92lp9h8l4Ueos0lb2a18tFM70Tm6wAJgLg63Wrl
 msjj5f/lZoMyJ1sX6jI8p+dOEWzwpLV2YziYkDN+4UviiLpu/NWHzzKKEkD1JwL/jhog
 ZBLQ==
X-Gm-Message-State: APjAAAX7JabXMlW1s8+J4dfI9gyoFX9TJFFhPCHFMaTmCIFmfrPBTtmL
 laExYOynd8rZ80nBLwQXtl8=
X-Google-Smtp-Source: APXvYqwl5QVR0MSi4chrtMnfImvMNFt4ODmIHWF8jWRqUtLjAVwkhUFOFPeRIEX+8kqysR6t4Tvbww==
X-Received: by 2002:a2e:298a:: with SMTP id p10mr14429150ljp.74.1563212687922; 
 Mon, 15 Jul 2019 10:44:47 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id t21sm2431287lfl.17.2019.07.15.10.44.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 10:44:47 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2019 10:44:27 -0700
Message-Id: <20190715174427.6144-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/7] xtensa updates for v5.3
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

Hi Linus,

please pull the following batch of updates for the Xtensa architecture:

The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:

  Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)

are available in the git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20190715

for you to fetch changes up to 775f1f7eacede583ec25ed56e58c4483f2b29265:

  xtensa: virt: add defconfig and DTS (2019-07-08 14:32:06 -0700)

----------------------------------------------------------------
Xtensa updates for v5.3:

- clean up PCI support code;
- add defconfig and DTS for the 'virt' board;
- abstract 'entry' and 'retw' uses in xtensa assembly in preparation for
  XEA3/NX pipeline support;
- random small cleanups.

----------------------------------------------------------------
Guenter Roeck (1):
      xtensa/PCI: Remove unused variable

Markus Elfring (1):
      xtensa: One function call less in bootmem_init()

Max Filippov (5):
      xtensa: drop dead PCI support code
      xtensa: use generic pcibios_set_master and pcibios_enable_device
      xtensa: remove arch/xtensa/include/asm/types.h
      xtensa: abstract 'entry' and 'retw' in assembly code
      xtensa: virt: add defconfig and DTS

 arch/xtensa/boot/dts/virt.dts      |  72 +++++++++++++++++++++
 arch/xtensa/configs/virt_defconfig | 113 +++++++++++++++++++++++++++++++++
 arch/xtensa/include/asm/asmmacro.h |  46 ++++++++++++++
 arch/xtensa/include/asm/platform.h |  10 ---
 arch/xtensa/include/asm/types.h    |  23 -------
 arch/xtensa/kernel/coprocessor.S   |   7 ++-
 arch/xtensa/kernel/entry.S         |  11 ++--
 arch/xtensa/kernel/mcount.S        |  11 ++--
 arch/xtensa/kernel/pci.c           | 124 -------------------------------------
 arch/xtensa/kernel/platform.c      |   2 -
 arch/xtensa/kernel/setup.c         |   4 --
 arch/xtensa/lib/checksum.S         |  12 ++--
 arch/xtensa/lib/memcopy.S          |  38 ++++++------
 arch/xtensa/lib/memset.S           |  10 +--
 arch/xtensa/lib/strncpy_user.S     |  16 ++---
 arch/xtensa/lib/strnlen_user.S     |  14 ++---
 arch/xtensa/lib/usercopy.S         |  12 ++--
 arch/xtensa/mm/init.c              |   5 +-
 arch/xtensa/mm/misc.S              |  78 +++++++++++------------
 19 files changed, 339 insertions(+), 269 deletions(-)
 create mode 100644 arch/xtensa/boot/dts/virt.dts
 create mode 100644 arch/xtensa/configs/virt_defconfig
 delete mode 100644 arch/xtensa/include/asm/types.h

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
