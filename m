Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 67B5C90BBC
	for <lists+linux-xtensa@lfdr.de>; Sat, 17 Aug 2019 02:24:11 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 817C96529;
	Sat, 17 Aug 2019 00:18:51 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by linux-xtensa.org (Postfix) with ESMTPS id 712716506
 for <linux-xtensa@linux-xtensa.org>; Sat, 17 Aug 2019 00:18:50 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id x3so5195982lfn.6
 for <linux-xtensa@linux-xtensa.org>; Fri, 16 Aug 2019 17:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5BCk8bFtxwiRj/dtDmyR2CqB0dW325WAsdwABRHioXU=;
 b=VdYQLM9o0hIXZUJKTYv3xybe+MsZqxJIUjzUNVfm1RUlRdBYhQrVUul/vKNg8ko5vA
 NEoyP+Puvvjz1dBlMdQPFr+C4raCP/qeYU1T/W1Mcrul9Xir8cg9HueIcdWihrXMo1vZ
 NaX5WYv//9KBNNOjWHL2XOcChFQ98YSzXMbVMvyvJ57ypyvQq73Ljzgcp9wcMXkIyMA5
 oVScKImhM3GnmY2LyIkrNCcBkAXbMOPD/6QKDp8RYZpNuSyhs/GfSHs0zD5qr7lTqqCZ
 Z7uyyjh8E2QTVMN/+pcXOmmXHrHIAgdtCGbPY+QAyGwfSY6UfOqgbHFE3qeTiJSdbZdA
 QIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5BCk8bFtxwiRj/dtDmyR2CqB0dW325WAsdwABRHioXU=;
 b=TfeBBG31R9thYyinAbSCAm9uDe85GM314dWodD0OdMLqyT1K0d+n7MXN4EUkEU99OV
 ZW1W+nmXa/HKyJ72V0toPrQatn1+D+6tFY1tXsmOJutJeFG7z2fNbdAy/ZzBveIHsrNB
 XR6+YBL0BwAC0N1AIfgmjZW+hu2J59KAJo8XvmCH8TxE9236lDNC83IhSoq9QxytySYE
 uszlkwudhqH5e8HG8i2zTWeZZPm0iMZwGriIDmNFiPym1DrMOIiY7Xg7YEV1+46gFLC7
 JP4C5MZqQBh4E9+dCR0QmYwwACbG7gCu/o99ca0WKjnh7vUO/RwEMo1jNYHhF+iwt6sU
 jHng==
X-Gm-Message-State: APjAAAVdJ8PB58UDdQdwa2gt12mk5851W52qmDN3lkFIW+fFo7kbxsPq
 K/x2HN15MgcR2/LzAD8YKJQ=
X-Google-Smtp-Source: APXvYqykHZ6nHNGIyr15OwALdLImvl18zWCo0bcVFvKGQDwHSddoOMs4F23dXqxmFol1AU3GPdCs6Q==
X-Received: by 2002:a19:4c88:: with SMTP id z130mr6588499lfa.149.1566001448127; 
 Fri, 16 Aug 2019 17:24:08 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 25sm1146633lft.71.2019.08.16.17.24.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 17:24:07 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 16 Aug 2019 17:23:49 -0700
Message-Id: <20190817002349.28658-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/1] Xtensa fix for v5.3
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

please pull another small fix for the Xtensa architecture.

The following changes since commit d45331b00ddb179e291766617259261c112db872:

  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)

are available in the git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20190816

for you to fetch changes up to cd8869f4cb257f22b89495ca40f5281e58ba359c:

  xtensa: add missing isync to the cpu_reset TLB code (2019-08-12 15:05:48 -0700)

----------------------------------------------------------------
Xtensa fixes for v5.3:

- add missing isync into cpu_reset to make sure ITLB changes are
  effective.

----------------------------------------------------------------
Max Filippov (1):
      xtensa: add missing isync to the cpu_reset TLB code

 arch/xtensa/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
