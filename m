Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 2190716990
	for <lists+linux-xtensa@lfdr.de>; Tue,  7 May 2019 19:48:54 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5599564A4;
	Tue,  7 May 2019 17:47:09 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 69FE15871
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 May 2019 17:47:07 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z1so2906297ljb.3
 for <linux-xtensa@linux-xtensa.org>; Tue, 07 May 2019 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9PPQtYXydiSZQDnv/KXQpVQSqv1XEgXVsVZJd7A0LVg=;
 b=k7vaCCHjNzS8s5U5sRu0VoMvKABrYm2nU/VUpf61VFejUzu8huNaJC5Rit2wM+ciV6
 5Mg5mz3lxWC5ACoCSX1HqkUHnzrG9Cj7UO9YzamqYjWuHuFpqRiCwYM7DNyUOctTeNhh
 LOBAoDkjs/G/rl1DndEbOqVQHoRMpJnD5769j7cKORCojfRUp0+8SbzxCiZtCUjb4d6P
 Jimt/C+oIBcHI6cs20IPo6Mh9sFFFwBk2gl/3IK0cNzwESLcUBUsc+IWsvCbd9Szf6Jo
 l3MXRxGSB3+XW8nZ1MGrskqEA6UFp1T1+oaeIvEdspHfAouwWGTwe/hGs5zlxcqT5+J8
 /InA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9PPQtYXydiSZQDnv/KXQpVQSqv1XEgXVsVZJd7A0LVg=;
 b=L4PR3GR1vODZ6k8Q5xUk1IvNW2booziz9v5Y5dDLQBU4qLjj3gfhMrd9HcAL0ykse7
 3c167XmO9fovhlDKrkg2ncE23qqFpPO2t7JsKEju7Tj15XlDKeFiHZ7yiKKL0as40rgJ
 QAgkYGKBKeaQankutSX5iyFyl89538UBzAR8K8IDk5HRJW92B6KkSyoGdmJV9fEd+zvQ
 rMprlCWA/WVnHiCl85Mc7a675I97sW2fVDbevZzK1PkRJXqSSNhPgNETkXc+93z7u7Ou
 pvDR0j2KE9T4yUmQNNlvhAEGP0Nv8Xfbe3rsGWYfrOWf4W/8xlqP8z67HUrXZBzBjGqL
 j6zQ==
X-Gm-Message-State: APjAAAVtPP3xYX3/brYYqVq9GaE7a++fl82v9GubUcVBx6VKW0qa9tIp
 BnmRikrQUq5U82C1Sg/wHYYbQewdpoQ=
X-Google-Smtp-Source: APXvYqx0ic5yOmbEYH2jQo5VeMbvIccETQlwVcaU/aKQF4gaQYCcl03Brk6e0xYqv5iCpgGF4FZKBg==
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr11436754ljj.90.1557251330190; 
 Tue, 07 May 2019 10:48:50 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id l5sm3489531lfh.70.2019.05.07.10.48.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 10:48:49 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  7 May 2019 10:48:40 -0700
Message-Id: <20190507174840.26347-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 6/7] xtensa: add exclusive atomics support
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
index a67f801aa303..9538b0f7953c 100644
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
@@ -42,11 +67,12 @@
 	: [addr] "r" (uaddr), [oparg] "r" (arg),	\
 	  [fault] "I" (-EFAULT)				\
 	: "memory")
+#endif
 
 static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
 		u32 __user *uaddr)
 {
-#if XCHAL_HAVE_S32C1I
+#if XCHAL_HAVE_S32C1I || XCHAL_HAVE_EXCLUSIVE
 	int oldval = 0, ret;
 
 	pagefault_disable();
@@ -91,7 +117,7 @@ static inline int
 futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 			      u32 oldval, u32 newval)
 {
-#if XCHAL_HAVE_S32C1I
+#if XCHAL_HAVE_S32C1I || XCHAL_HAVE_EXCLUSIVE
 	unsigned long tmp;
 	int ret = 0;
 
@@ -100,9 +126,19 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 
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
@@ -113,6 +149,9 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
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
