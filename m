Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5F00EE5827
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:10 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9C21C52BF;
	Sat, 26 Oct 2019 02:43:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by linux-xtensa.org (Postfix) with ESMTPS id 06B2D4240
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:22 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id c4so5101209lja.11
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IsJTv+QWpjYaUccjRkXXNPeGdu/dutpUoJ/1pUTs2gs=;
 b=fe/38URd99F73KPq53uLnn4uEiBqEv8jqw0zHKfmGEjH+C22B7lrKMuFFmYEFz1cU+
 o0faqiRF0FMIZjtUaL2LoeaErnaQ+6DdZlJajrrJFy7jVVy9uk1gROgKuG3CJ4LoumWm
 d3Rg8auUE5Dc+s7/ZI9PWKSCUAOwHiRkLel2FkiBkaW1CQHYnsH08TNnITr2nruz62vP
 7co3di5Jtu8epcY4Us0vuzyoy2qlNzj1OSeajAOKrb9+Y9mzG3XfK3nrKEMRa/CFoPEU
 FwR2VNjm0h9Ljs5nrdfMXM6rG641by5yzYdaCzI4xhNfX6zMYHoc2DHNhxwpA2I8Z4Oz
 ZNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IsJTv+QWpjYaUccjRkXXNPeGdu/dutpUoJ/1pUTs2gs=;
 b=U3UO6HejslGl1iP7UNVvQdhZeHW3DVLm7QKQHBZSdYIY+2KqWnkaReSxCL6fSUDXF0
 MbuOqL0zrCB+h3Hz6FeKzwKJzt0c9auw7lwIHGFxnzlyi0Q0IQvPvxXnrmgUFUag7n2M
 sOWXNUhX4l4RaXwyQ2Lo4XsfQjVDL5csdEvcXyb5V9mkO0gCMVdqEW2fo2g9Hh1s++Fi
 H4rhybUrdCQ95rawNxF2fH7HlaM2a/0Ho/4+fbROq+ZkF2vnlSdrIIAaM6V/66BNR7CU
 hgPawWiICLXfcCyGo9YaiRMZih53Cbtj9NAevCuX/SZbdNiTSlM3LY55AGhRn6CGb0dM
 RegA==
X-Gm-Message-State: APjAAAXERoBp0zEcN0zHT+Gw9lPIhPNZxl5KTAI/Q0//KwFbn+ZfJ93j
 O8w/K+EqlEfHfhOy5zd5zOWqk5imFKA=
X-Google-Smtp-Source: APXvYqzUkim/CDnwkpA4ee71DvYmUjewXg1tg6HuVsgv3YUaqPpZzI6JIJsXm5FocArG9SSY5MKTNQ==
X-Received: by 2002:a05:651c:111a:: with SMTP id
 d26mr3928902ljo.180.1572058265864; 
 Fri, 25 Oct 2019 19:51:05 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:51:05 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:30 -0700
Message-Id: <20191026025033.17797-6-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026025033.17797-1-jcmvbkbc@gmail.com>
References: <20191026025033.17797-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 5/8] xtensa: use named assembly arguments in
	atomic.h
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
uses them is hard to modify. Use named arguments in ATOMIC_OP,
ATOMIC_OP_RETURN and ATOMIC_FETCH_OP macros.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/atomic.h | 120 +++++++++++++++----------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/arch/xtensa/include/asm/atomic.h b/arch/xtensa/include/asm/atomic.h
index 7b00d26f472e..6bc5309a2ce8 100644
--- a/arch/xtensa/include/asm/atomic.h
+++ b/arch/xtensa/include/asm/atomic.h
@@ -64,13 +64,13 @@ static inline void atomic_##op(int i, atomic_t *v)			\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32ex   %1, %3\n"			\
-			"       " #op " %0, %1, %2\n"			\
-			"       s32ex   %0, %3\n"			\
-			"       getex   %0\n"				\
-			"       beqz    %0, 1b\n"			\
-			: "=&a" (result), "=&a" (tmp)			\
-			: "a" (i), "a" (v)				\
+			"1:     l32ex   %[tmp], %[addr]\n"		\
+			"       " #op " %[result], %[tmp], %[i]\n"	\
+			"       s32ex   %[result], %[addr]\n"		\
+			"       getex   %[result]\n"			\
+			"       beqz    %[result], 1b\n"		\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "memory"					\
 			);						\
 }									\
