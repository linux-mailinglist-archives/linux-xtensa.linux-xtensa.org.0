Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA81D6B35
	for <lists+linux-xtensa@lfdr.de>; Mon, 14 Oct 2019 23:25:48 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 800A1643C;
	Mon, 14 Oct 2019 21:18:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id CF58C5822
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 21:18:22 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id f5so18034471ljg.8
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 14:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+lnbWcSkcDwPIsFytYHP4Lin40lipRFRetqvAeDiCM=;
 b=scqM8yUc9u0hD5FGyP5x5ZQyMVArfUYBT1caCY/s8upxKS+OADZendXPcbkjtgDwRX
 fBFDle84CvSkmCmqz15j5h0ZqbWYwMaPeIwxyszbynwibdmhrGPkdSgWErQQ4/9uycRh
 g3iGC1AVqaoZ858izFhwlF3rLg9NLYZSQcg7s2BpXH8QlGXUFwMfx1iJIZVYKe9ouONH
 PIh9UCVG8MFqKHJFE+QIiBR7LdCC38n5zBoNrPq2CGVxFZ/Remz1ddPUDyfp0aRsB7dD
 uETEqRTsC6MpSm33eY7rHVMdCKs4xnOsW3J9bx77uV/bUA+MYXW9x6WO99WJCHwEzefc
 a5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+lnbWcSkcDwPIsFytYHP4Lin40lipRFRetqvAeDiCM=;
 b=qCdXf4yMYQidZCD1d4J/VbYctpxZz4RnC8Qsn3UThZHDLFpuuGw5QZU9DvZuYMG4r2
 yJtb/PV1p4oZBNMBzKfvkyPqo7kTMB6WADcvlbKKrzYHtpgzNpifq43DJ8xz9cAdLHVa
 OTkekkM6qNf2VWhXmpK8fYNxikTXvmeMFiUGH0qZuCNQ0sqCXI++NBL8aelbP+ZxQzTL
 U2tWveHe9Bt7sbFtqv5aA/PeoRpFZq7U0jHeZkbDEx1lGws7gHwhp89d+Nk1qvAxmW02
 8tG5IdV95FCeAHsgRV4TAa/VzIHG9aLuxZWqzATHbcHL59zJo0rfuC5MaYomm42iKZPt
 jDMw==
X-Gm-Message-State: APjAAAWF0F2Zi5AQYbPMUOHRL3VyOboz9aOp2zeK1G56dawV4mKcbrrZ
 q4YxDQ/4hui4ZIWz2n3bEZ2fiW0o48Y=
X-Google-Smtp-Source: APXvYqyrzFu8ETl5LAaaK0h64UqKgnHlFkkwLUVOG5U6g1GetDVSV9F+30JsVszl8VEwx7hu2cZS/A==
X-Received: by 2002:a05:651c:8b:: with SMTP id
 11mr20114009ljq.100.1571088344747; 
 Mon, 14 Oct 2019 14:25:44 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id m15sm4429434ljh.50.2019.10.14.14.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 14:25:44 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Mon, 14 Oct 2019 14:25:13 -0700
Message-Id: <20191014212513.17661-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014212513.17661-1-jcmvbkbc@gmail.com>
References: <20191014212513.17661-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v3 3/3] xtensa: fix type conversion in
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

Zero initialize __x in __get_user_asm and use '+' constraint for its
assembly argument, so that its value is preserved in error cases. This
may add at most 1 cycle to the fast path, but saves an instruction and
two padding bytes in the fixup section for each use of this macro and
works for both misaligned store and store exception.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2->v3:
- rearrange result zero-initialization for error paths in __get_user_asm

Changes v1->v2:
- initialize result when access_ok check fails in __get_user_check

 arch/xtensa/include/asm/uaccess.h | 55 ++++++++++++++++---------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index da4d35445063..3f80386f1883 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -172,19 +172,19 @@ __asm__ __volatile__(					\
 
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
+	else								\
+		(x) = 0;						\
 	__gu_err;							\
 })
 
@@ -208,7 +208,7 @@ do {									\
 		}							\
 		break;							\
 	}								\
-	default: (x) = __get_user_bad();				\
+	default: (x) = 0; __get_user_bad();				\
 	}								\
 } while (0)
 
@@ -218,24 +218,27 @@ do {									\
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
-	:[err] "+r"(err_), [tmp] "=r"(cb), [x] "=r"(x_)\
-	:[addr] "r"(addr_), [efault] "i"(-EFAULT))
+do {							\
+	u32 __x = 0;					\
+	__asm__ __volatile__(				\
+		__check_align_##align			\
+		"1: "insn"  %[x], %[addr], 0	\n"	\
+		"2:				\n"	\
+		"   .section  .fixup,\"ax\"	\n"	\
+		"   .align 4			\n"	\
+		"   .literal_position		\n"	\
+		"5:				\n"	\
+		"   movi   %[tmp], 2b		\n"	\
+		"   movi   %[err], %[efault]	\n"	\
+		"   jx     %[tmp]		\n"	\
+		"   .previous			\n"	\
+		"   .section  __ex_table,\"a\"	\n"	\
+		"   .long	1b, 5b		\n"	\
+		"   .previous"				\
+		:[err] "+r"(err_), [tmp] "=r"(cb), [x] "+r"(__x) \
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
