Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7EC34AF5D
	for <lists+linux-xtensa@lfdr.de>; Fri, 26 Mar 2021 20:32:00 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5F49F582B;
	Fri, 26 Mar 2021 19:07:20 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by linux-xtensa.org (Postfix) with ESMTPS id 6A8AE4264
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 19:07:17 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso2205593pjh.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 12:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAahU9lnr+IeLXkNVOhMFxUUK+QudEEF6P1gMHbAgbI=;
 b=YITB8S2cKWGm03Cz1mVohymof6LFlKAPOG6Nh7G0e5UwBqNnxtyNKGoUHopgPDbP6W
 H06rO/4sxHzYID9qvNlaNPFIqquB+SCBbatxFnT8UDBOdKaGGIhkbx/E+00IOOVhBMUf
 d9Z225A38sGPXAnjQEpEZKFQq5iF1y407B2oKHsqYVm/dXJRONz6C4vVfNlFKXyf0ziW
 Fu6UMCl5o9/OGz1q8xGl0LCTSlmTlreDmxNJIIP7NmzaZecdlpqFdQpVJDT4BGhUGqGN
 tY28IqE2YCgxAHO/Fp041ipcbfpTNqtPw41HIatRcJe0WxmeEOeZnfCVd38VsqycMsTX
 h+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAahU9lnr+IeLXkNVOhMFxUUK+QudEEF6P1gMHbAgbI=;
 b=kcLqRBIM6I+pDnjeRvSYJ/J/Abq9oX/yP+thbg9sVNilMs9HSEWratD9Lf8SFS4UqO
 gbpr+Ug2cVXsJIj8dyjrWct2hb2VRCwi5Mr+YGlRaorpfLzLQIfZgeSk4tbBLUkMUkUx
 /9VBEyrnasjhqIoQ6ylilYS3rMCs3c4gmggt68b18mMOiEebzoDJNDWSNJ4yTrc7crMO
 TpA2SnpE3yjk01DGiXY2Z4OEp8CDXDpDRbevjGrlilg/p5vvstA4JDS4JRHPewG/FRoS
 nk0DFTmhxCfLCPSeGITjb3iOMkHR7t9FtGO4p1AC2X6F5HIODqARkpM9jO8qbSUPhUJl
 wb/g==
X-Gm-Message-State: AOAM533jADQude+SADCEvi1rEMZ8B25VV9pZyGk7RLsfL0a0KhcNM4Jm
 aMo6ZBzlm+25zYvj5Gn0CHLhKmsSBGs=
X-Google-Smtp-Source: ABdhPJzVOQEQWfr6SQ7M8R6EOV6c7Wq8+fyR6lrwHyWnkxzmIaBr5rdzXa7T63QeExxgghssXKE5eA==
X-Received: by 2002:a17:902:d341:b029:e6:9a9f:5614 with SMTP id
 l1-20020a170902d341b02900e69a9f5614mr16869175plk.48.1616787115601; 
 Fri, 26 Mar 2021 12:31:55 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id q10sm9086789pgs.44.2021.03.26.12.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 12:31:55 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 26 Mar 2021 12:31:42 -0700
Message-Id: <20210326193143.21016-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326193143.21016-1-jcmvbkbc@gmail.com>
References: <20210326193143.21016-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/2] xtensa: ISS: split simcall
	implementation from semihosting interface
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

Disconnect existing ISS simcall implementation from the semihosting
interface to allow for alternative implementations selectable at
configure time.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 .../iss/include/platform/simcall-iss.h        | 73 +++++++++++++++++++
 .../platforms/iss/include/platform/simcall.h  | 70 +-----------------
 2 files changed, 75 insertions(+), 68 deletions(-)
 create mode 100644 arch/xtensa/platforms/iss/include/platform/simcall-iss.h

