Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id F0D6F14F747
	for <lists+linux-xtensa@lfdr.de>; Sat,  1 Feb 2020 09:40:21 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id A72436578;
	Sat,  1 Feb 2020 08:29:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 468DC6578
 for <linux-xtensa@linux-xtensa.org>; Sat,  1 Feb 2020 08:29:30 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v201so6446221lfa.11
 for <linux-xtensa@linux-xtensa.org>; Sat, 01 Feb 2020 00:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Z28SuKZRXMNFVR0O2T8TpM75CzBYxq5Fn9CvJuB4+g=;
 b=mG0tAZzVQa61mz/2TBGLDXpQ7HpHwGPNPvn/VsjcocPXdjbOMwQ/lZ9m2dyzxKKqZ1
 vNC4UdxVuGl8dN/HsGKNY1zajOvNXHFgPculbN1pYTQ1f4ZF3czMuYaYCGTLQRHm9OVw
 sry8g4kCRWZeUq8eDR3D9do63w1Jbo3bqgKJFclCyzr4IvL2ilYJATIBRf4ly/cqdhkh
 uhkBLdst6OmXdfqJPjafU6Zf+5/VTXGKD3pRTWZX+MgDYlVFYlU3gbHDz07mfLX5wbr9
 0Db1lsLAGHJY6ZsIyHwStWLhUuWb655hMIfHTAibPlZ6h+3qugLCRh8okisJ7WWykvy5
 yCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Z28SuKZRXMNFVR0O2T8TpM75CzBYxq5Fn9CvJuB4+g=;
 b=Egc6d4+csqVkSrz2TIx878UsmfC7u5QtceewXMJipSVw6VZJxZc/xCI3GOZQgKsip2
 zIfa0bljLXCDEIkeEj+z/mZvI/dAZPHSgeAL4b2hxEd9bP4/+9Mj9uV7VPUc51/KtL5M
 EwjYHBi5i0rBd36bkGPsikkxt4V0HNgw0SpvZUeMLGHsphtUcfUIIdMApo1qOKKHWXXH
 YpA88pVNqefVbHmoigYCS979qgY3YbaQE3s/nVh7T7lt5giU66S7oWPllGrh526pDO0D
 D8t5UHThXqdrwKuxww9PTSqzkz2Q651aGQKenDl4+aFoZ6y1UhHzyirnfLaCodylKDnd
 0EUw==
X-Gm-Message-State: APjAAAUTksm2XmNNZURcyCGlWn6U9DKMaULXjrhN0y6hJt6WgSHzSTTg
 EDDnvkAa79rWLhWh0MnAuAwNuIOeOi4=
X-Google-Smtp-Source: APXvYqyuwEE74O2onGC+68HDdv6Zt3GN1hYgqGRLGZiKHVd5k2IACLiAYfMFD8VZR02NsrysVbCQaA==
X-Received: by 2002:ac2:5509:: with SMTP id j9mr7329297lfk.135.1580546417792; 
 Sat, 01 Feb 2020 00:40:17 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id v16sm5742645lfp.92.2020.02.01.00.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 00:40:17 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat,  1 Feb 2020 00:40:02 -0800
Message-Id: <20200201084002.23617-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: clean up optional XCHAL_* definitions
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

Simplify users of XCHAL_HAVE_EXTERN_REGS and XCHAL_HAVE_VECBASE and
always define them as 0 if they're not defined in the variant/core.h

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/core.h      | 8 ++++++++
 arch/xtensa/include/asm/processor.h | 4 ----
 arch/xtensa/include/asm/vectors.h   | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/xtensa/include/asm/core.h b/arch/xtensa/include/asm/core.h
index 5b4acb7d1c07..5590b0f68837 100644
--- a/arch/xtensa/include/asm/core.h
+++ b/arch/xtensa/include/asm/core.h
@@ -10,10 +10,18 @@
 #define XCHAL_HAVE_EXCLUSIVE 0
 #endif
 
+#ifndef XCHAL_HAVE_EXTERN_REGS
+#define XCHAL_HAVE_EXTERN_REGS 0
+#endif
+
 #ifndef XCHAL_HAVE_MPU
 #define XCHAL_HAVE_MPU 0
 #endif
 
+#ifndef XCHAL_HAVE_VECBASE
+#define XCHAL_HAVE_VECBASE 0
+#endif
+
 #ifndef XCHAL_SPANNING_WAY
 #define XCHAL_SPANNING_WAY 0
 #endif
diff --git a/arch/xtensa/include/asm/processor.h b/arch/xtensa/include/asm/processor.h
index 6fa903daf2a2..7f63aca6a0d3 100644
--- a/arch/xtensa/include/asm/processor.h
+++ b/arch/xtensa/include/asm/processor.h
@@ -237,10 +237,6 @@ extern unsigned long get_wchan(struct task_struct *p);
 	 v; \
 	 })
 
-#ifndef XCHAL_HAVE_EXTERN_REGS
-#define XCHAL_HAVE_EXTERN_REGS 0
-#endif
-
 #if XCHAL_HAVE_EXTERN_REGS
 
 static inline void set_er(unsigned long value, unsigned long addr)
diff --git a/arch/xtensa/include/asm/vectors.h b/arch/xtensa/include/asm/vectors.h
index fd99b25037a7..140f30762cf9 100644
--- a/arch/xtensa/include/asm/vectors.h
+++ b/arch/xtensa/include/asm/vectors.h
@@ -40,7 +40,7 @@
 #define VECBASE_VADDR			_vecbase
 #endif
 
-#if defined(XCHAL_HAVE_VECBASE) && XCHAL_HAVE_VECBASE
+#if XCHAL_HAVE_VECBASE
 
 #define VECTOR_VADDR(offset)		(VECBASE_VADDR + offset)
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
