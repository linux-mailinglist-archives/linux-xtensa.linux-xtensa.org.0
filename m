Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C0FDED4B47
	for <lists+linux-xtensa@lfdr.de>; Sat, 12 Oct 2019 02:07:36 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9FF6564D4;
	Sat, 12 Oct 2019 00:00:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 4986F64BC
 for <linux-xtensa@linux-xtensa.org>; Sat, 12 Oct 2019 00:00:17 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y127so8196413lfc.0
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kjWi0GH8KhuY/mSwjF/Yf4/A/3SkcDswuz7RL6JGBfI=;
 b=URInePOrEmnoQ3aSXGuMmeQ6pfLDeRUtLk+sbV+1CVy8AiVBIX51IPm+uKGAop7u2v
 7cGoTbB4p0uzqFdbddu+7sAUhmfegCkfpTU+rZbmzMxnVRl8rA8/PEbD6DSeYcRZGIzx
 rSlEsbxEGKK6UilrLfKhbmLL0aU650pV8O3NG58H37Q07UPIlQAcgODfF/3ji4BPO1Jg
 9xDsiN6NT8A16rAfVexaiuRj4DswDn+/BtNyPloh42kSHKhShngq32QRFSaIcaQaQWgS
 w0ngF/mqkTWPhyS3WQ+RRkbz4KqZ9kk69zVazjK9yKhYl2LZ+HEMVwcbQfFepw5fkbfN
 JAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kjWi0GH8KhuY/mSwjF/Yf4/A/3SkcDswuz7RL6JGBfI=;
 b=QvN1+TEciEb0uYQL+ZXZrs2xHx7Y1JybfIwpvLIlLEC2ZBPchLtRp6ikNJfEhRJqfn
 6cVx2kzLeUKwP7ISQB/jag/TLJ3MCcGgUoZkCQEbezeOt+EcNrOy4THmFTjbcl4WoAYn
 jy8+IqVFOXfmm2+jJ23EG9lgTKZt6KXVGaMIJxSCoNKBE0VHyINiTrclrjf/pZ5ofQbF
 4u0/dxQnW3EEaY5IiVbaNR+fe4Xjm2fAJQzW321+1cfPgxL8+d43nmApTdMGpaY5RKWM
 TdLtdvozGB6H3TzyhlwbXkWVxYJ0oFIIcWju1vGSINZqnR4GkenuYqYSHmj2o7a6EHTe
 09kQ==
X-Gm-Message-State: APjAAAU67ic6ADSkTepaYsVkbPaCfjAB8D3s9zgP4JiHoqKCaYCr9Ajv
 dKZ//5xrnSG22ol7y+Htu/+r4IypWqY=
X-Google-Smtp-Source: APXvYqy+5Q4/pGNPrYajeTrCijSnJ3nA1LhqZV1/pIMLaMHN59uReEs15y9MlElSV9aX3TZ6v3Oq9A==
X-Received: by 2002:a19:4bcf:: with SMTP id
 y198mr10078998lfa.168.1570838853636; 
 Fri, 11 Oct 2019 17:07:33 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x17sm2215705lji.62.2019.10.11.17.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 17:07:33 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 11 Oct 2019 17:07:10 -0700
Message-Id: <20191012000711.3775-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191012000711.3775-1-jcmvbkbc@gmail.com>
References: <20191012000711.3775-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/3] xtensa: clean up assembly arguments in
	uaccess macros
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
