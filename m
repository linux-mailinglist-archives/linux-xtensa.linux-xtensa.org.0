Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 88B761570F
	for <lists+linux-xtensa@lfdr.de>; Tue,  7 May 2019 02:44:37 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 43B47650A;
	Tue,  7 May 2019 00:42:54 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 84089581A
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 May 2019 00:42:53 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id n22so2937980lfe.12
 for <linux-xtensa@linux-xtensa.org>; Mon, 06 May 2019 17:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ui7AahU+awkJk6uHX8T4z5uN3ovKpUZjXilIX95n/8s=;
 b=ZZgrZ+u5sujnQB9fjOOilPZgW65HEVOfAQU3r487jClzu9EJAQteWaJqMbmvgowHvU
 KLK5TV2yTLWVMWkcAruxQmHejeVlfwJ7OtdfZ67li5ZLiBTwnwdpxD35LDMa+qsLp5UB
 XHqMA0+zZKz2+HRqnjO4JWRYyHaL8MizY2boCz3vDoGdXRZ+QOFI5a3qmCpzJYb4fdEC
 CJ7ngGhXlF/DQTMaMJKxR/cwgZJrffHoVYI3cK+VBUnivVOKB5jy0wRnJ05MNaC3ZDuu
 PRLzViBcNSSMY86gT3HlSVB9FNpptD/fCdh0LZCAmIWeyySyGwJO/CQpztYaT2EcDP2c
 6z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ui7AahU+awkJk6uHX8T4z5uN3ovKpUZjXilIX95n/8s=;
 b=R+jcRW8oAKXWBwveERmxCyJF3TruQBdm0UBiBJ34IOxUETI8eVMjzg4jto4xcMy2t7
 epydv57YitqX3eBrvJ4k0gb7PvqsvqqAricMAkUK1Jg30EL1pOHxACr3pCFYKXEO+JmX
 IspWnSZL/vYNLDokNTkpkTMXBP+3Z1NHpPTnp9dKz1RjgT/JUPRw1Quq2aQ1SAq+04Th
 sOHJZr4UARbJkf7U/NKorwMSF5SN0e3LZHYw6Ey6HTv8X3/xyKQZDooApI5pUnXpUaax
 FpuPiyQ1qPWuHRKQZQHZYplAjDsPoDaZkPOkONLJhca5h0wIWbWm6uQLDUEZWd85B9fO
 BYvg==
X-Gm-Message-State: APjAAAVwuwkA5KlpnzbV5zKROSYiSTDQihf5tcWdeRxCNX036axUSLZY
 UvAzH/sOgNN1GkUuOqjQUJ1uNyKrPbI=
X-Google-Smtp-Source: APXvYqxDU26oy/FjzPetU8mBmwSsPV8My54KiQDEvR0MoG8zu6TBnxXHbagoU2MIvyVoXEd8oGBXRw==
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr14671479lfa.25.1557189874953; 
 Mon, 06 May 2019 17:44:34 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm850003lfp.55.2019.05.06.17.44.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 17:44:34 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  6 May 2019 17:44:06 -0700
Message-Id: <20190507004407.6756-5-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507004407.6756-1-jcmvbkbc@gmail.com>
References: <20190507004407.6756-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 4/5] xtensa: add exclusive atomics support
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

Implement atomic primitives using exclusive access opcodes available in
the recent xtensa cores.
Since l32ex/s32ex don't have any memory ordering guarantees don't define
__smp_mb__before_atomic/__smp_mb__after_atomic to make them use memw.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/atomic.h  |  62 ++++++++++++++++++-
 arch/xtensa/include/asm/barrier.h |   4 ++
 arch/xtensa/include/asm/bitops.h  | 121 +++++++++++++++++++++++++++++++++++++-
 arch/xtensa/include/asm/cmpxchg.h |  36 +++++++++++-
 arch/xtensa/include/asm/core.h    |   4 ++
 arch/xtensa/include/asm/futex.h   |  43 +++++++++++++-
 arch/xtensa/kernel/setup.c        |   3 +
 7 files changed, 267 insertions(+), 6 deletions(-)

diff --git a/arch/xtensa/include/asm/atomic.h b/arch/xtensa/include/asm/atomic.h
index 4e7311f58ae8..7b00d26f472e 100644
--- a/arch/xtensa/include/asm/atomic.h
+++ b/arch/xtensa/include/asm/atomic.h
@@ -56,7 +56,67 @@
  */
 #define atomic_set(v,i)		WRITE_ONCE((v)->counter, (i))
 
