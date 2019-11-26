Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 83E6D10A48B
	for <lists+linux-xtensa@lfdr.de>; Tue, 26 Nov 2019 20:30:50 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 42CD564BF;
	Tue, 26 Nov 2019 19:22:01 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 0650E64B8
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 Nov 2019 19:22:00 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id e9so21576516ljp.13
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 Nov 2019 11:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N1fma/rzZbsK0KgJkH5gDE4TEHvO2HL1ft3nAMVM09o=;
 b=DH9OE1isC9wMnuJMDGOHRni1GwxOUfsJU0ywmLSPLdfWPuomlkUHP8ykBHs1KwwoNZ
 IJftDyO+OQGKxgrWaR0Bird2WXdpg7JQ9WPQTWKm7kLMz5l8yTUSlLy9lR6+twon3BEh
 EB6ZMe5P7AwiA+ntl+Nn8ygQu1ODMZv5/opG4sn7DXVu57YHDoSxUbWgOblojTYE5OiK
 6bpufoW/OvY8x5WIF4Ugk/rykcm4PGNjfe4M7+WT1L9t2ngWMLGuZy5LhvaJbQV+cYRT
 865N738hDX8lXfnjCAPGvdp10UKPvPSQjjmjkLYLAW8NOmVywCz/EaS7QwF/z0HlnYgV
 sXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N1fma/rzZbsK0KgJkH5gDE4TEHvO2HL1ft3nAMVM09o=;
 b=RXyu4tK2l7XNBeagiZrc+x95XSMzg5EmT29kZR4RckXOBAScWgQfZs3mvGgVos1w0N
 GE25317IlBdZau3pbTdkokMO87KnYYe8OCFYkEdCSQsmVlsbssVea+0GKxRUM9wKx1J6
 ddZ3ETdWHDbiW3acBuskvPKRxS3YFbjpfcvC4LPhx+IU+tpmZfNAqElS0iSMKxrSgs54
 2Ar/7A0yyIeKd1gn+lhOYu5CEdsKoDgfmwzx6fnmOND/XN5g/ULq/NsGChbT1w854O6a
 5zk7kYPYFrpJqYiPLiE8rmCWb9Olr+GNYfBYQSFCyJ0iInTNLZ9MP1WFY6GaC7C1aSJU
 TAJg==
X-Gm-Message-State: APjAAAU4wRIQKkt72L6C/9BLqR64uV4aCgJteBHdTuEPc1FFwVNfLkQ5
 2ZcNenJ1G9+qsQgMyYCi3zQ0NV0h
X-Google-Smtp-Source: APXvYqx9/2noQaJq7x/KWqh0xaR3KlZk66kcGXCNzZVnDIkbRFG0nnLsPyaQcfSma3Bx0Mn7mgvzSg==
X-Received: by 2002:a2e:894b:: with SMTP id b11mr28263730ljk.118.1574796643636; 
 Tue, 26 Nov 2019 11:30:43 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id m18sm6134434ljg.3.2019.11.26.11.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 11:30:43 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 26 Nov 2019 11:30:27 -0800
Message-Id: <20191126193027.11970-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Baruch Siach <baruch@tkos.co.il>, linux-gpio@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [Linux-Xtensa] [PATCH] drivers/gpio/gpio-xtensa: fix driver build
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

Commit cad6fade6e78 ("xtensa: clean up WSR*/RSR*/get_sr/set_sr") removed
{RSR,WSR}_CPENABLE from xtensa code, but did not fix up all users,
breaking gpio-xtensa driver build.
Update gpio-xtensa to use new xtensa_{get,set}_sr API.

Cc: stable@vger.kernel.org # v5.0+
Fixes: cad6fade6e78 ("xtensa: clean up WSR*/RSR*/get_sr/set_sr")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 drivers/gpio/gpio-xtensa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index 43d3fa5f511a..0fb2211f9573 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -44,15 +44,14 @@ static inline unsigned long enable_cp(unsigned long *cpenable)
 	unsigned long flags;
 
 	local_irq_save(flags);
-	RSR_CPENABLE(*cpenable);
-	WSR_CPENABLE(*cpenable | BIT(XCHAL_CP_ID_XTIOP));
-
+	*cpenable = xtensa_get_sr(cpenable);
+	xtensa_set_sr(*cpenable | BIT(XCHAL_CP_ID_XTIOP), cpenable);
 	return flags;
 }
 
 static inline void disable_cp(unsigned long flags, unsigned long cpenable)
 {
-	WSR_CPENABLE(cpenable);
+	xtensa_set_sr(cpenable, cpenable);
 	local_irq_restore(flags);
 }
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
