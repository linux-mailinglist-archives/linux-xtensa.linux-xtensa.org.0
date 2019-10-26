Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0E5E5824
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:04 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6F15952CB;
	Sat, 26 Oct 2019 02:43:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by linux-xtensa.org (Postfix) with ESMTPS id C064852BA
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:15 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id v24so3444672lfe.10
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jccPvydOe+csBWwtJukg4X6N95FfMQOwrLJLT0eLZdo=;
 b=i5LOxHWEhgyXYb1OvQ7S0yrNKwh48E0t48klcto/4n6g0dEr2JpD0ybT3bIK56TZtK
 iVyppQJBkfcbhOj6zOg9QmRfr879jGXfNLGzC5KiJt6p+ctmgoRpCgxsyVWtB8BrN4Vh
 vAK02VxcaKkeNzDBSuBMd/OvoAzMQV+afBZwp4PJVQkxRvPoLo4P+w0UrXu3XdDNHKdu
 zc3ul8uccqnIhTSja4USJJGKHuuPgBo0yEN7aN8ZTTZf5ft4bfSMYVmHuf7NEGZVBrmt
 av0TTuAq1MLOmxgVnU6u4D9+gXl6F943fzIe20mQheItLvBU47wwj7bNk31zzOxkYqh6
 +r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jccPvydOe+csBWwtJukg4X6N95FfMQOwrLJLT0eLZdo=;
 b=cagwqAQXPIfFDJplqpKO6EOnRIrJ7R/uu8uDMK3R2POdXbRJlFPqPIji6SHUyMweg9
 r3kxEN3DJbIrsP0Ks8ZBwyhB9coi06RL4qmbUhzn/zdZ2fQw+TCLSUQ35hnRd9wF8YLh
 P9lM/NvvlvZZ5P0cEtzhv/dZstt2ujwGVsMAjEoEcUNqjEMhkwMJ/28LFx80uzQECN5a
 mGOLWidnaZGVk/ukc7ojldrhKxu+ZdQqtUozmwyytjwm7b3brA0z/C9BanFoIN2baytk
 4KvBSjZ1jT+KxmP9Iz77RqdjGCEOvYQ9h6B6kgdhhOnO4vOrB3ebjv9U9RHwOXCkqXmh
 lk0A==
X-Gm-Message-State: APjAAAX6suTwTiPuiwAk5gWSv2aQZ1iCrqAfYKqJLjvdxVh+2JL1pfQY
 H84v1O99GTtj23YW4jtXUWzPx33v6nE=
X-Google-Smtp-Source: APXvYqxV1Ri8JdJYnhhablKT8eb1aGqiMFvo/0C5iTvTX2IWml7A6H3bLEX6UkWKgJOTLUFqtQPpVw==
X-Received: by 2002:a19:895:: with SMTP id 143mr4475542lfi.158.1572058259524; 
 Fri, 25 Oct 2019 19:50:59 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:50:58 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:27 -0700
Message-Id: <20191026025033.17797-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026025033.17797-1-jcmvbkbc@gmail.com>
References: <20191026025033.17797-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/8] xtensa: use macros to generate *_bit and
	test_and_*_bit functions
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

Parameterize macros with function name, opcode and inversion pattern.
This reduces code duplication removing 2/3 of definitions.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/bitops.h | 321 +++++++++----------------------
 1 file changed, 92 insertions(+), 229 deletions(-)

diff --git a/arch/xtensa/include/asm/bitops.h b/arch/xtensa/include/asm/bitops.h
index be8b2be5a98b..bfaad56870f6 100644
--- a/arch/xtensa/include/asm/bitops.h
+++ b/arch/xtensa/include/asm/bitops.h
@@ -98,247 +98,110 @@ static inline unsigned long __fls(unsigned long word)
 
 #if XCHAL_HAVE_EXCLUSIVE
 
