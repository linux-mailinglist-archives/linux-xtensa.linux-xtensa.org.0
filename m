Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 2954E1DF15F
	for <lists+linux-xtensa@lfdr.de>; Fri, 22 May 2020 23:42:20 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 85661648E;
	Fri, 22 May 2020 21:27:58 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 1FA0B648E
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 21:27:57 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p30so5594929pgl.11
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCdpqksdEQ8eOMgD/HeQaMyUeYodk/YD8+VXvzwnuBg=;
 b=mi6AGVnD3HKGHYWtiQQx/i5gPZUL3dF201rW6+tZvS1caUZP1SHEv1C+N4m02hlIj9
 LIQn0k8d0q+WgZW+vFsVlgxnv4BFVK4JBtiZ2NuDJTUAyuqcnSNaWlKoMIVq2/qaO6ZC
 jOistPykwRXjN40NpVnhom96ljTid5YbZz/Zphfx1KsusvwUh8OBbI5SSmYoZ3xlQ8X0
 A3QiYAy/tD7AHCInVh1LjqnePq+tATpwigKlo9rspwW6OI8n4SnIMUD9MJgdAppFSErK
 4ffvOEaD+QjaI5ANjrm7xzwsCNLShc8cDDBbyA7INFk1Kt/w6m/CDx+30fWyljbPwIcR
 wjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCdpqksdEQ8eOMgD/HeQaMyUeYodk/YD8+VXvzwnuBg=;
 b=YGw4ChY2T9632jEWhBpenpsvAC2HAZpC+AlsoM+2VD8fwIkaxNwABZnSMAALXN0TQw
 BDKBioMDZYwRQY7iKukM0SWizi1aKJ8Q/n+0F0HaQknSMBEehQpyfA1DaH9YjQjTcFuL
 dEdbSzBPORGwoaViGBs+cfLMCEssXRIEG8uDuXfMzt95pMW5CrtBi9VSqI+iAzdqXmZ8
 56o88x03LNtHHl53+wUEfRZbdifdjp9UcDq/39ZlLUJLm7/xog5dytt8HNi5eHFe6dDD
 GKkAlrtrAkZ6ikDu6RmZfrQAC69M86x/Vd2Aq4mQPh4buas+A/ruUsnWlake76KnTWp5
 +hOw==
X-Gm-Message-State: AOAM530LRuiStZFOSc6TWWvdqTECDkUvhC8xHJpDRjOiCgasQNeHkqxD
 gsbDrihBWBeHhRDGlQJNET7BE2JB
X-Google-Smtp-Source: ABdhPJxQZPeY6JoRt+dhKDmjnybyLwMEeNePFJElDiQpTLZWDm/LDxLF6ztcxWp5WMy9aHAZ7n+ZHQ==
X-Received: by 2002:a63:1103:: with SMTP id g3mr15688372pgl.206.1590183734186; 
 Fri, 22 May 2020 14:42:14 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:d0d2:96ff:22ac:b8e6])
 by smtp.gmail.com with ESMTPSA id 4sm7625098pff.18.2020.05.22.14.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 14:42:13 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 22 May 2020 14:41:51 -0700
Message-Id: <20200522214153.30163-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522214153.30163-1-jcmvbkbc@gmail.com>
References: <20200522214153.30163-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: kbuild test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: [Linux-Xtensa] [PATCH 1/3] xtensa: add missing __user annotations
	to __{get, put}_user_check
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

__get_user_check and __put_user_check use temporary pointer but don't
mark it as __user, resulting in sparse warnings:

  sparse: warning: incorrect type in initializer (different address spaces)
  sparse:    expected long *__pu_addr
  sparse:    got long [noderef] <asn:1> *ret

  sparse: warning: incorrect type in argument 1 (different address spaces)
  sparse:    expected void [noderef] <asn:1> *to
  sparse:    got long *__pu_addr

Add __user annotation to temporary pointer in __get_user_check and
__put_user_check.

Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index 47b7702aaa40..754a7c96b9da 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -84,7 +84,7 @@ extern long __put_user_bad(void);
 #define __put_user_check(x, ptr, size)					\
 ({									\
 	long __pu_err = -EFAULT;					\
-	__typeof__(*(ptr)) *__pu_addr = (ptr);				\
+	__typeof__(*(ptr)) __user *__pu_addr = (ptr);			\
 	if (access_ok(__pu_addr, size))			\
 		__put_user_size((x), __pu_addr, (size), __pu_err);	\
 	__pu_err;							\
@@ -180,7 +180,7 @@ __asm__ __volatile__(					\
 #define __get_user_check(x, ptr, size)					\
 ({									\
 	long __gu_err = -EFAULT;					\
-	const __typeof__(*(ptr)) *__gu_addr = (ptr);			\
+	const __typeof__(*(ptr)) __user *__gu_addr = (ptr);		\
 	if (access_ok(__gu_addr, size))					\
 		__get_user_size((x), __gu_addr, (size), __gu_err);	\
 	else								\
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
