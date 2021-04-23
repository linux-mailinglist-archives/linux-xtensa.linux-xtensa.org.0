Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 61FBE36906D
	for <lists+linux-xtensa@lfdr.de>; Fri, 23 Apr 2021 12:34:07 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id BA6426FDC;
	Fri, 23 Apr 2021 10:08:31 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by linux-xtensa.org (Postfix) with ESMTPS id D2FAF6A09
 for <linux-xtensa@linux-xtensa.org>; Fri, 23 Apr 2021 10:08:25 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id u4so55173275ljo.6
 for <linux-xtensa@linux-xtensa.org>; Fri, 23 Apr 2021 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OfPcggF+aJwacONjauNdfDvXV40ZI8XOTwHOnfJ3TaY=;
 b=M0DmtLZWAEkW3P4cDmoUnFibXVq/gUOjtRqM6avYnxClqRvLXBPp6ddH1S1ysvrPW3
 xxolM9Mq3PDwOhkCNJhKB44ZL39rlcuLQC8vkdI3KRJiWLHMmPJkLQFTH4Nk8zruyRU2
 HV4zHoyd5UweAGyEJiKoNNqIRPxlnEnxzQzOHONAdDvgY4S+WkgPwLGHMUh34RP+hPr8
 4ZeG7ksJTamcblLArlbkIHm0SmU1vrkx0XYjg8f6wVgK+tn8mv+tGsq3UJwQje1En9uY
 3L94Q07xJwRXykjkpbdk4DWnebJhPVa+//T+3yzcXKlRDfvQuJijMUfd/Q3Z5Edn5KX5
 3b/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OfPcggF+aJwacONjauNdfDvXV40ZI8XOTwHOnfJ3TaY=;
 b=kyfVVVNkpiYcR+kg261a/X8KFsD5AjrD9RA0uPNoLaE2YMur2ndtw9aJwjv42IIz88
 JQ9L43QVYUfy8eLBowxNIKeERoFoKHqew7YFrKwLoLxrxTh4vurJ3wwAHivmBFDiwCwM
 fFGQ5/8e86IefgdwNy57beASXfjaQBoB5LwmGyBEgKDbYASrqkwIEK2EuGfkHjG+omGL
 QIowImjSG6LJBZi+qHueyNgGWsC9mDhkaL7ZzkzrtDZS9PGcR+25K7lHT6MMgKYB44WB
 +/Q+9hEfOq3sO0AwJB1K2AL7h4qSH+mk4J+q8TwJPQ+0AB/KrdW4FhfaTb0w2zCUQkYz
 lEHA==
X-Gm-Message-State: AOAM532UBqPZugenlRytPn/Om9H9l9DPAiTI7mvODoY/Th9ZYYFUKqLY
 UH9MHbgn1LSOzYbnYi3qdHE=
X-Google-Smtp-Source: ABdhPJzIX29mG0nBBXjJhh6HOoKolfXa9ZzaIKXh6vX27Y/XcJEbSCZ+4RoQjZEFvxt0t9iHaa/sgg==
X-Received: by 2002:a2e:7119:: with SMTP id m25mr2324840ljc.231.1619174039271; 
 Fri, 23 Apr 2021 03:33:59 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id v5sm514014lfp.298.2021.04.23.03.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 03:33:58 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Fri, 23 Apr 2021 03:33:30 -0700
Message-Id: <20210423103330.29008-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [COMMITTED] opcodes: xtensa: improve literal output
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

Output literals as 4-byte words, not as separate bytes.

2021-04-23  Max Filippov  <jcmvbkbc@gmail.com>
opcodes/
	* xtensa-dis.c (print_insn_xtensa): Set info->bytes_per_chunk
	to 4 for literal disassembly.
---
 opcodes/xtensa-dis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/opcodes/xtensa-dis.c b/opcodes/xtensa-dis.c
index 64c9a4ed4e05..e38fc39f4e7e 100644
--- a/opcodes/xtensa-dis.c
+++ b/opcodes/xtensa-dis.c
@@ -381,6 +381,7 @@ print_insn_xtensa (bfd_vma memaddr, struct disassemble_info *info)
       if (insn_block && (insn_block->flags & XTENSA_PROP_LITERAL)
 	  && (memaddr & 3) == 0 && bytes_fetched >= 4)
 	{
+	  info->bytes_per_chunk = 4;
 	  return 4;
 	}
       else
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
