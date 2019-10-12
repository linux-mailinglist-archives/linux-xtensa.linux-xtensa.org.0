Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D97FBD4B65
	for <lists+linux-xtensa@lfdr.de>; Sat, 12 Oct 2019 02:37:33 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id A100364E8;
	Sat, 12 Oct 2019 00:30:15 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 23FF664E6
 for <linux-xtensa@linux-xtensa.org>; Sat, 12 Oct 2019 00:30:15 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 7so11436008ljw.7
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 17:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kjWi0GH8KhuY/mSwjF/Yf4/A/3SkcDswuz7RL6JGBfI=;
 b=rh4nxRsKkMkiwnIctrOGT5SbHJrYngN5eKB5fsnIHEReNl9P+A3GddlSrOmeuFKJ61
 CvQlE5p2RXKXy+N42l7kEI/mV0tUMy2dT7X9LzbjR7FDw2WVjG5qYcD6i2so+H92Jmrv
 mKf1CTJBbkNIQMYf8mDPNSc6wkxZZVn8556hg7QOIGZZQ04uR8pPqVOskjnlTPALkrCf
 RwzuVQxreg+3fSSdRfgCspVcEmxVt4Ay2tuzSdrC+BKwcNZ4uJpEKl0CEM29mCAyg/ZE
 zEXreg1qwL1m2LD8Q6ZB86KwYJZ7QvE4OS7HsX2G8Yx55CvsQvNrFDmQJbxZNnoslAUF
 C5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kjWi0GH8KhuY/mSwjF/Yf4/A/3SkcDswuz7RL6JGBfI=;
 b=Bqi2DuK3rM4oP1fPBoDFhK7fLgShDbVPw6Egs342bv7+x7SwA3Z6eN9iLDiCxVaH5l
 Up1NBjKKsYbwShho46EK+lNh6Iy4kDjAojt+lLbcx0CWcGokpvzTTeDvEtf1qiuAicDt
 7nthMFllUUXrlI+55F52TM8/M6hcnhBZVzrkk5oBWOAJQCp9o7axjuXRM7IttlMl3sFF
 OX+clMdOQMD2akFgLqagoIciYT9qaqSj6Q8dndw3Ar1IQZ0f6ajl7JZrNGTL7QO6WTOv
 ns6m5voIf3Rb+YjP4J9961FS1qK6Y5Coax/M8GuXnYw8IzRpojPnUEs+Zie4fa79uct1
 iTlA==
X-Gm-Message-State: APjAAAX6fvyn5dauFGuFpfKIvUnwtxh4Ad81cph+6VAJIDCOd3m5O/h3
 vyLyCXmkWyhFeznNsrzHXW86UlWmlew=
X-Google-Smtp-Source: APXvYqw6fcCV0PZreTMFX3gLNfVBk9VZ2rni/sqhP0+1ifefTyR1iykvxk+3suosh4xnI6Ft+8OEeA==
X-Received: by 2002:a2e:5354:: with SMTP id t20mr10842119ljd.227.1570840651571; 
 Fri, 11 Oct 2019 17:37:31 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id f22sm2346620lfa.41.2019.10.11.17.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 17:37:30 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 11 Oct 2019 17:37:06 -0700
Message-Id: <20191012003708.22182-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191012003708.22182-1-jcmvbkbc@gmail.com>
References: <20191012003708.22182-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 2/4] xtensa: clean up assembly arguments
	in uaccess macros
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

Numeric assembly arguments are hard to understand and assembly code that
uses them is hard to modify. Use named arguments in __check_align_*,
__get_user_asm and __put_user_asm. Modify macro parameter names so that
they don't affect argument names.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 42 +++++++++++++++----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index f568c00392ec..aca510707189 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -132,14 +132,14 @@ do {									\
 #define __check_align_1  ""
 
 #define __check_align_2				\
