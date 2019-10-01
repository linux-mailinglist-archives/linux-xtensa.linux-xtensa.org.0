Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0855EC2E7B
	for <lists+linux-xtensa@lfdr.de>; Tue,  1 Oct 2019 09:58:20 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 142AD5871;
	Tue,  1 Oct 2019 07:51:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 95FFB25D3
 for <linux-xtensa@linux-xtensa.org>; Tue,  1 Oct 2019 07:51:23 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v24so12296710ljj.3
 for <linux-xtensa@linux-xtensa.org>; Tue, 01 Oct 2019 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rLeE+htgaU9gzy01Jb/ZeRp34lUaINpP7MzC2bKJlxI=;
 b=r2bqM6mdEDLW5flYXw3cyeWTLcUuNfxQEAf+GD+Fr3beIDLLLXl9drXOA3Wv43s3ix
 y4Q7iwdi7IZ9LhZrdUeey2xWGdhivPBjnkIsYmti3OWoc9W42BpvTH1+dSTh7M7Sudt+
 VjAuOlyU+8V4jeCIOEfOR73ErCfFXzejzLrMp7wCNb3cbklSS6BNkx/0VLgcnmZu9hWS
 mElLT/rAh6TDWmquicYB5EtRs/E48gWBBO753trQ53A+RiE3dkD1Wz3R1yRl8Ci9a/Wq
 7AZP6fxAQKd1cq6IvHlV6+DddraLhhv0tPPOT6ACesVNWiszTr4hLm6TeUt8Z/Tl+JYm
 gh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rLeE+htgaU9gzy01Jb/ZeRp34lUaINpP7MzC2bKJlxI=;
 b=o37tkyCqbw5q3wAaZ/6GLPx/3TFo+AFEQKJvzn2cvMOcPy6tPZXirFVWrNbG5z/dM2
 I8H7/51sg9Ne7c2KWN0ZJQuZ7UNrJ/spI6tM9pFUfAHy9sV4Wm/760k6I78k9ZXHBErs
 XJFPioHDyF+gJ3iZcLkZJiZndlB0asqinxACSv8UPPyLyYMN8DveUOivswksdnM1OZ/G
 w3ML348kUqkjrm1JGWdKxadV9rEqf0mvBMPRyTI/9XbJUa3Adc0JI2jzatUsmWlib8NZ
 jZh5G/tuh8TrQrHCbMFnjxPoAqZ7t1US3rqv4fpAAYdDd8OOw620NLVv7FyPFMuCNFnJ
 K8Lg==
X-Gm-Message-State: APjAAAXCOS9kPM24uGBvoVNurn7oNZYMmlT+LZ4d0RfTBqiIsn+GoLpW
 kQBLxd5Bo5aXKlATJktkHosTYOXGui0=
X-Google-Smtp-Source: APXvYqw/Iuou/9L/SpniN3uXbx4hIj7uekQDypFWL+p657iKHGGVvjXxj3jlTmHhLJ+rvlngNaaAbA==
X-Received: by 2002:a2e:9094:: with SMTP id l20mr15137697ljg.35.1569916697820; 
 Tue, 01 Oct 2019 00:58:17 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm3775562lfm.71.2019.10.01.00.58.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 00:58:17 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  1 Oct 2019 00:57:36 -0700
Message-Id: <20191001075739.32447-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191001075739.32447-1-jcmvbkbc@gmail.com>
References: <20191001075739.32447-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 3/6] xtensa: fix section name for
	start_info
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

.data.init.refok has been removed from the kernel long ago, replaced
with __REFDATA. Fix start_info definition.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/head.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/xtensa/kernel/head.S b/arch/xtensa/kernel/head.S
index 7f009719304e..c60ce905274f 100644
--- a/arch/xtensa/kernel/head.S
+++ b/arch/xtensa/kernel/head.S
@@ -355,10 +355,10 @@ ENDPROC(cpu_restart)
  * DATA section
  */
 
-        .section ".data.init.refok"
-        .align  4
+	__REFDATA
+	.align  4
 ENTRY(start_info)
-        .long   init_thread_union + KERNEL_STACK_SIZE
+	.long	init_thread_union + KERNEL_STACK_SIZE
 
 /*
  * BSS section
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
