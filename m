Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DD92F19F85
	for <lists+linux-xtensa@lfdr.de>; Fri, 10 May 2019 16:48:34 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8D64B6564;
	Fri, 10 May 2019 14:46:43 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id A232F6546
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 14:46:41 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y19so4344790lfy.5
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Sc/98YVrZlEbCCc7IxPerU+x2RTuZLgQB0OY0LLievc=;
 b=VRC32qdBtW5wmolnPjJ5f9wgO2xtJ4Frox4sMi06CleyvFTI3HJEdLEVZcZGWnIPQk
 jkAc5sIl5mREHf8pCJJmSi8sdlRFr/GVfT0zOifzDv3GatErM4U9kJuOp3L2wkvjDaQ0
 5NRjS53qOAheTe/AGzEwdpR8UIj9CQMJcf87XTAjuELdi69pqEFa2zuWGBhiytNrMvFI
 zhQ21nJpsKSFqgPAj41rDlZpsYUmMVrUvWW/9OhIMwGrv0DvSya4YbapPa1qc7Gg9jR3
 uuCLQIBCN+9R8rx7p8x+s92gqIOyeXxyWlEY7+VFxM6Y61fIh+f6tj1PRlyeZtjHeDE3
 4XzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Sc/98YVrZlEbCCc7IxPerU+x2RTuZLgQB0OY0LLievc=;
 b=CP4BDC2nnZt+cuwbVL89cwbSiTliUtnM9sWY+I+WfLMU6xei3A1wnB7sDCOxv1jO7u
 WrkD0U35fCXPjnTbHt9Yhola7kU/Rococru5lhJgh0cQ00bwxCe4fuZTfbdTrD7uaUvH
 UELGBJrhkmM+poNTkSpvjUeziClcOp5V2g6pb82DdJSoXJY3YyF0lvowYAYqneyD6rB/
 6BcNRbLkg2zidjh6iBE1fPsmnA7PYpMykqomIKz2UO2YFDDE25F4c0COoGZcVIlJncrn
 9soV5WX6YFKGa2pDuYHiMIdnFOErVvOzj/6ZCa+jCZW7kL5m4wkiHgyHst9kKx/I+u4W
 LzpQ==
X-Gm-Message-State: APjAAAX5Fx+5slODHpVNcQu+Pj+X1Str8FPicCZky3/IzWJoxKyBlqj+
 OMbZ32h3yHz84v0A9IN0b+L3PfpVWco=
X-Google-Smtp-Source: APXvYqwncRV6MhgMt4ngFzl3I+XJGWXHyvBcL2X6NQGzCLRBwCDqFUnmct042/GNnhZoqD/zZRQ+mQ==
X-Received: by 2002:a19:655a:: with SMTP id c26mr6515051lfj.97.1557499711106; 
 Fri, 10 May 2019 07:48:31 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id v11sm1549447lfb.68.2019.05.10.07.48.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 07:48:30 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Fri, 10 May 2019 07:48:14 -0700
Message-Id: <20190510144814.19121-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Waldemar Brodkorb <wbx@uclibc-ng.org>, linux-xtensa@linux-xtensa.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: don't use l32r opcode explicitly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

xtensa assembler is capable of representing register loads with either
movi + addmi, l32r or const16, depending on the core configuration.
Don't use '.literal' and 'l32r' directly in the code, use 'movi' and let
the assembler relax them.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 libc/string/xtensa/strcmp.S | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/libc/string/xtensa/strcmp.S b/libc/string/xtensa/strcmp.S
index a16da5da2e92..a106bee675f5 100644
--- a/libc/string/xtensa/strcmp.S
+++ b/libc/string/xtensa/strcmp.S
@@ -37,11 +37,6 @@
 	.text
 	.align 4
 	.literal_position
-	.literal .Lmask0, MASK0
-	.literal .Lmask1, MASK1
-	.literal .Lmask2, MASK2
-	.literal .Lmask3, MASK3
-	.literal .Lmask4, MASK4
 ENTRY (strcmp)
 	/* a2 = s1, a3 = s2 */
 
@@ -130,10 +125,9 @@ ENTRY (strcmp)
 	.align	4
 #if XCHAL_HAVE_LOOPS
 .Laligned:
-	.begin	no-transform
 	movi	a11, 0
-	l32r	a4, .Lmask0	/* mask for byte 0 */
-	l32r	a7, .Lmask4
+	movi	a4, MASK0	/* mask for byte 0 */
+	movi	a7, MASK4
 	loop	a11, .Laligned_done /* Loop forever. */
 
 	/* First unrolled loop body.  */
@@ -184,10 +178,10 @@ ENTRY (strcmp)
 	   If not, loop over the rest of string using normal algorithm.  */
 
 	bnone	a8, a4, .Leq	/* if byte 0 is zero */
-	l32r	a5, .Lmask1	/* mask for byte 1 */
-	l32r	a6, .Lmask2	/* mask for byte 2 */
+	movi	a5, MASK1	/* mask for byte 1 */
+	movi	a6, MASK2	/* mask for byte 2 */
 	bnone	a8, a5, .Leq	/* if byte 1 is zero */
-	l32r	a7, .Lmask3	/* mask for byte 3 */
+	movi	a7, MASK3	/* mask for byte 3 */
 	bnone	a8, a6, .Leq	/* if byte 2 is zero */
 	bnone	a8, a7, .Leq	/* if byte 3 is zero */
 	addi.n	a2, a2, 4	/* advance s1 pointer */
@@ -196,7 +190,6 @@ ENTRY (strcmp)
 
 	/* align (1 mod 4) */
 	loop	a11, .Leq	/* loop forever */
-	.end	no-transform
 
 	l32i	a8, a2, 0	/* get word from s1 */
 	l32i	a9, a3, 0	/* get word from s2 */
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
