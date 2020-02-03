Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDF5151222
	for <lists+linux-xtensa@lfdr.de>; Mon,  3 Feb 2020 22:55:46 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 078E64240;
	Mon,  3 Feb 2020 21:44:52 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id CBFC73AD5
 for <linux-xtensa@linux-xtensa.org>; Mon,  3 Feb 2020 21:44:50 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id f25so16284945ljg.12
 for <linux-xtensa@linux-xtensa.org>; Mon, 03 Feb 2020 13:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JcDDIqcfJawaSmDJHmbv9kK4ohGI6BQ6+ghiyE4fyag=;
 b=AAtV2z7/ICaxGdzbk0KfzqAI41XlVJ6G3ZetaADJcTJNKbECpRIglm0N3fAAuRv/Q9
 iJc0iWTze0CTHAmztvjAnrnPj25YMspbaP22w7QGF57LR1MQgCdwAq/4D2oT4PO6cg9u
 kEQY9cCmAEW3abUWY4WMDRRweWOkuB4hGn2bt3MVu97vyWY2+Unogd9NoSk9v1OEypUo
 wynJjHaZjHXtGVcfgMKWghPsREhnSABb5Hn00bxfF5Sv/2QTvgz8q2gT6oTOosTCD4BA
 743ycyJswOxKe7zLyHmqBBurxrb7zu9uU0chJxkZJKrzgB1WeR6rkL72iZL/by8dhgJP
 7HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JcDDIqcfJawaSmDJHmbv9kK4ohGI6BQ6+ghiyE4fyag=;
 b=IC6/lW+C7SowYk9dQUmjZkilp/qYz6QJxRWm/FwwIo0522zQatc25nUS/CNasG9Ir9
 xdFAFPFkIGnva8ySobbOjUYqTrMiIgZ28zZXjQKZjKNkcyP7tFIOZapzE+fpHpZ6VOez
 rMzCW1VZe0hvbHafNGU68O6SYfKJNnNTCb8jynGbTru7zpddOzdhCluecEaSUQnUPUHM
 IG4roHiXqxKbIXegthAlnRrN9jzBVbPHduYYgC7cQ/K1IR7gj/JPvOuFa+CwhUGJIaJ/
 PO1AqqXaoANFyNI2j96xUNbX19nWJAzJ85EbZFCsW6usG0S0KhIKjCJOJLTHTnS29bGm
 IPUA==
X-Gm-Message-State: APjAAAVbpGKhTDwoOTB+rnOHe0fztB+TmR4DiVdO9LzVDvyMqeIjY6we
 Ixs6qbRouPplUZ+aBkt8E8c=
X-Google-Smtp-Source: APXvYqz0oGuHd0HTE2Lszw8h7ish29GQ6/eDTOTJV3gyNoSkg71K18X+THHKp3qyXEDu6aPfj0DtPA==
X-Received: by 2002:a2e:884f:: with SMTP id z15mr15544335ljj.46.1580766943244; 
 Mon, 03 Feb 2020 13:55:43 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id l22sm10554150lje.40.2020.02.03.13.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 13:55:42 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Mon,  3 Feb 2020 13:55:31 -0800
Message-Id: <20200203215531.15516-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [PATCH] include/ctype.h: drop is*_l macro definitions
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

ctype locale-specific macro definitions are broken because they result
in dereference of pointer to structure of incomplete type.
Drop these macros since they are optional and let applications use
functions with the same names.

This change fixes parted-3.3 build with uClibc-ng:
  http://autobuild.buildroot.net/results/b7ba1210d5aa184b133f0171da621d2b0083ec39/build-end.log

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 include/ctype.h | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/include/ctype.h b/include/ctype.h
index ecd5e730886a..05f21c553e5a 100644
--- a/include/ctype.h
+++ b/include/ctype.h
@@ -350,46 +350,14 @@ libc_hidden_proto(tolower_l)
 /* Return the uppercase version of C.  */
 extern int toupper_l (int __c, __locale_t __l) __THROW;
 
-# if __GNUC__ >= 2 && defined __OPTIMIZE__ && !defined __cplusplus
-#  define tolower_l(c, locale) __tobody(c, tolower_l, (locale)->__ctype_tolower, (c, locale))
-#  define toupper_l(c, locale) __tobody(c, toupper_l, (locale)->__ctype_toupper, (c, locale))
-# endif	/* Optimizing gcc */
-
-
 # define __isctype_l(c, type, locale) ((locale)->__ctype_b[(int) (c)] & (__ctype_mask_t) type)
 # ifndef __NO_CTYPE
-#  define __isalnum_l(c,l)	__isctype_l((c), _ISalnum, (l))
-#  define __isalpha_l(c,l)	__isctype_l((c), _ISalpha, (l))
-#  define __iscntrl_l(c,l)	__isctype_l((c), _IScntrl, (l))
-#  define __isdigit_l(c,l)	__isctype_l((c), _ISdigit, (l))
-#  define __islower_l(c,l)	__isctype_l((c), _ISlower, (l))
-#  define __isgraph_l(c,l)	__isctype_l((c), _ISgraph, (l))
-#  define __isprint_l(c,l)	__isctype_l((c), _ISprint, (l))
-#  define __ispunct_l(c,l)	__isctype_l((c), _ISpunct, (l))
-#  define __isspace_l(c,l)	__isctype_l((c), _ISspace, (l))
-#  define __isupper_l(c,l)	__isctype_l((c), _ISupper, (l))
-#  define __isxdigit_l(c,l)	__isctype_l((c), _ISxdigit, (l))
-#  define __isblank_l(c,l)	__isctype_l((c), _ISblank, (l))
-
 #  if (defined __USE_SVID || defined __USE_MISC || defined __USE_XOPEN) \
 	&& defined __UCLIBC_SUSV4_LEGACY__
 #   define __isascii_l(c,l)	((l), __isascii (c))
 #   define __toascii_l(c,l)	((l), __toascii (c))
 #  endif
 
-#  define isalnum_l(c,l)	__isalnum_l ((c), (l))
-#  define isalpha_l(c,l)	__isalpha_l ((c), (l))
-#  define iscntrl_l(c,l)	__iscntrl_l ((c), (l))
-#  define isdigit_l(c,l)	__isdigit_l ((c), (l))
-#  define islower_l(c,l)	__islower_l ((c), (l))
-#  define isgraph_l(c,l)	__isgraph_l ((c), (l))
-#  define isprint_l(c,l)	__isprint_l ((c), (l))
-#  define ispunct_l(c,l)	__ispunct_l ((c), (l))
-#  define isspace_l(c,l)	__isspace_l ((c), (l))
-#  define isupper_l(c,l)	__isupper_l ((c), (l))
-#  define isxdigit_l(c,l)	__isxdigit_l ((c), (l))
-#  define isblank_l(c,l)	__isblank_l ((c), (l))
-
 #  if (defined __USE_SVID || defined __USE_MISC || defined __USE_XOPEN) \
 	&& defined __UCLIBC_SUSV4_LEGACY__
 #   define isascii_l(c,l)	__isascii_l ((c), (l))
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
