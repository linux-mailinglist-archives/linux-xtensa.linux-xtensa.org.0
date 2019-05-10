Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 71E931A373
	for <lists+linux-xtensa@lfdr.de>; Fri, 10 May 2019 21:41:23 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9312A6546;
	Fri, 10 May 2019 19:39:31 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id AE64C64A4
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 19:39:29 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 188so6040603ljf.9
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 12:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Wb6m/O8d+DXIkatA4xAsxw74L+R8D3ET/JMyosDN25I=;
 b=c0C0iDXqWaUAIG1ohB5tjTXZ/hf4DohrNmsMZMo1g+YMNRf0ErI84ambZfx2i1mMLp
 fQWJx0lzvaEpXoayJWzHvxRPzh5GdwNOYJvdRbk4RmNdmcsZu8WYITZOOTXNzWMU+B3o
 lvaihAf/O3SX2bJ194Alh/GTnq9zfYNjrRQyeAJhl/bqug12fu7KAS/2gMInqUs25N4r
 M6eDxFL0A8rjEdznxX1WCO/BPwWLac+7TV+K/DpkIpq3qQ4pMf6/OTgXRU85dYAypdKV
 DA9BPKijr6icsUlYeOK3gH+JthGKdqtFON3xz3Pr7k0NTYm7i09+ZG8OKCqAIoiC4+z6
 lRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Wb6m/O8d+DXIkatA4xAsxw74L+R8D3ET/JMyosDN25I=;
 b=iBiI0/cfOZzOLTJzUocoG4Tg2py81xW1XrDAfXgnKUG4/9nrh2ONpeXDgAzn3TqleC
 nQ0CNyahzUQrAYiZFibfqDQNOwGQIxIW+hlhvTqqCEj+YZX7iJ2IyOGDwrJiXaUFXyHB
 bWcb0eZyRx70m/6GulWAnUEySaCYqzv/kMWIqJ9ElKajpbi2eQv+b/+wZ7GxiEYeY9NX
 cqOe37vKP6PahhzzAbu+XHrRy1OyNAcwmLFQv4jQVyOMb6fR66YP9ZTeQpdQk6LPcNsT
 W7vMWjyqtgDNW3UV8SMamUZEReUDrmSFpLlahMB0UKexRQAE1XeD8WUwxO8t3T27wZVQ
 lVqA==
X-Gm-Message-State: APjAAAWOicJUlSgytW27SMdR0iqyKkDMUINNs4XYAY3ww8y92C0AkFMA
 HGjgCzV8/66+Bys8JDFu92c=
X-Google-Smtp-Source: APXvYqw+HCubHGtscCBX39N6Vu1XB5zecs9Yh+y6jonPtjxXKqn5BekZ+cJ9Mync7fQC4ZGaU0dHPg==
X-Received: by 2002:a2e:9c89:: with SMTP id x9mr6860384lji.28.1557517279493;
 Fri, 10 May 2019 12:41:19 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x21sm1680558ljj.43.2019.05.10.12.41.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 12:41:18 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 May 2019 12:41:02 -0700
Message-Id: <20190510194102.28038-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/7] xtensa updates for v5.2
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

The following changes since commit e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd:

  Linux 5.1 (2019-05-05 17:42:58 -0700)

are available in the git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20190510

for you to fetch changes up to a5944195d00a359e28d6e093593609bcee37ed5e:

  xtensa: implement initialize_cacheattr for MPU cores (2019-05-07 10:36:34 -0700)

----------------------------------------------------------------
Xtensa updates for v5.2:

- implement atomic operations using exclusive access Xtensa option
  operations.
- add support for Xtensa cores with memory protection unit (MPU).
- clean up xtensa-specific kernel-only headers.
- fix error path in simdisk_setup.

----------------------------------------------------------------
Chengguang Xu (2):
      xtensa: fix incorrect fd close in error case of simdisk_setup()
      xtensa: set proper error code for simdisk_setup()

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
 arch/xtensa/include/asm/futex.h                    | 122 +++++++++++++-------
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
 arch/xtensa/platforms/iss/simdisk.c                |   3 +-
 .../platforms/xt2000/include/platform/hardware.h   |   2 +-
 .../platforms/xt2000/include/platform/serial.h     |   2 +-
 33 files changed, 397 insertions(+), 98 deletions(-)
 create mode 100644 arch/xtensa/include/asm/core.h

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
