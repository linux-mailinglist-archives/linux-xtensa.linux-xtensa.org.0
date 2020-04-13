Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B9CDF1A6FDD
	for <lists+linux-xtensa@lfdr.de>; Tue, 14 Apr 2020 01:39:30 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id D15D45819;
	Mon, 13 Apr 2020 23:26:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by linux-xtensa.org (Postfix) with ESMTPS id F032F64A2
 for <linux-xtensa@linux-xtensa.org>; Mon, 13 Apr 2020 23:26:22 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id np9so4510104pjb.4
 for <linux-xtensa@linux-xtensa.org>; Mon, 13 Apr 2020 16:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBYOrC6bJ1P/MyHr+LH26qQwClztccAfZakICv3ZuEI=;
 b=FoMuCX9WMF0SyK7p9a4vD8lR+3cwfbRDOO0IYtvLely4ux8aLH+twMZbKSnzOiiel7
 arQnCHSY3UHCdwbbcQbN+gr86x/qCIa6ajSWOt8ZG1fx+IAgM0PQrVPaL2B5yW+IgaBC
 QzmjoF4MmTm5+LH66WCQOSQnDEoPUmgAF9z0np6/QfsmsE/F5+7NL+Rbw/V/46zALMNz
 aLuO3bRXCdQamiUAvEltB+Wp+9kH+RtMPAcNxXcBbWxS8lCHLLsmXvkGIPPmD9sEydxK
 YLz4a086BDgLQghp4AaXqTooXJv97lO/li9Kq8+C/bJ/4FRZWxEdjYK0u3tNqmB4uCHQ
 +c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cBYOrC6bJ1P/MyHr+LH26qQwClztccAfZakICv3ZuEI=;
 b=O+QNpvYxi/XdksZKukvJWC9Lfgr/OfFjlJPqUHbQ1fRc1hMJ/+RxtKSliZDgO6AQy3
 Dhdyqh/AhFXoL9gWlR4O27mOVWK3m/D8onr/gM7wp0iEzAfp60utZjbqwbFI3K2L0f4B
 T21gI/BjGbtTW2B7xvm4oI/fAZuV2OizIvdh/gIdA9QZzB2bl0cJY9/b9Ikr49hM6qTG
 QQK/Grcd3UuBFJqQhObulfXPiZP1jR2g62yiHS/I6Z8aDEq5CPhClYkEUJZ/t3wYWCWI
 by8RT+p0U+IvPHp/rZltZtsJaadN0I0uW+7MKmiy+7SIbpR5WBBFsZo9OoPxGXwzVuOT
 iGqA==
X-Gm-Message-State: AGi0PubXYFrkn23RGZVNzTJlC0+6qLlL8e/UofIzgkBLZMVTZlSeQqWA
 nae8yIfW3lLwhUpasDVRBWA=
X-Google-Smtp-Source: APiQypKeQEn1ptTPvjGqow8FwMKIs3xOyyXqDqduOlvz03LceCb/dY3yvRiNUM6AoAZv3XU/WSkmzg==
X-Received: by 2002:a17:90a:2149:: with SMTP id
 a67mr15627819pje.43.1586821166864; 
 Mon, 13 Apr 2020 16:39:26 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:63f0:a487:3b8:7ffc:c9e4])
 by smtp.gmail.com with ESMTPSA id q7sm9713656pfc.166.2020.04.13.16.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 16:39:26 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Mon, 13 Apr 2020 16:39:01 -0700
Message-Id: <20200413233901.2417-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix PR target/94584
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

Patterns zero_extendhisi2, zero_extendqisi2 and extendhisi2_internal can
load value from memory, but they don't treat volatile memory correctly.
Add %v1 before load instructions to emit 'memw' instruction when
-mserialize-volatile is in effect.

2020-04-13  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	* config/xtensa/xtensa.md (zero_extendhisi2, zero_extendqisi2)
	(extendhisi2_internal): Add %v1 before the load instructions.

gcc/testsuite/
	* gcc.target/xtensa/pr94584.c: New test.
---
 gcc/config/xtensa/xtensa.md               |  6 +++---
 gcc/testsuite/gcc.target/xtensa/pr94584.c | 24 +++++++++++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 gcc/testsuite/gcc.target/xtensa/pr94584.c

diff --git a/gcc/config/xtensa/xtensa.md b/gcc/config/xtensa/xtensa.md
index 5b803d3cbe65..749fe477d562 100644
--- a/gcc/config/xtensa/xtensa.md
+++ b/gcc/config/xtensa/xtensa.md
@@ -538,7 +538,7 @@
   ""
   "@
    extui\t%0, %1, 0, 16
-   l16ui\t%0, %1"
+   %v1l16ui\t%0, %1"
   [(set_attr "type"	"arith,load")
    (set_attr "mode"	"SI")
    (set_attr "length"	"3,3")])
@@ -549,7 +549,7 @@
   ""
   "@
    extui\t%0, %1, 0, 8
-   l8ui\t%0, %1"
+   %v1l8ui\t%0, %1"
   [(set_attr "type"	"arith,load")
    (set_attr "mode"	"SI")
    (set_attr "length"	"3,3")])
@@ -575,7 +575,7 @@
   ""
   "@
    sext\t%0, %1, 15
-   l16si\t%0, %1"
+   %v1l16si\t%0, %1"
   [(set_attr "type"	"arith,load")
    (set_attr "mode"	"SI")
    (set_attr "length"	"3,3")])
diff --git a/gcc/testsuite/gcc.target/xtensa/pr94584.c b/gcc/testsuite/gcc.target/xtensa/pr94584.c
new file mode 100644
index 000000000000..1577285b8a68
--- /dev/null
+++ b/gcc/testsuite/gcc.target/xtensa/pr94584.c
@@ -0,0 +1,24 @@
+/* { dg-do compile } */
+/* { dg-options "-O2 -mserialize-volatile" } */
+
+unsigned long load32 (volatile unsigned long *s)
+{
+  return *s;
+}
+
+short load16s (volatile short *s)
+{
+  return *s;
+}
+
+unsigned short load16u (volatile unsigned short *s)
+{
+  return *s;
+}
+
+unsigned char load8 (volatile unsigned char *s)
+{
+  return *s;
+}
+
+/* { dg-final { scan-assembler-times "memw" 4 } } */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
