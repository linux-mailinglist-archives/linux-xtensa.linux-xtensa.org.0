Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 05A94B55CC
	for <lists+linux-xtensa@lfdr.de>; Tue, 17 Sep 2019 20:59:24 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 1E89757FA;
	Tue, 17 Sep 2019 18:52:56 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id B2A6957F0
 for <linux-xtensa@linux-xtensa.org>; Tue, 17 Sep 2019 18:52:54 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y127so3783433lfc.0
 for <linux-xtensa@linux-xtensa.org>; Tue, 17 Sep 2019 11:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dyuKhmzoMsbtM5H85infDrEkbEV6Ixbxarte1ObFGk0=;
 b=NbK2DVn9q0mEgbm8RATY4iFGicQZh6cH/8s2X7tkuc9lJBv9VJ0pNcIRn0IkEkJRJx
 ZGIOyg97bX+/DzoRKZvT2QMMqdrOG4/Dwp9QdWL2YAP2UfU6GnbVurqn50CEW01rYQKg
 ycaYqsUJHN8A733YK0OfgV5gaVv1YgjcEgqKyHT333ouFyXPVfP+/WGuENSz49XA/JXw
 Vy14qr3QQzmXdu+ZStFOzbL2rvhVHqU2vqTAZ6+8Eg8iZ0mqonaycTybwtgNxY3znHrv
 GMTpqwvLB2JfKZGCNFakt7kIMZbamj2RmQisIfEsgL/zmCAwz2tBraCyCWoaR096eFIC
 PzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dyuKhmzoMsbtM5H85infDrEkbEV6Ixbxarte1ObFGk0=;
 b=B9jINrXiNZEt9Gt58tFKkW6elnBZhRPCldiOH+MHmdBtSk6WltO65u6Pia+Vwd3gjh
 CaseqRYJTkwm+zqD4cHa6jscwgsk2SNsRcUg4gaMFAOR/uimU+WRCWwNmj2pje6/qKlA
 Mhv6nf4vFkE0h2ZfB9NXJOMU/qBActibs18MxIme2oRbHUczkgE2X0WXWKEgR+1oF01X
 WN3aytEX98FbD8teran7D9QcY4RpENUjJC33xKi5Ve9NDVDsijPX9A2aMBsqeyPubTuq
 Hb5Kjwt7kx8YD3MLQ2P3nQGHfLs9bkXTb/K1KWhby0zFFAr72LA8XxR6NENF3bm+RcQv
 YKdA==
X-Gm-Message-State: APjAAAUysPJTdMV1NCQM/PbyNlrspUelnQ/XoQ/p3NByMbDL1wpLMuGw
 XnMfDyZcEnoR0r+JtbiaAIg=
X-Google-Smtp-Source: APXvYqxnNzrUX1SZAZFrr7uID+PtmazTg1aQvfYAbQBTc0mmMkg6V3GJEaMkr20MOcTljLg9GIOjvg==
X-Received: by 2002:ac2:491a:: with SMTP id n26mr2937567lfi.182.1568746760346; 
 Tue, 17 Sep 2019 11:59:20 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 6sm573038lfa.24.2019.09.17.11.59.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 11:59:19 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Sep 2019 11:59:05 -0700
Message-Id: <20190917185905.2761-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/4] xtensa updates for v5.4
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

The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20190917

for you to fetch changes up to 982792f45894878b9ec13df81e6e02209b34cb11:

  xtensa: virt: move PCI root complex to KIO range (2019-09-02 00:09:30 -0700)

----------------------------------------------------------------
Xtensa updates for v5.4:

- add support for xtensa call0 ABI in userspace;
- update xtensa virt board DTS for PCI root complex in KIO range;
- remove free_initrd_mem.

----------------------------------------------------------------
Max Filippov (3):
      xtensa: clean up PS_WOE_BIT usage
      xtensa: add support for call0 ABI in userspace
      xtensa: virt: move PCI root complex to KIO range

Mike Rapoport (1):
      xtensa: remove free_initrd_mem

 arch/xtensa/Kconfig                 | 48 +++++++++++++++++++++++++++++++++++++
 arch/xtensa/boot/dts/virt.dts       |  8 +++----
 arch/xtensa/include/asm/io.h        |  1 +
 arch/xtensa/include/asm/processor.h | 11 +++++++--
 arch/xtensa/include/asm/regs.h      |  1 +
 arch/xtensa/kernel/entry.S          | 42 ++++++++++++++++++++++++++++----
 arch/xtensa/kernel/head.S           |  2 +-
 arch/xtensa/kernel/setup.c          |  9 +++----
 arch/xtensa/kernel/signal.c         | 26 +++++++++++++-------
 arch/xtensa/kernel/stacktrace.c     |  5 ++++
 arch/xtensa/kernel/traps.c          |  4 ++++
 arch/xtensa/mm/init.c               | 10 --------
 12 files changed, 132 insertions(+), 35 deletions(-)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
