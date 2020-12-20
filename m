Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 233912DF6F9
	for <lists+linux-xtensa@lfdr.de>; Sun, 20 Dec 2020 23:04:57 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2BD305853;
	Sun, 20 Dec 2020 21:43:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by linux-xtensa.org (Postfix) with ESMTPS id 281BF57FB
 for <linux-xtensa@linux-xtensa.org>; Sun, 20 Dec 2020 21:43:15 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id c22so5152999pgg.13
 for <linux-xtensa@linux-xtensa.org>; Sun, 20 Dec 2020 14:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBfD8rf8U2AJQTQ87hOhcc1Ph7WA6tEpYZhPLuqYZLA=;
 b=WPSH2tY6RYWM5thA8ZG4phwn9V/DO2KjtkrP+sL1MQ5GMjexmYrs2Kzrit2pSfzsSR
 q7GzbG385jngEJCCigI/xTsfl9qHcL7ZM4+q7pMhLwG54fdvK9TerkKJddjhXvqGpVQ7
 dxRlQJwQzVoBhVflig1FnntKFy8ncA2iWKUsSEAWSKtnUshyjoSmmmRBCjd/Mc4fpx9+
 YOpNo75eJiz6i35VTdSdIHoMWmaZZRohGJSr07CiieD9MLnZ/9qWDaSztqmhoPZVDhfp
 SRgys4vvJl+FdNPzJEC4nt9PwlL4dgLQEYOc589Or2LiAT8P9uGTj4FUhyhg3baAcBg+
 LQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBfD8rf8U2AJQTQ87hOhcc1Ph7WA6tEpYZhPLuqYZLA=;
 b=PdL9PSq0gyAZvnek9yV8L69EWWyvhK97uoTfjGyS2I/xOLtj7SRczr/aS7L1cnPGsk
 yFJMqUl9pTeG/Xriilrt937mj7b7jfBEl0WW9WlRbMHYQ93i1Bu3VPwDgzzsS+YV5qLP
 tQt6L7c44QA13rYml+hrbEtvEKKbWq8ICKDOdRVaJXdADNBY0/D6hWY+z7GOf9prldhg
 qb7QO7W47KbrqsnEBai9mAfCmVIpeosxHcbdtrADUmV8BpgKjgNKEA7kD4dNW7WkfJs9
 ewUV6i5iZJY5xLkntYC7pFXXX0YcSl1YTuUGou35TwiChB9nVCKjuiJYd4qXqKR8T4JB
 OlMg==
X-Gm-Message-State: AOAM530rH9nFEE9smw4z9DSYlU2QETTT5aRTFmJt8uCSjcB9lUt4BwY9
 mkP1xlb0VV2FiSWPeVhhkEs=
X-Google-Smtp-Source: ABdhPJyH4BohdUJrDXN61R4NZyJeg8H17HojPQbcjDF4ANXk+mCCXxH2YJO3XgOsbNwgCGrVjIs5rA==
X-Received: by 2002:a63:5344:: with SMTP id t4mr12632489pgl.379.1608501892311; 
 Sun, 20 Dec 2020 14:04:52 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:26c0:5caa:fe49:9c90:e47c])
 by smtp.gmail.com with ESMTPSA id a131sm8021861pfd.171.2020.12.20.14.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 14:04:51 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Sun, 20 Dec 2020 14:04:41 -0800
Message-Id: <20201220220441.29838-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [COMMITTED] gcc: xtensa: implement bswapsi2,
	bswapdi2 and helpers
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

2020-12-20  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	* config/xtensa/xtensa.md (bswapsi2, bswapdi2): New patterns.

gcc/testsuite/
	* gcc.target/xtensa/bswap.c: New test.

libgcc/
	* config/xtensa/lib1funcs.S (__bswapsi2, __bswapdi2): New
	functions.
	* config/xtensa/t-xtensa (LIB1ASMFUNCS): Add _bswapsi2 and
	_bswapdi2.
---
 gcc/config/xtensa/xtensa.md             | 21 +++++++++++++
 gcc/testsuite/gcc.target/xtensa/bswap.c | 14 +++++++++
 libgcc/config/xtensa/lib1funcs.S        | 39 +++++++++++++++++++++++++
 libgcc/config/xtensa/t-xtensa           |  1 +
 4 files changed, 75 insertions(+)
 create mode 100644 gcc/testsuite/gcc.target/xtensa/bswap.c

diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
index 462a7244a35d..cfb6a546d922 100644
--- a/gcc/config/xtensa/xtensa.md
+++ b/gcc/config/xtensa/xtensa.md
@@ -469,6 +469,27 @@
 })
 
 
