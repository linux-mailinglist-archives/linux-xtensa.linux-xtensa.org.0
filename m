Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 2091B19F12
	for <lists+linux-xtensa@lfdr.de>; Fri, 10 May 2019 16:24:17 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9E2B365A0;
	Fri, 10 May 2019 14:22:25 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 6CC59659E
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 14:22:24 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id h126so4283672lfh.4
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rQlD7ioSp0h7pIx6Lzx8IuAt7n8Kwzx7eXyx0CKffz0=;
 b=VjGMoKRfDpe4tEp9Dvuwd56FbPLBTKaJNdKLzvUZqw7/0JvX4MKvSBriEuBW5TpwIr
 MYzRJdQRE0cj4BtXY14xCAOAUY41ZXzKXOxJjrAQ7iMUEglPo/swXrrVQLKAiNVyDr/F
 B6hZsAuA2SdMePVjihX/JVWTEUsqC4QS3GGVcFNdrXX5tRVVVPqZ/ezBfIB5RJW5vPpH
 CGgdNBNnPq0wjReDwWy2tSRhR4Bp/UM2ZcQ+5bHpmTWFvOdvgxZ5QeU4N4fQUZnUfvC4
 15vg6x01OBfwd4Q2XHqO7p3ghhhiPJZ3j9fjkS8HA6j/5e+7VyDsTU/mUmJeGS73II/Y
 ZfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rQlD7ioSp0h7pIx6Lzx8IuAt7n8Kwzx7eXyx0CKffz0=;
 b=g99kNQ1QTorxqiSSw2hezI8D/28e6npF3K0xa/qM/FMA239V5Vm7S1uvtJCrVI+R9Z
 ynVaCJXSu/kg9rnZn/xM7utMeOXozShg9lqJYniexddESo368OXF1N4cu7eNTeLkuaqd
 JKiFoU/RkcIQYcYR090ZbAhQjkTaNSNlwquGwNlandhbWKICBjp3b7H+/CBGHPaQTvfU
 Od8pzgfi/aNQwkEpAPun/AlimVadXmL3SNElA+4J6aXV6kORPqneP+iauQuRJmakRh54
 pca0WzPagWH30tDGnNvnFZsQT4Zcuizi2u0Xw97l4cOovmsLboF4QW/pMzwuo9SxpWJg
 mWgQ==
X-Gm-Message-State: APjAAAWNz9NrX0Bsnujl3NSDcMVMOnAeyxUf7efuqWrb/QjrE0RBlQWw
 pwVu++scpzBF9k4Ug1wVWEA=
X-Google-Smtp-Source: APXvYqx5AIcZj7yILmvTrVXMbxicgqm6HiX+TQMWM9plhjXfFGz8FS5IoLxnQHkwFf+oyACBDl73UA==
X-Received: by 2002:a19:e34c:: with SMTP id c12mr6182530lfk.145.1557498252785; 
 Fri, 10 May 2019 07:24:12 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id u13sm1115181lfg.71.2019.05.10.07.24.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 07:24:12 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Fri, 10 May 2019 07:23:53 -0700
Message-Id: <20190510142353.1977-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Waldemar Brodkorb <wbx@uclibc-ng.org>, linux-xtensa@linux-xtensa.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] preadv/pwritev: fix offset argument type
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

preadv/pwritev don't provide separate version for 64-bit wide off_t,
and default to 32-bit wide off_t, which results in a mismatch between
declaration and definition for user programs built with
-D_FILE_OFFSET_BITS=64.
Make offset argument of both functions __off64_t.
This fixes test misc/tst-preadvwritev on xtensa.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 include/sys/uio.h                   | 4 ++--
 libc/sysdeps/linux/common/preadv.c  | 2 +-
 libc/sysdeps/linux/common/pwritev.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sys/uio.h b/include/sys/uio.h
index aa766f9b1187..330426fec492 100644
--- a/include/sys/uio.h
+++ b/include/sys/uio.h
@@ -59,7 +59,7 @@ extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count);
    This function is a cancellation point and therefore not marked with
    __THROW.  */
 extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count,
-		       off_t __offset) __wur;
+		       __off64_t __offset) __wur;
 
 /* Write data pointed by the buffers described by IOVEC, which is a
    vector of COUNT 'struct iovec's, to file descriptor FD at the given
@@ -71,7 +71,7 @@ extern ssize_t preadv (int __fd, const struct iovec *__iovec, int __count,
    This function is a cancellation point and therefore not marked with
    __THROW.  */
 extern ssize_t pwritev (int __fd, const struct iovec *__iovec, int __count,
-			off_t __offset) __wur;
+			__off64_t __offset) __wur;
 #endif	/* Use misc.  */
 
 __END_DECLS
diff --git a/libc/sysdeps/linux/common/preadv.c b/libc/sysdeps/linux/common/preadv.c
index fd9dde4b999c..6a07d5df87e0 100644
--- a/libc/sysdeps/linux/common/preadv.c
+++ b/libc/sysdeps/linux/common/preadv.c
@@ -21,7 +21,7 @@
 
 #ifdef __NR_preadv
 ssize_t
-preadv (int fd, const struct iovec *vector, int count, off_t offset)
+preadv (int fd, const struct iovec *vector, int count, __off64_t offset)
 {
   unsigned long pos_l, pos_h;
 
diff --git a/libc/sysdeps/linux/common/pwritev.c b/libc/sysdeps/linux/common/pwritev.c
index bef5bcf69b46..f07c40e6de3c 100644
--- a/libc/sysdeps/linux/common/pwritev.c
+++ b/libc/sysdeps/linux/common/pwritev.c
@@ -21,7 +21,7 @@
 
 #ifdef __NR_pwritev
 ssize_t
-pwritev (int fd, const struct iovec *vector, int count, off_t offset)
+pwritev (int fd, const struct iovec *vector, int count, __off64_t offset)
 {
   unsigned long pos_l, pos_h;
 
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