diff --git a/arch/xtensa/platforms/iss/include/platform/simcall-iss.h b/arch/xtensa/platforms/iss/include/platform/simcall-iss.h
new file mode 100644
index 000000000000..5a1e7a1f182e
--- /dev/null
+++ b/arch/xtensa/platforms/iss/include/platform/simcall-iss.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2021 Cadence Design Systems Inc. */
+
+#ifndef _XTENSA_PLATFORM_ISS_SIMCALL_ISS_H
+#define _XTENSA_PLATFORM_ISS_SIMCALL_ISS_H
+
+/*
+ *  System call like services offered by the simulator host.
+ */
+
+#define SYS_nop		0	/* unused */
+#define SYS_exit	1	/*x*/
+#define SYS_fork	2
+#define SYS_read	3	/*x*/
+#define SYS_write	4	/*x*/
+#define SYS_open	5	/*x*/
+#define SYS_close	6	/*x*/
+#define SYS_rename	7	/*x 38 - waitpid */
+#define SYS_creat	8	/*x*/
+#define SYS_link	9	/*x (not implemented on WIN32) */
+#define SYS_unlink	10	/*x*/
+#define SYS_execv	11	/* n/a - execve */
+#define SYS_execve	12	/* 11 - chdir */
+#define SYS_pipe	13	/* 42 - time */
+#define SYS_stat	14	/* 106 - mknod */
+#define SYS_chmod	15
+#define SYS_chown	16	/* 202 - lchown */
+#define SYS_utime	17	/* 30 - break */
+#define SYS_wait	18	/* n/a - oldstat */
+#define SYS_lseek	19	/*x*/
+#define SYS_getpid	20
+#define SYS_isatty	21	/* n/a - mount */
+#define SYS_fstat	22	/* 108 - oldumount */
+#define SYS_time	23	/* 13 - setuid */
+#define SYS_gettimeofday 24	/*x 78 - getuid (not implemented on WIN32) */
+#define SYS_times	25	/*X 43 - stime (Xtensa-specific implementation) */
+#define SYS_socket      26
+#define SYS_sendto      27
+#define SYS_recvfrom    28
+#define SYS_select_one  29      /* not compatible select, one file descriptor at the time */
+#define SYS_bind        30
+#define SYS_ioctl	31
+
+#define SYS_iss_argc	1000	/* returns value of argc */
+#define SYS_iss_argv_size 1001	/* bytes needed for argv & arg strings */
+#define SYS_iss_set_argv 1002	/* saves argv & arg strings at given addr */
+
+/*
+ * SYS_select_one specifiers
+ */
+
+#define  XTISS_SELECT_ONE_READ    1
+#define  XTISS_SELECT_ONE_WRITE   2
+#define  XTISS_SELECT_ONE_EXCEPT  3
+
+static int errno;
+
+static inline int __simc(int a, int b, int c, int d)
+{
+	register int a1 asm("a2") = a;
+	register int b1 asm("a3") = b;
+	register int c1 asm("a4") = c;
+	register int d1 asm("a5") = d;
+	__asm__ __volatile__ (
+			"simcall\n"
+			: "+r"(a1), "+r"(b1)
+			: "r"(c1), "r"(d1)
+			: "memory");
+	errno = b1;
+	return a1;
+}
+
+#endif /* _XTENSA_PLATFORM_ISS_SIMCALL_ISS_H */
diff --git a/arch/xtensa/platforms/iss/include/platform/simcall.h b/arch/xtensa/platforms/iss/include/platform/simcall.h
index 5ba2454e6c37..612080bf0b3d 100644
--- a/arch/xtensa/platforms/iss/include/platform/simcall.h
+++ b/arch/xtensa/platforms/iss/include/platform/simcall.h
@@ -6,78 +6,13 @@
  * for more details.
  *
  * Copyright (C) 2001 Tensilica Inc.
- * Copyright (C) 2017 Cadence Design Systems Inc.
+ * Copyright (C) 2017 - 2021 Cadence Design Systems Inc.
  */
 
 #ifndef _XTENSA_PLATFORM_ISS_SIMCALL_H
 #define _XTENSA_PLATFORM_ISS_SIMCALL_H
 
-
-/*
- *  System call like services offered by the simulator host.
- */
-
-#define SYS_nop		0	/* unused */
-#define SYS_exit	1	/*x*/
-#define SYS_fork	2
-#define SYS_read	3	/*x*/
-#define SYS_write	4	/*x*/
-#define SYS_open	5	/*x*/
-#define SYS_close	6	/*x*/
-#define SYS_rename	7	/*x 38 - waitpid */
-#define SYS_creat	8	/*x*/
-#define SYS_link	9	/*x (not implemented on WIN32) */
-#define SYS_unlink	10	/*x*/
-#define SYS_execv	11	/* n/a - execve */
-#define SYS_execve	12	/* 11 - chdir */
-#define SYS_pipe	13	/* 42 - time */
-#define SYS_stat	14	/* 106 - mknod */
-#define SYS_chmod	15
-#define SYS_chown	16	/* 202 - lchown */
-#define SYS_utime	17	/* 30 - break */
-#define SYS_wait	18	/* n/a - oldstat */
-#define SYS_lseek	19	/*x*/
-#define SYS_getpid	20
-#define SYS_isatty	21	/* n/a - mount */
-#define SYS_fstat	22	/* 108 - oldumount */
-#define SYS_time	23	/* 13 - setuid */
-#define SYS_gettimeofday 24	/*x 78 - getuid (not implemented on WIN32) */
-#define SYS_times	25	/*X 43 - stime (Xtensa-specific implementation) */
-#define SYS_socket      26
-#define SYS_sendto      27
-#define SYS_recvfrom    28
-#define SYS_select_one  29      /* not compatible select, one file descriptor at the time */
-#define SYS_bind        30
-#define SYS_ioctl	31
-
-#define SYS_iss_argc	1000	/* returns value of argc */
-#define SYS_iss_argv_size 1001	/* bytes needed for argv & arg strings */
-#define SYS_iss_set_argv 1002	/* saves argv & arg strings at given addr */
-
-/*
- * SYS_select_one specifiers
- */
-
-#define  XTISS_SELECT_ONE_READ    1
-#define  XTISS_SELECT_ONE_WRITE   2
-#define  XTISS_SELECT_ONE_EXCEPT  3
-
-static int errno;
-
-static inline int __simc(int a, int b, int c, int d)
-{
-	register int a1 asm("a2") = a;
-	register int b1 asm("a3") = b;
-	register int c1 asm("a4") = c;
-	register int d1 asm("a5") = d;
-	__asm__ __volatile__ (
-			"simcall\n"
-			: "+r"(a1), "+r"(b1)
-			: "r"(c1), "r"(d1)
-			: "memory");
-	errno = b1;
-	return a1;
-}
+#include <platform/simcall-iss.h>
 
 static inline int simc_exit(int exit_code)
 {
@@ -137,4 +72,3 @@ static inline void simc_argv(void *buf)
 }
 
 #endif /* _XTENSA_PLATFORM_ISS_SIMCALL_H */
-
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
