Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5BCD6BEC
	for <lists+linux-xtensa@lfdr.de>; Tue, 15 Oct 2019 01:03:15 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E92C152E3;
	Mon, 14 Oct 2019 22:55:50 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 6EE7C52D3
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 22:55:49 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v24so18215762ljj.3
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 16:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCusZAkrcZ4ZRCDa64eloCvPpn0C4UDSNHBdnBBFEmI=;
 b=OGNS1yJ2ZEKMc9LhJWOC4YbRhyYE3gk7jajs//SVrsomWsZogyfPDGEb+ELb3ey4IQ
 EJQaJ1XCSY0a0pqSyMl2i7rbeoy/GTuFnegBhneM8msS5dPfLhjGuhZ0dbn5RBVyVTcx
 njqu7lgSAn3R37n6MdeWYSSH+LdfbQ4eYXw92l7sJv2z5QKVKxD3mLx43Q0mTmJUcptM
 qVOLofFnSVQTH/1Jjp4AYH2JqiLUd/P/68YNy/D7oJ/mnLdJjwJmtIkG0Spuy/D+9SkJ
 TDNyvCD5Q3man1vhIw5YgLPSDqkXacSa7lTecVpmYFh1Lxi2Aiq8gqN9FdIrb0tEwHn7
 JtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCusZAkrcZ4ZRCDa64eloCvPpn0C4UDSNHBdnBBFEmI=;
 b=Rtg/DaaRiu905U99QLvuq/VdTM26VJXrX8mMCT94b6EJ8svd2IkVt++6DEv5Pacd/T
 e4QwGdO1BBJCAQ1CL8+rFE2DSFMXjmdkQF6rlc4CKFM/icOFNGJpnKhjt/m7os7dIpeN
 Zlb799TyfKFTTEiUnQ82UDwVwR3hbQyE3+pz8Fsi8bA0R3eRrZfOtY8QX+iSvZSg5Mu8
 MsOBeWU5XT3RHs8g/MF9bdEwbPsjuHyx0jgk/8808WsVvYL5KwJwTLkeUqzrBftPhR1c
 oZ1IXxGLsVRMiC/buiewlniUTVLyKfi5u+Pvsxwj/PBb6t94KwlhTUMU8UPRZiAiVgbW
 bwzw==
X-Gm-Message-State: APjAAAWb+iKVNlznLveuLrcTfMeV2vGer/poEDpcon8gzGb87e70a0ca
 t1hjZE6wtH4yUyx6HerE868yVLHfntY=
X-Google-Smtp-Source: APXvYqyQwy5fFzQse1Ru/lbFy39DH1oVTqT2Hjvxyih4k53mCh1/BGbICIAg6XyHf0JRPxONEorpqA==
X-Received: by 2002:a2e:85cf:: with SMTP id h15mr20230406ljj.109.1571094191473; 
 Mon, 14 Oct 2019 16:03:11 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 25sm4727681lje.58.2019.10.14.16.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 16:03:10 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 14 Oct 2019 16:02:59 -0700
Message-Id: <20191014230259.31618-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: stable@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: drop EXPORT_SYMBOL for outs*/ins*
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

Custom outs*/ins* implementations are long gone from the xtensa port,
remove matching EXPORT_SYMBOLs.
This fixes the following build warnings issued by modpost since commit
15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions"):

  WARNING: "insb" [vmlinux] is a static EXPORT_SYMBOL
  WARNING: "insw" [vmlinux] is a static EXPORT_SYMBOL
  WARNING: "insl" [vmlinux] is a static EXPORT_SYMBOL
  WARNING: "outsb" [vmlinux] is a static EXPORT_SYMBOL
  WARNING: "outsw" [vmlinux] is a static EXPORT_SYMBOL
  WARNING: "outsl" [vmlinux] is a static EXPORT_SYMBOL

Cc: stable@vger.kernel.org
Fixes: d38efc1f150f ("xtensa: adopt generic io routines")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/xtensa_ksyms.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/xtensa/kernel/xtensa_ksyms.c b/arch/xtensa/kernel/xtensa_ksyms.c
index 04f19de46700..4092555828b1 100644
--- a/arch/xtensa/kernel/xtensa_ksyms.c
+++ b/arch/xtensa/kernel/xtensa_ksyms.c
@@ -119,13 +119,6 @@ EXPORT_SYMBOL(__invalidate_icache_range);
 // FIXME EXPORT_SYMBOL(screen_info);
 #endif
 
-EXPORT_SYMBOL(outsb);
-EXPORT_SYMBOL(outsw);
-EXPORT_SYMBOL(outsl);
-EXPORT_SYMBOL(insb);
-EXPORT_SYMBOL(insw);
-EXPORT_SYMBOL(insl);
-
 extern long common_exception_return;
 EXPORT_SYMBOL(common_exception_return);
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
