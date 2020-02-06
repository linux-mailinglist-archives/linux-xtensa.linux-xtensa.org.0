Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 54FFF154B5A
	for <lists+linux-xtensa@lfdr.de>; Thu,  6 Feb 2020 19:42:57 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 58C586553;
	Thu,  6 Feb 2020 18:31:57 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by linux-xtensa.org (Postfix) with ESMTPS id 14ACF6551
 for <linux-xtensa@linux-xtensa.org>; Thu,  6 Feb 2020 18:31:56 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id d10so7209406ljl.9
 for <linux-xtensa@linux-xtensa.org>; Thu, 06 Feb 2020 10:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHsO+0/8LajrVbD9VL04DBObBDuJ7d62JzOKBievMgg=;
 b=IEvZG1SA2fzmUXie/3PzLLZq3nfIYNpk+n3oHzzUbT+/OVLOwdZZo+zM1WmZqoIK4e
 BLYDN15OeDcCch6f0oqjMjMzrFYMBAd/kPiOADNXt6yccLMhFB8gqiOygsOUlv6Ansiq
 IUmLC3NVTwN/TEPQXaPoLmwFrg29qk/aoTB0OYmt1Mh70M3weTLCP9cISmaRPfORI7rv
 sJeAeNAsKbGLw9p9lNhsINU9NvwKW69n1gY4nAl8DBot1QcZTgFteFH5OOs9wOe1pl/K
 ntCTx5Yu5suEygSSxQ04EVuBLxRZp3Gy8+lgDcQemktnSgg2oXMY2Yq18cBRo4qfB1Fz
 0K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHsO+0/8LajrVbD9VL04DBObBDuJ7d62JzOKBievMgg=;
 b=R9O+/rjO4lrQTGxGyPJ8d7OoYI/zK4YZ1043nSw3pw5h/gwiV2T8XnbIb18vozz+tB
 /DjAkF7CcXFebFBdX7C0cAEz4EmD+K4gERb5XT9DM1d8rU8lZkHb69PMPlqI1CQvLleI
 Uq/la/OAn/K9ux1BvUJBaxwvK8MejcA35ilsQNFaRFfsyJwLviZqvhuD2+c+9FjScr/9
 d57UU3s+Pv/cUehtO8LCM5mqDGE0B5Vi134AAUav6MIw3S3Kiq4e5L+somHDmJAimBcV
 RpKqeNIM65LmS2urqFGI5xlcmIEiDkHtm6NF0xa0RtdBX1gyVupoq40YdP7oCbypRgwD
 M+bw==
X-Gm-Message-State: APjAAAUCyasXrgj24sG7WXB+giKClD4OGBqqUhbe4wwZufAq2LUN2E5m
 yDsGvb3dkzxW8KuuJcbs2As=
X-Google-Smtp-Source: APXvYqyfXKlD6zQAcndBiWJ43KIQXbLxoNLTeZfhm0MVx/tFPRWKX/XIELp906n4LjqfOyejCB6kUQ==
X-Received: by 2002:a2e:9587:: with SMTP id w7mr2842218ljh.42.1581014573922;
 Thu, 06 Feb 2020 10:42:53 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id h9sm81307ljg.3.2020.02.06.10.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 10:42:53 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu,  6 Feb 2020 10:42:24 -0800
Message-Id: <20200206184224.25833-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 00/11] xtensa updates for v5.6
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

The following changes since commit d5226fa6dbae0569ee43ecfc08bdcd6770fc4755:

  Linux 5.5 (2020-01-26 16:23:03 -0800)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20200206

for you to fetch changes up to c74c0fd2282e0e3ce891cb571f325b9412cbaa3f:

  xtensa: ISS: improve simcall assembly (2020-02-04 21:57:05 -0800)

----------------------------------------------------------------
Xtensa updates for v5.6:

- reorganize exception vectors placement;
- small cleanups (drop unused functions/headers/defconfig entries,
  spelling fixes).

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      xtensa: configs: Cleanup old Kconfig IO scheduler options

Max Filippov (9):
      xtensa: drop set_except_vector declaration
      xtensa: clean up platform headers
      xtensa: drop empty platform_* functions from platforms
      xtensa: drop unused function fast_coprocessor_double
      xtensa: clean up optional XCHAL_* definitions
      xtensa: move fast exception handlers close to vectors
      xtensa: separate SMP and XIP support
      xtensa: reorganize vectors placement
      xtensa: ISS: improve simcall assembly

Randy Dunlap (1):
      arch/xtensa: fix Kconfig typos for HAVE_SMP

 arch/xtensa/Kconfig                                |  44 +++++++--
 arch/xtensa/configs/audio_kc705_defconfig          |   2 -
 arch/xtensa/configs/cadence_csp_defconfig          |   2 -
 arch/xtensa/configs/generic_kc705_defconfig        |   2 -
 arch/xtensa/configs/iss_defconfig                  |   2 -
 arch/xtensa/configs/nommu_kc705_defconfig          |   2 -
 arch/xtensa/configs/smp_lx200_defconfig            |   3 -
 arch/xtensa/configs/virt_defconfig                 |   1 -
 arch/xtensa/include/asm/asmmacro.h                 |   2 +
 arch/xtensa/include/asm/core.h                     |   8 ++
 arch/xtensa/include/asm/platform.h                 |   2 -
 arch/xtensa/include/asm/processor.h                |   4 -
 arch/xtensa/include/asm/vectors.h                  |   6 +-
 arch/xtensa/include/uapi/asm/setup.h               |   2 -
 arch/xtensa/kernel/coprocessor.S                   |  12 +--
 arch/xtensa/kernel/entry.S                         |  18 ++--
 arch/xtensa/kernel/platform.c                      |   5 +-
 arch/xtensa/kernel/setup.c                         |   8 +-
 arch/xtensa/kernel/vectors.S                       |   3 +-
 arch/xtensa/kernel/vmlinux.lds.S                   | 102 ++++++++++++---------
 .../platforms/iss/include/platform/simcall.h       |   8 +-
 arch/xtensa/platforms/iss/setup.c                  |  25 +----
 arch/xtensa/platforms/xtfpga/setup.c               |  17 +---
 23 files changed, 141 insertions(+), 139 deletions(-)

Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