-static inline void set_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32ex   %0, %2\n"
-			"       or      %0, %0, %1\n"
-			"       s32ex   %0, %2\n"
-			"       getex   %0\n"
-			"       beqz    %0, 1b\n"
-			: "=&a" (tmp)
-			: "a" (mask), "a" (p)
-			: "memory");
-}
-
-static inline void clear_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32ex   %0, %2\n"
-			"       and     %0, %0, %1\n"
-			"       s32ex   %0, %2\n"
-			"       getex   %0\n"
-			"       beqz    %0, 1b\n"
-			: "=&a" (tmp)
-			: "a" (~mask), "a" (p)
-			: "memory");
-}
-
-static inline void change_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32ex   %0, %2\n"
-			"       xor     %0, %0, %1\n"
-			"       s32ex   %0, %2\n"
-			"       getex   %0\n"
-			"       beqz    %0, 1b\n"
-			: "=&a" (tmp)
-			: "a" (mask), "a" (p)
-			: "memory");
-}
-
-static inline int
-test_and_set_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32ex   %1, %3\n"
-			"       or      %0, %1, %2\n"
-			"       s32ex   %0, %3\n"
-			"       getex   %0\n"
-			"       beqz    %0, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (mask), "a" (p)
-			: "memory");
-
-	return value & mask;
-}
-
-static inline int
-test_and_clear_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32ex   %1, %3\n"
-			"       and     %0, %1, %2\n"
-			"       s32ex   %0, %3\n"
-			"       getex   %0\n"
-			"       beqz    %0, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (~mask), "a" (p)
-			: "memory");
-
-	return value & mask;
-}
-
-static inline int
-test_and_change_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32ex   %1, %3\n"
-			"       xor     %0, %1, %2\n"
-			"       s32ex   %0, %3\n"
-			"       getex   %0\n"
-			"       beqz    %0, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (mask), "a" (p)
-			: "memory");
-
-	return value & mask;
+#define BIT_OP(op, insn, inv)						\
+static inline void op##_bit(unsigned int bit, volatile unsigned long *p)\
+{									\
+	unsigned long tmp;						\
+	unsigned long mask = 1UL << (bit & 31);				\
+									\
+	p += bit >> 5;							\
+									\
+	__asm__ __volatile__(						\
+			"1:     l32ex   %0, %2\n"			\
+			"      "insn"   %0, %0, %1\n"			\
+			"       s32ex   %0, %2\n"			\
+			"       getex   %0\n"				\
+			"       beqz    %0, 1b\n"			\
+			: "=&a" (tmp)					\
+			: "a" (inv mask), "a" (p)			\
+			: "memory");					\
+}
+
+#define TEST_AND_BIT_OP(op, insn, inv)					\
+static inline int							\
+test_and_##op##_bit(unsigned int bit, volatile unsigned long *p)	\
+{									\
+	unsigned long tmp, value;					\
+	unsigned long mask = 1UL << (bit & 31);				\
+									\
+	p += bit >> 5;							\
+									\
+	__asm__ __volatile__(						\
+			"1:     l32ex   %1, %3\n"			\
+			"      "insn"   %0, %1, %2\n"			\
+			"       s32ex   %0, %3\n"			\
+			"       getex   %0\n"				\
+			"       beqz    %0, 1b\n"			\
+			: "=&a" (tmp), "=&a" (value)			\
+			: "a" (inv mask), "a" (p)			\
+			: "memory");					\
+									\
+	return value & mask;						\
 }
 
 #elif XCHAL_HAVE_S32C1I
 
