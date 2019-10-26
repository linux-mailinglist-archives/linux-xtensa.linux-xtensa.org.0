Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAEEE5829
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:12 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id C11C852C9;
	Sat, 26 Oct 2019 02:43:26 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by linux-xtensa.org (Postfix) with ESMTPS id E4D8F4240
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:25 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id a22so5164227ljd.0
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LSMz+P7h/yYWZSl6hsxceaczEQ4KlczmGYb60qB2+g8=;
 b=mbZfWbezixBKQiC3QDl3VRQePSUcMgIg05CJRgj+zAD7ziU3U216olRONrjIl2M34z
 BH5ivYG3hapEN90i2wusCSSVbvIBKbd7lVKt5xS7KsWrZIm0H5YAItjDdegxEYCLJFFn
 x7eWKPZmPw1+IHfez/5v/Z6MScBuzirMArIezMgZ9GDX/ICl5TjFJHJY/Hds0s+vQERY
 Ahs5STfhCv5/2NsXEET2FNcuivHE4SW35y0PcxHpqFqC+LgEQLdsp9LGkJe6f2Oi9kxt
 nmfJTaF52tjpGRW+f0qLdQhjlfaxabu1aYCs/nf4Xe//KpC407tp6meoM1BcYSFIzX+M
 f9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LSMz+P7h/yYWZSl6hsxceaczEQ4KlczmGYb60qB2+g8=;
 b=lU/wEhxulvmondX1pIWt1t096S5i1slfZtMsPG/a0bT5E8EyMx2OIQpVeHTI7uHPk/
 JcOoLlfONxv9NUzft29L7YB1msEnxVTHxgdk/tLcSgJ9KViL6Lj+rpIQzX9W9BoOPqx6
 GqMBlLTYLkKFLmHgu7+AwP3xQwvlK4sjxW6YpQz3M3a2tY1bvr8zyH9u+jkwYXS8kpwg
 nuWNv0hPPqEmwm/5rZm0Dbz89Zr+8dNLLHdZIC+OtX3hZIgJyLRZXk5uua1myY+j6QJV
 gzDqB+N9vQ4PaSFaH2+LJImX0vhGVB7F4CL14DJXF/ibyOukaWwzwWOdvJxxhz7FE6xX
 v5uw==
X-Gm-Message-State: APjAAAWcE22G6897DfZhx0agEa0hKIw+HlUlYJ+SfgznJ9bB51Bw0ppf
 AZy1MzN0IijlkEopdFxmYlagxsqMXMs=
X-Google-Smtp-Source: APXvYqwsd0vSw5Y3pvAQWMexFhZTu/AEVYsoFDTBQqTg1C6StkmA//2c0VhX0jp5y+dmwYrnRkszVw==
X-Received: by 2002:a2e:8652:: with SMTP id i18mr4549133ljj.86.1572058269996; 
 Fri, 25 Oct 2019 19:51:09 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:51:09 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:32 -0700
Message-Id: <20191026025033.17797-8-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026025033.17797-1-jcmvbkbc@gmail.com>
References: <20191026025033.17797-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 7/8] xtensa: use named assembly arguments in
	cmpxchg.h
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
uses them is hard to modify. Use named arguments in __cmpxchg_u32 and
xchg_u32.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/cmpxchg.h | 70 +++++++++++++++----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index 7ccc5cbf441b..0d4fc56337c8 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -27,25 +27,25 @@ __cmpxchg_u32(volatile int *p, int old, int new)
 	unsigned long tmp, result;
 
 	__asm__ __volatile__(
-			"1:     l32ex   %0, %3\n"
-			"       bne     %0, %4, 2f\n"
-			"       mov     %1, %2\n"
-			"       s32ex   %1, %3\n"
-			"       getex   %1\n"
-			"       beqz    %1, 1b\n"
+			"1:     l32ex   %[result], %[addr]\n"
+			"       bne     %[result], %[cmp], 2f\n"
+			"       mov     %[tmp], %[new]\n"
+			"       s32ex   %[tmp], %[addr]\n"
+			"       getex   %[tmp]\n"
+			"       beqz    %[tmp], 1b\n"
 			"2:\n"
-			: "=&a" (result), "=&a" (tmp)
-			: "a" (new), "a" (p), "a" (old)
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)
+			: [new] "a" (new), [addr] "a" (p), [cmp] "a" (old)
 			: "memory"
 			);
 
 	return result;
 #elif XCHAL_HAVE_S32C1I
 	__asm__ __volatile__(
-			"       wsr     %2, scompare1\n"
-			"       s32c1i  %0, %1, 0\n"
-			: "+a" (new)
-			: "a" (p), "a" (old)
+			"       wsr     %[cmp], scompare1\n"
+			"       s32c1i  %[new], %[addr], 0\n"
+			: [new] "+a" (new)
+			: [addr] "a" (p), [cmp] "a" (old)
 			: "memory"
 			);
 
