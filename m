Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D78EE1DF160
	for <lists+linux-xtensa@lfdr.de>; Fri, 22 May 2020 23:42:20 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9B7AF6524;
	Fri, 22 May 2020 21:28:02 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 335BF648E
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 21:27:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t11so5621636pgg.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 14:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GgtkiazwQoiTvdTYPMpf28KQw+7R+qBoN6rSS4orM1s=;
 b=HjRVxmVf1ldbdQQ4jNcadad7e/KmN7zX/mXlPZvNTiCYkFgoNVyaBwqVVZufsT5Kzv
 WeRED5ZDTFO1Dq1gsi2RuHgeAOWVlGDpU92OdtXKa8vmBBsOEwYT9GzhXt/+8ihBHXM6
 neVBMtFF5nkFfjdhHFAEKbr9wYKK2dX/z7VhUV9TeMSXXAGvhVJ9JCjKuo0Uic6EUVtv
 LWJzMPhHlcO5oQUCnLf0nV5bR9LhIbpiyGEB1GrhHTGk7f1GlG03kWyFwbz3r8J3oont
 RiHHjbG37wSn1RwjIDl3jfQsst2KEODtihMM7EnQBz2PWRKIPcUd3pVAZ24OKYizQHHY
 blgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GgtkiazwQoiTvdTYPMpf28KQw+7R+qBoN6rSS4orM1s=;
 b=RNgruhCcz0WCKdSdthuyFRWqs509fTTi9dzFMsbu8WmNJunls26fsVrMb3f1L2DLx3
 /h08mbKuGvGXKS8B/wpDSL3lCaxnUDRvMPnEPEfjF/1MC0VJQOpMNuo8PZ2USx9atoSz
 J45ncCgXacjbeLFgspUdEeWucZ+CP1QFVvIUPQb7Rl3O2FXKO2LFzkKgExJ6Jm4HpigA
 VB9wrZbTAsDcRhPrjoKKC+xbAyG3xDdESMJlKNlq9jqwDhpOtByx2FG5N4Bf8WMh5y8F
 4B93oeT8cJqFg45W0GgwmyowRkobGnbm+dtJo3NdszTUdSBz6uHw2M2tahxoRlqysZHw
 y/3Q==
X-Gm-Message-State: AOAM5339i/OrBrABD6bYbx72PHKmPVcVuFIgwJF7bDwnIhvQgDDHIqSp
 2HGq5ps/ohQT64Ih9CSoPjD4Kw8B
X-Google-Smtp-Source: ABdhPJxNTB8cdqBhGd0hJ8o5xV7Aiz2GsTjFcgw9TWk0AHBHzHgdRbaBU2e3vbs1ORg87i+p/WW6Gw==
X-Received: by 2002:a63:3449:: with SMTP id b70mr16118674pga.289.1590183735190; 
 Fri, 22 May 2020 14:42:15 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:d0d2:96ff:22ac:b8e6])
 by smtp.gmail.com with ESMTPSA id 4sm7625098pff.18.2020.05.22.14.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 14:42:14 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 22 May 2020 14:41:52 -0700
Message-Id: <20200522214153.30163-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522214153.30163-1-jcmvbkbc@gmail.com>
References: <20200522214153.30163-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH 2/3] xtensa: fix type conversion in
	__get_user_size
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

8-byte access in __get_user_size converts pointer to temporary variable
to the type of original user pointer and then dereferences it, resulting
in the following sparse warning:

  sparse: warning: dereference of noderef expression

Instead dereference the original user pointer under the __typeof__ and
add indirection outside.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index 754a7c96b9da..445bb4cf3c28 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -204,7 +204,7 @@ do {									\
 			retval = -EFAULT;				\
 			(x) = 0;					\
 		} else {						\
-			(x) = *(__force __typeof__((ptr)))&__x;		\
+			(x) = *(__force __typeof__(*(ptr)) *)&__x;	\
 		}							\
 		break;							\
 	}								\
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
