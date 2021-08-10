Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DCDE03E8661
	for <lists+linux-xtensa@lfdr.de>; Wed, 11 Aug 2021 01:19:33 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id DE014643B;
	Tue, 10 Aug 2021 22:50:07 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by linux-xtensa.org (Postfix) with ESMTPS id 602C63566
 for <linux-xtensa@linux-xtensa.org>; Tue, 10 Aug 2021 22:49:53 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id b7so144772plh.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 10 Aug 2021 16:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yCA36GlhulzbAlvlHtt61ilkxjPVScFxCkohpC2ykWk=;
 b=FTA5YoMorv370+N11Fvss0cbmgz8Dj0PUif6S7Mxwx4JFXKANXI2ABB1FsnT+o0aO7
 +2dmeWORjkoqKFVsB7/Qw6zRG/TQvMbVNiCXYy0hSkThjr1EZ39RPTNvShGWWI4kIWlw
 PQ5+QQnfLZVsH+kO/8KgAqDvSSZi0nd73MhtbXiSqDsZV1SW/nAK2uc+p76eAMgF5a2k
 Bh9h8RSzV0hSHuEA/rD5vjlvsiWxHlfme1acpRBbJeZYXHI831TMqbpR1O34+IhbXfBc
 naKZQ3GprWfaZMjIFowhjAFkoqnRgjzOPHc3nKdkiX9e0ox6fsr/OSMedr37X0R/wK/R
 hfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yCA36GlhulzbAlvlHtt61ilkxjPVScFxCkohpC2ykWk=;
 b=GljVF/Urml6CuwE5O8H+ReFUlHiesze89KVGQ1/vXNSV+0BkqfOjydLYuNqOWNb4Qn
 +T2YZglUv3vcTnMVk5HI+IL2xG08f0YvxPYf+j0KsXGpH5AVTvOs1jlGOUsu2r24ZWBS
 OLs8bKrI/VhPyCEYu7YrEZKs55uC10xKjIIs3Mwm5FtyUrEUH7q3+PBMjTUEAY1wViw9
 rFSTzPf9BatHHFhVWlNTBxDr0SH/vD4b3C22kbjLA2RJbfi5//2jgdyQZHsoD6z4lYfI
 VJn2FY587Mupit7h/Qlb+tC193An4eWoCH3o7NeNTj7JWyns/UpZFTDZuenQzgeQx034
 X0PQ==
X-Gm-Message-State: AOAM532MyLfFpEMu9jx487+MPZvnnlWyOTjOOanh3fsQkloUpf3JUxqS
 QRG7Kyb1l87wKZ8C0CD71rI5jQChJVw=
X-Google-Smtp-Source: ABdhPJykvF+abU0cmxkNq6XfHYQRr39iVCwiQ1J/YrOLO9x2Pff7iT0stXbHoYKphiplr7M1q3e9wg==
X-Received: by 2002:a17:90b:3d8:: with SMTP id
 go24mr7433529pjb.235.1628637553712; 
 Tue, 10 Aug 2021 16:19:13 -0700 (PDT)
Received: from octofox.metropolis ([172.56.38.87])
 by smtp.gmail.com with ESMTPSA id dw15sm23117348pjb.42.2021.08.10.16.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 16:19:13 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 10 Aug 2021 16:19:03 -0700
Message-Id: <20210810231903.5778-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: ISS: don't use string pointer before
	NULL check
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

Move strlen call inside the if block that checks string pointer for NULL.
While at it also fix the following coccicheck warning:

./arch/xtensa/platforms/iss/console.c:204:10-11: WARNING comparing
pointer to 0.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/platforms/iss/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/xtensa/platforms/iss/console.c b/arch/xtensa/platforms/iss/console.c
index a3dda25a4e45..8f41c0088220 100644
--- a/arch/xtensa/platforms/iss/console.c
+++ b/arch/xtensa/platforms/iss/console.c
@@ -193,10 +193,10 @@ late_initcall(rs_init);
 
 static void iss_console_write(struct console *co, const char *s, unsigned count)
 {
-	int len = strlen(s);
-
-	if (s != 0 && *s != 0)
+	if (s && *s != 0) {
+		int len = strlen(s);
 		simc_write(1, s, count < len ? count : len);
+	}
 }
 
 static struct tty_driver* iss_console_device(struct console *c, int *index)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
