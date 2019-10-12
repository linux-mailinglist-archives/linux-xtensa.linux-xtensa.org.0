Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C0E05D4B64
	for <lists+linux-xtensa@lfdr.de>; Sat, 12 Oct 2019 02:37:32 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8EB44583D;
	Sat, 12 Oct 2019 00:30:14 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 66FC55821
 for <linux-xtensa@linux-xtensa.org>; Sat, 12 Oct 2019 00:30:12 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u28so8203109lfc.5
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 17:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOU51IFsj1iWUWTwrZgYX0bBua/cZqGBz0E2pjuMMik=;
 b=UTJP5c51u97TZQgmSLoRxAc925Tkumx8EJcmpN2Qa463ReM1bWUp4aN9rj4Wo8FsfU
 19TbDGA3FzoulgBqb/PHvZtLhF0VqxWCVzjh+aju5wXruPSLQFPp8TKPQn2j3y43lLvR
 /ML1Y+T3xSkUA7U3uRn/a4eihlQ3sOFHA8kWUGTrMJIVVIszwHEx3VyMY71qjM/p4ggy
 ofLUpySc3mRtQYwcolnmzLyVEhvtu6n6vqUpfIuY/6zfiLtRZyHxIbrxLQqTf3E50p7a
 ce3FP1VdZICSAfhGh7+Cl3B0M7f6I5DKs8lNG574GxL+KO0twj3+ZjcjOb7C4khywNUR
 9IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOU51IFsj1iWUWTwrZgYX0bBua/cZqGBz0E2pjuMMik=;
 b=MHIhH8MeAm6e7jAWXzodK+cavJ13TYp4PRSGE6S2Vg+GJAxU9vUGghD+MwxwdGp7w9
 2ADlURFD4eJ5FKNaRwd45eUcxY5wxEo6L68qQfZdNxQaYh0x1CTmoSTQijsWDEzD+ywo
 Mr7qhaV2LMFHks9oiFwtvHNQSHD4Xexu7z2Tv7DxVuEPR7ClmIBxBnfdRWGlRmLTiEKU
 jAYStKCdOiLLXSIQQYJTcRl2L6lvHuEgcS6TfFbW+1rc8MxMLIL2mzU5GEgBLJ7DoBkH
 d9oedtwTOgoJPETFa7HcT9QoRItMx+D08sO8K0pZ4Jk3uzik7uMI1H6zDEZEmq25d2mH
 vSbw==
X-Gm-Message-State: APjAAAXSBnK/1rP4AwRmfTXGX8A1JqbGkwalf2stImcX8LswXzB7OCkP
 ebGJ1+Ar9ivvgJhRR+hVKhWYN7URcu0=
X-Google-Smtp-Source: APXvYqyh7VUEelfBevfxp2ozULTq0Wc4+EN6WACxzJmxXe54N++ulhT3aTDtgkmJ0xTyoatL6FeAjw==
X-Received: by 2002:ac2:5bc1:: with SMTP id u1mr10487452lfn.182.1570840648861; 
 Fri, 11 Oct 2019 17:37:28 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id f22sm2346620lfa.41.2019.10.11.17.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 17:37:28 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 11 Oct 2019 17:37:05 -0700
Message-Id: <20191012003708.22182-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191012003708.22182-1-jcmvbkbc@gmail.com>
References: <20191012003708.22182-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 1/4] xtensa: fix {get,
	put}_user() for 64bit values
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

From: Al Viro <viro@zeniv.linux.org.uk>

First of all, on short copies __copy_{to,from}_user() return the amount
of bytes left uncopied, *not* -EFAULT.  get_user() and put_user() are
expected to return -EFAULT on failure.

Another problem is get_user(v32, (__u64 __user *)p); that should
fetch 64bit value and the assign it to v32, truncating it in process.
Current code, OTOH, reads 8 bytes of data and stores them at the
address of v32, stomping on the 4 bytes that follow v32 itself.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index 6792928ba84a..f568c00392ec 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -100,7 +100,7 @@ do {									\
 	case 4: __put_user_asm(x, ptr, retval, 4, "s32i", __cb); break;	\
 	case 8: {							\
 		     __typeof__(*ptr) __v64 = x;			\
-		     retval = __copy_to_user(ptr, &__v64, 8);		\
+		     retval = __copy_to_user(ptr, &__v64, 8) ? -EFAULT : 0;	\
 		     break;						\
 	        }							\
 	default: __put_user_bad();					\
@@ -198,7 +198,16 @@ do {									\
 	case 1: __get_user_asm(x, ptr, retval, 1, "l8ui", __cb);  break;\
 	case 2: __get_user_asm(x, ptr, retval, 2, "l16ui", __cb); break;\
 	case 4: __get_user_asm(x, ptr, retval, 4, "l32i", __cb);  break;\
-	case 8: retval = __copy_from_user(&x, ptr, 8);    break;	\
+	case 8: {							\
+		u64 __x;						\
+		if (unlikely(__copy_from_user(&__x, ptr, 8))) {		\
+			retval = -EFAULT;				\
+			(x) = 0;					\
+		} else {						\
+			(x) = *(__force __typeof__((ptr)))&__x;		\
+		}							\
+		break;							\
+	}								\
 	default: (x) = __get_user_bad();				\
 	}								\
 } while (0)
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