+;; Byte swap.
+
+(define_insn "bswapsi2"
+  [(set (match_operand:SI 0 "register_operand" "=&a")
+	(bswap:SI (match_operand:SI 1 "register_operand" "r")))]
+  "!optimize_size"
+  "ssai\t8\;srli\t%0, %1, 16\;src\t%0, %0, %1\;src\t%0, %0, %0\;src\t%0, %1, %0"
+  [(set_attr "type"	"arith")
+   (set_attr "mode"	"SI")
+   (set_attr "length"	"15")])
+
+(define_insn "bswapdi2"
+  [(set (match_operand:DI 0 "register_operand" "=&a")
+	(bswap:DI (match_operand:DI 1 "register_operand" "r")))]
+  "!optimize_size"
+  "ssai\t8\;srli\t%0, %D1, 16\;src\t%0, %0, %D1\;src\t%0, %0, %0\;src\t%0, %D1, %0\;srli\t%D0, %1, 16\;src\t%D0, %D0, %1\;src\t%D0, %D0, %D0\;src\t%D0, %1, %D0"
+  [(set_attr "type"	"arith")
+   (set_attr "mode"	"DI")
+   (set_attr "length"	"27")])
+
+
 ;; Negation and one's complement.
 
 (define_insn "negsi2"
diff --git a/gcc/testsuite/gcc.target/xtensa/bswap.c b/gcc/testsuite/gcc.target/xtensa/bswap.c
new file mode 100644
index 000000000000..057a3569703f
--- /dev/null
+++ b/gcc/testsuite/gcc.target/xtensa/bswap.c
@@ -0,0 +1,14 @@
+/* { dg-do compile } */
+/* { dg-options "-O1" } */
+
+unsigned long f32(unsigned long v)
+{
+  return __builtin_bswap32(v);
+}
+
+unsigned long long f64(unsigned long long v)
+{
+  return __builtin_bswap64(v);
+}
+
+/* { dg-final { scan-assembler-times "ssai" 2 } } */
diff --git a/libgcc/config/xtensa/lib1funcs.S b/libgcc/config/xtensa/lib1funcs.S
index 77e78885d84b..b19deae14483 100644
--- a/libgcc/config/xtensa/lib1funcs.S
+++ b/libgcc/config/xtensa/lib1funcs.S
@@ -840,5 +840,44 @@ __lshrdi3:
 #endif /* L_lshrdi3 */
 
 
+#ifdef L_bswapsi2
+	.align	4
+	.global	__bswapsi2
+	.type	__bswapsi2, @function
+__bswapsi2:
+	leaf_entry sp, 16
+	ssai	8
+	srli	a3, a2, 16
+	src	a3, a3, a2
+	src	a3, a3, a3
+	src	a2, a2, a3
+	leaf_return
+	.size	__bswapsi2, . - __bswapsi2
+
+#endif /* L_bswapsi2 */
+
+
+#ifdef L_bswapdi2
+	.align	4
+	.global	__bswapdi2
+	.type	__bswapdi2, @function
+__bswapdi2:
+	leaf_entry sp, 16
+	ssai	8
+	srli	a4, a2, 16
+	src	a4, a4, a2
+	src	a4, a4, a4
+	src	a4, a2, a4
+	srli	a2, a3, 16
+	src	a2, a2, a3
+	src	a2, a2, a2
+	src	a2, a3, a2
+	mov	a3, a4
+	leaf_return
+	.size	__bswapdi2, . - __bswapdi2
+
+#endif /* L_bswapdi2 */
+
+
 #include "ieee754-df.S"
 #include "ieee754-sf.S"
diff --git a/libgcc/config/xtensa/t-xtensa b/libgcc/config/xtensa/t-xtensa
index 90df5f15daa9..9836c96aefc6 100644
--- a/libgcc/config/xtensa/t-xtensa
+++ b/libgcc/config/xtensa/t-xtensa
@@ -2,6 +2,7 @@ LIB1ASMSRC = xtensa/lib1funcs.S
 LIB1ASMFUNCS = _mulsi3 _divsi3 _modsi3 _udivsi3 _umodsi3 \
 	_umulsidi3 _clz _clzsi2 _ctzsi2 _ffssi2 \
 	_ashldi3 _ashrdi3 _lshrdi3 \
+	_bswapsi2 _bswapdi2 \
 	_negsf2 _addsubsf3 _mulsf3 _divsf3 _cmpsf2 _fixsfsi _fixsfdi \
 	_fixunssfsi _fixunssfdi _floatsisf _floatunsisf \
 	_sqrtf _recipsf2 _rsqrtsf2 \
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
