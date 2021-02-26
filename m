Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 34DE1325ED4
	for <lists+linux-xtensa@lfdr.de>; Fri, 26 Feb 2021 09:22:32 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id ABAA66556;
	Fri, 26 Feb 2021 07:58:46 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by linux-xtensa.org (Postfix) with ESMTPS id 2C2EB6551
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Feb 2021 07:58:45 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id s23so5660267pji.1
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Feb 2021 00:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lf0RP6AWNkPsAQL2oVEp2TVD1wy1RanwfgCPUOayM4c=;
 b=WKwkhyilQl5a9kG7HMphFNeig60dCMgmpHKLWrlXVfCzatiOlKxm0F021oFRNuVWb/
 kiCIjl95ej7pQJkubLQhPb4OMIbqQEfOFhSdGS2k9ZFy8sMZc5yQ98w1NFGJVGyZGshp
 PXQSDP3brGIDyklcO0uxBtuGFbwiMAmfXOs2cSw8PRQBN5NWikRKG8Ep/OfvTgN0Boua
 NA7Xvvc8B+IB6EnCPy8nPiNaLpz0EJS962UUotRwLPLZvTjbxkkhn1dUv2IQN35GkCpb
 HMnqHTRwXh8Wts2GCH/3QgxKdTPvvpBKpo1s+5T7BkVp1z756HHOTUFRyfZ7btUMdQz1
 +VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lf0RP6AWNkPsAQL2oVEp2TVD1wy1RanwfgCPUOayM4c=;
 b=ZkKtrBd/9s8q4lDmx4pxUTI2jwHC4D+iy8hc+6jFPXiEo50O792UMXiM+8cYRfH0kI
 cmdc4jR30aLNTf9BclxpPZ39qpv+Tcq1jFcdc1fvD+nRJlfnjle47vFKA0jdNI5CuC18
 NhTAGKNJiaEQO8lFxen/RTT9FUfmmKalvI2DFOx5J03jboSIE+qiSy9mnn7PjcryW5gk
 HGZb4q4jXkuLqmkdzj8se1wAHXNRt1NjuEXtCJ2z+rhiAB2CKgxVExxNtS+xXB75Jq/O
 MHMFid6vw1FPw+MIJISHMmdw1Vpmt4hb96tpei3uczoe6g/M8tNBI3N+fVqhRKNDfG9p
 +qAQ==
X-Gm-Message-State: AOAM533xyg9OQgYRiUScLvXre5OtETI3Cj+IGvPkFglDOD8ksHx5mqDl
 q7FmNA4WYO+pw/vHEDWY1bIyyCAKW0A=
X-Google-Smtp-Source: ABdhPJwmYYiFXfn3Bh/XIs5iYnRmfPWYauleaeHa5rh2vi33lsGkIC+YLcNfpzIC8wr2qDgAcmLIFg==
X-Received: by 2002:a17:90a:df12:: with SMTP id
 gp18mr2294256pjb.25.1614327748552; 
 Fri, 26 Feb 2021 00:22:28 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (c-24-130-92-200.hsd1.ca.comcast.net. [24.130.92.200])
 by smtp.gmail.com with ESMTPSA id c6sm9020138pfc.94.2021.02.26.00.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:22:27 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 26 Feb 2021 00:22:19 -0800
Message-Id: <20210226082219.8224-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: move coprocessor_flush to the .text
	section
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

coprocessor_flush is not a part of fast exception handlers, but it uses
parts of fast coprocessor handling code that's why it's in the same
source file. It uses call0 opcode to invoke those parts so there are no
limitations on their relative location, but the rest of the code calls
coprocessor_flush with call8 and that doesn't work when vectors are
placed in a different gigabyte-aligned area than the rest of the kernel.

Move coprocessor_flush from the .exception.text section to the .text so
that it's reachable from the rest of the kernel with call8.

Cc: stable@vger.kernel.org
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/coprocessor.S | 64 ++++++++++++++++----------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/arch/xtensa/kernel/coprocessor.S b/arch/xtensa/kernel/coprocessor.S
index c426b846beef..45cc0ae0af6f 100644
--- a/arch/xtensa/kernel/coprocessor.S
+++ b/arch/xtensa/kernel/coprocessor.S
@@ -99,37 +99,6 @@
 	LOAD_CP_REGS_TAB(6)
 	LOAD_CP_REGS_TAB(7)
 
-/*
- * coprocessor_flush(struct thread_info*, index)
- *                             a2        a3
- *
- * Save coprocessor registers for coprocessor 'index'.
- * The register values are saved to or loaded from the coprocessor area 
- * inside the task_info structure.
- *
- * Note that this function doesn't update the coprocessor_owner information!
- *
- */
-
-ENTRY(coprocessor_flush)
-
-	/* reserve 4 bytes on stack to save a0 */
-	abi_entry(4)
-
-	s32i	a0, a1, 0
-	movi	a0, .Lsave_cp_regs_jump_table
-	addx8	a3, a3, a0
-	l32i	a4, a3, 4
-	l32i	a3, a3, 0
-	add	a2, a2, a4
-	beqz	a3, 1f
-	callx0	a3
-1:	l32i	a0, a1, 0
-
-	abi_ret(4)
-
-ENDPROC(coprocessor_flush)
-
 /*
  * Entry condition:
  *
@@ -245,6 +214,39 @@ ENTRY(fast_coprocessor)
 
 ENDPROC(fast_coprocessor)
 
+	.text
+
+/*
+ * coprocessor_flush(struct thread_info*, index)
+ *                             a2        a3
+ *
+ * Save coprocessor registers for coprocessor 'index'.
+ * The register values are saved to or loaded from the coprocessor area
+ * inside the task_info structure.
+ *
+ * Note that this function doesn't update the coprocessor_owner information!
+ *
+ */
+
+ENTRY(coprocessor_flush)
+
+	/* reserve 4 bytes on stack to save a0 */
+	abi_entry(4)
+
+	s32i	a0, a1, 0
+	movi	a0, .Lsave_cp_regs_jump_table
+	addx8	a3, a3, a0
+	l32i	a4, a3, 4
+	l32i	a3, a3, 0
+	add	a2, a2, a4
+	beqz	a3, 1f
+	callx0	a3
+1:	l32i	a0, a1, 0
+
+	abi_ret(4)
+
+ENDPROC(coprocessor_flush)
+
 	.data
 
 ENTRY(coprocessor_owner)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
