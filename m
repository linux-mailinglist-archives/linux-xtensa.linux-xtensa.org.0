Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E4BB71A4AD6
	for <lists+linux-xtensa@lfdr.de>; Fri, 10 Apr 2020 21:53:48 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B64232263;
	Fri, 10 Apr 2020 19:40:46 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by linux-xtensa.org (Postfix) with ESMTPS id BE0862258
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 Apr 2020 19:40:44 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q3so1435880pff.13
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 Apr 2020 12:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GnS+iKPshB2H+iJx2B0bBeNxXYNge8mXSC0GNXOAR6E=;
 b=qAg92dm1m90uJbKfYO0c0g0rgZ3OyQah5Ijz3Nx2D7DW9+pNksOZBVrn6JtbETCaup
 QVTWEdPHIf8gAcaZJExiXN7j8owgBiGl0/9c+aqvFUWIrCLnvu9AvqJRfwQndqsXxV96
 zueVO/zOpS/xkC0zEgDXwm2Jnz1+pfnODPV5iwLbrwkNg8diNhhl0dlLaELC3PjlxGLt
 PCXN+Ab5Pr3GB6D3NnyGPFYrA2/9fx1VP7z6cTvD5IaTEcQsAZOnbrgDyaZrtHGTXooI
 7+6v0TZiL1GYqwWSZUpywkSn/1iG/LoEbPp5gMmbBsmHvQV8buJvcSX//wx9w6jcYxJq
 hlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GnS+iKPshB2H+iJx2B0bBeNxXYNge8mXSC0GNXOAR6E=;
 b=Rkw7I3U8Fx66OWN+8d8961SyDD4+ZpkC+swlScbiZo/lI2ex1yoPjhPTC8eJAT7tHI
 ljjg4szh1ecA10fBQUqzzEaex/P1Twnc0tm6Ouq7zB79FiR/DZL1MwrNO2aVta1oswN+
 MIQOJvDtdFJ08ET4KtOnYiH4TfkjUvK6dFH6G7hhdV77CF5CpKELLKMvAwZgTFPlCGng
 KJYL8G2Me1NihlN0PG0iapKbjqOaENVr+/1RCdyrdcj3tu+8Nq7egJp+laQmcTd/s15F
 nz4RN8y64IgJCYl2VdMztG/GcjZsubv/P54yeKPxonX1AytVFoi9+lvp+VGb7SUn1RsW
 frEg==
X-Gm-Message-State: AGi0PuZ6UbSfcSkIxCcZnJ0p1WFBI3/rAIzN0pwDVJ+UPd7xPtyIWMrP
 dX+zQt0/ytH6yfA/xrEKcqw=
X-Google-Smtp-Source: APiQypKtqv3FkYH83kX4elGfmQtsEbuXFeu29FerD++flwUmaRjooBkKO+s8F/RccjUYQxUoI3jMCQ==
X-Received: by 2002:a62:5341:: with SMTP id h62mr6375982pfb.183.1586548422818; 
 Fri, 10 Apr 2020 12:53:42 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:63f0:a487:3b8:7ffc:c9e4])
 by smtp.gmail.com with ESMTPSA id w142sm2468983pff.111.2020.04.10.12.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 12:53:42 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Apr 2020 12:53:31 -0700
Message-Id: <20200410195331.12735-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/3] xtensa updates for v5.7
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

please pull the following Xtensa architecture updates for v5.7:

The following changes since commit 98d54f81e36ba3bf92172791eba5ca5bd813989b:

  Linux 5.6-rc4 (2020-03-01 16:38:46 -0600)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20200410

for you to fetch changes up to 70cbddb973859158731ce77ab20cd5e53822c089:

  arch/xtensa: fix grammar in Kconfig help text (2020-03-30 13:35:31 -0700)

----------------------------------------------------------------
Xtensa updates for v5.7:

- replace setup_irq() by request_irq();
- cosmetic fixes in xtensa Kconfig and boot/Makefile.

----------------------------------------------------------------
Hu Haowen (1):
      arch/xtensa: fix grammar in Kconfig help text

Masahiro Yamada (1):
      xtensa: remove meaningless export ccflags-y

afzal mohammed (1):
      xtensa: replace setup_irq() by request_irq()

 arch/xtensa/Kconfig       |  2 +-
 arch/xtensa/boot/Makefile |  1 -
 arch/xtensa/kernel/smp.c  |  8 ++------
 arch/xtensa/kernel/time.c | 12 +++++-------
 4 files changed, 8 insertions(+), 15 deletions(-)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
