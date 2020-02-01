Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 54D3D14F746
	for <lists+linux-xtensa@lfdr.de>; Sat,  1 Feb 2020 09:40:00 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 928B4657D;
	Sat,  1 Feb 2020 08:29:10 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 8308B6577
 for <linux-xtensa@linux-xtensa.org>; Sat,  1 Feb 2020 08:29:07 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id 203so6430564lfa.12
 for <linux-xtensa@linux-xtensa.org>; Sat, 01 Feb 2020 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSDkEF5ez2wjkXf4Go4yhjiXCk7S4uDoyQFmbe77IR4=;
 b=Cn3/RCudP5NV4UFQX0A1WhMd40uy25cheJKGENtbHHCwwo70POE2k45EktcJWEsM1I
 a/opqFwuKEIR7hKpwdeu9/PzDTqd/IXl6Sk0Vv9aF+/w5RnFsI8UEb+MOw97Hzr5lvIw
 d8mtIueRCSI6Hj1c9otqi2u2o8sZemsBAJiQPYCauN1rc0+gObUYIO7TVslOdQK35LNQ
 h73G+15ozn+ZpAKTobJVySmCStvnFJejPINKHyd861rx1tYhEK2RuzaSFG66xJWSTnlu
 cbS0Wq/gBocjD6OHEIDZIjOnLFIyMbG9zp1RMUJKHqQJlQAup+rUI8vqqbre6SuWXS5J
 13BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSDkEF5ez2wjkXf4Go4yhjiXCk7S4uDoyQFmbe77IR4=;
 b=dXer4dTchcdd8jEHnyuUXaH7m+OaEImT1ffi0WuYydSxuQoFY2UbFDUHdptNCKD78q
 P0l4J63yfTi6mmDQet8BuX97zHiIfWVkzRh2TabAOxmmfVr2AzrWmS62T2YX7kWSp45B
 kBTccH/HWRyLV4kgb1VfyYbvThh94nlK1V1dLl5bjyTPsKhqO0dw+2UVEgSQyvT2mDcZ
 e5uUNdPLI5PHWiWip0QtyKbZZxRDy7ZGc0hoS3IeHcOdNobz4GRZYCtsN9ZR9yrielrL
 Gs2ipq4yyCTidxqDE8LaD2nsYKIdW3vUUMyTwvTuZkEP507sL61ebU05UgB/BMtlSwPO
 p4fQ==
X-Gm-Message-State: APjAAAW+Qa+1bW+MQVzYm2B+PO+a8+b03e3i78ik6dNqHWXv1/UtNapZ
 S7pm4ne60NyBAv0lXwCBRSj8i4Moksk=
X-Google-Smtp-Source: APXvYqxPwjYdeHr1kUwf+plhiWZ3JKx09mdaomSNAOWU3+icKl5mh6DefSF9giuf78TfBaU/yRPk1w==
X-Received: by 2002:a19:e011:: with SMTP id x17mr7616279lfg.59.1580546394849; 
 Sat, 01 Feb 2020 00:39:54 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id f21sm4175718ljc.30.2020.02.01.00.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 00:39:54 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat,  1 Feb 2020 00:39:39 -0800
Message-Id: <20200201083939.23565-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: drop unused function
	fast_coprocessor_double
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

fast_coprocessor_double is not used since commit c658eac628aa ("[XTENSA]
Add support for configurable registers and coprocessors") remove it.
There should be no coprocessor exceptions generated in the exception
handling paths while PS.EXCM is set.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/coprocessor.S | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/xtensa/kernel/coprocessor.S b/arch/xtensa/kernel/coprocessor.S
index bb8e499b9900..c53ce6d8794f 100644
--- a/arch/xtensa/kernel/coprocessor.S
+++ b/arch/xtensa/kernel/coprocessor.S
@@ -145,13 +145,6 @@ ENDPROC(coprocessor_flush)
  *	     <  VALID_DOUBLE_EXCEPTION_ADDRESS: regular exception
  */
 
-ENTRY(fast_coprocessor_double)
-
-	wsr	a0, excsave1
-	call0	unrecoverable_exception
-
-ENDPROC(fast_coprocessor_double)
-
 ENTRY(fast_coprocessor)
 
 	/* Save remaining registers a1-a3 and SAR */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
