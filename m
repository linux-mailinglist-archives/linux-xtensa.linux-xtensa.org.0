Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 928DF2DA825
	for <lists+linux-xtensa@lfdr.de>; Tue, 15 Dec 2020 07:35:07 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 49E3F5815;
	Tue, 15 Dec 2020 06:13:39 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by linux-xtensa.org (Postfix) with ESMTPS id 9D01357EA
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Dec 2020 06:13:37 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id w4so14535608pgg.13
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Dec 2020 22:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NAwG2ITC+pOskvMUsMOhxFdpaUj7LWLsB7Uvs+x25PE=;
 b=aytFnAN8qVKcVUAirgRiPnm+zLD+0zpb1l7MFFuFBqvdbvQ+fFVkHwYlcls2zNDN+8
 zQmFXMyWGoSoHej87dhCxrfzgPSOmOvcxKmXjWyq+G6R71NUPA9G9Kd6STV2Dx2VpilD
 5yV7M4bkDOS/W99Yc23Wp257pirEjmZa93ENiKJFQDix/eCTkmYIt4JhE1dOiYR6DQyF
 +VzN4kHNOiSZBRX0bLV6CcHPB3RWKJxwzvvHhzi41xaBuYY5bMD/Lblgkc0bmK3gTDeO
 Yp7tGoXvCW8jEz/5b70+iZ9kbkakzyiBCDnIFz+8pWQJ7DbI0z38YWd2VFQnqqr0UvKI
 9czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NAwG2ITC+pOskvMUsMOhxFdpaUj7LWLsB7Uvs+x25PE=;
 b=IqGqIT2Zn0bUIwlEuLAnbCW55K3smHj7n+4LEAEuq8NvZl32mJ+qbmS0fImBa1Lw3g
 aRKIJx2eVy5OFWZer6ebtwqcQVlwV42MvqBxKSo1tuPpQeXCCHZ+7BDYGc1bcl66XODz
 F3GOVvkbcVrz8jFSDLx1AOW57nvnAAINQFAgdvCVRs3FwHAMJUSAbwtfHb/VD51wojy7
 plvU6fnEXntf9Z3tEm0NMp6k8dxcwMtsq5wu0rW1tvwyb8dXLcR9sdJrw1sdctXqYKri
 Kgh3JeT3DzlZ9tcPz7IdpQEIojPmOzmXv/6gCfT40/ifxupGGrFdwzL81fOaRwhvDbhH
 pnSg==
X-Gm-Message-State: AOAM531BGE3/TnhDJcHlnzdVNW7k6nk998S4pqsfUi+GakfbmV4GEkvq
 BWw1lU4tszNNcSsuB/CYuxw=
X-Google-Smtp-Source: ABdhPJzttHPNndlLlG7S1UYdKI0WIaNEDThlfLqyXtSLb60XqYwUL35+wTmftSt+QS8V93cYxqY28g==
X-Received: by 2002:a63:4083:: with SMTP id
 n125mr27864375pga.356.1608014104185; 
 Mon, 14 Dec 2020 22:35:04 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:26c0:5caa:fe49:9c90:e47c])
 by smtp.gmail.com with ESMTPSA id x23sm6238882pge.47.2020.12.14.22.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 22:35:03 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Mon, 14 Dec 2020 22:34:21 -0800
Message-Id: <20201215063421.5095-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [COMMITTED] gcc: xtensa: fix PR target/98285
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

2020-12-14  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	* config/xtensa/predicates.md (addsubx_operand): Change accepted
	values from 2/4/8 to 1..3.
	* config/xtensa/xtensa.md (*addx, *subx): Change RTL pattern
	to use 'ashift' instead of 'mult'. Update operands[3] value.

gcc/testsuite/
	* gcc.target/xtensa/pr98285.c: New test.
---
 gcc/config/xtensa/predicates.md           |  5 +--
 gcc/config/xtensa/xtensa.md               | 18 +++++---
 gcc/testsuite/gcc.target/xtensa/pr98285.c | 54 +++++++++++++++++++++++
 3 files changed, 68 insertions(+), 9 deletions(-)
 create mode 100644 gcc/testsuite/gcc.target/xtensa/pr98285.c

