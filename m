Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5971DF2BC
	for <lists+linux-xtensa@lfdr.de>; Sat, 23 May 2020 01:11:16 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 812DB64F8;
	Fri, 22 May 2020 22:56:57 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by linux-xtensa.org (Postfix) with ESMTPS id D02C164F2
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 22:56:54 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id m7so5016141plt.5
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 16:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XwLJSYwASLEYgULcmxjHMYHm0gclCEZFExWcoADNDfk=;
 b=iqA7xGFH7nRzZSARF8J/6I87gXVGh2PeDk3JEKv2iZubsvfzUBXuI4+LMaQN/t5r73
 GxdIq3VmZYudQHfuCUBKXnoOEGklNrGsoBld+BCQJuSPZ5puYurVTAtOvqGVEizDcfnO
 dKZUzJA5p+9vV8xarJqChzjMdOUsTQnJzK3J9QWkk54jp7awFsugw4+nAjBNMkZT1rOp
 RAxAprQIszHXmayLMUAMIb7XqpQYhRwbqmJR69p7VJ56HF3l4Eoa4NSFxfSeS7TSjcHp
 4jMlmdQt34zQIhx5j8tuLcqneY31xwXOV+gzEpToqFrpH5koOfnGUMO/ZhzDvR6bv94X
 XJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XwLJSYwASLEYgULcmxjHMYHm0gclCEZFExWcoADNDfk=;
 b=ZkR0/uaCmgKspiL0s4X0yqp1vGV7KfyA4KFL7tAor2hZf2SU+L1oWTjtsk9EG/7jCO
 2xOGdmzWM7mSpt+YlrYfMJFLm8WKnrCMpbd5uDoegJhAo7Yoo/WPD4npbrPp8UQEgZrt
 WmK+gH9Go3WjRItdV+KZl2yxsUtFgVxX/ns68T5gNx9RFJLdYZQEKdzNuTHhFmh9qyUq
 DhoKJ7wZ3SSYXocGNN7h2Cl9neggiAX62sZzWZP+2yLTB8sJTWeZ6iV9ZM8ZYDLTElUt
 l1Q1QlZi+28MGB1LaxA0O2gnxf6okjcFVYK46vcSLdQWQmsgR0AFzg4iqa5gXYBtuqh4
 GOtA==
X-Gm-Message-State: AOAM533M0W4EH1zmcg1MJsb8TNrtr4h0cifQTP5QFMnqOJIV/9oqdyEK
 ZfPlPRrE3KJ2KRcPBruoXQMkKQyN
X-Google-Smtp-Source: ABdhPJzWH+H30rB22gfRPrtAIbrZkJvP48IdUiW2B/+G2yBfRKCZi6tlnmd0/ESwRg3CPpeax+pm0Q==
X-Received: by 2002:a17:90a:ce17:: with SMTP id
 f23mr7495181pju.51.1590189071893; 
 Fri, 22 May 2020 16:11:11 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:d0d2:96ff:22ac:b8e6])
 by smtp.gmail.com with ESMTPSA id b24sm7454401pfi.4.2020.05.22.16.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 16:11:11 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 22 May 2020 16:10:56 -0700
Message-Id: <20200522231056.27879-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH] xtensa: fix error paths in __get_user_{check,
	size}
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

Error paths in __get_user_check and __get_user_size directly assing 0 to
the result. It causes the following sparse warnings:

  sparse: warning: Using plain integer as NULL pointer

Convert 0 to the type pointed to by the user pointer before assigning it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index 445bb4cf3c28..0fd9b4086ae2 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -184,7 +184,7 @@ __asm__ __volatile__(					\
 	if (access_ok(__gu_addr, size))					\
 		__get_user_size((x), __gu_addr, (size), __gu_err);	\
 	else								\
-		(x) = 0;						\
+		(x) = (__typeof__(*(ptr)))0;				\
 	__gu_err;							\
 })
 
@@ -202,13 +202,15 @@ do {									\
 		u64 __x;						\
 		if (unlikely(__copy_from_user(&__x, ptr, 8))) {		\
 			retval = -EFAULT;				\
-			(x) = 0;					\
+			(x) = (__typeof__(*(ptr)))0;			\
 		} else {						\
 			(x) = *(__force __typeof__(*(ptr)) *)&__x;	\
 		}							\
 		break;							\
 	}								\
-	default: (x) = 0; __get_user_bad();				\
+	default:							\
+		(x) = (__typeof__(*(ptr)))0;				\
+		__get_user_bad();					\
 	}								\
 } while (0)
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