-static inline void set_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32i    %1, %3, 0\n"
-			"       wsr     %1, scompare1\n"
-			"       or      %0, %1, %2\n"
-			"       s32c1i  %0, %3, 0\n"
-			"       bne     %0, %1, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (mask), "a" (p)
-			: "memory");
-}
-
-static inline void clear_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32i    %1, %3, 0\n"
-			"       wsr     %1, scompare1\n"
-			"       and     %0, %1, %2\n"
-			"       s32c1i  %0, %3, 0\n"
-			"       bne     %0, %1, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (~mask), "a" (p)
-			: "memory");
+#define BIT_OP(op, insn, inv)						\
+static inline void op##_bit(unsigned int bit, volatile unsigned long *p)\
+{									\
+	unsigned long tmp, value;					\
+	unsigned long mask = 1UL << (bit & 31);				\
+									\
+	p += bit >> 5;							\
+									\
+	__asm__ __volatile__(						\
+			"1:     l32i    %1, %3, 0\n"			\
+			"       wsr     %1, scompare1\n"		\
+			"      "insn"   %0, %1, %2\n"			\
+			"       s32c1i  %0, %3, 0\n"			\
+			"       bne     %0, %1, 1b\n"			\
+			: "=&a" (tmp), "=&a" (value)			\
+			: "a" (inv mask), "a" (p)			\
+			: "memory");					\
+}
+
+#define TEST_AND_BIT_OP(op, insn, inv)					\
+static inline int							\
+test_and_##op##_bit(unsigned int bit, volatile unsigned long *p)	\
+{									\
+	unsigned long tmp, value;					\
+	unsigned long mask = 1UL << (bit & 31);				\
+									\
+	p += bit >> 5;							\
+									\
+	__asm__ __volatile__(						\
+			"1:     l32i    %1, %3, 0\n"			\
+			"       wsr     %1, scompare1\n"		\
+			"      "insn"   %0, %1, %2\n"			\
+			"       s32c1i  %0, %3, 0\n"			\
+			"       bne     %0, %1, 1b\n"			\
+			: "=&a" (tmp), "=&a" (value)			\
+			: "a" (inv mask), "a" (p)			\
+			: "memory");					\
+									\
+	return tmp & mask;						\
 }
 
-static inline void change_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32i    %1, %3, 0\n"
-			"       wsr     %1, scompare1\n"
-			"       xor     %0, %1, %2\n"
-			"       s32c1i  %0, %3, 0\n"
-			"       bne     %0, %1, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (mask), "a" (p)
-			: "memory");
-}
+#else
 
-static inline int
-test_and_set_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32i    %1, %3, 0\n"
-			"       wsr     %1, scompare1\n"
-			"       or      %0, %1, %2\n"
-			"       s32c1i  %0, %3, 0\n"
-			"       bne     %0, %1, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (mask), "a" (p)
-			: "memory");
-
-	return tmp & mask;
-}
+#define BIT_OP(op, insn, inv)
+#define TEST_AND_BIT_OP(op, insn, inv)
 
-static inline int
-test_and_clear_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32i    %1, %3, 0\n"
-			"       wsr     %1, scompare1\n"
-			"       and     %0, %1, %2\n"
-			"       s32c1i  %0, %3, 0\n"
-			"       bne     %0, %1, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (~mask), "a" (p)
-			: "memory");
-
-	return tmp & mask;
-}
+#include <asm-generic/bitops/atomic.h>
 
-static inline int
-test_and_change_bit(unsigned int bit, volatile unsigned long *p)
-{
-	unsigned long tmp, value;
-	unsigned long mask = 1UL << (bit & 31);
-
-	p += bit >> 5;
-
-	__asm__ __volatile__(
-			"1:     l32i    %1, %3, 0\n"
-			"       wsr     %1, scompare1\n"
-			"       xor     %0, %1, %2\n"
-			"       s32c1i  %0, %3, 0\n"
-			"       bne     %0, %1, 1b\n"
-			: "=&a" (tmp), "=&a" (value)
-			: "a" (mask), "a" (p)
-			: "memory");
-
-	return tmp & mask;
-}
+#endif /* XCHAL_HAVE_S32C1I */
 
-#else
+#define BIT_OPS(op, insn, inv)		\
+	BIT_OP(op, insn, inv)		\
+	TEST_AND_BIT_OP(op, insn, inv)
 
-#include <asm-generic/bitops/atomic.h>
+BIT_OPS(set, "or", )
+BIT_OPS(clear, "and", ~)
+BIT_OPS(change, "xor", )
 
-#endif /* XCHAL_HAVE_S32C1I */
+#undef BIT_OPS
+#undef BIT_OP
+#undef TEST_AND_BIT_OP
 
 #include <asm-generic/bitops/find.h>
 #include <asm-generic/bitops/le.h>
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
