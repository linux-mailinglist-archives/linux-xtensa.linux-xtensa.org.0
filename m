Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C360B23FCFE
	for <lists+linux-xtensa@lfdr.de>; Sun,  9 Aug 2020 08:23:30 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 4863E64A7;
	Sun,  9 Aug 2020 06:06:26 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by linux-xtensa.org (Postfix) with ESMTPS id F3BD46496
 for <linux-xtensa@linux-xtensa.org>; Sun,  9 Aug 2020 06:06:22 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id mt12so3090328pjb.4
 for <linux-xtensa@linux-xtensa.org>; Sat, 08 Aug 2020 23:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MJ5BX7u/X+u1PFa2yEZCCUhUPq+xEIdELVI96l0k3JY=;
 b=QCXRWAyMmPwD6FaU9R6lhumdciudOi7nhhnJTcuEBMKZ9f1ajZwZDawMwMqxxRAyF9
 TNsob1TnkbnDweE6XGRwYJLva7a/jJq8lJL++aSjA5VOB3EqFp7MxGilkawVpH5nPyy1
 uFrYDhV8gZ4qkRWearXjYWH0OB7vEe2g8euCrvmP4EBOOeUKz9SyE2vfkAWnwIJ1yRM0
 pwsQ31ZGPRyfmeHkbHSqBj8Zg55chl0OqMCGC0f6Q+k/5oPId3jJxOP90sQ1d4jsP6Vh
 0qcMJlAxcl491UXSVVFcJWkkRk0cBvzlnzj+4q1xC94SW6+voyKVTKtN2w0v0NwpV5i4
 TYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MJ5BX7u/X+u1PFa2yEZCCUhUPq+xEIdELVI96l0k3JY=;
 b=lMinlMW9D4K/Tekozg0mLoj9lOO3+lIyqRICbRWSuYBLlt8XxOwH2ODznj4id9UM6z
 LIaNcfZrwurikcDWbvE4WbmgjHHrMwW3oaV2CgUe6nN2AtQ6sIt2zlil9XULYYF6dFmd
 kY71ISVUfXo4Jamo1SNHYDWjW8OwESVGrFpDYJMQ9oODQBa8d9HwuxVVfjWy4W/SFa9O
 nDcglAPEhpjYz7dfTTpBMxhfOrkYONguXJ93gTcb0tU0fNLOl+oJkGBPXVtB7emI5ukn
 q5Owo965erAC97vs2XjR1JCKfHfkkaSDGLzbS5YmCMbFwt7kQ0YW9qohOlazntUPbcLK
 9r/Q==
X-Gm-Message-State: AOAM533f8VAVqRrICZwZA0K03RbTjjhqXmgLNNmT6PAkMq9Eo6xe5ZlU
 e0klDhRTsMh9Z4436Uw5RS4=
X-Google-Smtp-Source: ABdhPJyt7lAvuj+2khSKpMZWZS3Rbgjwgb/g4wNsSIi+Olm26dE2BhbnU2zAsM2KrJiumLAqTuAtNQ==
X-Received: by 2002:a17:90a:d78f:: with SMTP id
 z15mr21405773pju.9.1596954205593; 
 Sat, 08 Aug 2020 23:23:25 -0700 (PDT)
Received: from octofox.metropolis ([2607:fb90:4e2a:9849:ec4c:126e:c341:8919])
 by smtp.gmail.com with ESMTPSA id
 l17sm19826783pff.126.2020.08.08.23.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 23:23:25 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Sat,  8 Aug 2020 23:23:11 -0700
Message-Id: <20200809062311.18961-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: relax memory constraint in atomic
	assembly
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

Replace "a" constraints with "+m" to avoid forcing atomic variable
address into a register and let the compiler use non-zero offset in
load/store opcodes.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 libc/sysdeps/linux/xtensa/bits/atomic.h       | 49 +++++++++----------
 .../linuxthreads/sysdeps/xtensa/pt-machine.h  | 15 +++---
 2 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/libc/sysdeps/linux/xtensa/bits/atomic.h b/libc/sysdeps/linux/xtensa/bits/atomic.h
