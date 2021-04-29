Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A650136F084
	for <lists+linux-xtensa@lfdr.de>; Thu, 29 Apr 2021 21:34:33 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 50BD06C07;
	Thu, 29 Apr 2021 19:08:45 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by linux-xtensa.org (Postfix) with ESMTPS id 876E96C05
 for <linux-xtensa@linux-xtensa.org>; Thu, 29 Apr 2021 19:08:43 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id a5so40874920ljk.0
 for <linux-xtensa@linux-xtensa.org>; Thu, 29 Apr 2021 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tyNtVUM7TJO4Y2MIU/RlvtsyLuW2eANi7CNPOMUEFlg=;
 b=TZoYPuAmO/+Eys0DIlZP56S2yT2i4l3DhcNwzaQGQTawDgk7G6qh1j7xZGAIoT4nZe
 B3x3eRmEslzz2JzVO9kT+DYkmFpU+zZaqoB/KewKy0wtMW/68bupWPL/flaOAHhzk1ms
 0R/qad6A4PVv/AsmLsDSBMJTu5WSXL82mIdDIHp/RWbXeWSb96JNPDVoxeCGHDn1h912
 tnud2eA0UGjiVj0wK67iFIySHBHJ4G6ssv3KwK2jhqZ+D9J+wwIzmNNxYRzHx+rWMZkO
 TYv9cFNTYVK3bMG6G9rhEaoPhro/6vFVwO0LVGscDQ1Ic4/eB3NZoUtgG7GRdQ4eNkT9
 CUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tyNtVUM7TJO4Y2MIU/RlvtsyLuW2eANi7CNPOMUEFlg=;
 b=XjUt2BJFHZZwP0UD4X5i6csFj2kYnMFPJRMGv60w/cl01g/12us+TTgQsv6FOKlDZj
 DZ7UuNU4e54YXu0vYwIXQ+enMej7wXx/5NYMZX2Yo00rLC9sHSqMN5+ADbSce2aDqBB2
 UTJQzwK5iKQlRncy+uEKVaCXPqP6FxjCH2ZZLOjA4a11KilbApIAA429Q/CmDuzJJvQH
 b0reYM/l+YmyTqwtX4O2t0iOyyLYKGD3Wgzdshqr/mvCQ3l7dwUscunPkoQn4WmVxiz+
 xKfZUNzonw+oAXtSQZrcmAxryZwfTLp1pkczVJyYWtbRGHSw2xvfhoGPP58OlayWoltr
 wR5A==
X-Gm-Message-State: AOAM531q7GhEXzMQnqna730q0lhLOlbVmv6g7HVtwrsA4kPyvI93xp0a
 iIMd/hR9sYvC4IqTDU3Ct4o=
X-Google-Smtp-Source: ABdhPJwVRxrXaamHuNvA2Ya+4m3QmjCouVYhaILSlVT7zreoNg1+DdqDUqtkhz7HfzE0hgJGE3s2Qw==
X-Received: by 2002:a2e:a793:: with SMTP id c19mr965247ljf.75.1619724869694;
 Thu, 29 Apr 2021 12:34:29 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id t14sm597465ljk.107.2021.04.29.12.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 12:34:29 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 Apr 2021 12:34:06 -0700
Message-Id: <20210429193406.12947-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 00/14] xtensa updates for v5.13
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

Hi Linus,

please pull the following Xtensa architecture updates for v5.13:

The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:

  Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20210429

for you to fetch changes up to 6a8eb99e130f3f7658de2776934374fe1c41279e:

  xtensa: ISS: add GDBIO implementation to semihosting interface (2021-04-04 15:39:04 -0700)

----------------------------------------------------------------
Xtensa updates for v5.13:

- switch to generic syscall generation scripts
- new GDBIO implementation for xtensa semihosting interface
- various small code fixes and cleanups
- a few typo fixes in comments and Kconfig help text

----------------------------------------------------------------
Bhaskar Chowdhury (2):
      xtensa: Couple of typo fixes
      xtensa: simcall.h: Change compitible to compatible

Colin Ian King (1):
      xtensa: fix spelling mistake in Kconfig "wont" -> "won't"

Jiapeng Chong (1):
      xtensa: fix warning comparing pointer to 0

Masahiro Yamada (5):
      xtensa: move CONFIG_CPU_*_ENDIAN defines to Kconfig
      xtensa: remove unneeded export in boot-elf/Makefile
      xtensa: stop filling syscall array with sys_ni_syscall
      xtensa: syscalls: switch to generic syscalltbl.sh
      xtensa: syscalls: switch to generic syscallhdr.sh

Max Filippov (5):
      xtensa: simplify coherent_kvaddr logic
      xtensa: fix pgprot_noncached assumptions
      xtensa: drop extraneous register load from initialize_mmu
      xtensa: ISS: split simcall implementation from semihosting interface
      xtensa: ISS: add GDBIO implementation to semihosting interface

 arch/xtensa/Kconfig                                |  30 +++++-
 arch/xtensa/Makefile                               |   9 +-
 arch/xtensa/boot/Makefile                          |   4 -
 arch/xtensa/boot/boot-elf/Makefile                 |  11 +--
 arch/xtensa/boot/boot-redboot/Makefile             |   6 +-
 arch/xtensa/include/asm/initialize_mmu.h           |   2 +-
 arch/xtensa/include/asm/pgtable.h                  |   4 +-
 arch/xtensa/kernel/head.S                          |   4 +-
 arch/xtensa/kernel/pci.c                           |   2 +-
 arch/xtensa/kernel/syscall.c                       |   8 +-
 arch/xtensa/kernel/syscalls/Makefile               |  14 +--
 arch/xtensa/kernel/syscalls/syscallhdr.sh          |  36 -------
 arch/xtensa/kernel/syscalls/syscalltbl.sh          |  32 -------
 arch/xtensa/mm/cache.c                             |   9 +-
 arch/xtensa/mm/misc.S                              |  36 +------
 .../platforms/iss/include/platform/simcall-gdbio.h |  34 +++++++
 .../platforms/iss/include/platform/simcall-iss.h   |  73 +++++++++++++++
 .../platforms/iss/include/platform/simcall.h       | 104 ++++++++-------------
 18 files changed, 198 insertions(+), 220 deletions(-)
 delete mode 100644 arch/xtensa/kernel/syscalls/syscallhdr.sh
 delete mode 100644 arch/xtensa/kernel/syscalls/syscalltbl.sh
 create mode 100644 arch/xtensa/platforms/iss/include/platform/simcall-gdbio.h
 create mode 100644 arch/xtensa/platforms/iss/include/platform/simcall-iss.h

 -- 
 Thanks.
 -- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
