Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E96AD156C5A
	for <lists+linux-xtensa@lfdr.de>; Sun,  9 Feb 2020 21:13:18 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 15D156537;
	Sun,  9 Feb 2020 20:02:13 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by linux-xtensa.org (Postfix) with ESMTPS id CFE2E6514
 for <linux-xtensa@linux-xtensa.org>; Sun,  9 Feb 2020 20:02:11 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w21so2724620pgl.9
 for <linux-xtensa@linux-xtensa.org>; Sun, 09 Feb 2020 12:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mh8l8/ENlwoJz80TM0hFdoiAN+TbALKgf2bYvbYYpw4=;
 b=QB3TTCd1+7WmTMwPg2bjx2nGCxBdqkS//l+iYVp2Fhc25f8X79TJo8nmR66NOS312K
 9ghKws5i6S/1xRGIi8QKdioNwJp4mvSxCg65RHCHx/wJ7B4mK1kDw2Fxfrma8gPfWmQ7
 7U2+5avMo5K2g3trqY1Hdd0dQww8PRrV7pTQL4vXB9vXM43HF0FY3KPQ5kHUeEKw86Ru
 basmgvYBWISMC45I/0Zvfn/OXgm1qPVQKEr4y2EYtpM4dFu+bpby3Q6SAiHjOfD047Vh
 S6oCj0KNkS+jdjvb8by34GfLQ5KcgjjoriFdEcNZGD7If8KueXcKKy3e0FdrsthebYaK
 uKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mh8l8/ENlwoJz80TM0hFdoiAN+TbALKgf2bYvbYYpw4=;
 b=bjMEPNwhuZZHY+xX80bCCONZC9zQBs0l4hU6FcaTwFnAG7QD7ayWdhvq3FvSODReIx
 vTDwL3/mc2AfF18pOYmV4QcWZpZsFXkgdEHnPhf9pIkofcD3CS8tM5gk8IWlKb2lsiep
 wbyusw22Y7XLlyszshtwisyIKPdyXitZqggZ5/P8O8W+VMdSRI8SD/0YQDEBhPghH6nO
 zcQdvs8txBcBZM3rJWEuziHnpmPuS2MIK+Ucxwp/k4ODWBjObBOoUaqInJ0RwHSGeW7H
 /dP0TM5ZkAy9+gb5cS9zjapurKbriyFczq5iJCvPJdVWldOFSjOi6ZoElAgcdTwRG5Oc
 2h2g==
X-Gm-Message-State: APjAAAWSVlrheXjcAOD7uvrgUmLpuYzAIYbco5r6Dg6jLTgmK8aTz0hv
 wCTZ4et+4VEPgJ/2ukQWni4=
X-Google-Smtp-Source: APXvYqwXJcWidXXxz31r4DljK4pkDo7s4Y1I18i9rPinCkK8y87waeHaU1AsAV7o8BT32w0FO7GAKw==
X-Received: by 2002:a62:7681:: with SMTP id r123mr9593491pfc.169.1581279195942; 
 Sun, 09 Feb 2020 12:13:15 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:63f0:a487:3b8:7ffc:c9e4])
 by smtp.gmail.com with ESMTPSA id c19sm10417732pfc.144.2020.02.09.12.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 12:13:15 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Sun,  9 Feb 2020 12:13:02 -0800
Message-Id: <20200209201302.25576-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [PATCH] include/ctype.h: restore __isctype_l
	definition
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

Recent is*_l fix broke uclibc build because removed __isctype_l
definition was used in libc/misc/ctype/ctype.c. Restore it.

Fixes: d1a3ca7ca566 ("include/ctype.h: drop is*_l macro definitions")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 include/ctype.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/ctype.h b/include/ctype.h
index e934cf3321a6..05f21c553e5a 100644
--- a/include/ctype.h
+++ b/include/ctype.h
@@ -350,6 +350,7 @@ libc_hidden_proto(tolower_l)
 /* Return the uppercase version of C.  */
 extern int toupper_l (int __c, __locale_t __l) __THROW;
 
+# define __isctype_l(c, type, locale) ((locale)->__ctype_b[(int) (c)] & (__ctype_mask_t) type)
 # ifndef __NO_CTYPE
 #  if (defined __USE_SVID || defined __USE_MISC || defined __USE_XOPEN) \
 	&& defined __UCLIBC_SUSV4_LEGACY__
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
