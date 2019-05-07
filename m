Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 079A81570B
	for <lists+linux-xtensa@lfdr.de>; Tue,  7 May 2019 02:44:30 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 60B20649D;
	Tue,  7 May 2019 00:42:45 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 52216581A
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 May 2019 00:42:43 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m20so3470721lji.2
 for <linux-xtensa@linux-xtensa.org>; Mon, 06 May 2019 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8nl4i8mEexkIy9zqua9/J70sJLW6leDYBIUUdMnaSt0=;
 b=k7cVyP3DEkqQb6k73fZF1aaoBGLwJkjMcGEe5zarVFGDe3xEAaQTeJF4bfwPmkGcwH
 i/QEyIziCfWEYwOH6L0sYx6r3+//kk4354EeLQhUhl/Gd5pDpo6Uf34AwGXDEw1m6vRY
 rRBppfnVJOnHX/uFijGtAhYOS+HsTcJODS2jy/Z/dnXKRCfOuvoIycuo+H6OrKYLN6KQ
 x09fw6AQy8uln8cxqITI/p5dItdCeMDfdDaQOBPF6hcM1ajJh/M+NdrCdozCIllBNU6K
 8fFC1dzFHoribHF/RKQyIWleQ5jeuDs0krrrThJzXfZ2SEDXAzm1dPXkF40OdX0+YMbM
 cUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8nl4i8mEexkIy9zqua9/J70sJLW6leDYBIUUdMnaSt0=;
 b=ALvkEbZiTuSCeMIOXzNl7Ej0K3N1lYVZhkEyIM/XHFWfc+mqTxP24D0TWbEGUDNOYw
 6rUgpITKjJ2VEJ/rdEZPAERbEImyaAco1z6CaVQyEQMO05F6mnpjmEEGTIJ52+pkqRQ5
 LTCh9bZVbkwdPDLaTiqo4FJKkdM5WyC49l0edOxYHPwWSl9Ytl7QMzbl6FtqsVDTKc50
 4DKeneXwmpDMgoLoO+EwA0czR7mCApsj2Y6VDtqmpjBft0E78n899bDTrvuwA6Tyjzh+
 jqSE658i0gICHvjlUkJ2jCEiDtfQG2DP6U+hlMBvclcrpizNe5DHInB9Pbqu5i9mMurX
 +9nw==
X-Gm-Message-State: APjAAAV4FcpO4wTyil02SVew0AtYjOR/cDVS3neC52daEfI1A0Dr6VKk
 L6WvXd9zqejAyIVmUcd6h8vI2+2p
X-Google-Smtp-Source: APXvYqx0uGPsBJZSGSlNauh/BSIj/qzUG1pvG+uC/Plt2CwnBs/4wsitZ4GzSh8wX54YHCTKo7y8Qg==
X-Received: by 2002:a2e:9713:: with SMTP id r19mr15739805lji.189.1557189864596; 
 Mon, 06 May 2019 17:44:24 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm850003lfp.55.2019.05.06.17.44.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 17:44:23 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  6 May 2019 17:44:02 -0700
Message-Id: <20190507004407.6756-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/5] xtensa: add exclusive access and MPU
	support
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

this series implements atomic primitives using exclusive access Xtensa
option and adds basic support for MPU. It also cleans up usage of ifdef
__KERNEL__ in the kernel-only headers and introduces
arch/xtensa/include/asm/core.h as a place to provide XCHAL_* definitions
missing in variant/core.h files.

Max Filippov (5):
  xtensa: drop ifdef __KERNEL__ from kernel-only headers
  xtensa: replace variant/core.h with asm/core.h
  xtensa: clean up inline assembly in futex.h
  xtensa: add exclusive atomics support
  xtensa: implement initialize_cacheattr for MPU cores

 arch/xtensa/Kconfig                                |  26 ++++-
 arch/xtensa/boot/boot-redboot/bootstrap.S          |   2 +-
 arch/xtensa/include/asm/asmmacro.h                 |   2 +-
 arch/xtensa/include/asm/atomic.h                   |  66 ++++++++++-
 arch/xtensa/include/asm/barrier.h                  |   4 +
 arch/xtensa/include/asm/bitops.h                   | 125 ++++++++++++++++++++-
 arch/xtensa/include/asm/cache.h                    |   2 +-
 arch/xtensa/include/asm/checksum.h                 |   2 +-
 arch/xtensa/include/asm/cmpxchg.h                  |  36 +++++-
 arch/xtensa/include/asm/coprocessor.h              |   2 +-
 arch/xtensa/include/asm/core.h                     |  21 ++++
 arch/xtensa/include/asm/futex.h                    | 110 ++++++++++++------
 arch/xtensa/include/asm/initialize_mmu.h           |  38 ++++++-
 arch/xtensa/include/asm/io.h                       |   3 -
 arch/xtensa/include/asm/irq.h                      |   2 +-
 arch/xtensa/include/asm/pci-bridge.h               |   3 -
 arch/xtensa/include/asm/pci.h                      |   4 -
 arch/xtensa/include/asm/pgalloc.h                  |   3 -
 arch/xtensa/include/asm/processor.h                |   2 +-
 arch/xtensa/include/asm/ptrace.h                   |   2 +-
 arch/xtensa/include/asm/vectors.h                  |   2 +-
 arch/xtensa/kernel/hw_breakpoint.c                 |   2 +-
 arch/xtensa/kernel/setup.c                         |   3 +
 arch/xtensa/kernel/vmlinux.lds.S                   |   2 +-
 arch/xtensa/lib/checksum.S                         |   2 +-
 arch/xtensa/lib/memcopy.S                          |   2 +-
 arch/xtensa/lib/memset.S                           |   2 +-
 arch/xtensa/lib/strncpy_user.S                     |   2 +-
 arch/xtensa/lib/strnlen_user.S                     |   2 +-
 arch/xtensa/lib/usercopy.S                         |   2 +-
 .../platforms/xt2000/include/platform/hardware.h   |   2 +-
 .../platforms/xt2000/include/platform/serial.h     |   2 +-
 32 files changed, 390 insertions(+), 90 deletions(-)
 create mode 100644 arch/xtensa/include/asm/core.h

-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
