Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C1D74DB9DD
	for <lists+linux-xtensa@lfdr.de>; Fri, 18 Oct 2019 00:49:35 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6DE78425D;
	Thu, 17 Oct 2019 22:42:05 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id DCAAC2D7F
 for <linux-xtensa@linux-xtensa.org>; Thu, 17 Oct 2019 22:42:03 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id d1so4180735ljl.13
 for <linux-xtensa@linux-xtensa.org>; Thu, 17 Oct 2019 15:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/cEOoDfGUvop24BI6ZzpG7iBvdRmcFCHbzsqMJ5d8Q=;
 b=nLW6YpiexfLKhssUXQWKzy2sZlvvM3m9DOhQGhkA+wYifCLDjD5aWQrjhyuqi2xXPe
 n1TzNwdkohvt8i80owYaqwbbl8Sd8cLMFPjooo0FUmQsQEkdpGhoF6ayed47A+wb/iGn
 x+1TpFOAyvbDV06AHZFmZ7qbPfugtNvR9R2z4qWAA3RKRLSjzQmeKSMXtN/73XsjvDMP
 fInvi9C37akUmsTdx0Q6fNcAXg1s7oKTQNacx2bDzfb1lQh8SlLYUpZG3tHbf/L98Tpd
 E/3DuPY7akIIH3pOd3eo5eFZKhOjfWQW9vyiyB4HSEj41njiZMLqr+TvDh1hOKzJrUZ3
 M71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/cEOoDfGUvop24BI6ZzpG7iBvdRmcFCHbzsqMJ5d8Q=;
 b=LoVBkEAAlSC1sicJmr+47EcC1k4zrl03D8YiiwR6krMBmxNFvvCc9vDZO8YPyJ9Luf
 4RCvnkwcYaNQBiCuezekk/95AK9EaLgKNK6Ah/Uo3v2XRD7LPuuFcRbayj4rT2MQ84up
 j0LyGThHzHFZlB+RoQBGTYMuhwbylkFOQRULWf9/zN6+V3ytt9jrit+PI8FCxDZ9TqDx
 CM71bjwixeA5s09y7neCXRY4+cSFmrdaxIE/kY/qBOxLOD4d1boxhUYJJNTi/qBSQk6K
 XRlNGf1xVyKnWk+t7p3fgy4251keEcDZdrYe69tdBLAvG2f33DoXMJD8jTU4fxF+XMMc
 XHsg==
X-Gm-Message-State: APjAAAV3ZSQM/kqfm+j4pI7L9IUDf+iYcNV3nLCfPijySqC+M2FjJnxD
 3RKfNy0sYkTfX86oIuilcxM=
X-Google-Smtp-Source: APXvYqwQK4tiyrhkp43QT8S6jtFE0xnRvVPdabNTKsJYBDSRKCl4DpvLVGFid03BbuZyErJztNtUJQ==
X-Received: by 2002:a05:651c:8b:: with SMTP id 11mr3954907ljq.98.1571352571898; 
 Thu, 17 Oct 2019 15:49:31 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id v1sm1592347lfq.89.2019.10.17.15.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 15:49:31 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Oct 2019 15:49:10 -0700
Message-Id: <20191017224910.18457-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/6] xtensa fixes for v5.4-rc4
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

please pull the following batch of fixes for the Xtensa architecture:

The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:

  Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20191017

for you to fetch changes up to 775fd6bfefc66a8c33e91dd9687ed530643b954d:

  xtensa: fix change_bit in exclusive access option (2019-10-16 00:14:33 -0700)

----------------------------------------------------------------
Xtensa fixes for v5.4:

- fix {get,put}_user() for 64bit values;
- fix warning about static EXPORT_SYMBOL from modpost;
- fix PCI IO ports mapping for the virt board;
- fix pasto in change_bit for exclusive access option.

----------------------------------------------------------------
Al Viro (1):
      xtensa: fix {get,put}_user() for 64bit values

Max Filippov (5):
      xtensa: clean up assembly arguments in uaccess macros
      xtensa: fix type conversion in __get_user_[no]check
      xtensa: drop EXPORT_SYMBOL for outs*/ins*
      xtensa: virt: fix PCI IO ports mapping
      xtensa: fix change_bit in exclusive access option

 arch/xtensa/boot/dts/virt.dts     |  2 +-
 arch/xtensa/include/asm/bitops.h  |  2 +-
 arch/xtensa/include/asm/uaccess.h | 94 ++++++++++++++++++++++-----------------
 arch/xtensa/kernel/xtensa_ksyms.c |  7 ---
 4 files changed, 55 insertions(+), 50 deletions(-)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
