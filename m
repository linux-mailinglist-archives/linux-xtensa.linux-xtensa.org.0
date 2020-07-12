Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB8221CB33
	for <lists+linux-xtensa@lfdr.de>; Sun, 12 Jul 2020 21:55:40 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 98FCE52C1;
	Sun, 12 Jul 2020 19:39:35 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by linux-xtensa.org (Postfix) with ESMTPS id 941E142EB
 for <linux-xtensa@linux-xtensa.org>; Sun, 12 Jul 2020 19:39:33 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id k5so5093159pjg.3
 for <linux-xtensa@linux-xtensa.org>; Sun, 12 Jul 2020 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BIetUemoKxubLIYPWxy8SSfRsMLA5iGT0+nNiwpoC8E=;
 b=hDJtHFl+cs7wxiwlm/QzWtMohfBYx6eBi9chJv3S6i1ej30kh6SApEDRMKcoBel7j/
 pEwVHjAFsNMGYaw3qx44QHbKs1MXZCTyC10bdU+IMyMKmDKln4SZ667XpNyKhZsyXANy
 96ne/wRADtz/JeT4w0ej0Q5ZD2YQ3fHnb97m2Kk6O/9xyx/3G9E2HxSMSzvw2eKhQatS
 EEdGKx1dS4W91yvgqXSeN6QaRip+kHwPyh+0j84pSLdT0v/u7tjYzUfc8CqbaKd9wtRK
 09LOk4XAGwquNkzMZFt1SJAVJwU/KKyRYvlr+CGS3nEvKRAyBfEHKXo2K3GzJtsXsD6w
 50bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BIetUemoKxubLIYPWxy8SSfRsMLA5iGT0+nNiwpoC8E=;
 b=oH5GDC6tusuQ8oEL6yxYhimLnuVrDjjvJOHUjPgDcPiHNIPCsruN64P306a5c3qTsv
 bIVzF93R8hR53gyxYlK3OzRs96zJIR2Xu4mrq4vc8VT+jDiFdhFEcdXRK1TV5iEC/p4O
 6+00Kh5kgYTp++FyG0sUlgCk919L0FCtwlTusWt1wyCOxT+HK9Z9qwi7o26LqEtim4F0
 1DceQIvoEDdzp6ImhuQir45fp9niuhFdka/dEOI85Nk/xxaAdVZeT5lCyJjUSR6vqyK/
 KLNlQQr4ghZx+C94U8hoCO+eYCdAzpkp1O122znQJDLo9KqxoKSLyz1Wc1y4nnI6eu/6
 wdmQ==
X-Gm-Message-State: AOAM5314Z3px9TSEWRDYWkQa18NP1fxolMQ4zUJhgT4z347ARYBUK+IV
 fKkm93+9YbnptltJJMzxb0M=
X-Google-Smtp-Source: ABdhPJxt/3avMldT/5sRUPLXyx9n2Xa19Em9/z1ugiHkq8+HTiCY6i+RomfItIhd8PA51kYGUbWiUA==
X-Received: by 2002:a17:902:b204:: with SMTP id
 t4mr69685235plr.132.1594583736545; 
 Sun, 12 Jul 2020 12:55:36 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id nl11sm31314271pjb.0.2020.07.12.12.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 12:55:35 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 12 Jul 2020 12:55:23 -0700
Message-Id: <20200712195523.6411-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/3] xtensa fixes for v5.8
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

please pull the following Xtensa architecture fixes for v5.8:

The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:

  Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20200712

for you to fetch changes up to ee769ebbe9e5fc7219e979fb7c5ed5bb5722649e:

  xtensa: simplify xtensa_pmu_irq_handler (2020-07-08 00:18:15 -0700)

----------------------------------------------------------------
Xtensa fixes for v5.8:

- fix __sync_fetch_and_{and,or}_4 declarations to avoid build warning
- update *pos in cpuinfo_op.next to avoid runtime warning
- use for_each_set_bit in xtensa_pmu_irq_handler instead of open-coding
  it

----------------------------------------------------------------
Max Filippov (2):
      xtensa: fix __sync_fetch_and_{and,or}_4 declarations
      xtensa: update *pos in cpuinfo_op.next

Xu Wang (1):
      xtensa: simplify xtensa_pmu_irq_handler

 arch/xtensa/kernel/perf_event.c   | 4 +---
 arch/xtensa/kernel/setup.c        | 3 ++-
 arch/xtensa/kernel/xtensa_ksyms.c | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
