Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 4C015C1B04
	for <lists+linux-xtensa@lfdr.de>; Mon, 30 Sep 2019 07:33:32 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2AC326499;
	Mon, 30 Sep 2019 05:26:38 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by linux-xtensa.org (Postfix) with ESMTPS id E1DB16489
 for <linux-xtensa@linux-xtensa.org>; Mon, 30 Sep 2019 05:26:36 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id b20so8015522ljj.5
 for <linux-xtensa@linux-xtensa.org>; Sun, 29 Sep 2019 22:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ALU3ETjRpvpykxWjWBQy4d6Y5qcKvcWseKPlLYQFg14=;
 b=aED+GzqiPNDWAwfKj0BnK0YJkPlr8tc9B1topf6W4PXd8MSKPlvAnmp1YyCL4MHz8/
 psKp83AR1p0ad1OZdHQwuEkMqsUwDbQR4Aafb5PfQC9amDZ6hvSjwA+lc+nc+UwPNEX/
 AoGZi0p54XNYVJkhnaH1/CbEMwpFKEKNqaVE9jgxxli0c0xv4JxZHcuvJfz07jJyU2xw
 ExLfuWxP8BogBbwh5aOeba8kT4c6GWXPs0kJWbfboelK6rPIITwukrdLUDLIkIPjdL6U
 o+w+srKslVzJaKDnBEMUqSyQEz1UmrGywfttNzuQFSJkgSq4e/4LSMvGbeSGibydeXuE
 za5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ALU3ETjRpvpykxWjWBQy4d6Y5qcKvcWseKPlLYQFg14=;
 b=qSHRAo29x9cosQkB90h7nUQF/HT1FXxkEH81eagSuPzX1iraODOAcg0RQN3Pktv17E
 c67O+zIl4Fkm5VxgObzn1wzizrhgPL1cEU96ZhLkIPphK3xcPfaKmjOdAlJLSl2q5218
 wYarCPVsBnHXdTUb6QmHus7UCqT+98oBrVJUArAhpt9ZDRyDxqQWVj0dFBAnuUYiLoMd
 PSDbn2Ef1HL/yOhk/0vP7guXrvAzD/MxuXieMY3UCV8gZ9Gtx8/uihu5tGpYux9OgiDt
 lFGhdnf9GGf5eS+Acf2xHjj4nf4M5ay2q1iEvlzZE4gIDpA2CvaWRILVsbicKCNtQPF2
 41Ow==
X-Gm-Message-State: APjAAAUsItonxVEts1uwGQgm3hT7aoRU6Opjfivn7+L3iHdd3JkcKPHv
 Y+FQ1uP16Zv2X6RO/wCBOb6WxPlX
X-Google-Smtp-Source: APXvYqwWDvpu/vM0KZ8M4fsC8HwWdWEybUGUnO2kcgazOCLybPOhqoN3zsiBeqYsLjgOPcRmOx1wGg==
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr11133757lje.118.1569821608507; 
 Sun, 29 Sep 2019 22:33:28 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id k23sm2944211ljc.13.2019.09.29.22.33.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Sep 2019 22:33:27 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 29 Sep 2019 22:33:01 -0700
Message-Id: <20190930053306.7029-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/5] xtensa: add XIP kernel support
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

Max Filippov (5):
  xtensa: move XCHAL_KIO_* definitions to kmem_layout.h
  xtensa: move MPU constants from .data to .ref.rodata
  xtensa: fix section name for start_info
  xtensa: use correct symbol for the end of .rodata
  xtensa: add XIP kernel support

 arch/xtensa/Kconfig                      |  39 ++++++++++
 arch/xtensa/Makefile                     |   3 +-
 arch/xtensa/boot/Makefile                |   5 ++
 arch/xtensa/configs/xip_kc705_defconfig  | 120 +++++++++++++++++++++++++++++++
 arch/xtensa/include/asm/cache.h          |   6 ++
 arch/xtensa/include/asm/initialize_mmu.h |   3 +-
 arch/xtensa/include/asm/kmem_layout.h    |  29 ++++++++
 arch/xtensa/include/asm/page.h           |  11 +++
 arch/xtensa/include/asm/vectors.h        |  44 ++----------
 arch/xtensa/kernel/head.S                |  13 +++-
 arch/xtensa/kernel/setup.c               |   7 ++
 arch/xtensa/kernel/vmlinux.lds.S         |  52 +++++++++++++-
 arch/xtensa/mm/init.c                    |   4 +-
 13 files changed, 289 insertions(+), 47 deletions(-)
 create mode 100644 arch/xtensa/configs/xip_kc705_defconfig

-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
