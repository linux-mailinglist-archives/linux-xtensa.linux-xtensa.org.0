Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DBBD1C1B07
	for <lists+linux-xtensa@lfdr.de>; Mon, 30 Sep 2019 07:33:37 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5B7A864A9;
	Mon, 30 Sep 2019 05:26:44 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 35B096489
 for <linux-xtensa@linux-xtensa.org>; Mon, 30 Sep 2019 05:26:43 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m13so7986126ljj.11
 for <linux-xtensa@linux-xtensa.org>; Sun, 29 Sep 2019 22:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rLeE+htgaU9gzy01Jb/ZeRp34lUaINpP7MzC2bKJlxI=;
 b=FXHcWQA0qkvhj52JzHEk3WNnNmDxkKBFpR60nuR1CEvQZkfln2h6Zg/jIeRiOrqyQH
 9ZVkV3133TzuL8C1EBQpTp2akp34mS2Mv9W93GFa6wR8jh1BOPXfInV0H+1De3TTlwH3
 vOHXPRU51+RYtrsirr/N1ECCzELYiciVZebt2yJyJDOrMsipxLJPWo8A/7Vqt1gPeFyR
 gTMJLdJIPJhpf2DL7ZuW8Af8QZwtvsyKifdOskM42kIXGMF+3y0nZBXAK41gTU0R1Qsd
 vphHEKSkam7Xyt6aMgHcIpwZGgcc2fDfnm/JeRkWW7f2S02cXLEhmLPwqoBXSnm949D1
 y6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rLeE+htgaU9gzy01Jb/ZeRp34lUaINpP7MzC2bKJlxI=;
 b=bSi9AA9GCd1KbD8wR31knq7LAinMW8nxhh37wAn3KbDQZTvarMRDKATryY0thOnapu
 tV38I06zwlij1LNrVHzj8k/+1kSfuuoBqju6DlLkw2Qkv9XADC1To9lvJu0lDOdnhk6b
 wRzIfvBCEp8e0/ipYvQV7IgHeCgNCaylk4V/o+I424Gfr2pzRkVJJAVcULg6IqHWaXf4
 kUuaQAWWcr32qQnHaiczEHdHZtHUK6YVw7VeRWnf2gMV+6YMJ0nEZ3twmpwRz/XfL+d8
 9cPxBM8kOD6EsJiwqKoa7D+s4Qw+wN/rO06tTwJ+8S3kFmhqvMz4Q2pIY0DA28kX7eI0
 2mGQ==
X-Gm-Message-State: APjAAAX+q7OcxYR0VLdlsOamiU1uehFW3fzsm5tISBBhyknP6br+ZyPb
 c/Ny6et5UxSy9UOiaySVsNccx1zV
X-Google-Smtp-Source: APXvYqwTOaGqtLKAOQ5aycM4ciR2aDxJV2zqgqtLlDOt8EYmopwypHm8bwFMxHt8GNmdPXXeBHKszw==
X-Received: by 2002:a2e:b0c2:: with SMTP id g2mr10486220ljl.217.1569821615174; 
 Sun, 29 Sep 2019 22:33:35 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id k23sm2944211ljc.13.2019.09.29.22.33.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Sep 2019 22:33:34 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun, 29 Sep 2019 22:33:04 -0700
Message-Id: <20190930053306.7029-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190930053306.7029-1-jcmvbkbc@gmail.com>
References: <20190930053306.7029-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 3/5] xtensa: fix section name for start_info
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
