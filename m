Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3BABA1F94DA
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Jun 2020 12:46:20 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 387BF5874;
	Mon, 15 Jun 2020 10:31:14 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by linux-xtensa.org (Postfix) with ESMTPS id 3CCA65856
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 10:31:11 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id s88so6960459pjb.5
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 03:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XQUia0wkQXwkAVBUlQhXL/qDndSK3K7J0mJQgEvEO5k=;
 b=LuWYl8FbH4z59pgz9XC7/JL58orODojfATa4PBGPmf5TfPr5MqFZsMhE3UinrO2GBp
 yw1BVs1GnzEIJ4R49BDMWeAqJP+SiB+et5gOCjww5oVIhCFBtSv1KJQrAvDGGwJ/lWKs
 IcoC/zdDwy7VvckDVT+s4GpI0kzEfbXSI7xkv7TAmUGLgR7wUcPgl/AMiITZO0xGesZY
 hH0R5SCYWWyiTLRZ+1SDZcLx/bmU+mvr2JX3B/sCbtDU1R4W+tNP6J4QvyYZyKfe5EtG
 j2kyAfp+pDqypbP1rbZska8S8gGxkcX8db/PFagrlAtrvvmgf32Oh/smyzeNoEJHNbQy
 fIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XQUia0wkQXwkAVBUlQhXL/qDndSK3K7J0mJQgEvEO5k=;
 b=bkWLzp95Vdvp04BkSWNLHP+gNcdSlt9PxsfoMYOmJjwEvpnCt7JaqKN8KRGXIxUjg4
 aO4+bcG1x8g/rwLVvqtScVOcAeTozMvilOHy5eCp/dFU/kugk+h815+2f6YRFMFgWPUD
 PgFJQPj7ZVZCafEJd7EylxKPMuysWftpnpHpII58xoJAzY5FdEu/cIdbaY60zu1r7bVs
 wVg33xEHyL98YTNcdRBuSpPv3B/nZYQJQP8qdXPr8KglPw8pvzLGot0tJk30Quwuyk1L
 gR2F1REpTLwPY+DF14HhxeZfuiW+2kruF3VIkkpVOR5pxlHj3oapk/eJ/7I1Esx0e0vA
 HJnQ==
X-Gm-Message-State: AOAM531i1iALayC1FFNjU0DvJd4Gl4Cczf2YOIC/OOlT+nzXX+vhrMdJ
 JC4eMf+JExb84AI6QEPjdBxuwMp2
X-Google-Smtp-Source: ABdhPJwkaELFB9w5Y8yP4oSbv2I4QUSFm+mBGHQ1ilpmaJjfSZr7nZjBRxDJJdJTIhZdMV2Wm3a52A==
X-Received: by 2002:a17:90a:930f:: with SMTP id
 p15mr11770640pjo.85.1592217976067; 
 Mon, 15 Jun 2020 03:46:16 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id b24sm13171603pfo.112.2020.06.15.03.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 03:46:15 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Mon, 15 Jun 2020 03:46:02 -0700
Message-Id: <20200615104602.28592-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [COMMITTED] gcc: xtensa: make TARGET_HAVE_TLS
	definition static
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

Remove TARGET_THREADPTR reference from TARGET_HAVE_TLS to avoid
static data initialization dependency on xtensa core configuration.

Tested with xtensa-linux-uclibc, no new regression failures.
Committed to master.

2020-06-15  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	* config/xtensa/xtensa.c (TARGET_HAVE_TLS): Remove
	TARGET_THREADPTR reference.
	(xtensa_tls_symbol_p, xtensa_tls_referenced_p): Use
	targetm.have_tls instead of TARGET_HAVE_TLS.
	(xtensa_option_override): Set targetm.have_tls to false in
	configurations without THREADPTR.
---
 gcc/config/xtensa/xtensa.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
index e370aa4623c1..be1eb21a0b60 100644
--- a/gcc/config/xtensa/xtensa.c
+++ b/gcc/config/xtensa/xtensa.c
@@ -275,7 +275,7 @@ static rtx xtensa_delegitimize_address (rtx);
 #define TARGET_SECONDARY_RELOAD xtensa_secondary_reload
 
 #undef TARGET_HAVE_TLS
-#define TARGET_HAVE_TLS (TARGET_THREADPTR && HAVE_AS_TLS)
+#define TARGET_HAVE_TLS HAVE_AS_TLS
 
 #undef TARGET_CANNOT_FORCE_CONST_MEM
 #define TARGET_CANNOT_FORCE_CONST_MEM xtensa_cannot_force_const_mem
@@ -602,7 +602,7 @@ constantpool_mem_p (rtx op)
 static bool
 xtensa_tls_symbol_p (rtx x)
 {
-  if (! TARGET_HAVE_TLS)
+  if (! targetm.have_tls)
     return false;
 
   return GET_CODE (x) == SYMBOL_REF && SYMBOL_REF_TLS_MODEL (x) != 0;
@@ -2025,7 +2025,7 @@ xtensa_mode_dependent_address_p (const_rtx addr,
 bool
 xtensa_tls_referenced_p (rtx x)
 {
-  if (! TARGET_HAVE_TLS)
+  if (! targetm.have_tls)
     return false;
 
   subrtx_iterator::array_type array;
@@ -2222,6 +2222,9 @@ xtensa_option_override (void)
   if (xtensa_windowed_abi == -1)
     xtensa_windowed_abi = TARGET_WINDOWED_ABI_DEFAULT;
 
+  if (! TARGET_THREADPTR)
+    targetm.have_tls = false;
+
   /* Use CONST16 in the absence of L32R.
      Set it in the TARGET_OPTION_OVERRIDE to avoid dependency on xtensa
      configuration in the xtensa-common.c  */
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
