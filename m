Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id BEE00808BB
	for <lists+linux-xtensa@lfdr.de>; Sun,  4 Aug 2019 02:34:03 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B3B52655B;
	Sun,  4 Aug 2019 00:29:11 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 6078364D9
 for <linux-xtensa@linux-xtensa.org>; Sun,  4 Aug 2019 00:29:10 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v16so1545045lfg.11
 for <linux-xtensa@linux-xtensa.org>; Sat, 03 Aug 2019 17:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IDK+5GJsZg/moQTYynkFTD4VZ9t6Tz3FIid8VE7y7kI=;
 b=bGFGZFLRVjn1uAjxt0g6Xpfpd0DZhYy7lhDfricGG0nHBKOvemXKtt9o+hmbu8Xfn9
 74otpIeSgbrAjTTr2x6xoBdBA7jdM8dn2qFjA9XWcaQBuVVJ6zBi2Lxrn97NXxKE3vDJ
 LqfmmaR4GFQbxZAELYtn48dD5fRU1Dih2jWWWTULEmOkfDHHg13TzEoKxGi+vTzH30S6
 SImvND02Zdb/vcExsfarjxee/+jhVPF/W4LiSg0GLJRMgG2lI2qbTbCS76+uL6DM7jlG
 UcNiFqGG83dagfrevFpWuA0qqCdO3XslVlj+coIOa4HLOrN5ObNHkepQ8+K0cdYGatIw
 0Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IDK+5GJsZg/moQTYynkFTD4VZ9t6Tz3FIid8VE7y7kI=;
 b=Msd5Y+0uSFcFvDZN7//9ISmBADtM4qZ4SMR0VWgnCBE6NBYfITDTTYiBYPAkXR5UPC
 2EQfb89sZoj86/4jvqTrq4Dlf0yANI5ghWkJq3z5W48kcetHxCu5LjU/cANQ5jNKN1dl
 HDyEHcCfbR551UBgJrlVaRy6XZRz1g4x++V4UMtfxLy1xNAteNd3wk1eLtWJ4pFYtAPr
 pdkUf0Zh7gFK+CG4v2Cz+PD62yf7pU8D8LHpEyT8ifsH6KRWfD1FSc9sBhPAPzxv8VsA
 q1gVB97iP8Xqh8Pzoy11dCfRpth1+8E+VFjKKEeDvsqE95wDqDrgF8ZycIAbEVEzLjFD
 ZLag==
X-Gm-Message-State: APjAAAWDVGt7UuxhU1njsIcKuWivjn0hqgbEaw3SZ2zGAOUb55CzloUA
 RuLVhiR1+2tuK5KXfPp6IRg=
X-Google-Smtp-Source: APXvYqwVzou9iJ1UwdgKNFFg+Q9vHwibyzvE4IAqQwjoFWjcnQhys467V/V3deTpaF+HZ6xKl3eD+w==
X-Received: by 2002:ac2:4d02:: with SMTP id r2mr23021734lfi.138.1564878840353; 
 Sat, 03 Aug 2019 17:34:00 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x22sm13687848lfq.20.2019.08.03.17.33.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 03 Aug 2019 17:33:59 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat,  3 Aug 2019 17:33:17 -0700
Message-Id: <20190804003317.15370-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/1] xtensa fixes for v5.3
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

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20190803

for you to fetch changes up to e3cacb73e626d885b8cf24103fed0ae26518e3c4:

  xtensa: fix build for cores with coprocessors (2019-07-24 17:44:42 -0700)

----------------------------------------------------------------
Xtensa fixes for v5.3:

- fix build for xtensa cores with coprocessors that was broken by
  entry/return abstraction patch.

----------------------------------------------------------------
Max Filippov (1):
      xtensa: fix build for cores with coprocessors

 arch/xtensa/kernel/coprocessor.S | 1 +
 1 file changed, 1 insertion(+)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
