Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 9E920152645
	for <lists+linux-xtensa@lfdr.de>; Wed,  5 Feb 2020 07:25:46 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 0D8B95848;
	Wed,  5 Feb 2020 06:14:49 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by linux-xtensa.org (Postfix) with ESMTPS id DB29552AD
 for <linux-xtensa@linux-xtensa.org>; Wed,  5 Feb 2020 06:14:47 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id z26so597108lfg.13
 for <linux-xtensa@linux-xtensa.org>; Tue, 04 Feb 2020 22:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ROpQJU+AsBaOWzqFjZEzQWM2YbA0D8wEHEgEaCyVfPI=;
 b=e035I9oI04XqxRPmfhnSDr3cLl6WYAUdh8js6VQkjPpTdIH88nL8DhNfhzIKIrSbvT
 t46VOgDwxC055GArZ/MvJVUl0j98XWxrUSj5T+dKy2UHdrJor21YSm8BDLu07xrV8vkl
 0/YylkJo2DNplXE1PmaniQHJI+oR4vd8ARWk/FUDn21JZdN6W/p70kO0wpNJtZ+1h5kt
 kE2BqsQPz3ktNaUtUr7c1Z4+AxtiCcOw6MQv25Q0umLz+l+m/w5xoxx3KlHA9vf8O2LA
 nNMy7Q/D1v+g3tRf5F8jrteHJ7FHNMJ7KCevOoNcFO22Q/ewR7+g50/jyD0AgGm/bouK
 zK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ROpQJU+AsBaOWzqFjZEzQWM2YbA0D8wEHEgEaCyVfPI=;
 b=EHQwvOqPInRPICu7laZ2I9qc3Kng1Fnj9zBVKzhygqe8kWV2EbA8ArVV58gQA/OO1V
 EsL/NbZnvDxNdH4e+hwlciDaXjbnCF4KZmI2YNpdu4AX7KL0INlujBOxT5pf9UGRDnCz
 5KelCbYCvWMa+EtI9FdovckcjdyeO255CHCDsg76fAc6HqgZgON5ONjJ5XdvWzI+PVX+
 tL5edaKqDwiBuvSJD57lUl59yFiilqXxOVo4/OjPnXAr9lH5CEJwPtloWiW67C/hVRI/
 vyw7h5zITcD5yyU1QOQrOkrhIrNfKzJuWxGh6vcSEAjkeAnsI7XQ1v50Nu0tsGZZ3Q6z
 KrnQ==
X-Gm-Message-State: APjAAAVMYUvRtSiV3CNYhFSUfmYRuNrvxV+wMY9IM7Akjcfaxyw+wJQU
 SfS3qcsrItUKTcEf+E9mStaLAZC8tzo=
X-Google-Smtp-Source: APXvYqz/NQS78obs1digvp++W5EIgeVaghyr5THY6IjiQokarFRYPvg/YEbItDUW6M35unbqpHjJEQ==
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr17293897lfg.117.1580883942583; 
 Tue, 04 Feb 2020 22:25:42 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r26sm11545446lfm.82.2020.02.04.22.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 22:25:41 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  4 Feb 2020 22:25:26 -0800
Message-Id: <20200205062529.7046-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v3 0/3] xtensa: reorganize vectors placement
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

Hello,

this series adds an option to have vectors and fast exception handlers
combined at a specific virtual address or have them merged into the
kernel .text section, which is now default.

Changes v2->v3:
- rename .handler.text to .exception.text to allow referencing it
  from the .fixup section. This fixes section mismatch build warning
  when CONFIG_FAST_SYSCALL_XTENSA is enabled.

Changes v1->v2:
- add .literal_position to handlers section in entry.S

Max Filippov (3):
  xtensa: move fast exception handlers close to vectors
  xtensa: separate SMP and XIP support
  xtensa: reorganize vectors placement

 arch/xtensa/Kconfig                     |  40 ++++++++--
 arch/xtensa/configs/smp_lx200_defconfig |   1 -
 arch/xtensa/configs/virt_defconfig      |   1 -
 arch/xtensa/include/asm/asmmacro.h      |   2 +
 arch/xtensa/include/asm/vectors.h       |   4 +-
 arch/xtensa/kernel/coprocessor.S        |   5 +-
 arch/xtensa/kernel/entry.S              |  18 +++--
 arch/xtensa/kernel/setup.c              |   8 +-
 arch/xtensa/kernel/vectors.S            |   3 +-
 arch/xtensa/kernel/vmlinux.lds.S        | 102 ++++++++++++++----------
 10 files changed, 120 insertions(+), 64 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
