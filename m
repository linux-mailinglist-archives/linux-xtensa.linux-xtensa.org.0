Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 4553315219C
	for <lists+linux-xtensa@lfdr.de>; Tue,  4 Feb 2020 21:53:52 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id F35E13A8A;
	Tue,  4 Feb 2020 20:42:55 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id B2A593A7D
 for <linux-xtensa@linux-xtensa.org>; Tue,  4 Feb 2020 20:42:54 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id w1so89775ljh.5
 for <linux-xtensa@linux-xtensa.org>; Tue, 04 Feb 2020 12:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XGw9Wx48OKqeNnYi+RLHHnKp7pVid3+5LH/C2zZtrt8=;
 b=TyPSv8vGchI1QFAhjqj0qj1EBTH2dSA2MkWr7K3eswC4BIGuE2RV3YgDdos186MsaE
 G5rNZl+9J057xoRHizAsQs6aOsQMr8JUwv+WyYSqnP44NqkMy9BmEWDsUyvlrybbnQBh
 pvMmOlzvsICnNyQN5yspm+yKx/omtF6Y4JLctQBLYGVRDLFZWGD9mlqSfALeuQ4RVrDp
 B1y81kVSL8LAjr7k16PfEA+2cKKuMVrRT11nzPl2yur5f5Cw0wL0GAoXTVGRoFmVlcB5
 jr8dilVi2urb1H2GDQFw2yy+GeDEHlqG2nPi6FN1/79Nj2yl/kkTqg4ZjX9krjQgCuK4
 rD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XGw9Wx48OKqeNnYi+RLHHnKp7pVid3+5LH/C2zZtrt8=;
 b=DJyGwfdz/w9qB6oMPNzR6W/kGvs5oU+EPlbLcly2uQt3Cc6mY8Td5231uY/qtW/u5Q
 047R5UErSJxXRGmfm5r03gr4Xg3XQai/MdfsigFNZdf+dgV/Z8O8b1Ll7FPGSjP7j1yg
 we52b45BYD1MQhlCGQtm8X7xSUHtIWXDBfW1kpVhmiaK03SN061ozF0yCSZelX6HTFj7
 YkMm7Y1msFHAUNt2z0YA6tV3/xLnoaOVojA/jMaXPevCn9+WtpRaRoj+YEdvl+3fvqBz
 yiynIVVtAoF8S1qLLxKG+i0uIm+N0McZvz+/FIgkQpTduttHLGV0sitPX81V1VgIK17x
 qtvw==
X-Gm-Message-State: APjAAAUH/t2JUC3y7cLvzCAGjNQ/BR1xQnR591myYZLrQDbkNgP9vu7p
 N3amJ6PeC+/ts7aivBCAH7PSP9b3Wf4=
X-Google-Smtp-Source: APXvYqysRN6sKxpVLbGmg/3Mc5htHi7LmUG3oBsarjTqAl7kYYWrAG+JZRUsIub5Ge6cFI+RVVqqLQ==
X-Received: by 2002:a05:651c:1bb:: with SMTP id
 c27mr19107818ljn.277.1580849628650; 
 Tue, 04 Feb 2020 12:53:48 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id y5sm10913112lfl.6.2020.02.04.12.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 12:53:47 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  4 Feb 2020 12:53:37 -0800
Message-Id: <20200204205337.32547-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: ISS: improve simcall assembly
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

Drop redundant result moving from inline assembly, use a1 and b1 values
as return value and errno value respectively.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/platforms/iss/include/platform/simcall.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/xtensa/platforms/iss/include/platform/simcall.h b/arch/xtensa/platforms/iss/include/platform/simcall.h
index 2ba45858e50a..111bcc5d0dc0 100644
--- a/arch/xtensa/platforms/iss/include/platform/simcall.h
+++ b/arch/xtensa/platforms/iss/include/platform/simcall.h
@@ -66,19 +66,17 @@ static int errno;
 
 static inline int __simc(int a, int b, int c, int d)
 {
-	int ret;
 	register int a1 asm("a2") = a;
 	register int b1 asm("a3") = b;
 	register int c1 asm("a4") = c;
 	register int d1 asm("a5") = d;
 	__asm__ __volatile__ (
 			"simcall\n"
-			"mov %0, a2\n"
-			"mov %1, a3\n"
-			: "=a" (ret), "=a" (errno), "+r"(a1), "+r"(b1)
+			: "+r"(a1), "+r"(b1)
 			: "r"(c1), "r"(d1)
 			: "memory");
-	return ret;
+	errno = b1;
+	return a1;
 }
 
 static inline int simc_exit(int exit_code)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
