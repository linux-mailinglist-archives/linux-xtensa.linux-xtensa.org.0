Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 672FB2DC82B
	for <lists+linux-xtensa@lfdr.de>; Wed, 16 Dec 2020 22:14:16 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 1EA4C52C0;
	Wed, 16 Dec 2020 20:52:45 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by linux-xtensa.org (Postfix) with ESMTPS id 22B6852A3
 for <linux-xtensa@linux-xtensa.org>; Wed, 16 Dec 2020 20:52:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id g20so12828169plo.2
 for <linux-xtensa@linux-xtensa.org>; Wed, 16 Dec 2020 13:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzdopwpS3MJOa/w4kRXNrNQPmm/OT4Y3KDDV04hSBfc=;
 b=iy0rnk5PWY7Sq8vWucH2iDUN/loGEuMQdNKKK9YQ4b5Y9YnuP3rHXrz75/ROymrjca
 kZkKJaTjk7YSBAowGMA1GeF/z8vN7iCNPcj8I6Iw1DVWYUkWDAkFNI0EESI53A4egXpH
 hDOUXrAgXTTNq0g/Fq+UCFHde+9ZNQIg8zGHbI7U4ceSbuiwrX8QL/xZoFZC+hzRTsr3
 r8AItmb3yD76KkSwJvzpmgbMHkNctFrEZ7m4dIdiB0IDB7kYqR7fwVgHVibKsc6p2U4F
 HJ4sMggf5V8sNaX7UDjiXhmd4T69VHnPugYHZIu7poGqjiHLkHPbkEUl1QViiqFiFPpe
 +z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzdopwpS3MJOa/w4kRXNrNQPmm/OT4Y3KDDV04hSBfc=;
 b=CHQb0PjV3PN5ApmOZMQnZPbm5aKtBMwAQJkGXsL0Xkb08/xCjP9pw1AkbLsqoBcqV1
 P3Qwoj6drb7HObSFoWTf5YchtgnfJk6eyz5WnTm4JbudrdebksFAjCcfllY1758ZB6Zs
 UacMOIpNSLKoUHOXWnnZ3k4SKBNMNP5Ap2y77E+i5ngGddxfnwI4HdyN1Vl8X/PXTgQ6
 8Jrto91zMEI4tB3QvO705SaiRry4TtOyZkS0dsO4it1Q951b2v0Sxf3Kf9GsIgdwRU5o
 cwXoLwBQHHH+jmaTeWefTn+ZuNqGxxcGP5tJSEciYXqUYQCZ12GUbeN+f1QQHI2BGO51
 AA3w==
X-Gm-Message-State: AOAM530M+KGGyAXjbuhxUxm1mfSEjbbxpssKpLogQE8GvTO/T9YTyTL7
 9CsBIJqhq1Rr3KvEZOMRRK4=
X-Google-Smtp-Source: ABdhPJxjAJy0voZCdH9W6XezSQnmgeZWfu38bvMCKGG7eqVWuvTSFBuO7jZIb/v+qPLpAm8eNlAqUw==
X-Received: by 2002:a17:90a:5b18:: with SMTP id
 o24mr4697704pji.120.1608153252706; 
 Wed, 16 Dec 2020 13:14:12 -0800 (PST)
Received: from octofox.cadence.com ([2601:641:401:26c0:5caa:fe49:9c90:e47c])
 by smtp.gmail.com with ESMTPSA id m77sm3205873pfd.105.2020.12.16.13.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 13:14:11 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Wed, 16 Dec 2020 13:13:54 -0800
Message-Id: <20201216211354.21020-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org,
 Takayuki 'January June' Suwa <jjsuwa_sys3175@yahoo.co.jp>
Subject: [Linux-Xtensa] [COMMITTED] gcc: xtensa: rearrange DI mode constant
	loading
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
	* config/xtensa/xtensa.c (xtensa_emit_move_sequence): Try to
	replace 'l32r' with 'movi' + 'slli' when optimizing for size.
	* config/xtensa/xtensa.md (movdi): Split loading DI mode constant
	into register pair into two loads of SI mode constants.
---
 gcc/config/xtensa/xtensa.c  | 15 +++++++++++++++
 gcc/config/xtensa/xtensa.md | 19 +++++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
index be1eb21a0b60..1cdc39acfffa 100644
--- a/gcc/config/xtensa/xtensa.c
+++ b/gcc/config/xtensa/xtensa.c
@@ -1082,6 +1082,21 @@ xtensa_emit_move_sequence (rtx *operands, machine_mode mode)
 
       if (! TARGET_AUTO_LITPOOLS && ! TARGET_CONST16)
 	{
+	  /* Try to emit MOVI + SLLI sequence, that is smaller
+	     than L32R + literal.  */
+	  if (optimize_size && mode == SImode && register_operand (dst, mode))
+	    {
+	      HOST_WIDE_INT srcval = INTVAL (src);
+	      int shift = ctz_hwi (srcval);
+
+	      if (xtensa_simm12b (srcval >> shift))
+		{
+		  emit_move_insn (dst, GEN_INT (srcval >> shift));
+		  emit_insn (gen_ashlsi3_internal (dst, dst, GEN_INT (shift)));
+		  return 1;
+		}
+	    }
+
 	  src = force_const_mem (SImode, src);
 	  operands[1] = src;
 	}
diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
index 671c4bea144f..5fbe4ad4af9f 100644
--- a/gcc/config/xtensa/xtensa.md
+++ b/gcc/config/xtensa/xtensa.md
@@ -727,8 +727,23 @@
 	(match_operand:DI 1 "general_operand" ""))]
   ""
 {
-  if (CONSTANT_P (operands[1]) && !TARGET_CONST16)
-    operands[1] = force_const_mem (DImode, operands[1]);
+  if (CONSTANT_P (operands[1]))
+    {
+      /* Split in halves if 64-bit Const-to-Reg moves
+	 because of offering further optimization opportunities.  */
+      if (register_operand (operands[0], DImode))
+	{
+	  rtx first, second;
+
+	  split_double (operands[1], &first, &second);
+	  emit_insn (gen_movsi (gen_lowpart (SImode, operands[0]), first));
+	  emit_insn (gen_movsi (gen_highpart (SImode, operands[0]), second));
+	  DONE;
+	}
+
+      if (!TARGET_CONST16)
+	operands[1] = force_const_mem (DImode, operands[1]);
+    }
 
   if (!register_operand (operands[0], DImode)
       && !register_operand (operands[1], DImode))
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
