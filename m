Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCE510F932
	for <lists+linux-xtensa@lfdr.de>; Tue,  3 Dec 2019 08:46:49 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E15F964E6;
	Tue,  3 Dec 2019 07:37:50 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id CD1E752AD
 for <linux-xtensa@linux-xtensa.org>; Tue,  3 Dec 2019 07:37:48 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j6so2651323lja.2
 for <linux-xtensa@linux-xtensa.org>; Mon, 02 Dec 2019 23:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jWL0S/lwLfyBQNFH9COx+nXWnpckOMIBLfpqnAgHt3c=;
 b=iusGFqERBVX91IN4sHwkB2hC2gT3KT+woNnvvGllqJybFcZhZcjxOs9DDh4+Qvr25S
 aUFJw6/RVRHwOpXQijxHZmxthsJmogNtp92tp5PSKiSUce1S1a78U7rExa6aSNCuyDa5
 vy5XXi9WVQyPKZ0mc9eq9QVDaqLOfCv8dCJllPMkh1ygbd01+c/sQLe4yLDwiGE7b80M
 kNHru8ptMBELGcDk6C1kl0ETYjrdBWdGCRmzQkKEcKYhvSCo7WLq2yrx9i0bjdB5Zd9N
 TnlwI0tLfxNNPqa7UG2aKPg4xaISPQRrYSE7Cpb96IEko1Fl3lNfPwAqqVavGB67LSCZ
 d6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jWL0S/lwLfyBQNFH9COx+nXWnpckOMIBLfpqnAgHt3c=;
 b=pe/+J5nrYUVrbsBczjqRqc8b/UiO2VUpbQEmfu6uoM5e4PJkr4kvOyJ3+zQXs3xvIy
 nALGUCvmbrP0Fagc7zRTjdvS49Lc3WgwbRT1I6BRoZ9ZDMsYMtl/U3IisVW9dJ1wh/gm
 xY12sKQqatfLpi7FVyTS3Q6yIrE/fftVOJegb5rhjZ4UuRuHE1+6ZMRU58qMIZZj6obR
 AxKKMfmesyfn5u1ckoTrnbvklU/pO6Txb8bsll6c5QEOK2nkGCZ691MYFB/EeubCxFky
 NH7xy0adkiuewIWWnRB4S6hIJyaxITqqLM1GFyOJ2jxK5Ee8YNLzqzl0FYG3IXXcM4ah
 uyEw==
X-Gm-Message-State: APjAAAX6PxP4Gw4DtlKQoscL+6/38J7zUWTXxnV3VcjCMXShKIf3ACy5
 Z3wwv9kR4emHuJQLxK7Rzxw=
X-Google-Smtp-Source: APXvYqx3hBFm2zFpe5i6I0ZWiGSGFSXl0GSke+dvhBZidO9NDtAH5OmbPGWOKpNYH+yEFGkCmFpKhw==
X-Received: by 2002:a2e:6a14:: with SMTP id f20mr1789018ljc.87.1575359205046; 
 Mon, 02 Dec 2019 23:46:45 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id v7sm800228lfa.10.2019.12.02.23.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 23:46:44 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon,  2 Dec 2019 23:46:29 -0800
Message-Id: <20191203074629.17278-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 00/30] xtensa updates for v5.5
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

please pull the following batch of updates for the Xtensa architecture.
There's a merge conflict in arch/xtensa/kernel/vmlinux.lds.S that has
obvious part (the conflicting part itself) and non-obvious part (another
copy of RW_DATA_SECTION macro which was renamed in c9174047b48d
("vmlinux.lds.h: Replace RW_DATA_SECTION with RW_DATA")) that doesn't
conflict, but will result in build error if left unfixed. My resolution
of this conflict is available at

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20191201-mainline-merge

The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20191201

for you to fetch changes up to 9d9043f6a81713248d82d88983c06b1eaedda287:

  xtensa: clean up system_call/xtensa_rt_sigreturn interaction (2019-11-29 19:37:12 -0800)

----------------------------------------------------------------
Xtensa updates for v5.5:

- add support for execute in place (XIP) kernels
- improvements in inline assembly: use named arguments and "m"
  constraints where possible
- improve stack dumping
- clean up system_call code and syscall tracing
- various small fixes and cleanups

