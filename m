Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C5FE0D6989
	for <lists+linux-xtensa@lfdr.de>; Mon, 14 Oct 2019 20:37:51 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 0270E64E0;
	Mon, 14 Oct 2019 18:30:27 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 49AD264D4
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 18:30:25 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id l21so17651330lje.4
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RHQWl4a7XYYaUMpaWJ2GQY2+geZUVjru17E6roiTtQw=;
 b=TD5dyDKcWK4+FykiOtCSndRZdAjLcRKcV92T/ARKTpccWryZbKcDsUtPprzxtMWxMT
 vaqAbchpzJttdJZdtDPKqCF+2OzYPTcqmP2ixWrlXAFziKLOFPXt3dyqBe0V+7W4uquI
 rF0mYLnByEh7m1h4anz+TJW6e8SAH+PAsqsWedHa95eC8jk4x4kx610jtVJjUTqvpP15
 GjeKZYof23gq96+8QamufLoulgKyCimzGoNrJpAgyLlQIS4JiARuMDYh4SOIE8qNl0iz
 4xbF5Ym1XfKqj8EP81/+d8rDYyQUvpQvBKjRCJh6mYAcm14GH7atqA3lfuTrezqzQ5vw
 0H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RHQWl4a7XYYaUMpaWJ2GQY2+geZUVjru17E6roiTtQw=;
 b=FMmQVEkxPFnxWvA7c11tJ6BEBfKz6DZ7WPcbEHp61i7JR4izpYqunzGj+WZvc6Cxj5
 hzWeVfF/LfzCTbv48dhtIY9F5srsFfv8u07T9EU1LzO6mf/bVfyxgKieMuoJX90ZOG8l
 4hzDG4juCxzhUKB+yrueIZ5i8kK31VhS9v49xq0327c5f5NUdmyga9HdJE04xO0+uBa8
 thp0oK1ZLIq8mdjQAnujG7Km13hnZBNFxS1/PS6vthdGTzkkgq5QCzl/Ynax7Tfw1sCR
 B+JXPEbZQbuGRz11R3ONCJT9JiM/B7uJ9snNpXLx4T79sPV4ZD+GZ/xkmtJeiA3ykmnv
 48fA==
X-Gm-Message-State: APjAAAXketrKUC9F8Wm9prZLMpxgFmsHZKK66fa40QsBBo8q1hWUyu0c
 IsSkW8//j3tiZPHa3419+jcCiloV
X-Google-Smtp-Source: APXvYqx444PdMGosxwBPWXhCOfOIBintZIBeSiKSIhNO6+nvGNQX9ly3So4JDDe8hC8zlyNapFqdLA==
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr19544785ljm.243.1571078267049; 
 Mon, 14 Oct 2019 11:37:47 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id q19sm5451457lfj.9.2019.10.14.11.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 11:37:46 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 14 Oct 2019 11:37:26 -0700
Message-Id: <20191014183726.18248-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: merge .fixup with .text
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

Section .fixup contains pieces of code, merge it with the rest of the
.text section.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/vmlinux.lds.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index 01e3112cdb27..c64abc15d38f 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -117,7 +117,7 @@ SECTIONS
     SCHED_TEXT
     CPUIDLE_TEXT
     LOCK_TEXT
-
+    *(.fixup)
   }
   _etext = .;
   PROVIDE (etext = .);
@@ -126,10 +126,6 @@ SECTIONS
 
   RODATA
 
-  /*  Relocation table */
-
-  .fixup   : { *(.fixup) }
-
   EXCEPTION_TABLE(16)
   NOTES
   /* Data section */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
