Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7E202C0F05
	for <lists+linux-xtensa@lfdr.de>; Sat, 28 Sep 2019 02:43:05 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2B07352DA;
	Sat, 28 Sep 2019 00:36:16 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 5ADB552D3
 for <linux-xtensa@linux-xtensa.org>; Sat, 28 Sep 2019 00:36:14 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m13so4101751ljj.11
 for <linux-xtensa@linux-xtensa.org>; Fri, 27 Sep 2019 17:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=drAdC+jh//y0Il1JQmnrfyXmS5xiniQET11ZhYLtsNQ=;
 b=EbVLvO5c9u1cmYy67A/CSPoAFV6W3bSxrWka08Ocvh9SykBFtA2cXbMXu6CuippO4y
 +ZN1Qx/akAZbA6wtiiqaq/gcYBt4MG8IuA2SMIs2hLViIn/79mV3aroqezSM4scl02/b
 SMOKRZ2vJZk2bs15X4JiM+JID29mWHDD4TwwjckBcrWUOSwkyD4VfnZ/GtS9NCRsfJCJ
 lzqtZZpBDn/9Lh0Eq5z0+Ls1K6kEio8vzxbG2upFXpxAmW9N3sHfbJVenr7gBHW6LW+x
 oN1FDOlYCGIQus8RtMrKN0POLJkI/8VY9hlySue49q7QAPvVx7I9WgzBI+TNnQGOeMLI
 3wrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=drAdC+jh//y0Il1JQmnrfyXmS5xiniQET11ZhYLtsNQ=;
 b=uDJbjT7REVKs9E7bFjyOnANhxpgnLIu28bKbQ27XveHB5z14cVxoX7Qz8JuVB3FhM6
 8nyqOsyeWSVOJ2oMU1va2emqwSDC5/EvI+BaJIepWfHKW1UiIwZ6IxgDkFV3o8KJwh5n
 PuT5dpiZFPyLo1OY0VR4SO1Rdz8Cx2yUVOFw+pYitvxZ0kgJuz/Z49w8Y/W+tGFAao0r
 B3/DfnMxWhV5JOqKDSvI8wGCSkhpVuK+a+rmnqhSVhd0RSEA+VC9wtjA1iN5UTfUJ9Ic
 KdJfBJjYwMb/YSQVluugdJszJnI+mv7zZgN+7FzXCG1pXsGKEHdc8h59C86VRTTe6DR0
 EoqQ==
X-Gm-Message-State: APjAAAVxknS89DE7khjWDwW+ThIzae5709QXGcGce82wdVSzM3M46Clz
 9Q0vjyBCsPBUyIdsJtXIaYUWl+UJ
X-Google-Smtp-Source: APXvYqy7t+MaiMhmrU03sqIManQL59XjP5tmRCzlTRYlrMH2XuCkNNM47MNDx2trNS8z8SRAkQnGzA==
X-Received: by 2002:a2e:7f07:: with SMTP id a7mr4791334ljd.173.1569631380551; 
 Fri, 27 Sep 2019 17:43:00 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id f22sm842744lfk.56.2019.09.27.17.42.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 17:42:59 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 27 Sep 2019 17:42:44 -0700
Message-Id: <20190928004244.22199-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH] xtensa: update arch features
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

xtensa now supports tracehook, queued spinlocks and rwlocks. Update
corresponding Documentation/features entries.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 Documentation/features/core/tracehook/arch-support.txt           | 2 +-
 Documentation/features/locking/queued-rwlocks/arch-support.txt   | 2 +-
 Documentation/features/locking/queued-spinlocks/arch-support.txt | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/features/core/tracehook/arch-support.txt b/Documentation/features/core/tracehook/arch-support.txt
index d344b99aae1e..964667052eda 100644
--- a/Documentation/features/core/tracehook/arch-support.txt
+++ b/Documentation/features/core/tracehook/arch-support.txt
@@ -30,5 +30,5 @@
     |          um: | TODO |
     |   unicore32: | TODO |
     |         x86: |  ok  |
-    |      xtensa: | TODO |
+    |      xtensa: |  ok  |
     -----------------------
diff --git a/Documentation/features/locking/queued-rwlocks/arch-support.txt b/Documentation/features/locking/queued-rwlocks/arch-support.txt
index c683da198f31..ee922746a64c 100644
--- a/Documentation/features/locking/queued-rwlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-rwlocks/arch-support.txt
@@ -30,5 +30,5 @@
     |          um: | TODO |
     |   unicore32: | TODO |
     |         x86: |  ok  |
-    |      xtensa: | TODO |
+    |      xtensa: |  ok  |
     -----------------------
diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index e3080b82aefd..eb0e6047a2ce 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -30,5 +30,5 @@
     |          um: | TODO |
     |   unicore32: | TODO |
     |         x86: |  ok  |
-    |      xtensa: | TODO |
+    |      xtensa: |  ok  |
     -----------------------
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
