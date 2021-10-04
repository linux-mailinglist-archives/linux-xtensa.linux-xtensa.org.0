Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C7E2642196F
	for <lists+linux-xtensa@lfdr.de>; Mon,  4 Oct 2021 23:45:59 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2BF1B744F;
	Mon,  4 Oct 2021 21:14:41 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by linux-xtensa.org (Postfix) with ESMTPS id DC9C07442
 for <linux-xtensa@linux-xtensa.org>; Mon,  4 Oct 2021 21:14:39 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u7so15611123pfg.13
 for <linux-xtensa@linux-xtensa.org>; Mon, 04 Oct 2021 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jnVUz7cckIzuOpFBzdErFnhTI+WjBJRaEaWrDbGSfDs=;
 b=Czpbi/3Bpn9+3YBD9owvuQYZnnr0sSH+KNYORW3yjVZRrBQDpf9rrGPBsojMISMe5r
 CVOFjSGpetj7UTT8eCgFhdKaZuh/4TZn+DBNaf9Kq2/rvKcbUHlypXztCdTMiGWpulFZ
 9KSameZ2qta1WVf6b3cPco2qjVJMOoaJLfHxeCNHFhibkpDP6WFVhA2nqF7XSuWXAMtM
 3L19kAsi7sxQPENYWpvZzy4+YHeY5+EykwHCcI/DxYUCbBpqd5W+H8cyJF2Ga9VDmdvQ
 RP+lQCKR3ZlIeVpUw0rnS5XsG94xNMYdCeK3SBnNYF8lyummYVKcYAlsig+Im3jwGIaJ
 0WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jnVUz7cckIzuOpFBzdErFnhTI+WjBJRaEaWrDbGSfDs=;
 b=4QsfICQRsS2PhAe35AYhl4UnE0ACGrMBnp3mK7dMhXdxcnHqj41QXMfEcvFZtPAox3
 PIycmrli3eNCMkHmXhcTocu8j/A4twL64no/9345draROoA1/z7w2Fr67qn+DsFXne8U
 h3BTU6PsENsWFPkvnkdQPxDYOeq/97Z3iK0FRr+8mN6fmoSkqYDfi5uhyiQ324H/y9V5
 /ohjYPPtwelfgZ6O1aOQxfTDOFuKdy1k4rpPpOtYdfYfZaEg/1dOLq46kkOEN2pGuojO
 oBEnjdKwGcyk3tgLpjkQrRLR4izZnYjn7akIGetOsTn6ZyMJSFwzqpbcbzwlHTryg9ep
 cdXg==
X-Gm-Message-State: AOAM531QnkuUwQvz37Q+ItYnSn8Te1U8xRWFyDlPuwlxI3VNBR17ogoQ
 zrGiOP+cqluE3nRysccoW8Mi0w3h/Uo=
X-Google-Smtp-Source: ABdhPJyQPQk7tibakHPa9HyUtQ344H/8GVmDY3hLpiJcwvGGK9meGllYjQA2vnTr438dx44dBt4jvw==
X-Received: by 2002:aa7:8116:0:b0:44b:e0d1:25e9 with SMTP id
 b22-20020aa78116000000b0044be0d125e9mr28136977pfi.53.1633383956496; 
 Mon, 04 Oct 2021 14:45:56 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:401:1d20:ecea:c8ec:ff7b:52])
 by smtp.gmail.com with ESMTPSA id x11sm9372609pfh.75.2021.10.04.14.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 14:45:55 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon,  4 Oct 2021 14:45:44 -0700
Message-Id: <20211004214544.20167-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2] xtensa: xtfpga: Try software restart
	before simulating CPU reset
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

From: Guenter Roeck <linux@roeck-us.net>

Rebooting xtensa images loaded with the '-kernel' option in qemu does
not work. When executing a reboot command, the qemu session either hangs
or experiences an endless sequence of error messages.

  Kernel panic - not syncing: Unrecoverable error in exception handler

Reset code jumps to the CPU restart address, but Linux can not recover
from there because code and data in the kernel init sections have been
discarded and overwritten at this point.

XTFPGA platforms have a means to reset the CPU by writing 0xdead into a
specific FPGA IO address. When used in QEMU the kernel image loaded with
the '-kernel' option gets restored to its original state allowing the
machine to boot successfully.

Use that mechanism to attempt a platform reset. If it does not work,
fall back to the existing mechanism.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- use WRITE_ONCE instead of simple assignment

 arch/xtensa/platforms/xtfpga/setup.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
index 4f7d6142d41f..324f1f2aba09 100644
--- a/arch/xtensa/platforms/xtfpga/setup.c
+++ b/arch/xtensa/platforms/xtfpga/setup.c
@@ -51,8 +51,12 @@ void platform_power_off(void)
 
 void platform_restart(void)
 {
-	/* Flush and reset the mmu, simulate a processor reset, and
-	 * jump to the reset vector. */
+	/* Try software reset first. */
+	WRITE_ONCE(*(u32 *)XTFPGA_SWRST_VADDR, 0xdead);
+
+	/* If software reset did not work, flush and reset the mmu,
+	 * simulate a processor reset, and jump to the reset vector.
+	 */
 	cpu_reset();
 	/* control never gets here */
 }
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
