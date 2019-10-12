Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B7721D4B45
	for <lists+linux-xtensa@lfdr.de>; Sat, 12 Oct 2019 02:07:33 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8C98A64CF;
	Sat, 12 Oct 2019 00:00:15 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by linux-xtensa.org (Postfix) with ESMTPS id CA44364BC
 for <linux-xtensa@linux-xtensa.org>; Sat, 12 Oct 2019 00:00:14 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id w6so8192695lfl.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 17:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOU51IFsj1iWUWTwrZgYX0bBua/cZqGBz0E2pjuMMik=;
 b=cf06n0Hkxhy7kOh2+h4NMzhGw1OlsYghnaOjmz20S8X3irPNDR5+EZx4sRFVuWWnsT
 GNk+GUokwj9gqRZX+BJC9/1P0GY5lr6aBN+zddHlXQpTYn2+LB6ob8rzC85D7BnLYxSN
 OcRui87Nstph8ts/eUe7VxYBYWTssr8iWekrJAdC2dr0CIWZg+2a8muhXUXjo/GC1QL6
 WKNkh+hnb2An7bkTB3QcuJXT03Q/SrrddBgU2yW59/ZBJJ6PSwC+SDcssMCmJqU4WWpZ
 6mSngT+q53l5xM7SCgIWriPoeO33E20DQAVSby3nZkxzkCQC7hKWtnx1Dm7cRZh3jehC
 jPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOU51IFsj1iWUWTwrZgYX0bBua/cZqGBz0E2pjuMMik=;
 b=ru0Lp9uwTSo1S1L8/H5imaqPk5AacpKqkmcrZ9BmroCVDNy2BYCzxC+2v8UZVrq/l5
 70iZQ/mGUWtjRqRl3mlgGBLY6dxiohJJuCEjtH9n6aAxW4j5yDW78srS9sbbZINyjqbs
 /EghUwYEsjrbYcOUX+ON+HOIFicanqIBnnak7uiBvgK9VNWbkUQwx5215XfqHhAnHlj+
 SkG3T7P0OXjTENsHu2FB4pBIZ/gl6KpegeDQmBNjmsfGLOnys/kZm82ZLrPR+yQsyU1c
 oPUdnJGmQDPzBAMylNXFN8/SFA3U9bIMKDMjRRYX4gO85ZM3iMEB4/omJr8UD8ACnaAH
 WeGw==
X-Gm-Message-State: APjAAAX9ePRM0GEuXCjbpcBSSPArdIk++rfmLVC2Fg6O11zFPpA+ogJG
 iWkLPgWKoBVvmcpz+WjCG3qskOnDVeY=
X-Google-Smtp-Source: APXvYqwYdmZMj7678HK/tvZJ2dro1f5xYGc78HMplO3y9uphHeSRU8KsXptHwuptP2ocEcTM+3mCEQ==
X-Received: by 2002:a19:f813:: with SMTP id a19mr10378473lff.154.1570838851010; 
 Fri, 11 Oct 2019 17:07:31 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x17sm2215705lji.62.2019.10.11.17.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 17:07:29 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 11 Oct 2019 17:07:09 -0700
Message-Id: <20191012000711.3775-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191012000711.3775-1-jcmvbkbc@gmail.com>
References: <20191012000711.3775-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/3] xtensa: fix {get,
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
