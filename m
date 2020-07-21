Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id CD285227853
	for <lists+linux-xtensa@lfdr.de>; Tue, 21 Jul 2020 07:47:01 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9F2E45867;
	Tue, 21 Jul 2020 05:30:38 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by linux-xtensa.org (Postfix) with ESMTPS id CDE9B582F
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 05:30:37 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l63so11417374pge.12
 for <linux-xtensa@linux-xtensa.org>; Mon, 20 Jul 2020 22:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6bWhgtkGXl6Kr1YSJF6to7Kggw6JeAK3tzV29Pot9eE=;
 b=GpsYhtzNWnN0HW+fNwL7PAgSnz2F9w1gv/tLKcveDJgBQDYxUBUIW6gU5JOOUvk4gq
 amQNfoE0TPH/tgmQdNg7PiG2xDLyq81+78VOrdMoWyy8v3ataKm75lqQV7oNxr46xUiz
 GXvukLmAed2o9wya4/8gkYJMixGJjDSyhUDzFqSYVWHDMzdqR6WlhifWKCH2Ukyr3Ixm
 eupKPDtf3dt7R8lBIIHmbg+sFNGmvUYGZfjOzHugwyjp6mIZcBXsxIrQdIUdFv28WmY4
 ZrDBbvbbZUwVBLCvzpyLOdGcxr85p0BkLTqqkP3d6Bly3HTKzj0QVjB1W6vusWL0+m4P
 5g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6bWhgtkGXl6Kr1YSJF6to7Kggw6JeAK3tzV29Pot9eE=;
 b=Sg5w4JbLsrlkYYAAaXaAZCygDpsoIfMeDzTEV1MzM0fa1PfNDyFmqKMH4k1uEiX0nt
 Y6UmTMlQuy25aDn5lHbSiTftuQNqG6bTDjcNwDOcj8mRbR70z+nYqCNolDKbSFcOxM1p
 xLfg7nN9rOm9cXLekUs8yBj+FLaI0vndPo4ywP+B9TL/qVsYcdn5qIe7vHIqPGAwHtnH
 5MgGbtWycAw0bUvnJc2wWlIra5TNx98uNCasFwAUYJu7EEONG1M8IesdRTH4yOD4rWM5
 f6Jgb/13Q782jb1+jjzQNRL9kPdvvQ/wbjEBMxG3RF7BWIHLNx/s1xtVYBEpvAzxNwbW
 7QCA==
X-Gm-Message-State: AOAM533hkd9vr7fOKvUJz+yP31Ryjm+k5CjF4V84/tWW4/+fH2AKSWeJ
 PMEqDsSBNhqPyCsCFef3jrCue+ly
X-Google-Smtp-Source: ABdhPJzgNyDdEMqcJeYOIQMZCmFsOTkWrzjdoFB6sWgk19l9PRscppjrynFmSdft/NL58YhFviHVkw==
X-Received: by 2002:a62:346:: with SMTP id 67mr23020674pfd.111.1595310418976; 
 Mon, 20 Jul 2020 22:46:58 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id h18sm19110280pfr.186.2020.07.20.22.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 22:46:58 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 20 Jul 2020 22:46:46 -0700
Message-Id: <20200721054646.18497-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: add boot-elf targets to extra-y
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
Add boot.lds and bootstrap.o to extra-y.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/boot/boot-elf/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
index a62a25506536..eb952d809d81 100644
--- a/arch/xtensa/boot/boot-elf/Makefile
+++ b/arch/xtensa/boot/boot-elf/Makefile
@@ -15,6 +15,7 @@ export CPPFLAGS_boot.lds += -P -C
 export KBUILD_AFLAGS += -mtext-section-literals
 
 boot-y		:= bootstrap.o
+extra-y		:= boot.lds $(boot-y)
 
 OBJS		:= $(addprefix $(obj)/,$(boot-y))
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
