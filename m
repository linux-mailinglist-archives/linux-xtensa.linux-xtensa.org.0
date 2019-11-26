Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6E75B10A4FD
	for <lists+linux-xtensa@lfdr.de>; Tue, 26 Nov 2019 21:01:23 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 89D596461;
	Tue, 26 Nov 2019 19:52:36 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 5BF63377C
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 Nov 2019 19:52:35 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id s22so2678913ljs.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 Nov 2019 12:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9gYplPhtVE/YGLO3x1smraYGKvZdNPRdzDgfUGwplws=;
 b=GIRldqEdiwGN3YNe6c76Ggzly2TLHRFCWdEE02G+zF+8N2KcF8j+jZ7WokzK3KR1jo
 /yPaNkdQ0wHsOvzOfc/G7e+o6IifetbIk+4AiYUdw6r/FbJKR1y0htKWfJQiYuSzTiI6
 DosXBqB1wRDvH6FY5kC4YS7TjMZaLBpwXex/yrgMIpL8f13YiVi2lUSE3rs1r2p5urn+
 yxOGgZAJ+vHP4NVbQfWv14U0yXnPuqRtpRAwPApmMtb1cviCfSs/aUuO4+zCgIT8ecPB
 WttE4aMeG8NTlccrGQsIbB9JmiVoRfRr8gLGSKByL7PSvln/J5CBgFA0nBzYm3II9pyv
 l+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9gYplPhtVE/YGLO3x1smraYGKvZdNPRdzDgfUGwplws=;
 b=dtRDPXJN/Ug6NM1LpeMa18ysckmKg3lj7CYhNbayQ1aBeP+4Bi6H4fjVkhausRrsNt
 68i7h8Txr26F6M+cDZCfkaC/wvU0DTpIrfW8BQFdtCbl8AVqslJNhVSccZpBHKyLsAhV
 NFNeaWhbG2tKj4GEqBEY4K0R1ukpyRK/sYtO9gmRNVXavljRujzkLA+4iXSo9PNIHoPe
 wm/wAxSI9Y2XdkzVzDqCcEiXE6PMbXJrabfQQC4yr4ZWFcIdoT22JQJoF+k8fxu4LMRy
 WCbAoolzsM26pcukDV6GZ31MyeF+2Ze7Nj7V054jT6N+YLsl8TDfTBnldw4HMfqau/fj
 UUAQ==
X-Gm-Message-State: APjAAAVJuw/0L9YvP5m8vH6nM6a+MaRg/RxtUO/S+wNwHJjK2GecxKpe
 P+Wuj7Yzcr2LXIaSQg4Y5U2C0tj20Po=
X-Google-Smtp-Source: APXvYqxMydKAw0SnQ/rYZD0FFMTLmbLErH0qXFuFIDX2swa/M1Ot0o1BirTQP/nA/jNMfD5RfERQkw==
X-Received: by 2002:a2e:81c1:: with SMTP id s1mr27477310ljg.83.1574798479363; 
 Tue, 26 Nov 2019 12:01:19 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id g11sm5767129lfb.94.2019.11.26.12.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 12:01:18 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 26 Nov 2019 12:01:07 -0800
Message-Id: <20191126200107.13008-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: stable@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix syscall_set_return_value
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

syscall return value is in the register a2, not a0.

Cc: stable@vger.kernel.org # v5.0+
Fixes: 9f24f3c1067c ("xtensa: implement tracehook functions and enable HAVE_ARCH_TRACEHOOK")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/syscall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
index 359ab40e935a..c90fb944f9d8 100644
--- a/arch/xtensa/include/asm/syscall.h
+++ b/arch/xtensa/include/asm/syscall.h
@@ -51,7 +51,7 @@ static inline void syscall_set_return_value(struct task_struct *task,
 					    struct pt_regs *regs,
 					    int error, long val)
 {
-	regs->areg[0] = (long) error ? error : val;
+	regs->areg[2] = (long) error ? error : val;
 }
 
 #define SYSCALL_MAX_ARGS 6
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