----------------------------------------------------------------
Max Filippov (27):
      xtensa: update arch features
      xtensa: clean up empty include files
      xtensa: move XCHAL_KIO_* definitions to kmem_layout.h
      xtensa: move MPU constants from .data to .ref.rodata
      xtensa: fix section name for start_info
      xtensa: use correct symbol for the end of .rodata
      xtensa: move kernel memory layout to platform options
      xtensa: add XIP kernel support
      xtensa: merge .fixup with .text
      xtensa: use "m" constraint instead of "a" in uaccess.h assembly
      xtensa: use macros to generate *_bit and test_and_*_bit functions
      xtensa: use named assembly arguments in bitops.h
      xtensa: use "m" constraint instead of "a" in bitops.h assembly
      xtensa: use named assembly arguments in atomic.h
      xtensa: use "m" constraint instead of "a" in atomic.h assembly
      xtensa: use named assembly arguments in cmpxchg.h
      xtensa: use "m" constraint instead of "a" in cmpxchg.h assembly
      xtensa: use "m" constraint instead of "r" in futex.h assembly
      xtensa: improve stack dumping
      xtensa: make stack dump size configurable
      xtensa: fix TLB sanity checker
      xtensa: use MEMBLOCK_ALLOC_ANYWHERE for KASAN shadow map
      xtensa: drop unneeded headers from coprocessor.S
      xtensa: fix syscall_set_return_value
      xtensa: rearrange syscall tracing
      xtensa: fix system_call interaction with ptrace
      xtensa: clean up system_call/xtensa_rt_sigreturn interaction

Mike Rapoport (2):
      xtensa: mm: fix PMD folding implementation
      xtensa: get rid of __ARCH_USE_5LEVEL_HACK

Valentin Schneider (1):
      xtensa: entry: Remove unneeded need_resched() loop

 .../features/core/tracehook/arch-support.txt       |   2 +-
 arch/xtensa/Kconfig                                | 396 ++++++++++++---------
 arch/xtensa/Kconfig.debug                          |   7 +
 arch/xtensa/Makefile                               |   3 +-
 arch/xtensa/boot/Makefile                          |   5 +
 arch/xtensa/configs/xip_kc705_defconfig            | 119 +++++++
 arch/xtensa/include/asm/Kbuild                     |   2 +
 arch/xtensa/include/asm/atomic.h                   | 124 +++----
 arch/xtensa/include/asm/bitops.h                   | 323 +++++------------
 arch/xtensa/include/asm/cache.h                    |   6 +
 arch/xtensa/include/asm/cmpxchg.h                  |  71 ++--
 arch/xtensa/include/asm/fixmap.h                   |   8 +-
 arch/xtensa/include/asm/futex.h                    |  10 +-
 arch/xtensa/include/asm/hw_irq.h                   |  14 -
 arch/xtensa/include/asm/initialize_mmu.h           |   3 +-
 arch/xtensa/include/asm/kmem_layout.h              |  29 ++
 arch/xtensa/include/asm/page.h                     |  11 +
 arch/xtensa/include/asm/pgtable.h                  |   4 -
 arch/xtensa/include/asm/processor.h                |   3 +-
 arch/xtensa/include/asm/syscall.h                  |   4 +-
 arch/xtensa/include/asm/uaccess.h                  |  16 +-
 arch/xtensa/include/asm/user.h                     |  20 --
 arch/xtensa/include/asm/vectors.h                  |  44 +--
 arch/xtensa/kernel/coprocessor.S                   |  10 +-
 arch/xtensa/kernel/entry.S                         |  22 +-
 arch/xtensa/kernel/head.S                          |  13 +-
 arch/xtensa/kernel/process.c                       |   2 +
 arch/xtensa/kernel/ptrace.c                        |  18 +-
 arch/xtensa/kernel/setup.c                         |   7 +
 arch/xtensa/kernel/signal.c                        |   4 +-
 arch/xtensa/kernel/traps.c                         |  27 +-
 arch/xtensa/kernel/vmlinux.lds.S                   |  58 ++-
 arch/xtensa/mm/fault.c                             |  16 +-
 arch/xtensa/mm/init.c                              |   4 +-
 arch/xtensa/mm/kasan_init.c                        |  12 +-
 arch/xtensa/mm/mmu.c                               |   4 +-
 arch/xtensa/mm/tlb.c                               |  14 +-
 37 files changed, 772 insertions(+), 663 deletions(-)
 create mode 100644 arch/xtensa/configs/xip_kc705_defconfig
 delete mode 100644 arch/xtensa/include/asm/hw_irq.h
 delete mode 100644 arch/xtensa/include/asm/user.h

Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
