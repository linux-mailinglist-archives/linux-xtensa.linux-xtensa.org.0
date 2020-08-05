Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B82C823CC02
	for <lists+linux-xtensa@lfdr.de>; Wed,  5 Aug 2020 18:18:23 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E819E6464;
	Wed,  5 Aug 2020 16:01:26 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by linux-xtensa.org (Postfix) with ESMTPS id 1B322644A
 for <linux-xtensa@linux-xtensa.org>; Wed,  5 Aug 2020 16:01:25 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id o1so25534579plk.1
 for <linux-xtensa@linux-xtensa.org>; Wed, 05 Aug 2020 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xqOtscQ7oL8M2OV7/AS+H9zd7WlGhrndY3fKEhcVkr8=;
 b=Z16S5uzNX2DvMz74/erd60XfGe/qiJuePgZbU2/7UfhnQ/Qoymj6EdculFdgg2vGEX
 3fTmauJt1sMneAs8tuDbHwWDS+31gQTsUEdZXymQKlE1ejSnpzSsvpc4R92U92Krqgle
 MMowi9Pq+WB4jaAMMfguxv9c/+9o9hYNXu/eHcwKpo6AX+fFPX+Me8YYGEeQIyZrkNk3
 KwiQexVYYlrZGJlKULnx4ClxyPM8fRrj33Rp2fmvttuvITxCIUvZFfPRc0NhPEjaXiZF
 rgtrA3e7hjEdgOxdVYJ9v8G6rhl+QzqKUY8Va286aepOq2TtIMXP2+TIOYWIstIVYtdz
 1vWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xqOtscQ7oL8M2OV7/AS+H9zd7WlGhrndY3fKEhcVkr8=;
 b=N14QGv7DJrxgWN3spgzKF/Hae8sFV+VkrYRAdxwep561KjnXhceaPYEZ8dtbQMAyou
 cypbw5z3GFD4TC/9ni5xhpLGt8rZD4fAT1DTkN0dHtGb7inYbDCPiHOwmvnBGoGm0y0u
 O6euH7WUDzV2UL3Fsk4HBgCEpttqoB/QPXnUeIUYWhqwrhRBU87woWwxoUvCTwizxDuU
 UwUQlbzeFTKzkeXWKmTzn4rlwvLPZ0/tX1vWEOCX/1lYPAkir9tCc2Tn3UlP5CVxBds+
 NLbx+lqVT/Kv2kAOpChdBdsYkjktBOv3hN0aSaZjwM6/v295SIAQRBhmdWx/lMylIlTY
 JXfw==
X-Gm-Message-State: AOAM532GcEzxLmnLV8pD4RUu4xWP3cgjJCdCDfDCXCfSz5+Y8OpXzLAq
 nO5TfupTY02FSfAq9obQopc=
X-Google-Smtp-Source: ABdhPJxnvCWGyOLOGhyjS1AovH1VKezcgn5lf5r4MjNi2ROoheSsEQeaohrlkMnWfJWyLEVc8tmGGw==
X-Received: by 2002:a17:902:6b03:: with SMTP id
 o3mr3737409plk.69.1596644300042; 
 Wed, 05 Aug 2020 09:18:20 -0700 (PDT)
Received: from octofox.metropolis ([2607:fb90:a68f:7793:eeed:6380:da93:8dbc])
 by smtp.gmail.com with ESMTPSA id
 q17sm4061261pfh.32.2020.08.05.09.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 09:18:19 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed,  5 Aug 2020 09:17:13 -0700
Message-Id: <20200805161713.7476-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 00/10] xtensa updates for v5.9
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

please pull the following Xtensa architecture updates for v5.9.
There are trivial conflicts in the seccomp selftests with the csky
and sh trees.

The following changes since commit 92ed301919932f777713b9172e525674157e983d:

  Linux 5.8-rc7 (2020-07-26 14:14:06 -0700)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20200805

for you to fetch changes up to a0fc1436f1f4f84e93144480bf30e0c958d135b6:

  xtensa: add missing exclusive access state management (2020-07-31 14:15:57 -0700)

----------------------------------------------------------------
Xtensa updates for v5.9:

- add syscall audit support
- add seccomp filter support
- clean up make rules under arch/xtensa/boot
- fix state management for exclusive access opcodes
- fix build with PMU enabled

----------------------------------------------------------------
Masahiro Yamada (1):
      xtensa: add boot subdirectories build artifacts to 'targets'

Max Filippov (8):
      xtensa: add audit support
      xtensa: expose syscall through user_pt_regs
      xtensa: add seccomp support
      selftests/seccomp: add xtensa support
      xtensa: move vmlinux.bin[.gz] to boot subdirectory
      xtensa: add uImage and xipImage to targets
      xtensa: fix xtensa_pmu_setup prototype
      xtensa: add missing exclusive access state management

Randy Dunlap (1):
      xtensa: initialize_mmu.h: fix a duplicated word

 .../features/seccomp/seccomp-filter/arch-support.txt     |  2 +-
 arch/xtensa/Kconfig                                      | 16 ++++++++++++++++
 arch/xtensa/boot/Makefile                                | 12 +++++++-----
 arch/xtensa/boot/boot-elf/Makefile                       |  5 +++--
 arch/xtensa/boot/boot-redboot/Makefile                   |  5 +++--
 arch/xtensa/include/asm/Kbuild                           |  1 +
 arch/xtensa/include/asm/initialize_mmu.h                 |  2 +-
 arch/xtensa/include/asm/thread_info.h                    | 11 ++++++++++-
 arch/xtensa/include/uapi/asm/ptrace.h                    |  3 ++-
 arch/xtensa/kernel/asm-offsets.c                         |  3 +++
 arch/xtensa/kernel/entry.S                               | 11 +++++++++++
 arch/xtensa/kernel/perf_event.c                          |  2 +-
 arch/xtensa/kernel/ptrace.c                              | 14 +++++++++++++-
 tools/testing/selftests/seccomp/seccomp_bpf.c            | 16 +++++++++++++++-
 14 files changed, 87 insertions(+), 16 deletions(-)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
