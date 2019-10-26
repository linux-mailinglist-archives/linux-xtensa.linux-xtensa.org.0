Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 934C8E582A
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:14 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id D09D652BC;
	Sat, 26 Oct 2019 02:43:28 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id EB2D84263
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:27 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id t8so3423819lfc.13
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NJyUWHZEQpQKFJXdd9vvyEWZQ13fECKNbl0xUK2XGpM=;
 b=T63w4+ezcUj1VmwUBeJhTblv4dtufJk4ymm73/ZpMc37/1xsiF904Bw1YNaEBVCUnh
 oa01CCGacobXe/+cdMsBrgZfZmuq/pJrVTpGtQMqxzMVA5xdajCVJh9vABiprue16OvI
 PJLw+T1CRZXtqIw8vYnJcTac1SrxydX0pukkAnC7bhBhFyZjJGIWIHCzkhVY4x1DBmI6
 rGCZKidTrGQ43CYw1hQcvKbQ+XdhtCN2UrPncMJ7UAkCO9XH7yT3u3YkobLRnys3xuWx
 KpZIW9ydqfDfOYU7M4jD8bkJLQEJf8q2jiq6Z6t1p4OevGa8GBk2b8vh5RyScryZ93E+
 otRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJyUWHZEQpQKFJXdd9vvyEWZQ13fECKNbl0xUK2XGpM=;
 b=CSTZ2T9SmJ0dVOWotzT9Vt6I0kEvb83mChMBIuYVaclDLeLtyTrc3226aLw1oINjZL
 oxgMtDeza2aI5YNRbm+WJp70lXt/pSMIPdxNW/qbcn25RrnyrIhN3e+ARbCDlIsk/QnW
 1+qJicc+GURAuSF0E+qSlxRYIH3ztFuZaiKb+pdZePb0ftpGoGgxIBY/thJRXQ4n6oSu
 UuFm/3yyMh1V1WpxrZ/rKgaJ+xOO4QvWL+aFLn0ywjqprllC1ImJYSdGSQhfdvZZk79g
 ZjH6nHJ2ji98f1JiEPhgmnwU5YxALZnmdPDTXpjBevGfxkgQuIVG+wi0S+Z1ipHixdSz
 PSzA==
X-Gm-Message-State: APjAAAWvpuF7UeTuzFkMzImtIsTD8lrazYo/p/kgXlHwdxY5ksE7VXrh
 EexBEmr33LHam7L0RGJZL4A9u6y/OGs=
X-Google-Smtp-Source: APXvYqy8xnxKyQZTtKsU8pH/SFxcP0xeSdxDfFa7OUqAzTzGE6cA5rk3fT3XU2dLrVWuDW3MULvduQ==
X-Received: by 2002:a19:5e53:: with SMTP id z19mr4335989lfi.111.1572058272029; 
 Fri, 25 Oct 2019 19:51:12 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:51:11 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:33 -0700
Message-Id: <20191026025033.17797-9-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026025033.17797-1-jcmvbkbc@gmail.com>
References: <20191026025033.17797-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 8/8] xtensa: use "m" constraint instead of
	"a" in cmpxchg.h assembly
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
 arch/xtensa/include/asm/cmpxchg.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index 0d4fc56337c8..a175f8aec3fb 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -43,9 +43,9 @@ __cmpxchg_u32(volatile int *p, int old, int new)
 #elif XCHAL_HAVE_S32C1I
 	__asm__ __volatile__(
 			"       wsr     %[cmp], scompare1\n"
-			"       s32c1i  %[new], %[addr], 0\n"
-			: [new] "+a" (new)
-			: [addr] "a" (p), [cmp] "a" (old)
+			"       s32c1i  %[new], %[mem]\n"
+			: [new] "+a" (new), [mem] "+m" (*p)
+			: [cmp] "a" (old)
 			: "memory"
 			);
 
@@ -53,14 +53,14 @@ __cmpxchg_u32(volatile int *p, int old, int new)
 #else
 	__asm__ __volatile__(
 			"       rsil    a15, "__stringify(TOPLEVEL)"\n"
-			"       l32i    %[old], %[addr], 0\n"
+			"       l32i    %[old], %[mem]\n"
 			"       bne     %[old], %[cmp], 1f\n"
-			"       s32i    %[new], %[addr], 0\n"
+			"       s32i    %[new], %[mem]\n"
 			"1:\n"
 			"       wsr     a15, ps\n"
 			"       rsync\n"
-			: [old] "=&a" (old)
-			: [addr] "a" (p), [cmp] "a" (old), [new] "r" (new)
+			: [old] "=&a" (old), [mem] "+m" (*p)
+			: [cmp] "a" (old), [new] "r" (new)
 			: "a15", "memory");
 	return old;
 #endif
@@ -143,13 +143,14 @@ static inline unsigned long xchg_u32(volatile int * m, unsigned long val)
 #elif XCHAL_HAVE_S32C1I
 	unsigned long tmp, result;
 	__asm__ __volatile__(
-			"1:     l32i    %[tmp], %[addr], 0\n"
+			"1:     l32i    %[tmp], %[mem]\n"
 			"       mov     %[result], %[val]\n"
 			"       wsr     %[tmp], scompare1\n"
-			"       s32c1i  %[result], %[addr], 0\n"
+			"       s32c1i  %[result], %[mem]\n"
 			"       bne     %[result], %[tmp], 1b\n"
-			: [result] "=&a" (result), [tmp] "=&a" (tmp)
-			: [addr] "a" (m), [val] "a" (val)
+			: [result] "=&a" (result), [tmp] "=&a" (tmp),
+			  [mem] "+m" (*m)
+			: [val] "a" (val)
 			: "memory"
 			);
 	return result;
@@ -157,12 +158,12 @@ static inline unsigned long xchg_u32(volatile int * m, unsigned long val)
 	unsigned long tmp;
 	__asm__ __volatile__(
 			"       rsil    a15, "__stringify(TOPLEVEL)"\n"
-			"       l32i    %[tmp], %[addr], 0\n"
-			"       s32i    %[val], %[addr], 0\n"
+			"       l32i    %[tmp], %[mem]\n"
+			"       s32i    %[val], %[mem]\n"
 			"       wsr     a15, ps\n"
 			"       rsync\n"
-			: [tmp] "=&a" (tmp)
-			: [addr] "a" (m), [val] "a" (val)
+			: [tmp] "=&a" (tmp), [mem] "+m" (*m)
+			: [val] "a" (val)
 			: "a15", "memory");
 	return tmp;
 #endif
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