index b2be547f03e9..efc027d1ac25 100644
--- a/libc/sysdeps/linux/xtensa/bits/atomic.h
+++ b/libc/sysdeps/linux/xtensa/bits/atomic.h
@@ -56,16 +56,16 @@ typedef uintmax_t uatomic_max_t;
 #define __arch_compare_and_exchange_val_32_acq(mem, newval, oldval)  \
   ({__typeof__(*(mem)) __tmp, __value;                               \
     __asm__ __volatile__(                                            \
-      "1:     l32i    %1, %2, 0               \n"                    \
+      "1:     l32i    %1, %2                  \n"                    \
       "       bne     %1, %4, 2f              \n"                    \
       "       wsr     %1, SCOMPARE1           \n"                    \
       "       mov     %0, %1                  \n"                    \
       "       mov     %1, %3                  \n"                    \
-      "       s32c1i  %1, %2, 0               \n"                    \
+      "       s32c1i  %1, %2                  \n"                    \
       "       bne     %0, %1, 1b              \n"                    \
       "2:                                     \n"                    \
-      : "=&a" (__value), "=&a" (__tmp)                               \
-      : "a" (mem), "a" (newval), "a" (oldval)                        \
+      : "=&a" (__value), "=&a" (__tmp), "+m" (*(mem))                \
+      : "a" (newval), "a" (oldval)                                   \
       : "memory" );                                                  \
     __tmp;                                                           \
   })
@@ -76,17 +76,17 @@ typedef uintmax_t uatomic_max_t;
 #define __arch_compare_and_exchange_bool_32_acq(mem, newval, oldval) \
   ({__typeof__(*(mem)) __tmp, __value;                               \
     __asm__ __volatile__(                                            \
-      "1:     l32i    %0, %2, 0               \n"                    \
+      "1:     l32i    %0, %2                  \n"                    \
       "       sub     %1, %4, %0              \n"                    \
       "       bnez    %1, 2f                  \n"                    \
       "       wsr     %0, SCOMPARE1           \n"                    \
       "       mov     %1, %3                  \n"                    \
-      "       s32c1i  %1, %2, 0               \n"                    \
+      "       s32c1i  %1, %2                  \n"                    \
       "       bne     %0, %1, 1b              \n"                    \
       "       movi    %1, 0                   \n"                    \
       "2:                                     \n"                    \
-      : "=&a" (__value), "=&a" (__tmp)                               \
-      : "a" (mem), "a" (newval), "a" (oldval)                        \
+      : "=&a" (__value), "=&a" (__tmp), "+m" (*(mem))                \
+      : "a" (newval), "a" (oldval)                                   \
       : "memory" );                                                  \
     __tmp != 0;                                                      \
   })
@@ -96,13 +96,13 @@ typedef uintmax_t uatomic_max_t;
 #define __arch_exchange_32_acq(mem, newval)                          \
   ({__typeof__(*(mem)) __tmp, __value;                               \
     __asm__ __volatile__(                                            \
-      "1:     l32i    %0, %2, 0               \n"                    \
+      "1:     l32i    %0, %2                  \n"                    \
       "       wsr     %0, SCOMPARE1           \n"                    \
       "       mov     %1, %3                  \n"                    \
-      "       s32c1i  %1, %2, 0               \n"                    \
+      "       s32c1i  %1, %2                  \n"                    \
       "       bne     %0, %1, 1b              \n"                    \
-      : "=&a" (__value), "=&a" (__tmp)                               \
-      : "a" (mem), "a" (newval)                                      \
+      : "=&a" (__value), "=&a" (__tmp), "+m" (*(mem))                \
+      : "a" (newval)                                                 \
       : "memory" );                                                  \
     __tmp;                                                           \
   })
@@ -112,13 +112,13 @@ typedef uintmax_t uatomic_max_t;
 #define __arch_atomic_exchange_and_add_32(mem, value)                \
   ({__typeof__(*(mem)) __tmp, __value;                               \
     __asm__ __volatile__(                                            \
-      "1:     l32i    %0, %2, 0               \n"                    \
+      "1:     l32i    %0, %2                  \n"                    \
       "       wsr     %0, SCOMPARE1           \n"                    \
       "       add     %1, %0, %3              \n"                    \
-      "       s32c1i  %1, %2, 0               \n"                    \
+      "       s32c1i  %1, %2                  \n"                    \
       "       bne     %0, %1, 1b              \n"                    \
-      : "=&a" (__value), "=&a" (__tmp)                               \
-      : "a" (mem), "a" (value)                                       \
+      : "=&a" (__value), "=&a" (__tmp), "+m" (*(mem))                \
+      : "a" (value)                                                  \
       : "memory" );                                                  \
     __tmp;                                                           \
   })