@@ -82,14 +82,14 @@ static inline int atomic_##op##_return(int i, atomic_t *v)		\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32ex   %1, %3\n"			\
-			"       " #op " %0, %1, %2\n"			\
-			"       s32ex   %0, %3\n"			\
-			"       getex   %0\n"				\
-			"       beqz    %0, 1b\n"			\
-			"       " #op " %0, %1, %2\n"			\
-			: "=&a" (result), "=&a" (tmp)			\
-			: "a" (i), "a" (v)				\
+			"1:     l32ex   %[tmp], %[addr]\n"		\
+			"       " #op " %[result], %[tmp], %[i]\n"	\
+			"       s32ex   %[result], %[addr]\n"		\
+			"       getex   %[result]\n"			\
+			"       beqz    %[result], 1b\n"		\
+			"       " #op " %[result], %[tmp], %[i]\n"	\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "memory"					\
 			);						\
 									\
@@ -103,13 +103,13 @@ static inline int atomic_fetch_##op(int i, atomic_t *v)			\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32ex   %1, %3\n"			\
-			"       " #op " %0, %1, %2\n"			\
-			"       s32ex   %0, %3\n"			\
-			"       getex   %0\n"				\
-			"       beqz    %0, 1b\n"			\
-			: "=&a" (result), "=&a" (tmp)			\
-			: "a" (i), "a" (v)				\
+			"1:     l32ex   %[tmp], %[addr]\n"		\
+			"       " #op " %[result], %[tmp], %[i]\n"	\
+			"       s32ex   %[result], %[addr]\n"		\
+			"       getex   %[result]\n"			\
+			"       beqz    %[result], 1b\n"		\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "memory"					\
 			);						\
 									\
@@ -124,13 +124,13 @@ static inline void atomic_##op(int i, atomic_t * v)			\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %1, %3, 0\n"			\
-			"       wsr     %1, scompare1\n"		\
-			"       " #op " %0, %1, %2\n"			\
-			"       s32c1i  %0, %3, 0\n"			\
-			"       bne     %0, %1, 1b\n"			\
-			: "=&a" (result), "=&a" (tmp)			\
-			: "a" (i), "a" (v)				\
+			"1:     l32i    %[tmp], %[addr], 0\n"		\
+			"       wsr     %[tmp], scompare1\n"		\
+			"       " #op " %[result], %[tmp], %[i]\n"	\
+			"       s32c1i  %[result], %[addr], 0\n"	\
+			"       bne     %[result], %[tmp], 1b\n"	\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "memory"					\
 			);						\
 }									\
@@ -142,14 +142,14 @@ static inline int atomic_##op##_return(int i, atomic_t * v)		\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %1, %3, 0\n"			\
-			"       wsr     %1, scompare1\n"		\
-			"       " #op " %0, %1, %2\n"			\
-			"       s32c1i  %0, %3, 0\n"			\
-			"       bne     %0, %1, 1b\n"			\
-			"       " #op " %0, %0, %2\n"			\
-			: "=&a" (result), "=&a" (tmp)			\
-			: "a" (i), "a" (v)				\
+			"1:     l32i    %[tmp], %[addr], 0\n"		\
+			"       wsr     %[tmp], scompare1\n"		\
+			"       " #op " %[result], %[tmp], %[i]\n"	\
+			"       s32c1i  %[result], %[addr], 0\n"	\
+			"       bne     %[result], %[tmp], 1b\n"	\
+			"       " #op " %[result], %[result], %[i]\n"	\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "memory"					\
 			);						\
 									\
