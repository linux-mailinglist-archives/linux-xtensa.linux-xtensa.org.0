Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A3BD6224EA4
	for <lists+linux-xtensa@lfdr.de>; Sun, 19 Jul 2020 04:17:06 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3878B6478;
	Sun, 19 Jul 2020 02:00:47 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 8552E6472
 for <linux-xtensa@linux-xtensa.org>; Sun, 19 Jul 2020 02:00:44 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id p3so8632842pgh.3
 for <linux-xtensa@linux-xtensa.org>; Sat, 18 Jul 2020 19:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QM6lwvVyYd4T8B0+uW+YnPRkMUj3R5Nyhyg6SYyEzuk=;
 b=hIpg0Ll9yZxRGxf6GH8H2E/zPabJqjA8GQJcWAXolZaWgCWxG73f4X1hCu6XLjkdVN
 W3EOLpvWvbPvEdTwe5uTSz/u/bGGt9g7OTPpCw9tMGvMsapnOgDqT4aoWs+a/P4O1+6D
 DQQ0xIBwNnhWdFTylqNZFGZrNRcDeo9hpYvfKaMXvSmHbukEdqF0xkBWzUMJwAqbl7wT
 8ESYZutpwtwMaTi8f2fPHr0E5AMVemklvnRLmWozkNXOCVpiDS/rr4snQcvRC+J/rg8b
 whFmrLQNS7ylBReNWjBYB+EQjbgHu+QSiQbXah5FOU5X+HU4IL9Q5zvBvzPtOwOIgOHz
 rCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QM6lwvVyYd4T8B0+uW+YnPRkMUj3R5Nyhyg6SYyEzuk=;
 b=WDBN+aiEC+Z9tZFl61qa8ZB1CoF6sGP7+tLOa+EbL/My8/FoX8JKoazE+kME4PpOee
 e7jujT02bYtYMQCUJWZITPY9DXmJI7OR5mPAZ6dB6xmr5rPqaWqXK866ATr+tQV/Jxvv
 X/Sz8NNGvwm571a321TFhC5SqWHA4MFTLrVeN3IirxliOPJKA+jgyoarNPe7Wz/PhbeH
 d4Kc+SnbMVPlpnjtgstnTU02Rtb0GWdfuGT7JJCoEQwrp//RPKENEu8wf5tsMxH/pPJ+
 THVXrY2VaDEJQJjXS4pbCAbSEHkbh+sVbSnXSTXJ0MwDF9hv1BxTThklnGDxCGj0pQLj
 lUYQ==
X-Gm-Message-State: AOAM533sKnwMP4aSEVpLv1J4boxRC7Wvlkidk4ftgnADEibOHZgE4Mth
 JLkItOO2pHfogz3ku5Dxy4JmUAKV
X-Google-Smtp-Source: ABdhPJzEVypf4YCwvhByvDVA676j0GBMtNyQSzchcKBsvcNQ+Ikfqzm8fiYPDq4RZFbZc/Rl6vNgpQ==
X-Received: by 2002:a63:3cc:: with SMTP id 195mr13628525pgd.296.1595125020975; 
 Sat, 18 Jul 2020 19:17:00 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id a68sm6891159pje.35.2020.07.18.19.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:17:00 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat, 18 Jul 2020 19:16:51 -0700
Message-Id: <20200719021654.25922-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH 0/3] xtensa: add seccomp support
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

Hello,

this series adds support for seccomp filter on xtensa and updates
selftests/seccomp.

Max Filippov (3):
  xtensa: expose syscall through user_pt_regs
  xtensa: add seccomp support
  selftests/seccomp: add xtensa support

 .../seccomp/seccomp-filter/arch-support.txt      |  2 +-
 arch/xtensa/Kconfig                              | 15 +++++++++++++++
 arch/xtensa/include/asm/Kbuild                   |  1 +
 arch/xtensa/include/asm/thread_info.h            |  5 ++++-
 arch/xtensa/include/uapi/asm/ptrace.h            |  3 ++-
 arch/xtensa/kernel/ptrace.c                      |  8 +++++++-
 tools/testing/selftests/seccomp/seccomp_bpf.c    | 16 +++++++++++++++-
 7 files changed, 45 insertions(+), 5 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
