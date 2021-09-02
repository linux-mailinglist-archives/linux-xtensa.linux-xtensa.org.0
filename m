Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 068683FEFB7
	for <lists+linux-xtensa@lfdr.de>; Thu,  2 Sep 2021 16:52:09 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id AA4CE65F2;
	Thu,  2 Sep 2021 14:21:56 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by linux-xtensa.org (Postfix) with ESMTPS id 2CFE665EA
 for <linux-xtensa@linux-xtensa.org>; Thu,  2 Sep 2021 14:21:51 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id fz10so1551202pjb.0
 for <linux-xtensa@linux-xtensa.org>; Thu, 02 Sep 2021 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5pN7v4ea6JVRwcYbzT57F/Ba7bm6wPYHneE0JrKsfnw=;
 b=C48iHpr9pk3IoBBMVMEBx2Bu9bbVIVnxI7aTRrg216+oElP2+iRKLXWaxvQZkD9gKQ
 68XH8arQbIKh3eBwMlttfSZ3FdVccNrTtRSu8NpEVwQCz391nA0bNW2HiJiK/UwUld8t
 q6wRUyv/otnHJkTPlToE8wHDy6463hid0O+nRgP7toC2pFymBUu+A/q3EXb2+42bICkd
 3KiNGU0SAYhocJXy6XBTDmMYBQ1Ulr6yNsq+OlOMK6WNi/EarQE01atkJYpQMnSoG3Jd
 lSgcGY2oNa3WmMkNxKOOk7b0DmldYiEWAzoGSZexF2IspMIihP1gOi89ct2JFi+yXFdQ
 dC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5pN7v4ea6JVRwcYbzT57F/Ba7bm6wPYHneE0JrKsfnw=;
 b=CmGX5AKiN8tCx+5U015DhYTd88VeLWDj7ZdqpAlUsHQYMFDp/KeFGvmV0VApfFisSn
 joRSk5OZX23H48gmlTgUYNb01d2+j04iwiH3kWNTMLQhEQMbBrFjikHE210q60wNm+Y+
 LTr583tyhq0dr0ziRtPIjgW/lw+KrhA/UAIolzlXcXgC82UvWnuMxNTmuc0OweaN+zho
 8WddN4vvGtQPbIthgjCyDM+HGRIrppTFfc0U336lWWYL0FhKoeAWV/X3Bmhjk9nxySbi
 V0s5JeWCoanMUzER7dOr3WuNf5niQDs+ZnZap9i4hztoFR5qXQbmQZHM7aePhB1c2ft5
 ny0Q==
X-Gm-Message-State: AOAM531HW3N2+EFVxxpQaEiaA4p38gRwmVRJDrjJxK1pklC4t018PgwQ
 /c5rgN82Rf5c+NBhEbkZtV0=
X-Google-Smtp-Source: ABdhPJz2/G7LEhOrRZn6jyYAddm5ciJMDPjIESVGasISc9KGr3JWIAEQfc8xYpRX79JHbpYKduKD6w==
X-Received: by 2002:a17:90a:194a:: with SMTP id
 10mr4406460pjh.176.1630594321634; 
 Thu, 02 Sep 2021 07:52:01 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:401:1d20:49eb:5986:4393:7ed3])
 by smtp.gmail.com with ESMTPSA id o14sm3189746pgl.85.2021.09.02.07.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:52:00 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu,  2 Sep 2021 07:51:36 -0700
Message-Id: <20210902145136.21967-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/7] xtensa updates for 5.15
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

please pull the following Xtensa architecture updates for v5.15:

The following changes since commit 36a21d51725af2ce0700c6ebcb6b9594aac658a6:

  Linux 5.14-rc5 (2021-08-08 13:49:31 -0700)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20210902

for you to fetch changes up to 7b7cec477fc3cd42ce565dfc3e53f144504fc95c:

  xtensa: move core-y in arch/xtensa/Makefile to arch/xtensa/Kbuild (2021-08-11 11:37:13 -0700)

----------------------------------------------------------------
Xtensa updates for v5.15

- fix kconfig unmet dependency warning for HAVE_FUTEX_CMPXCHG
- add fairness to handling IRQs of the same priority
- fix pointer usage before NULL check in ISS console driver
- build system cleanups

----------------------------------------------------------------
Masahiro Yamada (4):
      xtensa: remove unneeded exports
      xtensa: do not build variants directory
      xtensa: build platform directories unconditionally
      xtensa: move core-y in arch/xtensa/Makefile to arch/xtensa/Kbuild

Max Filippov (2):
      xtensa: add fairness to IRQ handling
      xtensa: ISS: don't use string pointer before NULL check

Randy Dunlap (1):
      xtensa: fix kconfig unmet dependency warning for HAVE_FUTEX_CMPXCHG

 arch/xtensa/Kbuild                  |  1 +
 arch/xtensa/Kconfig                 |  2 +-
 arch/xtensa/Makefile                | 12 ------------
 arch/xtensa/kernel/traps.c          |  7 +++++++
 arch/xtensa/platforms/Makefile      |  4 ++++
 arch/xtensa/platforms/iss/console.c |  6 +++---
 6 files changed, 16 insertions(+), 16 deletions(-)
 create mode 100644 arch/xtensa/platforms/Makefile

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