-#if XCHAL_HAVE_S32C1I
+#if XCHAL_HAVE_EXCLUSIVE
+#define ATOMIC_OP(op)							\
+static inline void atomic_##op(int i, atomic_t *v)			\
+{									\
+	unsigned long tmp;						\
+	int result;							\
+									\
+	__asm__ __volatile__(						\
+			"1:     l32ex   %1, %3\n"			\
+			"       " #op " %0, %1, %2\n"			\
+			"       s32ex   %0, %3\n"			\
+			"       getex   %0\n"				\
+			"       beqz    %0, 1b\n"			\
+			: "=&a" (result), "=&a" (tmp)			\
+			: "a" (i), "a" (v)				\
+			: "memory"					\
+			);						\
+}									\
+
+#define ATOMIC_OP_RETURN(op)						\
+static inline int atomic_##op##_return(int i, atomic_t *v)		\
+{									\
+	unsigned long tmp;						\
+	int result;							\
+									\
+	__asm__ __volatile__(						\
+			"1:     l32ex   %1, %3\n"			\
+			"       " #op " %0, %1, %2\n"			\
+			"       s32ex   %0, %3\n"			\
+			"       getex   %0\n"				\
+			"       beqz    %0, 1b\n"			\
+			"       " #op " %0, %1, %2\n"			\
+			: "=&a" (result), "=&a" (tmp)			\
+			: "a" (i), "a" (v)				\
+			: "memory"					\
+			);						\
+									\
+	return result;							\
+}
+
+#define ATOMIC_FETCH_OP(op)						\
+static inline int atomic_fetch_##op(int i, atomic_t *v)			\
+{									\
+	unsigned long tmp;						\
+	int result;							\
+									\
+	__asm__ __volatile__(						\
+			"1:     l32ex   %1, %3\n"			\
+			"       " #op " %0, %1, %2\n"			\
+			"       s32ex   %0, %3\n"			\
+			"       getex   %0\n"				\
+			"       beqz    %0, 1b\n"			\
+			: "=&a" (result), "=&a" (tmp)			\
+			: "a" (i), "a" (v)				\
+			: "memory"					\
+			);						\
+									\
+	return tmp;							\
+}
+
+#elif XCHAL_HAVE_S32C1I
 #define ATOMIC_OP(op)							\
 static inline void atomic_##op(int i, atomic_t * v)			\
 {									\
diff --git a/arch/xtensa/include/asm/barrier.h b/arch/xtensa/include/asm/barrier.h
index 956596e4d437..d6f8d4ddc2bc 100644
--- a/arch/xtensa/include/asm/barrier.h
+++ b/arch/xtensa/include/asm/barrier.h
@@ -9,12 +9,16 @@
 #ifndef _XTENSA_SYSTEM_H
 #define _XTENSA_SYSTEM_H
 
+#include <asm/core.h>
+
 #define mb()  ({ __asm__ __volatile__("memw" : : : "memory"); })
 #define rmb() barrier()
 #define wmb() mb()
 
+#if XCHAL_HAVE_S32C1I
 #define __smp_mb__before_atomic()		barrier()
 #define __smp_mb__after_atomic()		barrier()
+#endif
 
 #include <asm-generic/barrier.h>
 
diff --git a/arch/xtensa/include/asm/bitops.h b/arch/xtensa/include/asm/bitops.h
index 345d28aead65..aeb15f4c755b 100644
--- a/arch/xtensa/include/asm/bitops.h
+++ b/arch/xtensa/include/asm/bitops.h
@@ -96,7 +96,126 @@ static inline unsigned long __fls(unsigned long word)
 
 #include <asm-generic/bitops/fls64.h>
 
-#if XCHAL_HAVE_S32C1I
+#if XCHAL_HAVE_EXCLUSIVE
+
+static inline void set_bit(unsigned int bit, volatile unsigned long *p)
+{
+	unsigned long tmp;
+	unsigned long mask = 1UL << (bit & 31);
+
+	p += bit >> 5;
+
+	__asm__ __volatile__(
+			"1:     l32ex   %0, %2\n"
+			"       or      %0, %0, %1\n"
+			"       s32ex   %0, %2\n"
+			"       getex   %0\n"
+			"       beqz    %0, 1b\n"
+			: "=&a" (tmp)
+			: "a" (mask), "a" (p)
+			: "memory");
+}
+
+static inline void clear_bit(unsigned int bit, volatile unsigned long *p)
+{
+	unsigned long tmp;
+	unsigned long mask = 1UL << (bit & 31);
+
+	p += bit >> 5;
+
+	__asm__ __volatile__(
+			"1:     l32ex   %0, %2\n"
+			"       and     %0, %0, %1\n"
+			"       s32ex   %0, %2\n"
+			"       getex   %0\n"
+			"       beqz    %0, 1b\n"
+			: "=&a" (tmp)
+			: "a" (~mask), "a" (p)
+			: "memory");
+}
+
+static inline void change_bit(unsigned int bit, volatile unsigned long *p)
+{
+	unsigned long tmp;
+	unsigned long mask = 1UL << (bit & 31);
+
+	p += bit >> 5;
+
+	__asm__ __volatile__(
+			"1:     l32ex   %0, %2\n"
+			"       xor     %0, %0, %1\n"
+			"       s32ex   %0, %2\n"
+			"       getex   %0\n"
+			"       beqz    %0, 1b\n"
+			: "=&a" (tmp)
+			: "a" (~mask), "a" (p)
+			: "memory");
+}
+
+static inline int
+test_and_set_bit(unsigned int bit, volatile unsigned long *p)
+{
+	unsigned long tmp, value;
+	unsigned long mask = 1UL << (bit & 31);
+
+	p += bit >> 5;
+
+	__asm__ __volatile__(
+			"1:     l32ex   %1, %3\n"
+			"       or      %0, %1, %2\n"
+			"       s32ex   %0, %3\n"
+			"       getex   %0\n"
+			"       beqz    %0, 1b\n"
+			: "=&a" (tmp), "=&a" (value)
+			: "a" (mask), "a" (p)
+			: "memory");
+
+	return value & mask;
+}
+
+static inline int
+test_and_clear_bit(unsigned int bit, volatile unsigned long *p)
+{
+	unsigned long tmp, value;
+	unsigned long mask = 1UL << (bit & 31);
+
+	p += bit >> 5;
+
+	__asm__ __volatile__(
+			"1:     l32ex   %1, %3\n"
+			"       and     %0, %1, %2\n"
+			"       s32ex   %0, %3\n"
+			"       getex   %0\n"
+			"       beqz    %0, 1b\n"
+			: "=&a" (tmp), "=&a" (value)
+			: "a" (~mask), "a" (p)
+			: "memory");
+
+	return value & mask;
+}
+
+static inline int
+test_and_change_bit(unsigned int bit, volatile unsigned long *p)
+{
+	unsigned long tmp, value;
+	unsigned long mask = 1UL << (bit & 31);
+
+	p += bit >> 5;
+
+	__asm__ __volatile__(
+			"1:     l32ex   %1, %3\n"
+			"       xor     %0, %1, %2\n"
+			"       s32ex   %0, %3\n"
+			"       getex   %0\n"
+			"       beqz    %0, 1b\n"
+			: "=&a" (tmp), "=&a" (value)
+			: "a" (mask), "a" (p)
+			: "memory");
+
+	return value & mask;
+}
+
+#elif XCHAL_HAVE_S32C1I
 
 static inline void set_bit(unsigned int bit, volatile unsigned long *p)
 {
diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index 22a10c715c1f..7ccc5cbf441b 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -23,7 +23,24 @@
 static inline unsigned long
 __cmpxchg_u32(volatile int *p, int old, int new)
 {
-#if XCHAL_HAVE_S32C1I
+#if XCHAL_HAVE_EXCLUSIVE
+	unsigned long tmp, result;
+
+	__asm__ __volatile__(
+			"1:     l32ex   %0, %3\n"
+			"       bne     %0, %4, 2f\n"
+			"       mov     %1, %2\n"
+			"       s32ex   %1, %3\n"
+			"       getex   %1\n"
+			"       beqz    %1, 1b\n"
+			"2:\n"
+			: "=&a" (result), "=&a" (tmp)
+			: "a" (new), "a" (p), "a" (old)
+			: "memory"
+			);
+
+	return result;
+#elif XCHAL_HAVE_S32C1I
 	__asm__ __volatile__(
 			"       wsr     %2, scompare1\n"
 			"       s32c1i  %0, %1, 0\n"
@@ -108,7 +125,22 @@ static inline unsigned long __cmpxchg_local(volatile void *ptr,
 
 static inline unsigned long xchg_u32(volatile int * m, unsigned long val)
 {
-#if XCHAL_HAVE_S32C1I
+#if XCHAL_HAVE_EXCLUSIVE
+	unsigned long tmp, result;
+
+	__asm__ __volatile__(
+			"1:     l32ex   %0, %3\n"
+			"       mov     %1, %2\n"
+			"       s32ex   %1, %3\n"
+			"       getex   %1\n"
+			"       beqz    %1, 1b\n"
+			: "=&a" (result), "=&a" (tmp)
+			: "a" (val), "a" (m)
+			: "memory"
+			);
+
+	return result;
+#elif XCHAL_HAVE_S32C1I
 	unsigned long tmp, result;
 	__asm__ __volatile__(
 			"1:     l32i    %1, %2, 0\n"
diff --git a/arch/xtensa/include/asm/core.h b/arch/xtensa/include/asm/core.h
index b1f57519df49..ee02e164b673 100644
--- a/arch/xtensa/include/asm/core.h
+++ b/arch/xtensa/include/asm/core.h
@@ -6,6 +6,10 @@
 
 #include <variant/core.h>
 
+#ifndef XCHAL_HAVE_EXCLUSIVE
+#define XCHAL_HAVE_EXCLUSIVE 0
+#endif
+
 #ifndef XCHAL_SPANNING_WAY
 #define XCHAL_SPANNING_WAY 0
 #endif
diff --git a/arch/xtensa/include/asm/futex.h b/arch/xtensa/include/asm/futex.h
index 558bd7d3e171..e148de1f255b 100644
--- a/arch/xtensa/include/asm/futex.h
+++ b/arch/xtensa/include/asm/futex.h
@@ -19,6 +19,31 @@
 #include <linux/uaccess.h>
 #include <linux/errno.h>
 
+#if XCHAL_HAVE_EXCLUSIVE
+#define __futex_atomic_op(insn, ret, old, uaddr, arg)	\
+	__asm__ __volatile(				\
+	"1:	l32ex	%[oldval], %[addr]\n"		\
+		insn "\n"				\
+	"2:	s32ex	%[newval], %[addr]\n"		\
+	"	getex	%[newval]\n"			\
+	"	beqz	%[newval], 1b\n"		\
+	"	movi	%[newval], 0\n"			\
+	"3:\n"						\
+	"	.section .fixup,\"ax\"\n"		\
+	"	.align 4\n"				\
+	"	.literal_position\n"			\
+	"5:	movi	%[oldval], 3b\n"		\
+	"	movi	%[newval], %[fault]\n"		\
+	"	jx	%[oldval]\n"			\
+	"	.previous\n"				\
+	"	.section __ex_table,\"a\"\n"		\
+	"	.long 1b, 5b, 2b, 5b\n"			\
+	"	.previous\n"				\
+	: [oldval] "=&r" (old), [newval] "=&r" (ret)	\
+	: [addr] "r" (uaddr), [oparg] "r" (arg),	\
+	  [fault] "I" (-EFAULT)				\
+	: "memory")
+#elif XCHAL_HAVE_S32C1I
 #define __futex_atomic_op(insn, ret, old, uaddr, arg)	\
 	__asm__ __volatile(				\
 	"1:	l32i	%[oldval], %[addr], 0\n"	\
@@ -42,13 +67,14 @@
 	: [addr] "r" (uaddr), [oparg] "r" (arg),	\
 	  [fault] "I" (-EFAULT)				\
 	: "memory")
+#endif
 
 static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 		u32 __user *uaddr)
 {
 	int oldval = 0, ret;
 
-#if !XCHAL_HAVE_S32C1I
+#if !XCHAL_HAVE_S32C1I && !XCHAL_HAVE_EXCLUSIVE
 	return -ENOSYS;
 #endif
 
@@ -97,15 +123,25 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	if (!access_ok(uaddr, sizeof(u32)))
 		return -EFAULT;
 
-#if !XCHAL_HAVE_S32C1I
+#if !XCHAL_HAVE_S32C1I && !XCHAL_HAVE_EXCLUSIVE
 	return -ENOSYS;
 #endif
 
 	__asm__ __volatile__ (
 	"	# futex_atomic_cmpxchg_inatomic\n"
+#if XCHAL_HAVE_EXCLUSIVE
+	"1:	l32ex	%[tmp], %[addr]\n"
+	"	s32i	%[tmp], %[uval], 0\n"
+	"	bne	%[tmp], %[oldval], 2f\n"
+	"	mov	%[tmp], %[newval]\n"
+	"3:	s32ex	%[tmp], %[addr]\n"
+	"	getex	%[tmp]\n"
+	"	beqz	%[tmp], 1b\n"
+#elif XCHAL_HAVE_S32C1I
 	"	wsr	%[oldval], scompare1\n"
 	"1:	s32c1i	%[newval], %[addr], 0\n"
 	"	s32i	%[newval], %[uval], 0\n"
+#endif
 	"2:\n"
 	"	.section .fixup,\"ax\"\n"
 	"	.align 4\n"
@@ -116,6 +152,9 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	"	.previous\n"
 	"	.section __ex_table,\"a\"\n"
 	"	.long 1b, 4b\n"
+#if XCHAL_HAVE_EXCLUSIVE
+	"	.long 3b, 4b\n"
+#endif
 	"	.previous\n"
 	: [ret] "+r" (ret), [newval] "+r" (newval), [tmp] "=&r" (tmp)
 	: [addr] "r" (uaddr), [oldval] "r" (oldval), [uval] "r" (uval),
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 4ec6fbb696bf..c0ec24349421 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -651,6 +651,9 @@ c_show(struct seq_file *f, void *slot)
 #if XCHAL_HAVE_S32C1I
 		     "s32c1i "
 #endif
+#if XCHAL_HAVE_EXCLUSIVE
+		     "exclusive "
+#endif
 		     "\n");
 
 	/* Registers. */
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
