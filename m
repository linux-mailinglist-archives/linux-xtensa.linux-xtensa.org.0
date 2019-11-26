Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0F32C10A4B8
	for <lists+linux-xtensa@lfdr.de>; Tue, 26 Nov 2019 20:50:24 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B96DB3AD9;
	Tue, 26 Nov 2019 19:41:37 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by linux-xtensa.org (Postfix) with ESMTPS id 05CA72D7F
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 Nov 2019 19:41:37 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y5so2407615lfy.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 Nov 2019 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yToflPu1v9gopWp0ead2H9oQlGYqjKSS8AgQAzzNRyo=;
 b=DRlgVBlM0CYsPktev3AHOiRnXXvGT0hwbIqiT6T6mcvhr4RhMj76va4GkjQyq3mCyn
 7NYwmnxoUGmS8fRbSBOD1Iqpr8d9udA3YcTmAshJqZFLN543eooDtj6fi+w/IGyxE1u9
 ibdhhmx/Ik6ohhlFtOQIlfy2+8KC3AGfAj3cqfyDkTLnrM5Ar+BoftY92A7Gwohokk8Y
 AO+pJN1UnDu0oAfPjDDBHKt/GnEbCmrn2xf+VN4Q79ycs89vcpY37s2GBZB0dj1een9r
 fsGRDZD5eYIEfJ3iziKGvcDJL83B2d/+XzDqLFBVDG36yR158GtU7k1cyl68gvhk11pJ
 6HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yToflPu1v9gopWp0ead2H9oQlGYqjKSS8AgQAzzNRyo=;
 b=hUoFgY33nguEvUF1qJiAUOIqH0wzR/0R5GgDvuFu7tS15MFALEdXIeivf3dHh77o8V
 Z7lAsyXGZTJ47TkAQ48VqGZDdFfPHpwX0+gtq54oEyAnPdp2MlTmtjle92LI4lxU5E+2
 +3nBIhWS9575CViiYpiXiD3YQnMoUM6zWTdN7DLMIBEvinwWR0yvdnWwNGGerHng7+sD
 qsMOoquExGxmCwB+p6LccEisaA+0ntmNX/8aze3t3O5NOYczmFDr7vFXDo3bQILUUjfV
 dqfdjvEUDyzcWBZPaK7wtzYBfumXaqp13F0VeQN317BAAD5wYrrUjJDBLfmabp+xMqvJ
 lKJA==
X-Gm-Message-State: APjAAAX41I425O6tH7TAEUMM4BsbJwa9jy6bWQbFTuF4Q//mkvGvVIku
 x4XtZfB+ApZDyQuOBILM7Ej0wYV5q8A=
X-Google-Smtp-Source: APXvYqxw2Mop/i0LLPlggD/2oG3tNfB0YpUWJ6g4kX7hMtK82hPlV4rvCdpvCMvF4WXCmx/H0VKUPA==
X-Received: by 2002:ac2:57cb:: with SMTP id k11mr25706032lfo.87.1574797820996; 
 Tue, 26 Nov 2019 11:50:20 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id j81sm5778314lfj.26.2019.11.26.11.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 11:50:20 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 26 Nov 2019 11:50:09 -0800
Message-Id: <20191126195009.12811-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: drop unneeded headers from
	coprocessor.S
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

A bunch of irrelevant headers is included into coprocessor.S. Remove
them and add necessary asm/regs.h.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/coprocessor.S | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/xtensa/kernel/coprocessor.S b/arch/xtensa/kernel/coprocessor.S
index 80828b95a51f..bb8e499b9900 100644
--- a/arch/xtensa/kernel/coprocessor.S
+++ b/arch/xtensa/kernel/coprocessor.S
@@ -15,17 +15,9 @@
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
 #include <asm/asmmacro.h>
-#include <asm/processor.h>
 #include <asm/coprocessor.h>
-#include <asm/thread_info.h>
-#include <asm/asm-uaccess.h>
-#include <asm/unistd.h>
-#include <asm/ptrace.h>
 #include <asm/current.h>
-#include <asm/pgtable.h>
-#include <asm/page.h>
-#include <asm/signal.h>
-#include <asm/tlbflush.h>
+#include <asm/regs.h>
 
 #if XTENSA_HAVE_COPROCESSORS
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
