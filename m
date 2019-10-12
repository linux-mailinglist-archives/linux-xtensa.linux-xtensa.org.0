Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3065FD4B48
	for <lists+linux-xtensa@lfdr.de>; Sat, 12 Oct 2019 02:07:39 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 131FD64BF;
	Sat, 12 Oct 2019 00:00:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by linux-xtensa.org (Postfix) with ESMTPS id D6A1764BC
 for <linux-xtensa@linux-xtensa.org>; Sat, 12 Oct 2019 00:00:19 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id w6so8192768lfl.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 17:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nhYT88TgT/VRwvcGZf4aIWkeFGM34JRMlU0vJpd9odg=;
 b=L9Osl97jEz1Gg7GX9IqpMD4GeCF9Qqpe794rXv8//Gr1gXpcBjO+WfybpUDNIiBZ64
 1XLOLYaMQQfqX8pPze+LJE5B6Imov/FGtFi5poRwhmBy/R5QcoW0Nk6vPathTzJQx9PD
 f5WDQFLfvKnCw3R0QFiYIW1YR6c3A/L3kNIooqOS99FPlkHshsyn6c4O9fIJbA1Mv7b8
 wTUJ26wKzqVLdlidXDPR5ZBMDe8FjGmLmrHLgI4idxzyNYitgLz5QR2O1CzpiYSZ+r+1
 sDQJQq3gBdtO6wg4GsZWh2bOQoxOZq1v6aWk1LXtkkbPiGu7/rhOb5cSVSE3rAPkgLpl
 V9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nhYT88TgT/VRwvcGZf4aIWkeFGM34JRMlU0vJpd9odg=;
 b=mruyWt44D+MZMNehhRCc3U6FFbwhUrj7svow2N+eETBkdlQlqUZzFjEeKSuDbYx+hK
 i31OOPv/ZoKSOAjI46PiVRBPjGhs6YUX2K0USX1rJrmBuGVeftqWb7Ijc4uJoG0ZsVKD
 RgWQgJ0YXBYRZHraAGBo4zzlWRIjkFRuOxcxxqEGCtyT5dqbj+RBNuH3ravRfEZ7hF9j
 SH6a4dEvBJougWHxc8qPj1wixJvrK8PmmmppW/mZ3op9GryHq99/O1hY77ndelxS1nbu
 d/MdJQlXxOJp57J95lnOppx0e/8KcxiLAletR3jlYLlyhy6E6RnoN6NMkkTO1EZb8Xwb
 l5OQ==
X-Gm-Message-State: APjAAAUapEVOKAQesQ94PlFSSaFvF6H4U8NVSHbqVYB/XGvYGUiuNMEp
 JANqPo6XW819UY+6f+VPvqiCKPS3pQ0=
X-Google-Smtp-Source: APXvYqwLoZZbFjUbSruh+7FFb8QBV47QEWc7w3TBQBoNH9GIBzCZF32hJAIeHLW/RNy9RpND63cXIw==
X-Received: by 2002:ac2:46ed:: with SMTP id q13mr7575786lfo.187.1570838856189; 
 Fri, 11 Oct 2019 17:07:36 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x17sm2215705lji.62.2019.10.11.17.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 17:07:35 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 11 Oct 2019 17:07:11 -0700
Message-Id: <20191012000711.3775-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191012000711.3775-1-jcmvbkbc@gmail.com>
References: <20191012000711.3775-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 3/3] xtensa: fix type conversion in
	__get_user_[no]check
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

__get_user_[no]check uses temporary buffer of type long to store result
of __get_user_size and do sign extension on it when necessary. This
doesn't work correctly for 64-bit data. Fix it by moving temporary
buffer/sign extension logic to __get_user_asm.
Don't do assignment of __get_user_bad result to (x) as it may not always
be integer-compatible now and issue warning even when it's going to be
optimized. Instead do (x) = 0; and call __get_user_bad separately.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 54 ++++++++++++++++---------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index aca510707189..da62a1017cc7 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -172,19 +172,17 @@ __asm__ __volatile__(					\
 
 #define __get_user_nocheck(x, ptr, size)			\
 ({								\
-	long __gu_err, __gu_val;				\
-	__get_user_size(__gu_val, (ptr), (size), __gu_err);	\
-	(x) = (__force __typeof__(*(ptr)))__gu_val;		\
+	long __gu_err;						\
+	__get_user_size((x), (ptr), (size), __gu_err);		\
 	__gu_err;						\
 })
 
 #define __get_user_check(x, ptr, size)					\
 ({									\
-	long __gu_err = -EFAULT, __gu_val = 0;				\
+	long __gu_err = -EFAULT;					\
 	const __typeof__(*(ptr)) *__gu_addr = (ptr);			\
-	if (access_ok(__gu_addr, size))			\
-		__get_user_size(__gu_val, __gu_addr, (size), __gu_err);	\
-	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
+	if (access_ok(__gu_addr, size))					\
+		__get_user_size((x), __gu_addr, (size), __gu_err);	\
 	__gu_err;							\
 })
 
@@ -208,7 +206,7 @@ do {									\
 		}							\
 		break;							\
 	}								\
-	default: (x) = __get_user_bad();				\
+	default: (x) = 0; __get_user_bad();				\
 	}								\
 } while (0)
 
@@ -218,24 +216,28 @@ do {									\
  * __check_align_* macros still work.
  */
 #define __get_user_asm(x_, addr_, err_, align, insn, cb) \
-__asm__ __volatile__(				\
-	__check_align_##align			\
-	"1: "insn"  %[x], %[addr], 0	\n"	\
-	"2:				\n"	\
-	"   .section  .fixup,\"ax\"	\n"	\
-	"   .align 4			\n"	\
-	"   .literal_position		\n"	\
-	"5:				\n"	\
-	"   movi   %[tmp], 2b		\n"	\
-	"   movi   %[x], 0		\n"	\
-	"   movi   %[err], %[efault]	\n"	\
-	"   jx     %[tmp]		\n"	\
-	"   .previous			\n"	\
-	"   .section  __ex_table,\"a\"	\n"	\
-	"   .long	1b, 5b		\n"	\
-	"   .previous"				\
-	:[err] "=r"(err_), [tmp] "=r"(cb), [x] "=r"(x_)\
-	:[addr] "r"(addr_), [efault] "i"(-EFAULT))
+do {							\
+	u32 __x;					\
+	__asm__ __volatile__(				\
+		__check_align_##align			\
+		"1: "insn"  %[x], %[addr], 0	\n"	\
+		"2:				\n"	\
+		"   .section  .fixup,\"ax\"	\n"	\
+		"   .align 4			\n"	\
+		"   .literal_position		\n"	\
+		"5:				\n"	\
+		"   movi   %[tmp], 2b		\n"	\
+		"   movi   %[x], 0		\n"	\
+		"   movi   %[err], %[efault]	\n"	\
+		"   jx     %[tmp]		\n"	\
+		"   .previous			\n"	\
+		"   .section  __ex_table,\"a\"	\n"	\
+		"   .long	1b, 5b		\n"	\
+		"   .previous"				\
+		:[err] "=r"(err_), [tmp] "=r"(cb), [x] "=r"(__x) \
+		:[addr] "r"(addr_), [efault] "i"(-EFAULT)); \
+	(x_) = (__force __typeof__(*(addr_)))__x;	\
+} while (0)
 
 
 /*
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
