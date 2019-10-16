Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 089B4D8924
	for <lists+linux-xtensa@lfdr.de>; Wed, 16 Oct 2019 09:14:10 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id EED436497;
	Wed, 16 Oct 2019 07:06:42 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id F13C052E3
 for <linux-xtensa@linux-xtensa.org>; Wed, 16 Oct 2019 07:06:40 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m7so22839741lji.2
 for <linux-xtensa@linux-xtensa.org>; Wed, 16 Oct 2019 00:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJB3DgxYbX/jUqMyf+pgAYm9//vAPvM7RBIypiauqNc=;
 b=V6GrRUh8+pYJ2lOqM+Ya8lwdm+PkHXo8h04IYauYp0srqj6Xt+xYRg53QigHN7Lqqg
 O7uB49jV/vjMsfD8WnWi1ShTXmxeDYeE19mheNa41hInMzkmXY39CuVjnWwrHNc7713C
 AajWxJgjElBW9pGPXWsYmk8Ck1jjRbSDPwaPQQIYaiMPu4zA/0jfDGt0QytgDfYlV54S
 isqcLgTZ6JxxCh4MAM0Gq1LVKBSfdPVsibV1B/00ISKERqXfcqpfi9/mD3ThWRgn3ocw
 z8ClL6ay/SRbIWwwkOKrUYOZH1vg6XZwtM/sy1cmP+x6xdbmRTlzhKPblBYlf5bBbzQT
 Pr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJB3DgxYbX/jUqMyf+pgAYm9//vAPvM7RBIypiauqNc=;
 b=NX736u7Znds9tFgmbe5OuyvhXZSGOAz+mhbsYyPu5IxiMHwRq1aOPtsQz3j0Jjoclk
 p3MKdEYaRQ7XL0Chs6I+c6tGzdOCwiT8KYrk+76U58VyqoakPNShuJxnPgiXFPlLJpFo
 XBbGAryKQWLoKQuFcbyAFw4ftD19qfA5vJbH2sdsvf6DwWBYJ+lqZbAxHzd184dfAq0P
 UIuxbUQnatYc/P9+WMzjjoi/eAt0+ClYcxmKd/Tb/TuF4CcpTva62OAIML3MbUYxkWdI
 1kK4T8gfRlVVzV0jCUTnMZwjfohLu0HNMY8JhxXlTaPZutPpGu8vIF9eayL5q/GvFjSK
 kSTA==
X-Gm-Message-State: APjAAAUzavZFDHllKtds5HKj7JxYlSv3XU6aEugR9q/JhcmkG1QJ5tzH
 +k/udEfxvaJOTzwzu4d+qzPX5YqyP1I=
X-Google-Smtp-Source: APXvYqz73v2r6f0Pn5w3kKhOZhIFnhyNWeusiYXhxa3078eViBbB4ZbBn+msOI48WG4JODLnSNTpmQ==
X-Received: by 2002:a05:651c:1b9:: with SMTP id
 c25mr24015130ljn.163.1571210045684; 
 Wed, 16 Oct 2019 00:14:05 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id q19sm8182454lfj.9.2019.10.16.00.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 00:14:05 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Wed, 16 Oct 2019 00:13:52 -0700
Message-Id: <20191016071352.27688-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: stable@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix change_bit in exclusive access
	option
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

change_bit implementation for XCHAL_HAVE_EXCLUSIVE case changes all bits
except the one required due to copy-paste error from clear_bit.

Cc: stable@vger.kernel.org # v5.2+
Fixes: f7c34874f04a ("xtensa: add exclusive atomics support")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/bitops.h b/arch/xtensa/include/asm/bitops.h
index aeb15f4c755b..be8b2be5a98b 100644
--- a/arch/xtensa/include/asm/bitops.h
+++ b/arch/xtensa/include/asm/bitops.h
@@ -148,7 +148,7 @@ static inline void change_bit(unsigned int bit, volatile unsigned long *p)
 			"       getex   %0\n"
 			"       beqz    %0, 1b\n"
 			: "=&a" (tmp)
-			: "a" (~mask), "a" (p)
+			: "a" (mask), "a" (p)
 			: "memory");
 }
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
