Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 71B4D1570E
	for <lists+linux-xtensa@lfdr.de>; Tue,  7 May 2019 02:44:35 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2D493654E;
	Tue,  7 May 2019 00:42:52 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id E5BB3581A
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 May 2019 00:42:50 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k8so12677550lja.8
 for <linux-xtensa@linux-xtensa.org>; Mon, 06 May 2019 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EnYJIGSZveX2M/4+x5Yrqpn5Y32Ds80WmwzG3juHg0w=;
 b=VrsxyVLUAIW2o8li7FSBseReop5BYci4xp6+RK2dijM0XW7EXqm4T+AtLrClhi6c6A
 ZcVY7C6oY9FywZxZxLfDBQ1a7q2HX3GGgse2g8SuCVX4oCu7QOmOmCxNpA4a+8ln6VHP
 zQr9qRwnN/XE5Wvim0r9PQeeDYsoorPMsXEr9y/010LQzY/M8Rf9GT/efXEZBjyNgOl6
 FOlqFlgO4qa7ML4AaNr7dKwUGgVJioj9a/pDDySqr1+gkqPj37gLZegoBN7+K6tr/OYu
 ceRrWNlesrU7xXpROhPDC/nCdpim20j1/BoMGhJmjNANfhXNZRt0HMBZgOv2Etzk+WWX
 VAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EnYJIGSZveX2M/4+x5Yrqpn5Y32Ds80WmwzG3juHg0w=;
 b=oOERlrnLopVahratRDDUsj+FWfWNTKFtRJnvXnmWrqj9oFT/zTP5FyghO5W6kiHG9C
 Xluf84WIykuHDZb2yNqEMWps0cN47YKv6iN7Ff21F5BAlHcaq2i67sdBcaoigrd54INm
 wsXYaVyfIujndF68jn/Az87OEe6u9+JNap+SVwTzBpxclzd/Shsg/Z7XfLpU8dAKIaz9
 ++7eYG43l+mcDiOP1/gZhg4nFL/azvsed+vdv+DaqciQvVboBdfOIzr9b/mAlXSpdZu4
 hegAmXaQfAoEzsyXv9vyekk9yLmwEMf6hnaG6/zWuu+GJEGR48NVEZ+Vsli0X3Sn/KEe
 raJg==
X-Gm-Message-State: APjAAAWLlUccM/f9e9D+xVwlFEjog9bRIywgxxLHj2RXgoFTUhw7zw/Z
 1pfLlJqgGFi2mGle3rekUaZqXUcD
X-Google-Smtp-Source: APXvYqzpl38DkeAPy7EJypRUB2ies3hmp1pZ5JR72gcnjODMGwmsWzR06anORgOyfy41g88+ekRGfg==
X-Received: by 2002:a2e:8216:: with SMTP id w22mr8706503ljg.109.1557189872498; 
 Mon, 06 May 2019 17:44:32 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm850003lfp.55.2019.05.06.17.44.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 17:44:31 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  6 May 2019 17:44:05 -0700
Message-Id: <20190507004407.6756-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507004407.6756-1-jcmvbkbc@gmail.com>
References: <20190507004407.6756-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 3/5] xtensa: clean up inline assembly in
	futex.h
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

Replace numeric inline assembly parameters with named parameters.
Drop unused parameters from the futex_atomic_cmpxchg_inatomic.
Use new temporary variable to hold target address in the fixup code in
futex_atomic_cmpxchg_inatomic.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/futex.h | 64 ++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/arch/xtensa/include/asm/futex.h b/arch/xtensa/include/asm/futex.h
index 0fd58b7521aa..558bd7d3e171 100644
--- a/arch/xtensa/include/asm/futex.h
+++ b/arch/xtensa/include/asm/futex.h
@@ -19,27 +19,28 @@
 #include <linux/uaccess.h>
 #include <linux/errno.h>
 
