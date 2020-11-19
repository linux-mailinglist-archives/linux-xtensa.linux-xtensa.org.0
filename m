Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A6FFA2B9119
	for <lists+linux-xtensa@lfdr.de>; Thu, 19 Nov 2020 12:37:52 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B622F3AD7;
	Thu, 19 Nov 2020 11:17:13 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by linux-xtensa.org (Postfix) with ESMTPS id EE2162631
 for <linux-xtensa@linux-xtensa.org>; Thu, 19 Nov 2020 11:17:11 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id a9so7779432lfh.2
 for <linux-xtensa@linux-xtensa.org>; Thu, 19 Nov 2020 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OR5DlQ82Z0giWyrUKoqiG/pahiCDRhRB22HiV/XCm3A=;
 b=QeqvO+IV+oEFVnggQNPfdOQaZMm/RAsTtKSrrEVaVkl1eeK7qoEjq34P+PGVF7xNYx
 n2hddAzgDM8f1sbUAJejdIWM14Qu2GOcu74ITuJYIu14oHTcpxaljeFA1/cGTYSIo+7K
 WXotrmmoFm2lpkWcX/X2lmXrTK6t3sy0Xv0kSVX2DMrumWyL14VZt8RBtV3NbbUDhjVH
 nFz4Lif84tDxgFd6AP7RTiib4yB+4t95InRG78UtH/Ztqrj41EPLfi+hSjOcBB48OZyU
 EXuvpAVmqvq0N7842ttWRLUJpvc9a1STfkl41u9h29sntyWIx0Em3Z21rC6j3eAsOy9T
 5AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OR5DlQ82Z0giWyrUKoqiG/pahiCDRhRB22HiV/XCm3A=;
 b=il/tY8KRD9xkNwV6JD7k9BRe2v7EuMlsXzSU1Q+d1iWiuuo5bG/C93rwVaOCFyK84/
 gw19pjC3Z6e3qw2ucmiuNfgeknzULapiwb/Xbby3FUaxnbGO4sHchz81BM+zhIgud+dq
 r32QavW07VfBF6rmsLSu+HBOauLe/kPTVT+77zYWsOtDLpAD+1EKJDxzq4VmZ47Lx0/d
 3AUE7pcHOJN1ctl0Ni+EsjqGNp67ikOOmzOInlOH4m+IFrDXpF9yeeYxYbmHSUPacSgn
 E+xr5bU3Py0WWqHUGZqgJV2vOs6h8z3UHqw45eaN6xE30qJTo0+S3U1EGTMNkjXfcjDm
 Phuw==
X-Gm-Message-State: AOAM5335US666h3GcDxli8+B5+KAeizeyHOVn9xiDVK8NFmx+o9Tck8e
 HqxMh4UeudS+YnbvoPORGy4=
X-Google-Smtp-Source: ABdhPJyY2cwSvDfGgfMiKJsiUkaO24dX2pW/4J4CifTSN+qB7d7nY6FdD0GqHXSKOMuR5R12ULhF6Q==
X-Received: by 2002:a05:6512:2141:: with SMTP id
 s1mr5298952lfr.307.1605785868515; 
 Thu, 19 Nov 2020 03:37:48 -0800 (PST)
Received: from octofox.metropolis ([5.19.183.212])
 by smtp.gmail.com with ESMTPSA id 12sm4059857lfz.10.2020.11.19.03.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 03:37:47 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Nov 2020 03:37:34 -0800
Message-Id: <20201119113734.25047-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/3] xtensa fixes for v5.10
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

please pull the following fixes for the Xtensa architecture for v5.10.

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20201119

for you to fetch changes up to dc293f2106903ab9c24e9cea18c276e32c394c33:

  xtensa: uaccess: Add missing __user to strncpy_from_user() prototype (2020-11-17 05:09:28 -0800)

----------------------------------------------------------------
Xtensa fixes for v5.10:

- fix placement of cache alias remapping area
- disable preemption around cache alias management calls
- add missing __user annotation to strncpy_from_user argument

----------------------------------------------------------------
Laurent Pinchart (1):
      xtensa: uaccess: Add missing __user to strncpy_from_user() prototype

Max Filippov (2):
      xtensa: fix TLBTEMP area placement
      xtensa: disable preemption around cache alias management calls

 Documentation/xtensa/mmu.rst      |  9 ++++++---
 arch/xtensa/include/asm/pgtable.h |  2 +-
 arch/xtensa/include/asm/uaccess.h |  2 +-
 arch/xtensa/mm/cache.c            | 14 ++++++++++++++
 4 files changed, 22 insertions(+), 5 deletions(-)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
