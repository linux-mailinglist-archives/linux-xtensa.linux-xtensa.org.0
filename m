Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 4804CE5826
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:10 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8DAFE42EB;
	Sat, 26 Oct 2019 02:43:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 9BE9857E6
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:19 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f5so5118991ljg.8
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m/KddLqJN3ojEjLO4QxlpaV5/QWuRMSvQXj9259AJFY=;
 b=uDpduO5uDdYzwloWfPWmlQcntURbqHNhheGyErlJT5nQmpRa8DuglyLNZ5qEa2i3Em
 Lks9DdlGTt6CoiipyJShMkhHxO2xQUPMX/qteTafezf1baB6gtgLBrwFVncj/ALI+6+a
 JJR7Z5yPr4ro6UFEnt6g8QTrE5EZ8wkQIHW0g074DpQg6BTtx5qIze1R7otzig+5guAv
 nnkK4EWf9Ex17bGTUPmLwhCg9LzPt2w/ACuYco0OowvLycM3hcHeQYs6+VPhpZHsiTNt
 nCMCHswSxCnDO5vh0edNzu0rHPoybgNnohxdcGJiYnABHNLa8wfy3HjiuxeeEl4KnY3M
 rQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m/KddLqJN3ojEjLO4QxlpaV5/QWuRMSvQXj9259AJFY=;
 b=tTdShqvPXvB4JAeW7qlz5id/rV6MTz2px0W6WdFXQ0JwjRp2qms+PrXnRRycUKffbs
 zkL98gxP3cmHc8BOCMPwOeTsZn+gnOYGpf8J1TDtnaPs/rTdnVnVOKFA2h0lz9YuiScT
 h42PkdnzhoeTIzkfuOxWYU4QsoyIe3CV/XZF39PjfDCCrvGKz4pnRV4esAE3SBgMH4Y4
 soW5vFC57ZS0S1luhAQndHdnBBeSvZDY+U89CdZJv8PHrnwENvVrIR8ORuEkb0CP9tlO
 FOGwtySFCJbRPdIezH4Mtn18hL0JKAyDJYtwjb0JbQiqGbRv74F46M6DidKRHSzfj7/5
 gqfg==
X-Gm-Message-State: APjAAAVJTKPd83vupsWHucGBhNqfz7h/vFhoUHVmvFjvNKzshvlWVAIQ
 VOVAlh4eyKKwIuvifsPHIIE7UNu9At0=
X-Google-Smtp-Source: APXvYqy/vgKl2TdZ9rgBKW5uNv+OqHl2O/xqpZAMYIFV5jcBlO9z52psVNNsjHdfWd66JSVLsrj2Wg==
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr4462075lji.66.1572058263755; 
 Fri, 25 Oct 2019 19:51:03 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:51:03 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:29 -0700
Message-Id: <20191026025033.17797-5-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026025033.17797-1-jcmvbkbc@gmail.com>
References: <20191026025033.17797-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 4/8] xtensa: use "m" constraint instead of
	"a" in bitops.h assembly
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

Use "m" constraint instead of "r" for the address, as "m" allows
compiler to access adjacent locations using base + offset, while "r"
requires updating the base register every time.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/bitops.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/xtensa/include/asm/bitops.h b/arch/xtensa/include/asm/bitops.h
index 5a35d026c1c3..3f71d364ba90 100644
--- a/arch/xtensa/include/asm/bitops.h
+++ b/arch/xtensa/include/asm/bitops.h
@@ -150,13 +150,14 @@ static inline void op##_bit(unsigned int bit, volatile unsigned long *p)\
 	p += bit >> 5;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %[value], %[addr], 0\n"		\
+			"1:     l32i    %[value], %[mem]\n"		\
 			"       wsr     %[value], scompare1\n"		\
 			"      "insn"   %[tmp], %[value], %[mask]\n"	\
-			"       s32c1i  %[tmp], %[addr], 0\n"		\
+			"       s32c1i  %[tmp], %[mem]\n"		\
 			"       bne     %[tmp], %[value], 1b\n"		\
-			: [tmp] "=&a" (tmp), [value] "=&a" (value)	\
-			: [mask] "a" (inv mask), [addr] "a" (p)		\
+			: [tmp] "=&a" (tmp), [value] "=&a" (value),	\
+			  [mem] "+m" (*p)				\
+			: [mask] "a" (inv mask)				\
 			: "memory");					\
 }
 
@@ -170,13 +171,14 @@ test_and_##op##_bit(unsigned int bit, volatile unsigned long *p)	\
 	p += bit >> 5;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %[value], %[addr], 0\n"		\
+			"1:     l32i    %[value], %[mem]\n"		\
 			"       wsr     %[value], scompare1\n"		\
 			"      "insn"   %[tmp], %[value], %[mask]\n"	\
-			"       s32c1i  %[tmp], %[addr], 0\n"		\
+			"       s32c1i  %[tmp], %[mem]\n"		\
 			"       bne     %[tmp], %[value], 1b\n"		\
-			: [tmp] "=&a" (tmp), [value] "=&a" (value)	\
-			: [mask] "a" (inv mask), [addr] "a" (p)		\
+			: [tmp] "=&a" (tmp), [value] "=&a" (value),	\
+			  [mem] "+m" (*p)				\
+			: [mask] "a" (inv mask)				\
 			: "memory");					\
 									\
 	return tmp & mask;						\
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
