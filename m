Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0251698F
	for <lists+linux-xtensa@lfdr.de>; Tue,  7 May 2019 19:48:39 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3B06D5887;
	Tue,  7 May 2019 17:46:54 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id E92F15840
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 May 2019 17:46:52 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u27so12229324lfg.10
 for <linux-xtensa@linux-xtensa.org>; Tue, 07 May 2019 10:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iSYM7w88r6DNPsf7r0BrgRlbU/suBvazvuHKx6bD+AE=;
 b=onecPNPh9pehiPHxOtrFTx3CCLQR/PCrn+ljmZQ582HzQZC5s7RHIS9ui0NMowkymW
 ZICM0fEKpcn7Ufi+zmp6ndmSkg0FH1BpsyyX/L0xA3kX0YU07hYiMJXgb/Ih6EWMG1nD
 Og6BAe9+cv5cC2PBYWBtKOqtk9NLqsUx6J0n9nhyoJ+yV9SSHzmNPauBHU4VL/TgXY1Z
 b1nFayWMZjNno19CNJd61hecYkKJXpZNp8VYRraSln4vxeXNM/gCdMeQBhH4R1yEjzJF
 NFN1IW4RhPp9/avsTiNUJ63kcLz1AHSNlAX8eY2imqAVLltS3sPvcAbPR0Tb1IIA++o1
 UU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iSYM7w88r6DNPsf7r0BrgRlbU/suBvazvuHKx6bD+AE=;
 b=hRIf2LsTn382T4iWbebnFqmWWeSjONBJIEyZAc2bWe1ITDxvexnmHnVchzc2QGlh5X
 6TGCyvkIuGjoxJOaYbYv8jPdUCPxHc4qc0UIS3VPUCZZ4aqUVOEQMz558tatusXU6Md9
 7z9fYWS6rMascrIPEyPm8VAbcPANrmPNeY4X1HHJJK6X5kv6HwtVHZmjs1XEyBgV08q3
 sdw5w7/IUSOOKKrPDEw26fXFaX5zAKkkpsHSQ0XPrUyiK7odJ/Vd9//+YCy2pDXmliDy
 8Tr+DXNQbSo3atdKtlL+nVR06NzeejtKfNi3xfITWrVcGqPgnzuUnZ/1QZhzJnx/lSvl
 qzgg==
X-Gm-Message-State: APjAAAWbXS5/WrgiIxD0LXYd3/KkEEux1DqrLA8cNgmBdSPJoda6hCmV
 eKnVNhhUrNXmztIWpWwR/0subfHeQto=
X-Google-Smtp-Source: APXvYqy4kdoULA23VjhRyBzyBMYtWLkbCAhdHpIaaM/rfDkc6R4pU2DQBRqe9wwk466/KAzGVIroEA==
X-Received: by 2002:a19:ccca:: with SMTP id c193mr17171048lfg.36.1557251315668; 
 Tue, 07 May 2019 10:48:35 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id u3sm1822934lfc.73.2019.05.07.10.48.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 10:48:35 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  7 May 2019 10:48:24 -0700
Message-Id: <20190507174824.26299-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 5/7] xtensa: clean up inline assembly in
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
futex_atomic_cmpxchg_inatomic. Conditionalize function bodies so that
only 'return -ENOSYS' is left in configurations without futex support.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- conditionalize functions bodies

 arch/xtensa/include/asm/futex.h | 80 +++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/arch/xtensa/include/asm/futex.h b/arch/xtensa/include/asm/futex.h
index 0fd58b7521aa..a67f801aa303 100644
--- a/arch/xtensa/include/asm/futex.h
+++ b/arch/xtensa/include/asm/futex.h
@@ -19,59 +19,58 @@
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
 		u32 __user *uaddr)
 {
+#if XCHAL_HAVE_S32C1I
 	int oldval = 0, ret;
 
-#if !XCHAL_HAVE_S32C1I
-	return -ENOSYS;
-#endif
-
 	pagefault_disable();
 
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
@@ -83,42 +82,47 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 		*oval = oldval;
 
 	return ret;
+#else
+	return -ENOSYS;
+#endif
 }
 
 static inline int
 futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 			      u32 oldval, u32 newval)
 {
+#if XCHAL_HAVE_S32C1I
+	unsigned long tmp;
 	int ret = 0;
 
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 
-#if !XCHAL_HAVE_S32C1I
-	return -ENOSYS;
-#endif
-
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
+#else
+	return -ENOSYS;
+#endif
 }
 
 #endif /* _ASM_XTENSA_FUTEX_H */
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