-#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg) \
+#define __futex_atomic_op(insn, ret, old, uaddr, arg)	\
 	__asm__ __volatile(				\
-	"1:	l32i	%0, %2, 0\n"			\
+	"1:	l32i	%[oldval], %[addr], 0\n"	\
 		insn "\n"				\
-	"	wsr	%0, scompare1\n"		\
-	"2:	s32c1i	%1, %2, 0\n"			\
-	"	bne	%1, %0, 1b\n"			\
-	"	movi	%1, 0\n"			\
+	"	wsr	%[oldval], scompare1\n"		\
+	"2:	s32c1i	%[newval], %[addr], 0\n"	\
+	"	bne	%[newval], %[oldval], 1b\n"	\
+	"	movi	%[newval], 0\n"			\
 	"3:\n"						\
 	"	.section .fixup,\"ax\"\n"		\
 	"	.align 4\n"				\
 	"	.literal_position\n"			\
-	"5:	movi	%0, 3b\n"			\
-	"	movi	%1, %3\n"			\
-	"	jx	%0\n"				\
+	"5:	movi	%[oldval], 3b\n"		\
+	"	movi	%[newval], %[fault]\n"		\
+	"	jx	%[oldval]\n"			\
 	"	.previous\n"				\
 	"	.section __ex_table,\"a\"\n"		\
-	"	.long 1b,5b,2b,5b\n"			\
+	"	.long 1b, 5b, 2b, 5b\n"			\
 	"	.previous\n"				\
-	: "=&r" (oldval), "=&r" (ret)			\
-	: "r" (uaddr), "I" (-EFAULT), "r" (oparg)	\
+	: [oldval] "=&r" (old), [newval] "=&r" (ret)	\
+	: [addr] "r" (uaddr), [oparg] "r" (arg),	\
+	  [fault] "I" (-EFAULT)				\
 	: "memory")
 
 static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
@@ -55,23 +56,24 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 
 	switch (op) {
 	case FUTEX_OP_SET:
-		__futex_atomic_op("mov %1, %4", ret, oldval, uaddr, oparg);
+		__futex_atomic_op("mov %[newval], %[oparg]",
+				  ret, oldval, uaddr, oparg);
 		break;
 	case FUTEX_OP_ADD:
-		__futex_atomic_op("add %1, %0, %4", ret, oldval, uaddr,
-				oparg);
+		__futex_atomic_op("add %[newval], %[oldval], %[oparg]",
+				  ret, oldval, uaddr, oparg);
 		break;
 	case FUTEX_OP_OR:
-		__futex_atomic_op("or %1, %0, %4", ret, oldval, uaddr,
-				oparg);
+		__futex_atomic_op("or %[newval], %[oldval], %[oparg]",
+				  ret, oldval, uaddr, oparg);
 		break;
 	case FUTEX_OP_ANDN:
-		__futex_atomic_op("and %1, %0, %4", ret, oldval, uaddr,
-				~oparg);
+		__futex_atomic_op("and %[newval], %[oldval], %[oparg]",
+				  ret, oldval, uaddr, ~oparg);
 		break;
 	case FUTEX_OP_XOR:
-		__futex_atomic_op("xor %1, %0, %4", ret, oldval, uaddr,
-				oparg);
+		__futex_atomic_op("xor %[newval], %[oldval], %[oparg]",
+				  ret, oldval, uaddr, oparg);
 		break;
 	default:
 		ret = -ENOSYS;
@@ -89,6 +91,7 @@ static inline int
 futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 			      u32 oldval, u32 newval)
 {
+	unsigned long tmp;
 	int ret = 0;
 
 	if (!access_ok(uaddr, sizeof(u32)))
@@ -100,22 +103,23 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
 	__asm__ __volatile__ (
 	"	# futex_atomic_cmpxchg_inatomic\n"
-	"	wsr	%5, scompare1\n"
-	"1:	s32c1i	%1, %4, 0\n"
-	"	s32i	%1, %6, 0\n"
+	"	wsr	%[oldval], scompare1\n"
+	"1:	s32c1i	%[newval], %[addr], 0\n"
+	"	s32i	%[newval], %[uval], 0\n"
 	"2:\n"
 	"	.section .fixup,\"ax\"\n"
 	"	.align 4\n"
 	"	.literal_position\n"
-	"4:	movi	%1, 2b\n"
-	"	movi	%0, %7\n"
-	"	jx	%1\n"
+	"4:	movi	%[tmp], 2b\n"
+	"	movi	%[ret], %[fault]\n"
+	"	jx	%[tmp]\n"
 	"	.previous\n"
 	"	.section __ex_table,\"a\"\n"
-	"	.long 1b,4b\n"
+	"	.long 1b, 4b\n"
 	"	.previous\n"
-	: "+r" (ret), "+r" (newval), "+m" (*uaddr), "+m" (*uval)
-	: "r" (uaddr), "r" (oldval), "r" (uval), "I" (-EFAULT)
+	: [ret] "+r" (ret), [newval] "+r" (newval), [tmp] "=&r" (tmp)
+	: [addr] "r" (uaddr), [oldval] "r" (oldval), [uval] "r" (uval),
+	  [fault] "I" (-EFAULT)
 	: "memory");
 
 	return ret;
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