-	"   _bbci.l %3,  0, 1f		\n"	\
-	"   movi    %0, %4		\n"	\
+	"   _bbci.l %[addr], 0, 1f	\n"	\
+	"   movi    %[err], %[efault]	\n"	\
 	"   _j      2f			\n"
 
 #define __check_align_4				\
-	"   _bbsi.l %3,  0, 0f		\n"	\
-	"   _bbci.l %3,  1, 1f		\n"	\
-	"0: movi    %0, %4		\n"	\
+	"   _bbsi.l %[addr], 0, 0f	\n"	\
+	"   _bbci.l %[addr], 1, 1f	\n"	\
+	"0: movi    %[err], %[efault]	\n"	\
 	"   _j      2f			\n"
 
 
@@ -151,24 +151,24 @@ do {									\
  * WARNING: If you modify this macro at all, verify that the
  * __check_align_* macros still work.
  */
-#define __put_user_asm(x, addr, err, align, insn, cb)	\
+#define __put_user_asm(x_, addr_, err_, align, insn, cb)\
 __asm__ __volatile__(					\
 	__check_align_##align				\
-	"1: "insn"  %2, %3, 0		\n"		\
+	"1: "insn"  %[x], %[addr], 0	\n"		\
 	"2:				\n"		\
 	"   .section  .fixup,\"ax\"	\n"		\
 	"   .align 4			\n"		\
 	"   .literal_position		\n"		\
 	"5:				\n"		\
-	"   movi   %1, 2b		\n"		\
-	"   movi   %0, %4		\n"		\
-	"   jx     %1			\n"		\
+	"   movi   %[tmp], 2b		\n"		\
+	"   movi   %[err], %[efault]	\n"		\
+	"   jx     %[tmp]		\n"		\
 	"   .previous			\n"		\
 	"   .section  __ex_table,\"a\"	\n"		\
 	"   .long	1b, 5b		\n"		\
 	"   .previous"					\
-	:"=r" (err), "=r" (cb)				\
-	:"r" ((int)(x)), "r" (addr), "i" (-EFAULT), "0" (err))
+	:[err] "=r"(err_), [tmp] "=r"(cb)		\
+	:[x] "r"(x_), [addr] "r"(addr_), [efault] "i"(-EFAULT))
 
 #define __get_user_nocheck(x, ptr, size)			\
 ({								\
@@ -217,25 +217,25 @@ do {									\
  * WARNING: If you modify this macro at all, verify that the
  * __check_align_* macros still work.
  */
-#define __get_user_asm(x, addr, err, align, insn, cb) \
-__asm__ __volatile__(			\
+#define __get_user_asm(x_, addr_, err_, align, insn, cb) \
+__asm__ __volatile__(				\
 	__check_align_##align			\
-	"1: "insn"  %2, %3, 0		\n"	\
+	"1: "insn"  %[x], %[addr], 0	\n"	\
 	"2:				\n"	\
 	"   .section  .fixup,\"ax\"	\n"	\
 	"   .align 4			\n"	\
 	"   .literal_position		\n"	\
 	"5:				\n"	\
-	"   movi   %1, 2b		\n"	\
-	"   movi   %2, 0		\n"	\
-	"   movi   %0, %4		\n"	\
-	"   jx     %1			\n"	\
+	"   movi   %[tmp], 2b		\n"	\
+	"   movi   %[x], 0		\n"	\
+	"   movi   %[err], %[efault]	\n"	\
+	"   jx     %[tmp]		\n"	\
 	"   .previous			\n"	\
 	"   .section  __ex_table,\"a\"	\n"	\
 	"   .long	1b, 5b		\n"	\
 	"   .previous"				\
-	:"=r" (err), "=r" (cb), "=r" (x)	\
-	:"r" (addr), "i" (-EFAULT), "0" (err))
+	:[err] "=r"(err_), [tmp] "=r"(cb), [x] "=r"(x_)\
+	:[addr] "r"(addr_), [efault] "i"(-EFAULT))
 
 
 /*
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
