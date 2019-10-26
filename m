Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8605EE5828
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:10 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id AA77D6455;
	Sat, 26 Oct 2019 02:43:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id D69904240
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:23 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id w8so620814lji.13
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PIzDFnXrLJJeQdqkPQSGCKH870Ijnorm2ZMC3TlCtg=;
 b=rNthAJrgfdf9aqKVB7hz4SCXeLPmui5xHtdYzQZOspoftUScfRKYO2TBnlzaU8v/Mt
 gvBRRLkLI/FY2H58y+AjjQ2DYgQ/QGdTMclnBOZlgGIn0h128VVpg3U8HiajqScpri4F
 L3KC9jYgAgN5nLdoT+fmULD6/qEqFtNEZ3DNLPYP42TRXEWkS1diiBgHJCZmG+8Xsz4F
 OXABQ++RBYV2/cFiNboPOlqqyQgrvMk6P/nc6z4iKmolaS/2y/PtsueDn9GHZ7Ic5H88
 mjEC9xZK+NIgIzhnFGtxx2Oxxsn6vTTB5Qp36cIMlY6TuiM4ys8fk3OgXyHeQPgdGkBN
 i61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PIzDFnXrLJJeQdqkPQSGCKH870Ijnorm2ZMC3TlCtg=;
 b=Qs4Ppar3yD/n7SvObLcheSvtMapmBHFfiSSGyiBxLNon03rSLbigOjkArUbqtFpRcC
 g/NrZwtBuRGBTKscIfq7iqZqj9VSkqDQ256nZos+/TkHdzHvwPR4z9Ng+fjbtjVe9Lxs
 Oedyn+/EVolZkIHI4gQILhiX5P/uS6j17TSeb+pSzRc9lbfD7paKJYvqbvROzHxtzz2n
 YaVSJix0BDVkNfzorerAFOK+TuDH7F54mVJLYwWh6vMzJWiSROvKkx4QzMiOOnOPdI14
 LPYrnXvm7MKKm/nmeYrvk/+WubrSYDi7kecx5kiGeFDZ5I/C4BkPmT4ATjDiuW5W3jIL
 rpJA==
X-Gm-Message-State: APjAAAXwXxTSEmrutYFy+0RBA47UVhyoEUfkUlD4JwNI37ptr9zHt9BV
 WlekQpMSfd1asZx8uF3EBbO3zmR/Nw4=
X-Google-Smtp-Source: APXvYqw5GV0Pet5RhtU/5NkZis/m9IqirOJZVktRqfNWXlpOnGudey6QblhOn8AdKSFFUdWL1Y7rZQ==
X-Received: by 2002:a2e:9449:: with SMTP id o9mr4350767ljh.110.1572058267903; 
 Fri, 25 Oct 2019 19:51:07 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:51:07 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:31 -0700
Message-Id: <20191026025033.17797-7-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026025033.17797-1-jcmvbkbc@gmail.com>
References: <20191026025033.17797-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 6/8] xtensa: use "m" constraint instead of
	"a" in atomic.h assembly
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

Use "m" constraint instead of "r" for the address, as "m" allows
compiler to access adjacent locations using base + offset, while "r"
requires updating the base register every time.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/atomic.h | 52 +++++++++++++++++---------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/arch/xtensa/include/asm/atomic.h b/arch/xtensa/include/asm/atomic.h
index 6bc5309a2ce8..3e7c6134ed32 100644
--- a/arch/xtensa/include/asm/atomic.h
+++ b/arch/xtensa/include/asm/atomic.h
@@ -124,13 +124,14 @@ static inline void atomic_##op(int i, atomic_t * v)			\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %[tmp], %[addr], 0\n"		\
+			"1:     l32i    %[tmp], %[mem]\n"		\
 			"       wsr     %[tmp], scompare1\n"		\
 			"       " #op " %[result], %[tmp], %[i]\n"	\
-			"       s32c1i  %[result], %[addr], 0\n"	\
+			"       s32c1i  %[result], %[mem]\n"		\
 			"       bne     %[result], %[tmp], 1b\n"	\
-			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
-			: [i] "a" (i), [addr] "a" (v)			\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp),	\
+			  [mem] "+m" (*v)				\
+			: [i] "a" (i)					\
 			: "memory"					\
 			);						\
 }									\
@@ -142,14 +143,15 @@ static inline int atomic_##op##_return(int i, atomic_t * v)		\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %[tmp], %[addr], 0\n"		\
+			"1:     l32i    %[tmp], %[mem]\n"		\
 			"       wsr     %[tmp], scompare1\n"		\
 			"       " #op " %[result], %[tmp], %[i]\n"	\