@@ -53,14 +53,14 @@ __cmpxchg_u32(volatile int *p, int old, int new)
 #else
 	__asm__ __volatile__(
 			"       rsil    a15, "__stringify(TOPLEVEL)"\n"
-			"       l32i    %0, %1, 0\n"
-			"       bne     %0, %2, 1f\n"
-			"       s32i    %3, %1, 0\n"
+			"       l32i    %[old], %[addr], 0\n"
+			"       bne     %[old], %[cmp], 1f\n"
+			"       s32i    %[new], %[addr], 0\n"
 			"1:\n"
 			"       wsr     a15, ps\n"
 			"       rsync\n"
-			: "=&a" (old)
-			: "a" (p), "a" (old), "r" (new)
+			: [old] "=&a" (old)
+			: [addr] "a" (p), [cmp] "a" (old), [new] "r" (new)
 			: "a15", "memory");
 	return old;
 #endif
@@ -129,13 +129,13 @@ static inline unsigned long xchg_u32(volatile int * m, unsigned long val)
 	unsigned long tmp, result;
 
 	__asm__ __volatile__(
-			"1:     l32ex   %0, %3\n"
-			"       mov     %1, %2\n"
-			"       s32ex   %1, %3\n"
-			"       getex   %1\n"
-			"       beqz    %1, 1b\n"
-			: "=&a" (result), "=&a" (tmp)
-			: "a" (val), "a" (m)
+			"1:     l32ex   %[result], %[addr]\n"
+			"       mov     %[tmp], %[val]\n"
+			"       s32ex   %[tmp], %[addr]\n"
+			"       getex   %[tmp]\n"
+			"       beqz    %[tmp], 1b\n"
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)
+			: [val] "a" (val), [addr] "a" (m)
 			: "memory"
 			);
 
@@ -143,13 +143,13 @@ static inline unsigned long xchg_u32(volatile int * m, unsigned long val)
 #elif XCHAL_HAVE_S32C1I
 	unsigned long tmp, result;
 	__asm__ __volatile__(
-			"1:     l32i    %1, %2, 0\n"
-			"       mov     %0, %3\n"
-			"       wsr     %1, scompare1\n"
-			"       s32c1i  %0, %2, 0\n"
-			"       bne     %0, %1, 1b\n"
-			: "=&a" (result), "=&a" (tmp)
-			: "a" (m), "a" (val)
+			"1:     l32i    %[tmp], %[addr], 0\n"
+			"       mov     %[result], %[val]\n"
+			"       wsr     %[tmp], scompare1\n"
+			"       s32c1i  %[result], %[addr], 0\n"
+			"       bne     %[result], %[tmp], 1b\n"
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)
+			: [addr] "a" (m), [val] "a" (val)
 			: "memory"
 			);
 	return result;
@@ -157,12 +157,12 @@ static inline unsigned long xchg_u32(volatile int * m, unsigned long val)
 	unsigned long tmp;
 	__asm__ __volatile__(
 			"       rsil    a15, "__stringify(TOPLEVEL)"\n"
-			"       l32i    %0, %1, 0\n"
-			"       s32i    %2, %1, 0\n"
+			"       l32i    %[tmp], %[addr], 0\n"
+			"       s32i    %[val], %[addr], 0\n"
 			"       wsr     a15, ps\n"
 			"       rsync\n"
-			: "=&a" (tmp)
-			: "a" (m), "a" (val)
+			: [tmp] "=&a" (tmp)
+			: [addr] "a" (m), [val] "a" (val)
 			: "a15", "memory");
 	return tmp;
 #endif
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