@@ -128,13 +128,13 @@ typedef uintmax_t uatomic_max_t;
 #define __arch_atomic_exchange_and_sub_32(mem, value)                \
   ({__typeof__(*(mem)) __tmp, __value;                               \
     __asm__ __volatile__(                                            \
-      "1:     l32i    %0, %2, 0               \n"                    \
+      "1:     l32i    %0, %2                  \n"                    \
       "       wsr     %0, SCOMPARE1           \n"                    \
       "       sub     %1, %0, %3              \n"                    \
-      "       s32c1i  %1, %2, 0               \n"                    \
+      "       s32c1i  %1, %2                  \n"                    \
       "       bne     %0, %1, 1b              \n"                    \
-      : "=&a" (__value), "=&a" (__tmp)                               \
-      : "a" (mem), "a" (value)                                       \
+      : "=&a" (__value), "=&a" (__tmp), "+m" (*(mem))                \
+      : "a" (value)                                                  \
       : "memory" );                                                  \
     __tmp;                                                           \
   })
@@ -144,16 +144,15 @@ typedef uintmax_t uatomic_max_t;
 #define __arch_atomic_decrement_if_positive_32(mem)                  \
   ({__typeof__(*(mem)) __tmp, __value;                               \
     __asm__ __volatile__(                                            \
-      "1:     l32i    %0, %2, 0               \n"                    \
+      "1:     l32i    %0, %2                  \n"                    \
       "       blti    %0, 1, 2f               \n"                    \
       "       wsr     %0, SCOMPARE1           \n"                    \
       "       addi    %1, %0, -1              \n"                    \
-      "       s32c1i  %1, %2, 0               \n"                    \
+      "       s32c1i  %1, %2                  \n"                    \
       "       bne     %0, %1, 1b              \n"                    \
       "2:                                     \n"                    \
-      : "=&a" (__value), "=&a" (__tmp)                               \
-      : "a" (mem)                                                    \
-      : "memory" );                                                  \
+      : "=&a" (__value), "=&a" (__tmp), "+m" (*(mem))                \
+      :: "memory" );                                                 \
     __value;                                                         \
   })
 
diff --git a/libpthread/linuxthreads/sysdeps/xtensa/pt-machine.h b/libpthread/linuxthreads/sysdeps/xtensa/pt-machine.h
index 2c68ddfb5fe1..82d9b540c611 100644
--- a/libpthread/linuxthreads/sysdeps/xtensa/pt-machine.h
+++ b/libpthread/linuxthreads/sysdeps/xtensa/pt-machine.h
@@ -43,10 +43,9 @@ testandset (int *spinlock)
 "	movi	%0, 0			\n"
 "	wsr	%0, SCOMPARE1		\n"
 "	movi	%0, 1			\n"
-"	s32c1i	%0, %1, 0		\n"
-	: "=&a" (tmp)
-	: "a" (spinlock)
-	: "memory"
+"	s32c1i	%0, %1			\n"
+	: "=&a" (tmp), "+m" (*spinlock)
+	:: "memory"
 	);
 	return tmp;
 }
@@ -57,16 +56,16 @@ __compare_and_swap (long int *p, long int oldval, long int newval)
         unsigned long tmp;
         unsigned long value;
         __asm__ volatile (
-"1:     l32i    %0, %2, 0            \n"
+"1:     l32i    %0, %2               \n"
 "       bne     %0, %4, 2f           \n"
 "       wsr     %0, SCOMPARE1        \n"
 "       mov     %1, %0               \n"
 "       mov     %0, %3               \n"
-"       s32c1i  %0, %2, 0            \n"
+"       s32c1i  %0, %2               \n"
 "       bne     %1, %0, 1b           \n"
 "2:                                  \n"
-          : "=&a" (tmp), "=&a" (value)
-          : "a" (p), "a" (newval), "a" (oldval)
+          : "=&a" (tmp), "=&a" (value), "+m" (*p)
+          : "a" (newval), "a" (oldval)
           : "memory" );
 
         return tmp == oldval;
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
