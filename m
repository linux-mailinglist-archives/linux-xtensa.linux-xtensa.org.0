Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 997A34199CA
	for <lists+linux-xtensa@lfdr.de>; Mon, 27 Sep 2021 18:57:43 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6B9386975;
	Mon, 27 Sep 2021 16:26:37 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by linux-xtensa.org (Postfix) with ESMTPS id B09C26972
 for <linux-xtensa@linux-xtensa.org>; Mon, 27 Sep 2021 16:26:26 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 u1-20020a17090ae00100b0019ec31d3ba2so4663142pjy.1
 for <linux-xtensa@linux-xtensa.org>; Mon, 27 Sep 2021 09:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aVNQ/TSsFCpHmH8roUzHH7XvMBrRFI54b0VHaTyCBAo=;
 b=H2Xr5yJsBofJ/L/K2Flfee0MrlLW+ZGJJrFO6lbGWTaUDBcZejvtb2ieSHb+Bbw2ZZ
 Vk4gxdiUZvSLZIs2Le2caEJehi/oaWfRhLnDG4pxebjQmt0k7zkaAXOxpiaFG4rZv3p3
 hiyXHRhWeepe9Bpde8CGoev4fTdTy/KAzSAMCFJm7YWiJDj52u/dklOyA2ofzWqKC9uN
 3u7FjBj3BjGrs9gfk9onOkssEoetu96nAlDI+qzitgSTbEr3LOEuyVIZKVgF0R3h2UYn
 Z+7ssBzfqMlg/NLIeJwACpOeRZvwjvirJnriJMZjNVKzeD+4XQnvJO6Ug7nRU288Gb/w
 Zf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aVNQ/TSsFCpHmH8roUzHH7XvMBrRFI54b0VHaTyCBAo=;
 b=iW+ci37In9bAQftSat6TspvQHaOBciJ/RNTPr4vsVKConwHFMAUQss+HwQhXEmWU8W
 /D0bOGpX+eu3OqXGSF/mNu/XSZRtkddUslN7+ks3tF8cEI/t+aXSBijQbruq5eYDfYYd
 YE8UvZNFvmFa/VzaKufcBPk9IXynO3LlWNOdR9xAqG0/c5G0RU2/50lFqfXBFB256ZDQ
 8JD9pOHeOvHYddxyud0dW+iVmaqhMD6B50r5zPECCh6rLmvO4yWX1J5MziTHgWrosY6T
 oOFAsFoCLXEJJ9uTewKCMNKE3plWFZUe7DvmKM+FSmxc3o3pNbNp+vMvG5sT4V1lrnqN
 e2bQ==
X-Gm-Message-State: AOAM530DdhhvOq6WIET06X4ohtpL/ogeMbobucwT4y9tlpAOFWg9wBWP
 hhIc4g4/B5JAeJCV2nSIsKMMCFLFRpE=
X-Google-Smtp-Source: ABdhPJxJXBOKwYLop10cvnqJmzrtdGdUQxPxtN2GE6+btno8uowYMKey7A3sNNHXf7NdbYYeSdH+dQ==
X-Received: by 2002:a17:90a:1a19:: with SMTP id 25mr145642pjk.34.1632761847787; 
 Mon, 27 Sep 2021 09:57:27 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:ecea:c8ec:ff7b:52])
 by smtp.gmail.com with ESMTPSA id n22sm2686769pfa.220.2021.09.27.09.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:57:24 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 27 Sep 2021 09:57:06 -0700
Message-Id: <20210927165706.22938-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: call irqchip_init only when
	CONFIG_USE_OF is selected
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

During boot time kernel configured with OF=y but USE_OF=n displays the
following warnings and hangs shortly after starting userspace:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/irq/irqdomain.c:695 irq_create_mapping_affinity+0x29/0xc0
irq_create_mapping_affinity(, 6) called with NULL domain
CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-rc3-00001-gd67ed2510d28 #30
Call Trace:
  __warn+0x69/0xc4
  warn_slowpath_fmt+0x6c/0x94
  irq_create_mapping_affinity+0x29/0xc0
  local_timer_setup+0x40/0x88
  time_init+0xb1/0xe8
  start_kernel+0x31d/0x3f4
  _startup+0x13b/0x13b
---[ end trace 1e6630e1c5eda35b ]---
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at arch/xtensa/kernel/time.c:141 local_timer_setup+0x58/0x88
error: can't map timer irq
CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.15.0-rc3-00001-gd67ed2510d28 #30
Call Trace:
  __warn+0x69/0xc4
  warn_slowpath_fmt+0x6c/0x94
  local_timer_setup+0x58/0x88
  time_init+0xb1/0xe8
  start_kernel+0x31d/0x3f4
  _startup+0x13b/0x13b
---[ end trace 1e6630e1c5eda35c ]---
Failed to request irq 0 (timer)

Fix that by calling irqchip_init only when CONFIG_USE_OF is selected and
calling legacy interrupt controller init otherwise.

Fixes: da844a81779e ("xtensa: add device trees support")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/kernel/irq.c b/arch/xtensa/kernel/irq.c
index 764b54bef701..15051a8a1539 100644
--- a/arch/xtensa/kernel/irq.c
+++ b/arch/xtensa/kernel/irq.c
@@ -143,7 +143,7 @@ unsigned xtensa_get_ext_irq_no(unsigned irq)
 
 void __init init_IRQ(void)
 {
-#ifdef CONFIG_OF
+#ifdef CONFIG_USE_OF
 	irqchip_init();
 #else
 #ifdef CONFIG_HAVE_SMP
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
