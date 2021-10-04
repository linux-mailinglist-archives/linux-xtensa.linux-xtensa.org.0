Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE0B42050D
	for <lists+linux-xtensa@lfdr.de>; Mon,  4 Oct 2021 05:14:19 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 774167191;
	Mon,  4 Oct 2021 02:43:02 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by linux-xtensa.org (Postfix) with ESMTPS id 81705718F
 for <linux-xtensa@linux-xtensa.org>; Mon,  4 Oct 2021 02:42:59 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id y1so10128567plk.10
 for <linux-xtensa@linux-xtensa.org>; Sun, 03 Oct 2021 20:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKnjjVOVAOCInl/nMgbxZfi/GBeRFnh4ynzj/tmEXRI=;
 b=kpLA465SHWMY05MKq0WxlBMzhIp3REP3vUwciyH55Un7boa2U2LWarStF9LHxVzvVI
 fJuobPWki3xq7eiK2VHUwVkqAbYp2F0yf/fov8LuiD35leNWSFTchCM04SQim4ymMSHC
 Pxpkl7SFe9cUZOGEglSBtHh8PD2WpCUDt3FfMfbSZnB4Ow5ok6SDlKZNJF9TVugsRUry
 +Tr8SWeq4e6PeSJJqoblTg69kQi2FCQu5LOmID/wZccTAs3r5YDOD7MyKkywbHhV9iJt
 wViCUeKWHj9JSoVmv5w+/+VTCvCZlifbS4GDLAbm6Ktgl6sKKj38htMuaIrXNKg9CipJ
 ZDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKnjjVOVAOCInl/nMgbxZfi/GBeRFnh4ynzj/tmEXRI=;
 b=Uk20aMJ/x8JcxM2hWrAclfUxAAZS9bUtSQ0Trl2qaeBWhPfANVyWBdUBz/VsC0Khzs
 5Zp/vq4ANxGGZ5E8MtJK9dIBoluWjXdo/1pXkv7BuIpp3pw2OG6tjHk5IEg1SqJok85W
 8ZY/kUdZQdwSaPthfbr2e6lQA7mNiOCy9nzDYrVdvqIxCrAjtmcjrFoW7aulgEcXxe47
 ddCOEiG2ZXuwf2d8LiuXs2YZr9P43O+N62G1wplo9x8PDbZ1vZNZ0nEY1nPU0GJlbQu7
 yCwnQqBcGDi8c4Uy0bsHIrxSRBZLQ+4txAJ8GKFAE8I/+oF/JzZWzlF+2POEVtEOgIP4
 T1gQ==
X-Gm-Message-State: AOAM531wkohOy4kGDhJbQAW4tSrjIN3jjDBewRk2t9UhVvvrTRkeUqsV
 bED6IgWn//LA62Vh++G1ZCBSd7NsnG8=
X-Google-Smtp-Source: ABdhPJy8WjH+EK+vaTNiU+WotRSwzTTUkUu4dhGqhndTit+hx8sYVCPmpILJIvG5KBYU0nsZHCnvOw==
X-Received: by 2002:a17:902:6947:b0:13e:8e8d:cc34 with SMTP id
 k7-20020a170902694700b0013e8e8dcc34mr12787700plt.88.1633317254581; 
 Sun, 03 Oct 2021 20:14:14 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:ecea:c8ec:ff7b:52])
 by smtp.gmail.com with ESMTPSA id h2sm11035776pjk.44.2021.10.03.20.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 20:14:13 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sun,  3 Oct 2021 20:13:41 -0700
Message-Id: <20211004031341.20297-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: xtfpga: Try software restart before
	simulating CPU reset
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
 arch/xtensa/platforms/xtfpga/setup.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
index 4f7d6142d41f..9b1e36b06530 100644
--- a/arch/xtensa/platforms/xtfpga/setup.c
+++ b/arch/xtensa/platforms/xtfpga/setup.c
@@ -51,8 +51,12 @@ void platform_power_off(void)
 
 void platform_restart(void)
 {
-	/* Flush and reset the mmu, simulate a processor reset, and
-	 * jump to the reset vector. */
+	/* Try software reset first. */
+	*((unsigned int *)XTFPGA_SWRST_VADDR) = 0xdead;
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
