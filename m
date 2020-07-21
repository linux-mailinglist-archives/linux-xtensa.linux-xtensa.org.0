Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3C14F228BC4
	for <lists+linux-xtensa@lfdr.de>; Wed, 22 Jul 2020 00:00:46 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B31AE5800;
	Tue, 21 Jul 2020 21:44:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 686D742EB
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 21:44:20 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x8so10839427plm.10
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 15:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdNcuQK0NXb9O+sBfaHLVJivIhqCAN5FeOqzQif1mJk=;
 b=Wskphfs/cMN5rdywSMJMV4e4u/ThVaEMleo4waV8I+8i65tE9ErTUq89Q7RQF9CKNf
 iQGt8UiObHNjCqCKWfciSW/Eo6TiY+shrgK8EzRJeNZJ3zmEEfEYl1kjTKdD8FSj8JeP
 Wp7IpCT1WqS2zhRy6Ru28EEUPqHxdKSY567pQIz6Om7ntqpzz60JdWHZnANluR5jfwsM
 S/vOzD4FDNHuAHDwoRuKOifqTDhxw1k26DuayJqSS1/8AVOHw86LIo1J+5TDuM1DNqQy
 Z0EEi5fJhwX63P7sRoF+sqmKvIF5ZvL6AhF2tQXbJejOg2XJc5ouz4zKmMBT5QgOdQGv
 Tg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdNcuQK0NXb9O+sBfaHLVJivIhqCAN5FeOqzQif1mJk=;
 b=QjGRMwvAP4omkX4hFHNj7IHw3YH9OD2Wi/F0k7fugmaXlKPUT2+WX5did7xwgeg8CW
 tPon41VjLwQYrDCh+QyYkbclty4y0kbvMNGj/zqxScKRronyqHEoQvKj4AO9RL0312RL
 2mtbmUPvgCiT3AkbpOVYvThEI7QBb07Y0cPOkABH7RUtehTI7xRlKonnOntk2/1KsoDo
 LP6YcaFbmV0rW80hWJPMhBBj/jylmZGh1hM3p8Nd9nnqFD8VtgACD85squZcod3oIJQE
 ZKTreeUORy4bPFjr80Ru2spnD7o990mg6OwmJgCHPaLJnEMvldkjjMDmRyQsjp57uWEa
 Hlvw==
X-Gm-Message-State: AOAM5325HxnpIZbe+Mxo7DC8R/jmKJ1QlSZclVmf8zybuf7is+6W79rk
 K+iCYWX7U2M+AnQhJOVqYqYj1WGh
X-Google-Smtp-Source: ABdhPJzDxZFymjNgcSR3l18ygAmdv4lsoT9yT3V3JP5Rwk0QYQI7U8yzNU7v1MmO+QQZLJQKl/R+qA==
X-Received: by 2002:a17:90a:db17:: with SMTP id
 g23mr7187756pjv.180.1595368842718; 
 Tue, 21 Jul 2020 15:00:42 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id q96sm4453920pja.0.2020.07.21.15.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 15:00:42 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 21 Jul 2020 15:00:35 -0700
Message-Id: <20200721220035.32584-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix access check in
	csum_and_copy_from_user
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

Commit d341659f470b ("xtensa: switch to providing
csum_and_copy_from_user()") introduced access check, but incorrectly
tested dst instead of src.
Fix access_ok argument in csum_and_copy_from_user.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Fixes: d341659f470b ("xtensa: switch to providing csum_and_copy_from_user()")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/checksum.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/checksum.h b/arch/xtensa/include/asm/checksum.h
index d8292cc9ebdf..243a5fe79d3c 100644
--- a/arch/xtensa/include/asm/checksum.h
+++ b/arch/xtensa/include/asm/checksum.h
@@ -57,7 +57,7 @@ static inline
 __wsum csum_and_copy_from_user(const void __user *src, void *dst,
 				   int len, __wsum sum, int *err_ptr)
 {
-	if (access_ok(dst, len))
+	if (access_ok(src, len))
 		return csum_partial_copy_generic((__force const void *)src, dst,
 					len, sum, err_ptr, NULL);
 	if (len)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
