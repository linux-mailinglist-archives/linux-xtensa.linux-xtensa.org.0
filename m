Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 18EBD2ECBDF
	for <lists+linux-xtensa@lfdr.de>; Thu,  7 Jan 2021 09:46:06 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 18BEF57E0;
	Thu,  7 Jan 2021 08:23:54 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by linux-xtensa.org (Postfix) with ESMTPS id 127FB262C
 for <linux-xtensa@linux-xtensa.org>; Thu,  7 Jan 2021 08:23:52 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id m6so3444116pfm.6
 for <linux-xtensa@linux-xtensa.org>; Thu, 07 Jan 2021 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HrQdC79g1547Cub9HyNCNkUMm+sW+/UdWIggwNdYI/g=;
 b=NAzRv3tud6PaDOV2l04VQZbdUqv68e2GukP4UKAOdSle/koKsxPgi/RskcRj9QZGSg
 TTLIvAKoiMeKjREt/yRnfg1KgQE76/3Qii13tB2exbSWXCsrCsjMBrPiauJQi10oR18T
 ULKVS1PoCPE2L0ltbBbMAASA71pWGaIt23m/wKdB8Rx0RZ6PvQQx/E+5NOfW26MD9A3M
 HKD9MCPlT2m/gRldc4XCdmz5GJ3uDqeLD8RHNJS+W9l/knHNGmYDQBkz3H1JsHMaGpWa
 WlOugz5D9JQZ5ssMjGrRIrU+a0U7E92qkrBMbiD2ngrm/ltT4+w60LIrcrxTxWGUTfOM
 ETlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HrQdC79g1547Cub9HyNCNkUMm+sW+/UdWIggwNdYI/g=;
 b=KbFZ5FgTgLg7/rkPhdRP2WCJGCzlSlaouvK3NMbqegWq1wWSy6Zj7BcDhXgbm1H+yO
 lRBqD3sYsSvJnk77p7cw7sjNR1BJ5BbMOf92+wB94ha9IjWcqUpkxsi8qaJBHo1vXzEe
 JqBL/WdnxlM71F3EXTCm63z7pWz/OPHCDFfcIZ7R9i6kMmjVdZS87pEfhl8hA3kO9/A5
 birFRVl7beD24iurjSSHiQKsl2hCCViN+wAylguAiI2Pnej4IE1xQFipGlANlvhkXdqI
 bsgXTrVILgFD5qT+dTpCBMTFqvPV1ysxFHNzYwVvGVYTdHoV1m1U/o1d85V/eVxJG9NB
 /Kdg==
X-Gm-Message-State: AOAM531GpJHZhUuItIKD8Bp1SpwUyYIvwJohMyl9opzxf6hOqJeYWrWF
 Ot1xc1EoT/DypOOr176mBEQ=
X-Google-Smtp-Source: ABdhPJzb3QsiWOXCtiydodgEw43O/exYpWVwr6rLoVbfx080AoG1eYb5lu7njRFVpM9gh3WEVmewHw==
X-Received: by 2002:a63:2e05:: with SMTP id u5mr804609pgu.239.1610009162152;
 Thu, 07 Jan 2021 00:46:02 -0800 (PST)
Received: from octofox.cadence.com ([2601:641:401:26c0:5caa:fe49:9c90:e47c])
 by smtp.gmail.com with ESMTPSA id z23sm4822607pfn.202.2021.01.07.00.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 00:46:01 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Thu,  7 Jan 2021 00:45:30 -0800
Message-Id: <20210107084530.14611-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] extra/locale: fix gen_wc8bit diagnostic
	output
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

Diagnostic for missing UTF locale is printed to stdout instead of
stderr, fix that.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 extra/locale/gen_wc8bit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/extra/locale/gen_wc8bit.c b/extra/locale/gen_wc8bit.c
index 8031df1cf4a5..110541ad5ccc 100644
--- a/extra/locale/gen_wc8bit.c
+++ b/extra/locale/gen_wc8bit.c
@@ -121,7 +121,8 @@ int main(int argc, char **argv)
 		}
 
  locale_failure:
-		printf("could not find a UTF8 locale ... please enable en_US.UTF-8\n");
+		fprintf(stderr,
+			"could not find a UTF8 locale ... please enable en_US.UTF-8\n");
 		return EXIT_FAILURE;
  locale_success:
 		pclose(fp);
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
