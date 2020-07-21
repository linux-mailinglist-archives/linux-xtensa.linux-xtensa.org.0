Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 83DC3227BE4
	for <lists+linux-xtensa@lfdr.de>; Tue, 21 Jul 2020 11:38:01 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 1A62C5801;
	Tue, 21 Jul 2020 09:21:38 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 7BF0B57E1
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 09:21:34 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d7so1247397plq.13
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WYIe/jy5Dqr0y+oNjQbbwYu6KlJ30fL8Fok/qL9XnPk=;
 b=n+8EdCnYpI9w4QjiWRKAVS54jZ1Ps1uRqRUyeMZnXiDcZEXJSAelRlHz0Ml+F1dB9w
 fFBlVhu/3eQb2wXD3+96Bq2XlO0LoLyLpTLnOlg0yzKgsjkrjvtCmnVlbgvV+0ieLAZG
 CCTT0VONfgMu7+hMbwOVSaEHRYGxzqLHap34kqpqy2TsGBDWt/1WQb9AlK7/MTXPg41D
 8r44xA1GEWt/a0JFPXlZi4JR7h7DwAHMkFxofBpBZDDl15x0BlC/vPRcLCUmVnND6Tyc
 sDWmNFj604AKKYHszuohS7nTxYkpwr9WcQkGONHCI4XCtw7bYnECs7HfoJIpf2kvKtlX
 h0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WYIe/jy5Dqr0y+oNjQbbwYu6KlJ30fL8Fok/qL9XnPk=;
 b=fgpE0oBRrxSjJwcgY0VZmfJPRAIqX8a7w0QS76ygF4TWxo70n/zKKVZWqvpfkkYNdh
 M2sxsvLFsQ6JrIlt8M8I5AODY9A0z56DO4yYy1wB2FgCoBG+MnbIgGp3oU9ARbTSPRpY
 jaC+c7cihfLOFaYQSXDaiORY5DVhioEEc9N+HFa+sYP/D4WGDj/4AT6RnGooUrAIe29E
 KeXwsqOORpUer3hyYQz2QzgtrJLa0hA+Gqnk5hvw+j2gZhkM9whB84A1Tn7c79JF8YZC
 MQP+l+vKTTZxkJEgdh8vV4Mo9/PLymP9L3gUCQNM4EwnQSjhvoXUEIJ4JE1ofWYfOt5r
 2/cQ==
X-Gm-Message-State: AOAM532PABeeqodLDpYLBnyKl/k2zFdSl60hhxRgdpbd7y7oGczEQbWz
 o/IUr4BOKw5UWrXjm5zArVlLODlg
X-Google-Smtp-Source: ABdhPJx3q2vePBy0C8LqpkO73icb5tIVTFbRJ/bGDIEVo3L/J0CavOVeYQJOv7m9OLf97F7tw0lBEw==
X-Received: by 2002:a17:90b:30d7:: with SMTP id
 hi23mr2989543pjb.69.1595324275934; 
 Tue, 21 Jul 2020 02:37:55 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id g8sm17653264pgr.70.2020.07.21.02.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:37:55 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 21 Jul 2020 02:37:48 -0700
Message-Id: <20200721093748.26627-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2] xtensa: add boot subdirectories targets
	to extra-y
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

The commit 8fe87a92f262 ("kbuild: always create directories of targets")
exposed an issue in the xtensa makefiles that results in the following
build error in a clean directory:
  scripts/Makefile.build:374: arch/xtensa/boot/boot-elf/boot.lds] Error 1
    arch/xtensa/boot/boot-elf/bootstrap.S:21: fatal error:
    opening dependency file arch/xtensa/boot/boot-elf/.bootstrap.o.d:
    No such file or directory

Intermediate targets in arch/xtensa/boot/boot-elf don't get into
'targets' and build directory is not created for them.
Add boot.lds and bootstrap.o to extra-y in subdirectories of
arch/xtensa/boot.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- update boot-redboot/Makefile in the same manner as boot-elf/Makefile.

 arch/xtensa/boot/boot-elf/Makefile     | 1 +
 arch/xtensa/boot/boot-redboot/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
index 12ae1e91cb75..ad341c0fff15 100644
--- a/arch/xtensa/boot/boot-elf/Makefile
+++ b/arch/xtensa/boot/boot-elf/Makefile
@@ -15,6 +15,7 @@ export CPPFLAGS_boot.lds += -P -C
 export KBUILD_AFLAGS += -mtext-section-literals
 
 boot-y		:= bootstrap.o
+extra-y		:= boot.lds $(boot-y)
 
 OBJS		:= $(addprefix $(obj)/,$(boot-y))
 
diff --git a/arch/xtensa/boot/boot-redboot/Makefile b/arch/xtensa/boot/boot-redboot/Makefile
index 8632473ad319..022a76a2282a 100644
--- a/arch/xtensa/boot/boot-redboot/Makefile
+++ b/arch/xtensa/boot/boot-redboot/Makefile
@@ -13,6 +13,7 @@ endif
 LD_ARGS	= -T $(srctree)/$(obj)/boot.ld
 
 boot-y	:= bootstrap.o
+extra-y	:= $(boot-y)
 
 OBJS	:= $(addprefix $(obj)/,$(boot-y))
 LIBS	:= arch/xtensa/boot/lib/lib.a arch/xtensa/lib/lib.a
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
