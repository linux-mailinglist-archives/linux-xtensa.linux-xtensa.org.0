Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id CD8B039529
	for <lists+linux-xtensa@lfdr.de>; Fri,  7 Jun 2019 21:02:03 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id AC8B465C6;
	Fri,  7 Jun 2019 18:59:13 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 2EDF165C4
 for <linux-xtensa@linux-xtensa.org>; Fri,  7 Jun 2019 18:59:11 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j29so2389627lfk.10
 for <linux-xtensa@linux-xtensa.org>; Fri, 07 Jun 2019 12:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7TSC6Lcwt0ziWmC1KdJukuudhzzptcOYMXG61hkW4JI=;
 b=FODScLNoVtC3Y/vqI6A6HAMUtssJMFzduhqVCTFGUMv1NX1ozThF2CJIwJ4xg1jjlm
 EHg5aC05/lgwzGRgG3M+hxFH1+mErHCFFwsRlICqw4JbsU0sBUb4O/JH4IdHYtMnWsfV
 /+jx7BCFGndgVxdUHPhrjY6Aa+5nQ46UZaDSwonbahxbn6ylinqZ6bFWc3dXCW2hm4NP
 le9oYV/PnbahgQSQT9Txc7AUW10pn4euHcydnfk5DYkPYwG/izRY2wPpWVE27dGUlT11
 oIpRme84lGKm1Mj05peta2xYk+dsKA2DoDBnerJBrj7a5Th4s8W+OjESvGv7XcNzRJWu
 w8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7TSC6Lcwt0ziWmC1KdJukuudhzzptcOYMXG61hkW4JI=;
 b=TnUwvDMdjmiWEqfPeZVVieawuA0MCf4r4sSU0bVogpxDd2TH2Ry4E60bdjH1UrLa/Q
 FsjKc6B3MEWf8nn+zU/ykGZikXXuUUa1uzZMGo0Kg6DwL/wySo8yPE5K5NQqywx+816Z
 vm0q4ciwW++xcDWHwxeOk1OTWysj3hGUEbFaFPbWVsXSLSgvXLYJqM63HIaUCiXB8VnS
 HKprOjileqvsWx9+nrSdjGkGwNuHXDj8TNqnp872rCbeRAZRiHBPFgpD6q++LNTf3OLC
 /acdds+bbEl1mr4Pc2l8l1QJTp4jYvZwq4kdQHq6ac1NWR/NgUTkAMzjy+LqfhD0qREa
 EUug==
X-Gm-Message-State: APjAAAVmf7Zy5e0atEpgZib267Laqi3wFq3/q4Ty7Mv43aREcQsC9v60
 wF9s6SdZn3PeWVzy7ShNQXg=
X-Google-Smtp-Source: APXvYqxBjO0yyL9+zsTgH4glhJuLGhdeouDe6vBMtMHweRdY0hKv3KnTkMJMHNbbFk/2HMZOXy1SVg==
X-Received: by 2002:a19:4c05:: with SMTP id z5mr18847629lfa.5.1559934119797;
 Fri, 07 Jun 2019 12:01:59 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id m24sm528507lfl.41.2019.06.07.12.01.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 12:01:59 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri,  7 Jun 2019 12:01:31 -0700
Message-Id: <20190607190131.4252-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/1] xtensa fix for v5.2-rc4
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

please pull the following fix for the Xtensa architecture.

The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20190607

for you to fetch changes up to adefd051a6707a6ca0ebad278d3c1c05c960fc3b:

  xtensa: Fix section mismatch between memblock_reserve and mem_reserve (2019-05-30 06:53:53 -0700)

----------------------------------------------------------------
Xtensa fixes for v5.2-rc4

- fix section mismatch between memblock_reserve and mem_reserve. This
  fixes tinyconfig xtensa builds.

----------------------------------------------------------------
Guenter Roeck (1):
      xtensa: Fix section mismatch between memblock_reserve and mem_reserve

 arch/xtensa/kernel/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
