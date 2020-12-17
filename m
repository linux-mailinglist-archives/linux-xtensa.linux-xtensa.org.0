Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9242DCAB2
	for <lists+linux-xtensa@lfdr.de>; Thu, 17 Dec 2020 02:55:53 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5D7B164BE;
	Thu, 17 Dec 2020 01:34:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by linux-xtensa.org (Postfix) with ESMTPS id 3E33664AF
 for <linux-xtensa@linux-xtensa.org>; Thu, 17 Dec 2020 01:34:20 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id m6so8247550pfm.6
 for <linux-xtensa@linux-xtensa.org>; Wed, 16 Dec 2020 17:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2dApT06trKg3XB3A8lm+rmuqaMjA8SzEg2bBp3w2x4=;
 b=t6BdRMEq9462qu8fqlfk2gJQ1c4Oe6RX+p65205oRmgKQ1JTrGpGJErr2d0c1cy4x6
 arY+NXLmGWqf8+s9h3pjgh2vWZS8B91bTmoG7YJfWGUFWbJbPEta+ck3BjVyWIp3XHbe
 CbsicS4QoB9UYj/Q/j0dzfpEhziZwijiPfc/LboV/OnhambfmnVRSzZ4giE4NcJZFTlt
 BRVF1QpIUPYt0OyKN1eMvikT0GbkTrF4ZakEptFtuJfdiu9SW6bXTxX+wPM23oDbiE3P
 PtCJ7NAJaORGKop0KmyrLBDO3x5xBDDW06wS9qUGqFIV2BpYvA/Bv47yjokHAdieEuLi
 R8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2dApT06trKg3XB3A8lm+rmuqaMjA8SzEg2bBp3w2x4=;
 b=OB1bTxJAHqUbJ9z9AEAa0lMeqts9rZKNNLd+82cPb62ffg2mhHO37+wJ0muOaRkHQp
 8VpGPWaCjHNuqjfGFmVXvFY36cHG9VeVys2Q7qz9om96OCMmQXWMu+G9RkpaqukzaGAU
 hWXYvC3TAs+vLOd55rSWf16Emfe/eDn+TFUPexyEFZSoVebdBZBUokB14d9r/Kxy3HVj
 pmp4T78wqieJOVr/8rfHw8JzCKsVs9aTiO50njWivW4SHsVHCWIOK8wj9FmJk9I/AtGW
 Nix6Cpcgr0qEu0DPBBMByMasCckU/gI0KKNf6hE9kjSPOnSgE5Ecp14vOtPjDBo2rkY4
 ATdQ==
X-Gm-Message-State: AOAM530X4NhPXR73lSEC+RJiX0qci6Svvis+DP/H4L9+53SfTaaxAS9H
 SLXlGyxKyQ0V2DoPeDlRACQ=
X-Google-Smtp-Source: ABdhPJwlNL5yiXg9ekchs/myzyRU2g0SPHx51Tlm6LIEscuXoz+qLOVLSnmJiecZoaY0y/QnHBMQUg==
X-Received: by 2002:a63:194c:: with SMTP id 12mr35889758pgz.159.1608170150186; 
 Wed, 16 Dec 2020 17:55:50 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:26c0:5caa:fe49:9c90:e47c])
 by smtp.gmail.com with ESMTPSA id h16sm4428582pgd.62.2020.12.16.17.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 17:55:49 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Wed, 16 Dec 2020 17:55:37 -0800
Message-Id: <20201217015537.8603-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org,
 Takayuki 'January June' Suwa <jjsuwa_sys3175@yahoo.co.jp>
Subject: [Linux-Xtensa] [COMMITTED] gcc: xtensa: add optimizations for shift
	operations
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

From: Takayuki 'January June' Suwa <jjsuwa_sys3175@yahoo.co.jp>

2020-12-16  Takayuki 'January June' Suwa  <jjsuwa_sys3175@yahoo.co.jp>
gcc/
	* config/xtensa/xtensa.md (*ashlsi3_1, *ashlsi3_3x, *ashrsi3_3x)
	(*lshrsi3_3x): New patterns.

gcc/testsuite/
	* gcc.target/xtensa/shifts.c: New test.
---
 gcc/config/xtensa/xtensa.md              | 43 ++++++++++++++++++++++++
 gcc/testsuite/gcc.target/xtensa/shifts.c | 31 +++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 gcc/testsuite/gcc.target/xtensa/shifts.c

diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
index 5fbe4ad4af9f..462a7244a35d 100644
--- a/gcc/config/xtensa/xtensa.md
+++ b/gcc/config/xtensa/xtensa.md
@@ -1071,6 +1071,16 @@
   operands[1] = xtensa_copy_incoming_a7 (operands[1]);
 })
 
+(define_insn "*ashlsi3_1"
+  [(set (match_operand:SI 0 "register_operand" "=a")
+	(ashift:SI (match_operand:SI 1 "register_operand" "r")
+		   (const_int 1)))]
+  "TARGET_DENSITY"
+  "add.n\t%0, %1, %1"
+  [(set_attr "type"	"arith")
+   (set_attr "mode"	"SI")
+   (set_attr "length"	"2")])
+
 (define_insn "ashlsi3_internal"
   [(set (match_operand:SI 0 "register_operand" "=a,a")
 	(ashift:SI (match_operand:SI 1 "register_operand" "r,r")
@@ -1083,6 +1093,17 @@
    (set_attr "mode"	"SI")
    (set_attr "length"	"3,6")])
 
+(define_insn "*ashlsi3_3x"
+  [(set (match_operand:SI 0 "register_operand" "=a")
+	(ashift:SI (match_operand:SI 1 "register_operand" "r")
+		   (ashift:SI (match_operand:SI 2 "register_operand" "r")
+			      (const_int 3))))]
+  ""
+  "ssa8b\t%2\;sll\t%0, %1"
+  [(set_attr "type"	"arith")
+   (set_attr "mode"	"SI")
+   (set_attr "length"	"6")])
+
 (define_insn "ashrsi3"
   [(set (match_operand:SI 0 "register_operand" "=a,a")
 	(ashiftrt:SI (match_operand:SI 1 "register_operand" "r,r")
@@ -1095,6 +1116,17 @@
    (set_attr "mode"	"SI")
    (set_attr "length"	"3,6")])
 
+(define_insn "*ashrsi3_3x"
+  [(set (match_operand:SI 0 "register_operand" "=a")
+	(ashiftrt:SI (match_operand:SI 1 "register_operand" "r")
+		     (ashift:SI (match_operand:SI 2 "register_operand" "r")
+				(const_int 3))))]
+  ""
+  "ssa8l\t%2\;sra\t%0, %1"
+  [(set_attr "type"	"arith")
+   (set_attr "mode"	"SI")
+   (set_attr "length"	"6")])
+
 (define_insn "lshrsi3"
   [(set (match_operand:SI 0 "register_operand" "=a,a")
 	(lshiftrt:SI (match_operand:SI 1 "register_operand" "r,r")
@@ -1114,6 +1146,17 @@
    (set_attr "mode"	"SI")
    (set_attr "length"	"3,6")])
 
+(define_insn "*lshrsi3_3x"
+  [(set (match_operand:SI 0 "register_operand" "=a")
+	(lshiftrt:SI (match_operand:SI 1 "register_operand" "r")
+		     (ashift:SI (match_operand:SI 2 "register_operand" "r")
+				(const_int 3))))]
+  ""
+  "ssa8l\t%2\;srl\t%0, %1"
+  [(set_attr "type"	"arith")
+   (set_attr "mode"	"SI")
+   (set_attr "length"	"6")])
+
 (define_insn "rotlsi3"
   [(set (match_operand:SI 0 "register_operand" "=a,a")
 	(rotate:SI (match_operand:SI 1 "register_operand" "r,r")
diff --git a/gcc/testsuite/gcc.target/xtensa/shifts.c b/gcc/testsuite/gcc.target/xtensa/shifts.c
new file mode 100644
index 000000000000..8d7e4a928d3a
--- /dev/null
+++ b/gcc/testsuite/gcc.target/xtensa/shifts.c
@@ -0,0 +1,31 @@
+/* { dg-do compile } */
+/* { dg-options "-O1" } */
+
+int lshift1(int v)
+{
+  return v << 1;
+}
+
+int lshift2(int v, int s)
+{
+  return v << (s * 8);
+}
+
+unsigned int lshift3(unsigned int v, int s)
+{
+  return v << (s * 8);
+}
+
+int rshift1(int v, int s)
+{
+  return v >> (s * 8);
+}
+
+unsigned int rshift2(unsigned int v, int s)
+{
+  return v >> (s * 8);
+}
+
+/* { dg-final { scan-assembler-not "slli" } } */
+/* { dg-final { scan-assembler-times "ssa8l" 2 } } */
+/* { dg-final { scan-assembler-times "ssa8b" 2 } } */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
