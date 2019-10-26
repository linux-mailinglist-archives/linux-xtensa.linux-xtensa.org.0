Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 23EE3E5823
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:04 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6447A52BF;
	Sat, 26 Oct 2019 02:43:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 5670D52BA
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:13 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id c4so5100957lja.11
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BaSB7L5c7LphOSo+mXo9WLlCOK4ZKVfc5qh+IwAQld8=;
 b=jw+qV4U9BnDupi5levdL69xwo5Dss1gZTlrjAllQCCNmHNLmtvKJ+7eAYzn+VblC7f
 TX44P9YZsJN5dU6V8nA8wfBisjUeWw8u7G6YBjbHihXIDVLEtWcHCPWqYQCgDWlKqEED
 J0nHPGm57tZKuprSXzs4jqPWvkimuNwsktzfpk6mfNT9+wlFaUz1DI9o1BIGh3V1OBgo
 J+oUCUuUtNwxxvcgISxJ2RRM9uq+ioR/AcUr0TOVfyyitVY1JmwjKKtctqv1I+TgHQDf
 jbbwHrIUisvqT4OtVXcZ8IqBubipMGBYQWnvm9ge+KY6Lxi3kQm4O+wZ1ypjJdHKqk3M
 6lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaSB7L5c7LphOSo+mXo9WLlCOK4ZKVfc5qh+IwAQld8=;
 b=Kb5HvHGU/crUEoZaRJWrIleilOM1n2KbKkZu3fz691PezoqIjIHSpBAoHGw7fwmdd8
 rCCTpD2DZcuVf+xDcTITWbSBjChchCi7D/HtbiFHihzPZoF4HmcKisPNUW2OJl79HBBF
 xtmPJYxMK0M/IBNAcXc5+AT42GzqiBueOVNRbjmjLfhGzRGcGK40fe97EfI2Yb07R3QP
 ehtgeSjyhiN0qFfkw034KzAblhyDW8TtoygYx33YGR/InlPTJS7BMiZQS/DWeZI4FLkE
 PW3TY2m6bZx095+ohwcK/r6KQd6Ja0YSzFS/z0YA7YPo3ve7Ee5Id3zxX7woZRwQSVnw
 KK1Q==
X-Gm-Message-State: APjAAAVEmDwUaww5ABYZVeyAsaX9COM0xtYIe8usAp3ApyduqAPyZit8
 7CvFTFBjYdjI0vT2XuttA5XgW0Yc
X-Google-Smtp-Source: APXvYqwMoimZzHNWEH+lDYSQH7sHFBXJduFefc9dhf6JTWaMY7W38VqsoirlhoA6w0H6/gjcHSlCug==
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr4453213ljm.243.1572058257342; 
 Fri, 25 Oct 2019 19:50:57 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:50:56 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:26 -0700
Message-Id: <20191026025033.17797-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026025033.17797-1-jcmvbkbc@gmail.com>
References: <20191026025033.17797-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/8] xtensa: use "m" constraint instead of
	"a" in uaccess.h assembly
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
Use %[mem] * 0 + v to replace offset part of %[mem] expansion with v.
It is impossible to change address alignment through the offset part on
xtensa, so just ignore offset in alignment checks.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index 3f80386f1883..47b7702aaa40 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -132,13 +132,13 @@ do {									\
 #define __check_align_1  ""
 
 #define __check_align_2				\
-	"   _bbci.l %[addr], 0, 1f	\n"	\
+	"   _bbci.l %[mem] * 0, 1f	\n"	\
 	"   movi    %[err], %[efault]	\n"	\
 	"   _j      2f			\n"
 
 #define __check_align_4				\
-	"   _bbsi.l %[addr], 0, 0f	\n"	\
-	"   _bbci.l %[addr], 1, 1f	\n"	\
+	"   _bbsi.l %[mem] * 0, 0f	\n"	\
+	"   _bbci.l %[mem] * 0 + 1, 1f	\n"	\
 	"0: movi    %[err], %[efault]	\n"	\
 	"   _j      2f			\n"
 
@@ -154,7 +154,7 @@ do {									\
 #define __put_user_asm(x_, addr_, err_, align, insn, cb)\
 __asm__ __volatile__(					\
 	__check_align_##align				\
-	"1: "insn"  %[x], %[addr], 0	\n"		\
+	"1: "insn"  %[x], %[mem]	\n"		\
 	"2:				\n"		\
 	"   .section  .fixup,\"ax\"	\n"		\
 	"   .align 4			\n"		\
@@ -167,8 +167,8 @@ __asm__ __volatile__(					\
 	"   .section  __ex_table,\"a\"	\n"		\
 	"   .long	1b, 5b		\n"		\
 	"   .previous"					\
-	:[err] "+r"(err_), [tmp] "=r"(cb)		\
-	:[x] "r"(x_), [addr] "r"(addr_), [efault] "i"(-EFAULT))
+	:[err] "+r"(err_), [tmp] "=r"(cb), [mem] "=m"(*(addr_))		\
+	:[x] "r"(x_), [efault] "i"(-EFAULT))
 
 #define __get_user_nocheck(x, ptr, size)			\
 ({								\
@@ -222,7 +222,7 @@ do {							\
 	u32 __x = 0;					\
 	__asm__ __volatile__(				\
 		__check_align_##align			\
-		"1: "insn"  %[x], %[addr], 0	\n"	\
+		"1: "insn"  %[x], %[mem]	\n"	\
 		"2:				\n"	\
 		"   .section  .fixup,\"ax\"	\n"	\
 		"   .align 4			\n"	\
@@ -236,7 +236,7 @@ do {							\
 		"   .long	1b, 5b		\n"	\
 		"   .previous"				\
 		:[err] "+r"(err_), [tmp] "=r"(cb), [x] "+r"(__x) \
-		:[addr] "r"(addr_), [efault] "i"(-EFAULT)); \
+		:[mem] "m"(*(addr_)), [efault] "i"(-EFAULT)); \
 	(x_) = (__force __typeof__(*(addr_)))__x;	\
 } while (0)
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
