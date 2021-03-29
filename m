Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E091C34D765
	for <lists+linux-xtensa@lfdr.de>; Mon, 29 Mar 2021 20:37:12 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B305F6812;
	Mon, 29 Mar 2021 18:12:26 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by linux-xtensa.org (Postfix) with ESMTPS id 194DE6810
 for <linux-xtensa@linux-xtensa.org>; Mon, 29 Mar 2021 18:12:25 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id g10so4826127plt.8
 for <linux-xtensa@linux-xtensa.org>; Mon, 29 Mar 2021 11:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2vX47kNAbuQ6iB1dL8WXUv9iCpp8Rvoq9MaFH5UQI38=;
 b=pCAl0bSL/I5WQtZov9ySDbJXFGEJH8fmLrqtdxAvKbwMitCZ26kUfZ/iiDtktj5fJJ
 G9u8iihtEvHzjpgsQsB1skcXCj7ckkpINKKLrZC50ESwZRbAfe5upG1TO620D/ia0l70
 +y65rDOOMlpjygsHtnzmfOZuiw8Q5FOcnTXvjlfzh58aIKQzifsBiE918rijmVwcFKjq
 qyveWaNE6k/FMI++0MMnDPHsq3bWWUIO6HhMnjIFeF+A/AAG47PqjjHPnxcLPXWECrCV
 fj3rPSTkhELMWV7e7H7xI0cCDkToNlOLSniYWz+7BM/sFm++gvxDcPR7e1BgWU+isk16
 Fm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2vX47kNAbuQ6iB1dL8WXUv9iCpp8Rvoq9MaFH5UQI38=;
 b=Skw1Hnwxlu8/xsg5b0zz42RuF1696tpGWf2o9AN8+q4q0WtjXzodi7qD+5P5I8mTKi
 nJn2DAwzP4cvzpRkQtZCYfuPHQHLIEt+IHKqpRKbloI6nUfK7w4D5U59IsWE03nPhFhs
 G0Nv46oID3oOas1dLVjtbXlgIsN/RrfEK9OFe6c45t4i7VIdKga+yrGVzv/nFHQ7eGmZ
 s+TZgQdnwNG8LiGaXw/Dzodv7b8ixgiC2bLX2tZZ/N5YYSXYq4Sw44ccDVg8bg3rA6mm
 43jucMt50swM3UnZz8Nsq81XLh55w6NcWRvw2ki5N+Uoh00tgcObkVtI+oy4PiTCbJUI
 8t8Q==
X-Gm-Message-State: AOAM530SpRkVLqH18zMBZxCEuiIEEAPzMrmuUO6O0w8jNin9rV0/her3
 ejdO/VL5G87gwjx4knSXhQQ=
X-Google-Smtp-Source: ABdhPJzOcjK8lse5dwGxec+1eCDIQXd22D1u4X0NONkPKF2eV/Cystg/J5MADzJZ6P69Jy7JK7CjWA==
X-Received: by 2002:a17:902:c48d:b029:e6:f7d:a76d with SMTP id
 n13-20020a170902c48db02900e60f7da76dmr29563498plx.66.1617043029628; 
 Mon, 29 Mar 2021 11:37:09 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id f2sm18348117pfq.129.2021.03.29.11.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 11:37:09 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Mar 2021 11:36:48 -0700
Message-Id: <20210329183648.2277-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/2] xtensa fixes for 5.12
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

please pull the following fixes for the xtensa architecture for v5.12.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20210329

for you to fetch changes up to 7b9acbb6aad4f54623dcd4bd4b1a60fe0c727b09:

  xtensa: fix uaccess-related livelock in do_page_fault (2021-03-29 11:25:11 -0700)

----------------------------------------------------------------
Xtensa fixes for v5.12:

- fix build with separate exception vectors when they are placed too far
  from the rest of the kernel;
- fix uaccess-related livelock in do_page_fault.

----------------------------------------------------------------
Max Filippov (2):
      xtensa: move coprocessor_flush to the .text section
      xtensa: fix uaccess-related livelock in do_page_fault

 arch/xtensa/kernel/coprocessor.S | 64 +++++++++++++++++++++-------------------
 arch/xtensa/mm/fault.c           |  5 +++-
 2 files changed, 37 insertions(+), 32 deletions(-)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
