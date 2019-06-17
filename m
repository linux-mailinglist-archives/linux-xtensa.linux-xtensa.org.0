Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id CF605488D5
	for <lists+linux-xtensa@lfdr.de>; Mon, 17 Jun 2019 18:26:41 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 1F8D06439;
	Mon, 17 Jun 2019 16:23:31 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by linux-xtensa.org (Postfix) with ESMTPS id E29BC6435
 for <linux-xtensa@linux-xtensa.org>; Mon, 17 Jun 2019 16:23:28 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id t28so9890384lje.9
 for <linux-xtensa@linux-xtensa.org>; Mon, 17 Jun 2019 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cMhUdTJNWUF5l1EUdWq5XZ4c8tusEKzWlkG1oArWgM8=;
 b=gngLoSjuveFqJRscfnb00SI3Kagl/C5R1VUAMcR8UXXTz4g6JeQNXb/GLImPpDasJT
 yn75Da20j/t67wHCZm5QppXoOvc1qyvkzQhUL+pfnxn3/PrvvknKAzqpQ6klqywIGCxf
 ndm71uJnFevhK67Q+1WZImq6UMI+d/+ETrY2kgreOec+G6fg+knempJl7E+KjKjpYUmW
 i0frIy61wDvXaC8aaJGc7MgglJo4Duv7Yq9qb/aKQy9UqOVGLVwJEt6nMQswFRxzrJKm
 49MfDFm2Lhvew9uDuA4x0JEmojQpuwEXPIvMvq6wZ1v+ALsuLrQ9YIUsxEW1rUY/cxAm
 /3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cMhUdTJNWUF5l1EUdWq5XZ4c8tusEKzWlkG1oArWgM8=;
 b=YntLatvBP/SMNpkNpWluSFt85a6utXK+OTINJJU4cXaoCyRrH402v4s0A48Ek7VEVs
 akKwVUv1lXuPaJmmcCy3VrdYuuqO34U52mFxJzNWcW/oom3lOMXGupZ/NF3p8rPXthBh
 LQr2W/rn7FVkw4P99mnJaALXHzFzCI+wArf1WDNxJqaMezButahtN9bHBjpYKyBLUGu6
 Rv1cWG/SRPQ3di55TjVkDH6bwAWmA3vCjYdrhPPGA61nbX53Z484wQap2dlo4A8u39hq
 1SGzd3e40ePXmVbeVj5cbHU82oCrmLLlk58TmXZ8KSP94rHnWbwnnwclSRrW66o6MO2P
 gEWA==
X-Gm-Message-State: APjAAAX1TNdyQcdp0jUNfuq98TBVXazfgqhV0VrIWr/F9CWJZfZ5orsv
 Ru8S3CXsXoPQ+o2htfWlpuUhuTRF
X-Google-Smtp-Source: APXvYqxsVq+Q+yUXiY947JP7Aft0JYhd1ZK7VnheSPQ5FYjYLeHGBJQGRZl3+W4sLO2s2PxDxJLA9g==
X-Received: by 2002:a2e:1290:: with SMTP id 16mr40712563ljs.88.1560788797369; 
 Mon, 17 Jun 2019 09:26:37 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id v14sm1834721lfb.50.2019.06.17.09.26.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 09:26:36 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 17 Jun 2019 09:26:21 -0700
Message-Id: <20190617162623.28518-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/2] xtensa: clean up PCI support
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

Hello,

this series removes unused/nonfunctional bits of the xtensa PCI support
and replaces two custom functions with generic ones.

Max Filippov (2):
  xtensa: drop dead PCI support code
  xtensa: use generic pcibios_set_master and pcibios_enable_device

 arch/xtensa/include/asm/platform.h |  10 ---
 arch/xtensa/kernel/pci.c           | 123 -------------------------------------
 arch/xtensa/kernel/platform.c      |   2 -
 arch/xtensa/kernel/setup.c         |   4 --
 4 files changed, 139 deletions(-)

-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
