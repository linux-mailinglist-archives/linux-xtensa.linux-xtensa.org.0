Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 30D9134BA87
	for <lists+linux-xtensa@lfdr.de>; Sun, 28 Mar 2021 05:19:15 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 41EFD32AD;
	Sun, 28 Mar 2021 02:54:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by linux-xtensa.org (Postfix) with ESMTPS id 25CD8262F
 for <linux-xtensa@linux-xtensa.org>; Sun, 28 Mar 2021 02:54:26 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id e33so7186729pgm.13
 for <linux-xtensa@linux-xtensa.org>; Sat, 27 Mar 2021 20:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RDTKvBCVKjC/zYD9EfD0mis7wtW44rX7PdGU3QAJOQI=;
 b=KUxwJzYMAjcWXqiyybqPQmni8ZusZ2fRqGbTKJ5dmZnkXw6k6rVxLcrAjQFNE3GKf1
 VS4oU9F3yN0124Zo84apcURnk2Mh8JV/SBn5q4pqz1EdBMP5o5Tdz5o+Y/va+PVNOyFN
 KDYTU2ujAVt9IX+dhAT9DuGL3aNyEgvNLE3mh4r+OD7MuFuvyb5pfa8dmgh3zE5WEiOC
 +75C1ogiizG0L6a8cjW2o6I80mNAXzBFJi2HltlUt4+VCin5ohSDge7q2KLGqIib5uDS
 2bXPFadLb0Nit2KTyKSDhOoOLzURyA9N4wZGdDlagSWiy4OMfkMxzBW649y0bBKZHWDm
 RqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RDTKvBCVKjC/zYD9EfD0mis7wtW44rX7PdGU3QAJOQI=;
 b=Aw/i/sMh7YEl2JCl2GN1oILaQl7aILXtTOZgPDo98gjFRENAjTiTejeCKedwOA91vb
 l/uTVnHHEiMVchSA6hsz+6BlfrgdPHHkZgLEnK2sKfinqnNXMJ4sBb9cqHX+kipkt4VR
 KE0YjLNBZujC10Czmj7tDQvf5VyhRjzT6yZ0A+OpK7eN4tqw+USofmW6tWZjUrPUnIHN
 qwt/wt/ujp/1PFUlWtqDlYQS91QDA0GZEHlYB1NA0a9S6lXjLC9eSf5o89e6nLjV9olN
 KHS+GLnbod1jYcciYlXpOMYSkckAmRtgc5vIPOWsdWMSZ5NsGeQarghebF1YYCYVyT3j
 4v6A==
X-Gm-Message-State: AOAM530jgTSyQ64bOlzVvPYsKUOI2y9zWf6ETl2Q4ctfaVyzq6BHIFvd
 gMdceBT8o6t3pXHx2rMFVxvaNe/+ZDI=
X-Google-Smtp-Source: ABdhPJzPYD1/1R/laSJC/8BtJU58yNv0hciWN9qdxavWp/hYaPcA4DtCPROgjC3u6WmvbIv7+sSDeQ==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr12091838pgq.237.1616901547050; 
 Sat, 27 Mar 2021 20:19:07 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id w1sm12523998pgs.15.2021.03.27.20.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 20:19:06 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat, 27 Mar 2021 20:18:48 -0700
Message-Id: <20210328031848.8755-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix uaccess-related livelock in
	do_page_fault
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

If a uaccess (e.g. get_user()) triggers a fault and there's a
fault signal pending, the handler will return to the uaccess without
having performed a uaccess fault fixup, and so the CPU will immediately
execute the uaccess instruction again, whereupon it will livelock
bouncing between that instruction and the fault handler.

https://lore.kernel.org/lkml/20210121123140.GD48431@C02TD0UTHF1T.local/

Cc: stable@vger.kernel.org
Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/fault.c b/arch/xtensa/mm/fault.c
index 7666408ce12a..95a74890c7e9 100644
--- a/arch/xtensa/mm/fault.c
+++ b/arch/xtensa/mm/fault.c
@@ -112,8 +112,11 @@ void do_page_fault(struct pt_regs *regs)
 	 */
 	fault = handle_mm_fault(vma, address, flags, regs);
 
-	if (fault_signal_pending(fault, regs))
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			goto bad_page_fault;
 		return;
+	}
 
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
