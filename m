Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id BD400151229
	for <lists+linux-xtensa@lfdr.de>; Mon,  3 Feb 2020 22:57:52 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 43E736436;
	Mon,  3 Feb 2020 21:46:58 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id D45B95878
 for <linux-xtensa@linux-xtensa.org>; Mon,  3 Feb 2020 21:46:56 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r19so16338298ljg.3
 for <linux-xtensa@linux-xtensa.org>; Mon, 03 Feb 2020 13:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWXOL/jp5aNFAi2fHP4h0Qn+G77aE2/UVzbGA8pgKKI=;
 b=QTOk8+Vxo8PCrWTkIpeByukrLpCJzh+x73QEy9ueDBUwSPgbikN3DFh+d2oThXcItM
 /g0KvfVi5knWZAMdWSv4KrkHvLYPs8WMf1jZqQ03JQvZWWwNFBEKDRzlNTnDVFkOr48j
 E2HLDkkGDXrh3gEHjNBEpnrw/SxQ831k6ZTI2yB0m1FwqVlSQugLYSQEr7iTlTzZ0dT0
 tixf9EtzdqZKtSymuoSbixLqVdNAh/C0vgnCgg7bH+R1rbalcOI7BSTgploFVddE7vS5
 gdF3RhTzuZdmbnJss6JaEJ7STvZOsBbL1L/6UidfpIMe53+3BcOjha87n6hHVexchfnP
 dUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWXOL/jp5aNFAi2fHP4h0Qn+G77aE2/UVzbGA8pgKKI=;
 b=t6mq2KMF0/k/9afXKqJz2bEv+aCTgtdzXmFXmuowcfnxUyTUmFikLP2iSo8cQeAHGB
 AHw1FUoAJUOwu9ZopNXszeeOrKiD3SR5q8EttUywcgkah5m4YbE64ORif7C0worAkHoV
 AXrrdhCbew0137j2+pQM4GtQ56jPMPyL/m73j3DaihxRPzAeF7Y92atzENRraMm4F0QD
 NkIsUubUy/tkprqBQoy0sFUoYCOmO79mp0lHEtlfBB1uTqFteTE9BSPObYo3vyj2rvjG
 zxp3szvhA+u8AWZKtPxv45gVUqPWajWVhRZA9hvDSitrTgfzdWBdmZ1Dg2Z6ozPVbzVC
 6+Vg==
X-Gm-Message-State: APjAAAVUuu+JX4v9cdYEshu16mP8WpfwKy6NBzFwtWdjCEQrQk2Xu53J
 jgdH0vj/2zqkLLTHvjfWs/0=
X-Google-Smtp-Source: APXvYqwmn/DMdAwPmtGrdSl+NiLMsjED2WeGLMSyG/F2oExidk1QvUXKQkdRE597zRdnH0QYMKVrSA==
X-Received: by 2002:a2e:8916:: with SMTP id d22mr15646896lji.19.1580767069478; 
 Mon, 03 Feb 2020 13:57:49 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id t21sm10108423ljh.14.2020.02.03.13.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 13:57:48 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Mon,  3 Feb 2020 13:57:32 -0800
Message-Id: <20200203215732.15601-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [PATCH v2] include/ctype.h: drop is*_l macro
	definitions
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
Changes v1->v2:
- also drop __isctype_l macro.

 include/ctype.h | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/include/ctype.h b/include/ctype.h
index ecd5e730886a..e934cf3321a6 100644
--- a/include/ctype.h
+++ b/include/ctype.h
@@ -350,46 +350,13 @@ libc_hidden_proto(tolower_l)
 /* Return the uppercase version of C.  */
 extern int toupper_l (int __c, __locale_t __l) __THROW;
 
-# if __GNUC__ >= 2 && defined __OPTIMIZE__ && !defined __cplusplus
-#  define tolower_l(c, locale) __tobody(c, tolower_l, (locale)->__ctype_tolower, (c, locale))
-#  define toupper_l(c, locale) __tobody(c, toupper_l, (locale)->__ctype_toupper, (c, locale))
-# endif	/* Optimizing gcc */
-
-
-# define __isctype_l(c, type, locale) ((locale)->__ctype_b[(int) (c)] & (__ctype_mask_t) type)
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
