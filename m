Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 19E0CC2E7C
	for <lists+linux-xtensa@lfdr.de>; Tue,  1 Oct 2019 09:58:23 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 28175583D;
	Tue,  1 Oct 2019 07:51:27 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id CE54D25D3
 for <linux-xtensa@linux-xtensa.org>; Tue,  1 Oct 2019 07:51:25 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q11so9081971lfc.11
 for <linux-xtensa@linux-xtensa.org>; Tue, 01 Oct 2019 00:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p18OX2g38Sk3qCgt+3M9exfh0aZBsuiEJJd286cBdxE=;
 b=Ji2xoGeKE+TVQZJx7B9BH0x0nK46iTPpRwn1G5gCR8ow+SPqsaju8d0mLey2/u5f5d
 1qdZT9DhB8g6b+7QJTWHk+aRXZ2sDk7Qku0StM4ZNCpLHdAIGvhW1nZnPq+qaz9r/TkD
 jyisy1DzIsgpLwVcpa3Vmo8ozUpJo3F2LI6VgqWGoMqMss5fwU1RVG/dAHYucXS5dn9n
 0wdvT+hBqyWq5UcUls1T4js+C4iKoP5510FiiYq7L+Fj9Dt1uYJNQJ571BTcVefAxHgK
 yh0437d4QZ0E66340meJKluf954gnhYQu4gER5YuuVjrX4l2XCB+siTNqNmu7l4Q0IBv
 fSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p18OX2g38Sk3qCgt+3M9exfh0aZBsuiEJJd286cBdxE=;
 b=ZM4ykdKcrWxavpksNslMiEzkam5xMLFTqNGYvs3J273vXS4tqtVG/Z5fqlXdwJC8OF
 fdzb6jSvejNR60bcJhalrkeM2fnB1YLsDyw8wkdNEPmRRJBIJfpV7M1DtJC81VoI9c9R
 5D+pkUa7dWRXtWv/Z/sIB8D8ESatkiDx8/1Yj3kS/gmcEgmmqAZ6jPLl9YPPjUOwqXMK
 JLyQdc7dyk2jYWaG44oYK3YIYr94EPwf8v1NtYX9bPltG+H+5Slon9IsR6Uz1Urkdf69
 UTN4SCsFHLIx8eUgRm34PuVi7g7Rc+c6cjc3nyGXiSD5DNpJiAYzMI/h8iGJvc6GpeGJ
 rxLA==
X-Gm-Message-State: APjAAAV4AvXGD+kf3zva86hOqThvP96bBEdL0ikrY9YKDnYjr8eStq2y
 4fz32y8OiMt1xzQZbSR/w8sk58tutu0=
X-Google-Smtp-Source: APXvYqzvlZh10oO2zzPwwibMgS9el3fMQXSIrEuThDTRh+wpCcFYkdCQxqMZ5Lc96eJHdKpNc0FKVg==
X-Received: by 2002:ac2:515b:: with SMTP id q27mr14223798lfd.154.1569916699962; 
 Tue, 01 Oct 2019 00:58:19 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm3775562lfm.71.2019.10.01.00.58.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 00:58:19 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  1 Oct 2019 00:57:37 -0700
Message-Id: <20191001075739.32447-5-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191001075739.32447-1-jcmvbkbc@gmail.com>
References: <20191001075739.32447-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 4/6] xtensa: use correct symbol for the
	end of .rodata
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

Use correct symbol for the end of .rodata section when dumping virtual
memory layout. This fixes odd rodata size with XIP kernel.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index 79467c749416..2162b640d3de 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -193,8 +193,8 @@ void __init mem_init(void)
 		((max_low_pfn - min_low_pfn) * PAGE_SIZE) >> 20,
 		(unsigned long)_text, (unsigned long)_etext,
 		(unsigned long)(_etext - _text) >> 10,
-		(unsigned long)__start_rodata, (unsigned long)_sdata,
-		(unsigned long)(_sdata - __start_rodata) >> 10,
+		(unsigned long)__start_rodata, (unsigned long)__end_rodata,
+		(unsigned long)(__end_rodata - __start_rodata) >> 10,
 		(unsigned long)_sdata, (unsigned long)_edata,
 		(unsigned long)(_edata - _sdata) >> 10,
 		(unsigned long)__init_begin, (unsigned long)__init_end,
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