-			"       s32c1i  %[result], %[addr], 0\n"	\
+			"       s32c1i  %[result], %[mem]\n"		\
 			"       bne     %[result], %[tmp], 1b\n"	\
 			"       " #op " %[result], %[result], %[i]\n"	\
-			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
-			: [i] "a" (i), [addr] "a" (v)			\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp),	\
+			  [mem] "+m" (*v)				\
+			: [i] "a" (i)					\
 			: "memory"					\
 			);						\
 									\
@@ -163,13 +165,14 @@ static inline int atomic_fetch_##op(int i, atomic_t * v)		\
 	int result;							\
 									\
 	__asm__ __volatile__(						\
-			"1:     l32i    %[tmp], %[addr], 0\n"		\
+			"1:     l32i    %[tmp], %[mem]\n"		\
 			"       wsr     %[tmp], scompare1\n"		\
 			"       " #op " %[result], %[tmp], %[i]\n"	\
-			"       s32c1i  %[result], %[addr], 0\n"	\
+			"       s32c1i  %[result], %[mem]\n"		\
 			"       bne     %[result], %[tmp], 1b\n"	\
-			: [result] "=&a" (result), [tmp] "=&a" (tmp)	\
-			: [i] "a" (i), [addr] "a" (v)			\
+			: [result] "=&a" (result), [tmp] "=&a" (tmp),	\
+			  [mem] "+m" (*v)				\
+			: [i] "a" (i)					\
 			: "memory"					\
 			);						\
 									\
@@ -185,13 +188,13 @@ static inline void atomic_##op(int i, atomic_t * v)			\
 									\
 	__asm__ __volatile__(						\
 			"       rsil    a15, "__stringify(TOPLEVEL)"\n"	\
-			"       l32i    %[result], %[addr], 0\n"	\
+			"       l32i    %[result], %[mem]\n"		\
 			"       " #op " %[result], %[result], %[i]\n"	\
-			"       s32i    %[result], %[addr], 0\n"	\
+			"       s32i    %[result], %[mem]\n"		\
 			"       wsr     a15, ps\n"			\
 			"       rsync\n"				\
-			: [result] "=&a" (vval)				\
-			: [i] "a" (i), [addr] "a" (v)			\
+			: [result] "=&a" (vval), [mem] "+m" (*v)	\
+			: [i] "a" (i)					\
 			: "a15", "memory"				\
 			);						\
 }									\
@@ -203,13 +206,13 @@ static inline int atomic_##op##_return(int i, atomic_t * v)		\
 									\
 	__asm__ __volatile__(						\
 			"       rsil    a15,"__stringify(TOPLEVEL)"\n"	\
-			"       l32i    %[result], %[addr], 0\n"	\
+			"       l32i    %[result], %[mem]\n"		\
 			"       " #op " %[result], %[result], %[i]\n"	\
-			"       s32i    %[result], %[addr], 0\n"	\
+			"       s32i    %[result], %[mem]\n"		\
 			"       wsr     a15, ps\n"			\
 			"       rsync\n"				\
-			: [result] "=&a" (vval)				\
-			: [i] "a" (i), [addr] "a" (v)			\
+			: [result] "=&a" (vval), [mem] "+m" (*v)	\
+			: [i] "a" (i)					\
 			: "a15", "memory"				\
 			);						\
 									\
@@ -223,13 +226,14 @@ static inline int atomic_fetch_##op(int i, atomic_t * v)		\
 									\
 	__asm__ __volatile__(						\
 			"       rsil    a15,"__stringify(TOPLEVEL)"\n"	\
-			"       l32i    %[result], %[addr], 0\n"	\
+			"       l32i    %[result], %[mem]\n"		\
 			"       " #op " %[tmp], %[result], %[i]\n"	\
-			"       s32i    %[tmp], %[addr], 0\n"		\
+			"       s32i    %[tmp], %[mem]\n"		\
 			"       wsr     a15, ps\n"			\
 			"       rsync\n"				\
-			: [result] "=&a" (vval), [tmp] "=&a" (tmp)	\
-			: [i] "a" (i), [addr] "a" (v)			\
+			: [result] "=&a" (vval), [tmp] "=&a" (tmp),	\
+			  [mem] "+m" (*v)				\
+			: [i] "a" (i)					\
 			: "a15", "memory"				\
 			);						\
 									\
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