diff --git a/gcc/config/xtensa/predicates.md b/gcc/config/xtensa/predicates.md
index 1721640dc79e..eb52b05aafad 100644
--- a/gcc/config/xtensa/predicates.md
+++ b/gcc/config/xtensa/predicates.md
@@ -25,9 +25,8 @@
 
 (define_predicate "addsubx_operand"
   (and (match_code "const_int")
-       (match_test "INTVAL (op) == 2
-		    || INTVAL (op) == 4
-		    || INTVAL (op) == 8")))
+       (match_test "INTVAL (op) >= 1
+		    && INTVAL (op) <= 3")))
 
 (define_predicate "arith_operand"
   (ior (and (match_code "const_int")
diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
index 749fe477d562..671c4bea144f 100644
--- a/gcc/config/xtensa/xtensa.md
+++ b/gcc/config/xtensa/xtensa.md
@@ -162,11 +162,14 @@
 
 (define_insn "*addx"
   [(set (match_operand:SI 0 "register_operand" "=a")
-	(plus:SI (mult:SI (match_operand:SI 1 "register_operand" "r")
-			  (match_operand:SI 3 "addsubx_operand" "i"))
+	(plus:SI (ashift:SI (match_operand:SI 1 "register_operand" "r")
+			    (match_operand:SI 3 "addsubx_operand" "i"))
 		 (match_operand:SI 2 "register_operand" "r")))]
   "TARGET_ADDX"
-  "addx%3\t%0, %1, %2"
+{
+  operands[3] = GEN_INT (1 << INTVAL (operands[3]));
+  return "addx%3\t%0, %1, %2";
+}
   [(set_attr "type"	"arith")
    (set_attr "mode"	"SI")
    (set_attr "length"	"3")])
@@ -196,11 +199,14 @@
 
 (define_insn "*subx"
   [(set (match_operand:SI 0 "register_operand" "=a")
-	(minus:SI (mult:SI (match_operand:SI 1 "register_operand" "r")
-			   (match_operand:SI 3 "addsubx_operand" "i"))
+	(minus:SI (ashift:SI (match_operand:SI 1 "register_operand" "r")
+			     (match_operand:SI 3 "addsubx_operand" "i"))
 		  (match_operand:SI 2 "register_operand" "r")))]
   "TARGET_ADDX"
-  "subx%3\t%0, %1, %2"
+{
+  operands[3] = GEN_INT (1 << INTVAL (operands[3]));
+  return "subx%3\t%0, %1, %2";
+}
   [(set_attr "type"	"arith")
    (set_attr "mode"	"SI")
    (set_attr "length"	"3")])
diff --git a/gcc/testsuite/gcc.target/xtensa/pr98285.c b/gcc/testsuite/gcc.target/xtensa/pr98285.c
new file mode 100644
index 000000000000..2c037d546565
--- /dev/null
+++ b/gcc/testsuite/gcc.target/xtensa/pr98285.c
@@ -0,0 +1,54 @@
+/* { dg-do compile } */
+/* { dg-options "-O2" } */
+
+int mul3(int v)
+{
+  return v * 3;
+}
+
+int mul5(int v)
+{
+  return v * 5;
+}
+
+int mul7(int v)
+{
+  return v * 7;
+}
+
+int mul9(int v)
+{
+  return v * 9;
+}
+
+int mul2sub(int a, int b)
+{
+  return a * 2 - b;
+}
+
+int mul4sub(int a, int b)
+{
+  return a * 4 - b;
+}
+
+short index2(short *p, int i)
+{
+  return p[i];
+}
+
+int index4(int *p, int i)
+{
+  return p[i];
+}
+
+long long index8(long long *p, int i)
+{
+  return p[i];
+}
+
+/* { dg-final { scan-assembler-times "addx2" 2 } } */
+/* { dg-final { scan-assembler-times "addx4" 2 } } */
+/* { dg-final { scan-assembler-times "addx8" 2 } } */
+/* { dg-final { scan-assembler-times "subx2" 1 } } */
+/* { dg-final { scan-assembler-times "subx4" 1 } } */
+/* { dg-final { scan-assembler-times "subx8" 1 } } */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
