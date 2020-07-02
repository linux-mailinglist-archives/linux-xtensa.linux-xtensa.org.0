Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D3EA92127F4
	for <lists+linux-xtensa@lfdr.de>; Thu,  2 Jul 2020 17:34:55 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6726D52E1;
	Thu,  2 Jul 2020 15:19:13 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 6CD545289
 for <linux-xtensa@linux-xtensa.org>; Thu,  2 Jul 2020 15:19:11 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e18so13637357pgn.7
 for <linux-xtensa@linux-xtensa.org>; Thu, 02 Jul 2020 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jdo38+SfnzRZ0irtqUgOk39c1YWhJclooSJtA2eS8B8=;
 b=CRy/abyUrrPreVwkieYroH/5tLLn3oU1Nr8MfgMXT+lgm0+O4CujQw/WE4O4I4B44Z
 XxSUmN7rwpkMQD9DlqJh4kghEwQ2P2LBr0xna7ikYBrcoBmbEhLHQElwzNWPOkE3FPfF
 ASn5tLhRG1/TvYp7Pe4FNKx1nAbo/quDHvqloYvBP8BYfcJ0XVi6kaWBslmqrcfx0xBK
 hF9yzp20fKmFCgra/+Q9WPPQNVhLPBiDHsRJbFGyEX7lyEXHmjUT6IzOvZuN+lmIiPX1
 7HIWB6vTFC3aQ0ht8pdb3+HMOwgSPTA/6QgWv+FrkVJz/1618Ec54JM3Kd+3rf6bplcY
 NlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jdo38+SfnzRZ0irtqUgOk39c1YWhJclooSJtA2eS8B8=;
 b=cLdDqAUSQmVNq5hKrCJBTPtIWC5MjhQdlwxTzhZ/LxHJB1vG7IBs+FX4Lbmo6mPlcQ
 E0DJVuyIheA1HUdSIWVbCGJUsDQ3RE3YNZv318KZiMzhw1aBcm41hrwE0YcLlO6W2/c0
 QgvRtx5fKTrbpdBy8ryn5I6Ohrft34B/ll+yDfMR+SGmIuTjvEclwgoXE5iGEIrletLK
 Lm0peQldfon8nSM8FcRaG7wROte4aKKr1m3isQ4RYa5Pa8e/030ihEOXcgU95lTnAb9b
 ybBTtlNVxS1BbUTizt1B/gGjw0bF8KS+XzydM4Al4B6ycJg6l1Cqgu8pgJvAfOzSM4SY
 AQvQ==
X-Gm-Message-State: AOAM531FFtWDKoIbDCo8W4sNDhyG/Q0nkixKclkWypbSA9erGOog6QH6
 00ismSJBHrwLA5qfd6RSiOPpcwuQ
X-Google-Smtp-Source: ABdhPJyRqzh8RGY+Tqv4Okd2thJp3+UNut3AqT2cXFZhtua+PVXSPIVUKehj+YcwsysWmfbXpZbvfw==
X-Received: by 2002:a63:455c:: with SMTP id u28mr25890574pgk.374.1593704091996; 
 Thu, 02 Jul 2020 08:34:51 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id b6sm9247529pfp.0.2020.07.02.08.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 08:34:51 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Thu,  2 Jul 2020 08:34:45 -0700
Message-Id: <20200702153445.16241-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: update *pos in cpuinfo_op.next
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

Increment *pos in the cpuinfo_op.next to fix the following warning
triggered by cat /proc/cpuinfo:

  seq_file: buggy .next function c_next did not update position index

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index d9204dc2656e..be2c78f71695 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -724,7 +724,8 @@ c_start(struct seq_file *f, loff_t *pos)
 static void *
 c_next(struct seq_file *f, void *v, loff_t *pos)
 {
-	return NULL;
+	++*pos;
+	return c_start(f, pos);
 }
 
 static void
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
