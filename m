Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3E70FE5825
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:05 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7B1C052C2;
	Sat, 26 Oct 2019 02:43:19 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id A059352BA
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:17 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id l21so5138447lje.4
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rpfp3+rB4NrFCsc1O0E+DoDjd1d6BBYz8PFu5rD7dw8=;
 b=lAftWKLXm//3L4MWlKOoCocI+1COEgRRfWWKNCEpoAtCsvZK1upnaIOLHE83uSYEwB
 y2ImuZc2xZPVsXEWERJCy3yNxeDQoKj74VRZob66kk/qqPQ8DOLYQpgjKwP2BreJF4B/
 b2vADS/rLMtvvzaKoYzxiB3FoLsODXBLQS5E1KhaL4ev52Sxgi9tSsE26SShIw4Ej1AD
 sTNuYqOObBji5oBoBwt0zlkqaKJHj50pNG65sLRfpTvziqUDwD4WICnMD+ujULCXS+Do
 VXW8uTMDGU+3hW7M6p8YupVhxr3xGIZOaURDCxou+OFD2GXhoPc0rBWMHQAwL3/R/v9N
 gVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rpfp3+rB4NrFCsc1O0E+DoDjd1d6BBYz8PFu5rD7dw8=;
 b=fHO3TuqbWHAVch/KsWbfQhY6YFajzujUmj5dqwRFocaq7W8nt39LAVEuyaUhLMXZ8t
 ZDLTLpK3PqnP9yBS2d4tPyr8b2DrJXwFw/qC+xGjRoooJJq4dJnt/dGwMpEe8ir5wKVV
 OEt7PVJ7eVFGi70xeM6eoGWkrTWPIU853/sgrCigKHRl+zt8r35BH9n0xfM6hA4B5TPK
 8fwaWmNmJe0P5azjLYIu9xPF99qeFzWJ5S9v6yNfyu+lH/slkAo+rrsyuYrVFXB9q0Om
 IF/Vyg0Q9qhC1Q5/ZXQVaKuOjM19FNUOQSfkCg5KnjfYxtS1m1jaYNgzVaj7sKlMLKse
 bwOQ==
X-Gm-Message-State: APjAAAWqANvtmxC9pOg/ZzYLWX+aFadH18qscEcEokfQ6SQpVe/IvwSS
 0v4iMcNizjueTVYnb+ZaN34r0eLqkiw=
X-Google-Smtp-Source: APXvYqwo2zxO9oT1NMSNdbcJWD6bpbQ5aaHMr6sYXyNhGvg4Sx6kZD8g251KkX0Vd9HA3/bUss0jXg==
X-Received: by 2002:a2e:9693:: with SMTP id q19mr4372150lji.6.1572058261746;
 Fri, 25 Oct 2019 19:51:01 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:51:01 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:28 -0700
Message-Id: <20191026025033.17797-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026025033.17797-1-jcmvbkbc@gmail.com>
References: <20191026025033.17797-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 3/8] xtensa: use named assembly arguments in
	bitops.h
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
uses them is hard to modify. Use named arguments in BIT_OP and
TEST_AND_BIT_OP macros.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/bitops.h | 56 ++++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/xtensa/include/asm/bitops.h b/arch/xtensa/include/asm/bitops.h
index bfaad56870f6..5a35d026c1c3 100644
--- a/arch/xtensa/include/asm/bitops.h
+++ b/arch/xtensa/include/asm/bitops.h
@@ -107,13 +107,13 @@ static inline void op##_bit(unsigned int bit, volatile unsigned long *p)\
 	p += bit >> 5;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32ex   %0, %2\n"			\
-			"      "insn"   %0, %0, %1\n"			\
-			"       s32ex   %0, %2\n"			\
-			"       getex   %0\n"				\
-			"       beqz    %0, 1b\n"			\
-			: "=&a" (tmp)					\
-			: "a" (inv mask), "a" (p)			\
+			"1:     l32ex   %[tmp], %[addr]\n"		\
+			"      "insn"   %[tmp], %[tmp], %[mask]\n"	\
+			"       s32ex   %[tmp], %[addr]\n"		\
+			"       getex   %[tmp]\n"			\
+			"       beqz    %[tmp], 1b\n"			\
+			: [tmp] "=&a" (tmp)				\
+			: [mask] "a" (inv mask), [addr] "a" (p)		\
 			: "memory");					\
 }
 
@@ -127,13 +127,13 @@ test_and_##op##_bit(unsigned int bit, volatile unsigned long *p)	\
 	p += bit >> 5;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32ex   %1, %3\n"			\
-			"      "insn"   %0, %1, %2\n"			\
-			"       s32ex   %0, %3\n"			\
-			"       getex   %0\n"				\
-			"       beqz    %0, 1b\n"			\
-			: "=&a" (tmp), "=&a" (value)			\
-			: "a" (inv mask), "a" (p)			\
+			"1:     l32ex   %[value], %[addr]\n"		\
+			"      "insn"   %[tmp], %[value], %[mask]\n"	\
+			"       s32ex   %[tmp], %[addr]\n"		\
+			"       getex   %[tmp]\n"			\
+			"       beqz    %[tmp], 1b\n"			\
+			: [tmp] "=&a" (tmp), [value] "=&a" (value)	\
+			: [mask] "a" (inv mask), [addr] "a" (p)		\
 			: "memory");					\
 									\
 	return value & mask;						\
@@ -150,13 +150,13 @@ static inline void op##_bit(unsigned int bit, volatile unsigned long *p)\
 	p += bit >> 5;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %1, %3, 0\n"			\
-			"       wsr     %1, scompare1\n"		\
-			"      "insn"   %0, %1, %2\n"			\
-			"       s32c1i  %0, %3, 0\n"			\
-			"       bne     %0, %1, 1b\n"			\
-			: "=&a" (tmp), "=&a" (value)			\
-			: "a" (inv mask), "a" (p)			\
+			"1:     l32i    %[value], %[addr], 0\n"		\
+			"       wsr     %[value], scompare1\n"		\
+			"      "insn"   %[tmp], %[value], %[mask]\n"	\
+			"       s32c1i  %[tmp], %[addr], 0\n"		\
+			"       bne     %[tmp], %[value], 1b\n"		\
+			: [tmp] "=&a" (tmp), [value] "=&a" (value)	\
+			: [mask] "a" (inv mask), [addr] "a" (p)		\
 			: "memory");					\
 }
 
@@ -170,13 +170,13 @@ test_and_##op##_bit(unsigned int bit, volatile unsigned long *p)	\
 	p += bit >> 5;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %1, %3, 0\n"			\
-			"       wsr     %1, scompare1\n"		\
-			"      "insn"   %0, %1, %2\n"			\
-			"       s32c1i  %0, %3, 0\n"			\
-			"       bne     %0, %1, 1b\n"			\
-			: "=&a" (tmp), "=&a" (value)			\
-			: "a" (inv mask), "a" (p)			\
+			"1:     l32i    %[value], %[addr], 0\n"		\
+			"       wsr     %[value], scompare1\n"		\
+			"      "insn"   %[tmp], %[value], %[mask]\n"	\
+			"       s32c1i  %[tmp], %[addr], 0\n"		\
+			"       bne     %[tmp], %[value], 1b\n"		\
+			: [tmp] "=&a" (tmp), [value] "=&a" (value)	\
+			: [mask] "a" (inv mask), [addr] "a" (p)		\
 			: "memory");					\
 									\
 	return tmp & mask;						\
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
