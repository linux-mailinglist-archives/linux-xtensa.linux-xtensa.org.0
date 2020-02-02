Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5766114FB0E
	for <lists+linux-xtensa@lfdr.de>; Sun,  2 Feb 2020 01:36:21 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5B6BC6565;
	Sun,  2 Feb 2020 00:25:30 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 4183B6555
 for <linux-xtensa@linux-xtensa.org>; Sun,  2 Feb 2020 00:25:28 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n18so10938874ljo.7
 for <linux-xtensa@linux-xtensa.org>; Sat, 01 Feb 2020 16:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TAXxpj4tPoC0GNKicfwpo6QW1slSTCEUN59yrjYrL4o=;
 b=Yp3HJg4nrrSth7lEODc7sbMmSS02GB5EBZcMnoSV1CYbbuZCb4USqoOBtiUFwUFaW0
 vLnOipKM1upHtIuJkBh1IP0UV9SNI66q22/lr6OD9ffyQJpSUZ0s+LEqovlqlT70CKeX
 /JGovXjKF6Iru8/lASdsUi3f8yTeCkEEoKJOqms7CyJbL96tJ2nYxLC3gTbu+wICZFCa
 rWyeSc/DSSLCfLJlVNlOtlmwVKde0eI100+6+WN7+HbsR20AmGCvd0FB4k5FKP91Tb6B
 ArIrVyUKVGhI3dcrj2EvN30v1BelTSL2wYw4H7p0tMO2A/DuDN8lqk5EUU6czkeMdGD2
 kjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TAXxpj4tPoC0GNKicfwpo6QW1slSTCEUN59yrjYrL4o=;
 b=rKyoO4zr+Kir2n5+1iNRW4zbRYVziRZ5Hxo1oRMySDXh+xLZkUGZJm7BkT8RAWDVKl
 1GjzfGO4TgO4N8wAALpnKUipawPUAdySWV5T/0QhMCDuDNm+h4B5W+HUA+/rZO6Hbovf
 Zjw8G+Nby9ksVHtjJ8Szl++mg0R773BgbspYc2fFWgjN/n2hS5/QI5CLZjrI4hG0VdNn
 woF3SklSIXaDl5KkG1kXklBKtIuJBffdh83BRIZ0f86IQnrq1DJ+TgxlvJJTWr1s3ZLx
 x+vngzYXCLr/ItTZ+FtPmM2pnX0IRk3KjU6/Y+SGQT4BqCSXkEpR5T/Mwepyv2NCrUoX
 TJig==
X-Gm-Message-State: APjAAAUCzyF79xsjZpyMSAchtAWYNLbQOwCXR+jNScQ4voBa4rcReS0K
 oz/TeJv3Vbafe74KnP/+YoVJdwUDfR4=
X-Google-Smtp-Source: APXvYqwJDSgTjHIWzXzhrGQyhs3xMeA/8kU3ToZbE5/cvrLBgvIH6LozUoLZFOIMuS+oVdC3acWpfQ==
X-Received: by 2002:a2e:9050:: with SMTP id n16mr9762532ljg.49.1580603776950; 
 Sat, 01 Feb 2020 16:36:16 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id p26sm6711312lfh.64.2020.02.01.16.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 16:36:16 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat,  1 Feb 2020 16:36:01 -0800
Message-Id: <20200202003604.30767-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/3] xtensa: reorganize vectors placement
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
 arch/xtensa/kernel/entry.S              |  17 ++--
 arch/xtensa/kernel/setup.c              |   8 +-
 arch/xtensa/kernel/vectors.S            |   3 +-
 arch/xtensa/kernel/vmlinux.lds.S        | 102 ++++++++++++++----------
 10 files changed, 119 insertions(+), 64 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