@@ -163,13 +163,13 @@ static inline int atomic_fetch_##op(int i, atomic_t * v)		\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %1, %3, 0\n"			\
-			"       wsr     %1, scompare1\n"		\
-			"       " #op " %0, %1, %2\n"			\
-			"       s32c1i  %0, %3, 0\n"			\
-			"       bne     %0, %1, 1b\n"			\
-			: "=&a" (result), "=&a" (tmp)			\
-			: "a" (i), "a" (v)				\
+			"1:     l32i    %[tmp], %[addr], 0\n"		\
+			"       wsr     %[tmp], scompare1\n"		\
+			"       " #op " %[result], %[tmp], %[i]\n"	\
+			"       s32c1i  %[result], %[addr], 0\n"	\
+			"       bne     %[result], %[tmp], 1b\n"	\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "memory"					\
 			);						\
 									\
@@ -184,14 +184,14 @@ static inline void atomic_##op(int i, atomic_t * v)			\
 	unsigned int vval;						\
 									\
 	__asm__ __volatile__(						\
-			"       rsil    a15, "__stringify(TOPLEVEL)"\n"\
-			"       l32i    %0, %2, 0\n"			\
-			"       " #op " %0, %0, %1\n"			\
-			"       s32i    %0, %2, 0\n"			\
+			"       rsil    a15, "__stringify(TOPLEVEL)"\n"	\
+			"       l32i    %[result], %[addr], 0\n"	\
+			"       " #op " %[result], %[result], %[i]\n"	\
+			"       s32i    %[result], %[addr], 0\n"	\
 			"       wsr     a15, ps\n"			\
 			"       rsync\n"				\
-			: "=&a" (vval)					\
-			: "a" (i), "a" (v)				\
+			: [result] "=&a" (vval)				\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "a15", "memory"				\
 			);						\
 }									\
@@ -203,13 +203,13 @@ static inline int atomic_##op##_return(int i, atomic_t * v)		\
 									\
 	__asm__ __volatile__(						\
 			"       rsil    a15,"__stringify(TOPLEVEL)"\n"	\
-			"       l32i    %0, %2, 0\n"			\
-			"       " #op " %0, %0, %1\n"			\
-			"       s32i    %0, %2, 0\n"			\
+			"       l32i    %[result], %[addr], 0\n"	\
+			"       " #op " %[result], %[result], %[i]\n"	\
+			"       s32i    %[result], %[addr], 0\n"	\
 			"       wsr     a15, ps\n"			\
 			"       rsync\n"				\
-			: "=&a" (vval)					\
-			: "a" (i), "a" (v)				\
+			: [result] "=&a" (vval)				\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "a15", "memory"				\
 			);						\
 									\
@@ -223,13 +223,13 @@ static inline int atomic_fetch_##op(int i, atomic_t * v)		\
 									\
 	__asm__ __volatile__(						\
 			"       rsil    a15,"__stringify(TOPLEVEL)"\n"	\
-			"       l32i    %0, %3, 0\n"			\
-			"       " #op " %1, %0, %2\n"			\
-			"       s32i    %1, %3, 0\n"			\
+			"       l32i    %[result], %[addr], 0\n"	\
+			"       " #op " %[tmp], %[result], %[i]\n"	\
+			"       s32i    %[tmp], %[addr], 0\n"		\
 			"       wsr     a15, ps\n"			\
 			"       rsync\n"				\
-			: "=&a" (vval), "=&a" (tmp)			\
-			: "a" (i), "a" (v)				\
+			: [result] "=&a" (vval), [tmp] "=&a" (tmp)	\
+			: [i] "a" (i), [addr] "a" (v)			\
 			: "a15", "memory"				\
 			);						\
 									\
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
