Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E63D7D4B67
	for <lists+linux-xtensa@lfdr.de>; Sat, 12 Oct 2019 02:37:39 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id BCEAE64ED;
	Sat, 12 Oct 2019 00:30:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id AEFB964EE
 for <linux-xtensa@linux-xtensa.org>; Sat, 12 Oct 2019 00:30:20 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y23so11407026lje.9
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 17:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54LRcAZD00eVKPK3FNvqhw23ruw7tf3kBIi8BnJjoS0=;
 b=uPOussVDx72S+iDIooeNqsmbtrl7it6MbxgKtymlvx2TNLPMvf8vvRvlMzTvEba84v
 wvzMXMASiBtbhasQZVqhQCC4QC8X657wNp3wxbRSIFZ5SjONATAoHk4ATDB/AuzrGR85
 8lLOdZtC0Bd0A9tMSlM/QRPVzPZ+QQ/YX+ESPA6zDMHUajQtOUxVvfqb2nvMkM1nt9Yx
 eS1wDxICqSE0Z/FVMlkJ1sqBHx35V294Uoz8sAk0UEDd4iTFl+vN4shsomAoTcYOfpj4
 p9fXKnxoFeotcFLADwxbNWoezyWiTYmkOQDXlfQlsVLQRLEIvJMV4fS7uFRPwSbk4MlN
 MR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54LRcAZD00eVKPK3FNvqhw23ruw7tf3kBIi8BnJjoS0=;
 b=W79Mfa44RvoboxcQd2gAUI+1t53i+n0HJs37ZZM0iRfTM6ykUHayEwwXLs6Jd1VTEU
 5e88CLSB6dNoHDM6nGxmN3O20VJ4wXiO1ej3BvWjnj/ozgUVGQfPu2A/4Jhw/3K1QiNa
 OltX77CC7bn+YklJROBpAwmMZk9Pz1XLzB9sTcr3hAUHjC1wxX1opcMwv8t8Is0K23xk
 eaT+IJtOLaU7X+0FQhFpZtpkHps1TeR8Vd98zH5CsJt36PJPdb9SIWmyIEcyzIophjDd
 u/d9mxYhfD0J4ekfkef9BM+wOsfX+w+rJ32rK1nYH0mmVtQqeitAJVIWs+yqSEAQJsFO
 mCzw==
X-Gm-Message-State: APjAAAX95Me4Ot2OLNfJ/ohv3ql7JH4S9kPRpdUlci1fd1xxD2uzIfLz
 jKOb6FMFRCChT/krwfraSEjg/UP6vIU=
X-Google-Smtp-Source: APXvYqxzdqPlMilQU3nmxFk9zBN8wXeKdCdXWAgxhYCM5tHpBierUSArhoJz2E33Mv9AH+DcQUXXeQ==
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr11098180lja.24.1570840657244; 
 Fri, 11 Oct 2019 17:37:37 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id f22sm2346620lfa.41.2019.10.11.17.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 17:37:36 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 11 Oct 2019 17:37:08 -0700
Message-Id: <20191012003708.22182-5-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191012003708.22182-1-jcmvbkbc@gmail.com>
References: <20191012003708.22182-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 4/4] xtensa: initialize result in
	__get_user_asm for unaligned access
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

__get_user_asm macro leaves result register uninitialized when alignment
check fails. Add 'insn' parameter to __check_align_{1,2,4} and pass an
instruction that initializes result register from __get_user_asm.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/asm/uaccess.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
index 43e923678dfb..d8cff972f3cf 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -129,17 +129,19 @@ do {									\
  * sync.
  */
 
-#define __check_align_1  ""
+#define __check_align_1(insn)  ""
 
-#define __check_align_2				\
+#define __check_align_2(insn)			\
 	"   _bbci.l %[addr], 0, 1f	\n"	\
 	"   movi    %[err], %[efault]	\n"	\
+	"   "insn"			\n"	\
 	"   _j      2f			\n"
 
-#define __check_align_4				\
+#define __check_align_4(insn)			\
 	"   _bbsi.l %[addr], 0, 0f	\n"	\
 	"   _bbci.l %[addr], 1, 1f	\n"	\
 	"0: movi    %[err], %[efault]	\n"	\
+	"   "insn"			\n"	\
 	"   _j      2f			\n"
 
 
@@ -153,7 +155,7 @@ do {									\
  */
 #define __put_user_asm(x_, addr_, err_, align, insn, cb)\
 __asm__ __volatile__(					\
-	__check_align_##align				\
+	__check_align_##align("")			\
 	"1: "insn"  %[x], %[addr], 0	\n"		\
 	"2:				\n"		\
 	"   .section  .fixup,\"ax\"	\n"		\
@@ -221,7 +223,7 @@ do {									\
 do {							\
 	u32 __x;					\
 	__asm__ __volatile__(				\
-		__check_align_##align			\
+		__check_align_##align("movi %[x], 0")	\
 		"1: "insn"  %[x], %[addr], 0	\n"	\
 		"2:				\n"	\
 		"   .section  .fixup,\"ax\"	\n"	\
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
