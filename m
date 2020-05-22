Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 378A21DF161
	for <lists+linux-xtensa@lfdr.de>; Fri, 22 May 2020 23:42:21 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B66416547;
	Fri, 22 May 2020 21:28:02 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 54A2C6524
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 21:27:59 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q9so5622094pjm.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fVUAtXSaWXKY2QT13OooGchGaVr8PVTqlkJIqIUCls=;
 b=cy4Iv1dKrgmFf8HFHiIihXeT9oWaLOFcX1u1xNS9Unjy3U9g7biDlL4hxe7LkC719J
 FkNVSCdFQwEML09RQPogyqLJF7hZonYdZrgu15BM52spOiyUe3YyKKRv5wh/hCiPVWMA
 sRITXFqyl4JxmJQPmbVQk9YiW2pb7BX1K5UxwM+BR9pfgXKlOlFglFW/7aGbqlI7ammv
 MZWvNtpLIVPyFv5psFYbpRL2iowWwVVe0UUhgs0I90tUqHZsEYFrIk3cosGX9kmhvWos
 USZpLWnCmaHoNlbyoMPtENvVpECQp7NrVPImq2t0nfV/BxjRrJ5ZKEsw4qOZ/jki0p8u
 QdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fVUAtXSaWXKY2QT13OooGchGaVr8PVTqlkJIqIUCls=;
 b=XkXhjM8QMlTKW0+soU8ZANrPyxeLcLrI+NIoq2gJ7WJUHk4mUWe51B5rBqV50M3TGs
 IythuN+ttNX0lCOCmLGhaOkwQSRc05OZWkflW5xb6A3jC1AOVW2bf9tDv1qvksKRpywT
 QHQmkAX0BufrhxZ/O0ClF2Tag8371+hRmUBYzNB27LCB/ehsZIywmotiu1Gt1ZpHFOK8
 v2TdJmOfhj9Zhui6m3u9tXyO22KGf9YXxeoDoWlkDrCMjlgEJ9wWJiJScYxarif2eeUT
 zWoftCh8INLHBynrceXe7KDwd1hgNjsjSp4ZWAwdT2SKYl572SVIa7CLD1fqvl/U0dRD
 423w==
X-Gm-Message-State: AOAM531zNlFivVTkSCLIdxW2ZRYW6XCeHKytNsNfV6TZ0G98xmCeXgyR
 B89eUurVUJxh0wBXh1rmwh5fIPnt
X-Google-Smtp-Source: ABdhPJyWoqBNAKwmwX2jgA3ybB8t3HseB65aDPJiYRmvuQhMYa7q3wo6oJvsLtPe9Q8F9aOSJpBfiw==
X-Received: by 2002:a17:90b:f0e:: with SMTP id
 br14mr6547467pjb.78.1590183736327; 
 Fri, 22 May 2020 14:42:16 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:d0d2:96ff:22ac:b8e6])
 by smtp.gmail.com with ESMTPSA id 4sm7625098pff.18.2020.05.22.14.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 14:42:15 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 22 May 2020 14:41:53 -0700
Message-Id: <20200522214153.30163-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522214153.30163-1-jcmvbkbc@gmail.com>
References: <20200522214153.30163-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH 3/3] xtensa: add missing __user annotations
	to asm/uaccess.h
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

clear_user, strncpy_user, strnlen_user and their helpers operate on user
pointers, but don't have their arguments marked as __user.
Add __user annotation to userspace pointers of those functions.
Fix open-coded access check in the strnlen_user while at it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index 445bb4cf3c28..e933ded0d07b 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -270,15 +270,15 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
  */
 
 static inline unsigned long
-__xtensa_clear_user(void *addr, unsigned long size)
+__xtensa_clear_user(void __user *addr, unsigned long size)
 {
-	if (!__memset(addr, 0, size))
+	if (!__memset((void __force *)addr, 0, size))
 		return size;
 	return 0;
 }
 
 static inline unsigned long
-clear_user(void *addr, unsigned long size)
+clear_user(void __user *addr, unsigned long size)
 {
 	if (access_ok(addr, size))
 		return __xtensa_clear_user(addr, size);
@@ -290,10 +290,10 @@ clear_user(void *addr, unsigned long size)
 
 #ifndef CONFIG_GENERIC_STRNCPY_FROM_USER
 
-extern long __strncpy_user(char *, const char *, long);
+extern long __strncpy_user(char *dst, const char __user *src, long count);
 
 static inline long
-strncpy_from_user(char *dst, const char *src, long count)
+strncpy_from_user(char *dst, const char __user *src, long count)
 {
 	if (access_ok(src, 1))
 		return __strncpy_user(dst, src, count);
@@ -306,13 +306,11 @@ long strncpy_from_user(char *dst, const char *src, long count);
 /*
  * Return the size of a string (including the ending 0!)
  */
-extern long __strnlen_user(const char *, long);
+extern long __strnlen_user(const char __user *str, long len);
 
-static inline long strnlen_user(const char *str, long len)
+static inline long strnlen_user(const char __user *str, long len)
 {
-	unsigned long top = __kernel_ok ? ~0UL : TASK_SIZE - 1;
-
-	if ((unsigned long)str > top)
+	if (!access_ok(str, 1))
 		return 0;
 	return __strnlen_user(str, len);
 }
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
