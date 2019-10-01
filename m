Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE48C2E78
	for <lists+linux-xtensa@lfdr.de>; Tue,  1 Oct 2019 09:58:16 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E57EA5820;
	Tue,  1 Oct 2019 07:51:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by linux-xtensa.org (Postfix) with ESMTPS id D9AF125D3
 for <linux-xtensa@linux-xtensa.org>; Tue,  1 Oct 2019 07:51:16 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id a22so12308648ljd.0
 for <linux-xtensa@linux-xtensa.org>; Tue, 01 Oct 2019 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7fb2cZnwsfkuUibkbWOVmuQyvTsXcMG9sT00ISlkwFM=;
 b=L9+a0y4iD3TIomlEKfGcoKVKur+dcvxbs15QawVI58q5DegMGyV4azrtvUOQWNNhXq
 ZV2q+CYaRXaAf97m3CsfipQGW823KJrOGmsU/2j8r/tsiJ/tX5HawoRF8NI7u3wOsTJ2
 lrilWc4Kc1pCHb7LA9AWLGOi3YQBzr3LQ/kGPmQ6yKNF2yz0OOqf3oATgrDP/24N4Oq1
 Mw5C4R3qgkyJZynQxRR/r6ZF+mlJK14JkS8Xb0SHffe/hbL9OqqDOGP797dmKcap7suh
 UbZ02AE4JfzQ0BFdk/88xZHaKUjbESSLNYufEIwvaCL8nndRXSbo7vhJffYnSr51YbfD
 VL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7fb2cZnwsfkuUibkbWOVmuQyvTsXcMG9sT00ISlkwFM=;
 b=SeVkeCNzf1wVlvQqLbew388qpqj0yI7XRTAEU6d2VEPy2Pwp2OIJmjwSH6Nm5WHfe8
 Dy4hWxrbrUSElixmfnWq1B2CMrllCQ6IX7WDdBCQBkFTG30eBbdMmWRCob4vwTWsCmEp
 ChXPWX1XhLYmEOO9PgJZElKvhMnGkZx6giDTz8mzMYk7BVIqtpvlTOfN/GW6UlmLuDMP
 XNlWJZHi8VM2jH3HaEvU9AcpZHJM6e4BEJJrxOQ/ICxsGFjBAh6Vsm12zEutoh+u0Ie1
 eG8EXEnDg+J3EHB/n/Q6cqYDYWXM6CnjABATeB+sCPpTlY+ONo99oXhgIy7q7gVlDJp2
 4ofQ==
X-Gm-Message-State: APjAAAUpTNMRN55Jwe0fe+/Ma0uOY+j6uzEZSLbNhrRfhSnhfha8YYtM
 AnPJ3lZSXE19Z1zxDbgS38YGmQBS
X-Google-Smtp-Source: APXvYqw6esHr5iuZXIxKXCe1OEPn0Pux0GxyZPc7ZFpHhw77Lh/VDHGV4K9c9s614fVd6rdbYxSNTA==
X-Received: by 2002:a2e:141c:: with SMTP id u28mr15173403ljd.44.1569916690950; 
 Tue, 01 Oct 2019 00:58:10 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm3775562lfm.71.2019.10.01.00.58.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 00:58:09 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  1 Oct 2019 00:57:33 -0700
Message-Id: <20191001075739.32447-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 0/6] xtensa: add XIP kernel support
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

Hello,

this series adds initial support for eXecute In Place kernel image for
xtensa. XIP image may be written to the bootloader region of the onboard
FLASH and the CPU will boot into linux executing its code directly from
FLASH.
There's also a few cleanups and an example MMU XIP defconfig.

Changes v1->v2:
- rearrange xtensa Kconfig kernel address space layout settings placement
- disable kernel features not supported with XIP
- restrict XIP to platforms that support it

Max Filippov (6):
  xtensa: move XCHAL_KIO_* definitions to kmem_layout.h
  xtensa: move MPU constants from .data to .ref.rodata
  xtensa: fix section name for start_info
  xtensa: use correct symbol for the end of .rodata
  xtensa: move kernel memory layout to platform options
  xtensa: add XIP kernel support

 arch/xtensa/Kconfig                      | 396 +++++++++++++++++--------------
 arch/xtensa/Makefile                     |   3 +-
 arch/xtensa/boot/Makefile                |   5 +
 arch/xtensa/configs/xip_kc705_defconfig  | 120 ++++++++++
 arch/xtensa/include/asm/cache.h          |   6 +
 arch/xtensa/include/asm/initialize_mmu.h |   3 +-
 arch/xtensa/include/asm/kmem_layout.h    |  29 +++
 arch/xtensa/include/asm/page.h           |  11 +
 arch/xtensa/include/asm/vectors.h        |  44 +---
 arch/xtensa/kernel/head.S                |  13 +-
 arch/xtensa/kernel/setup.c               |   7 +
 arch/xtensa/kernel/vmlinux.lds.S         |  52 +++-
 arch/xtensa/mm/init.c                    |   4 +-
 13 files changed, 471 insertions(+), 222 deletions(-)
 create mode 100644 arch/xtensa/configs/xip_kc705_defconfig

-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
