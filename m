Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B800140313C
	for <lists+linux-xtensa@lfdr.de>; Wed,  8 Sep 2021 00:56:46 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6E5236AD2;
	Tue,  7 Sep 2021 22:26:23 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by linux-xtensa.org (Postfix) with ESMTPS id 689556AD0
 for <linux-xtensa@linux-xtensa.org>; Tue,  7 Sep 2021 22:26:18 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id f65so363422pfb.10
 for <linux-xtensa@linux-xtensa.org>; Tue, 07 Sep 2021 15:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3WfaCL3FS4pSYbvlWCpoJft7VL4Fq66tocMCF3OeqQ=;
 b=gqKt1XvqGrL+D3rgZzb9EKAdRBi39O4oXSAd+R4yBNkIObeF+oJ7fUjbhEZ9HyEfo9
 dRZrfPiZ6oDC2g1Am3nm506xUQ88Nw23fkh3aEynd34iUauvAfKVsobZkS5hdc8pC2ST
 KAlmS7eEK8/jMQ5M2V80SFIvLAsrHZBvk5Ajkfq9Xa1wb88ftTJ1X8wWzYU64Lwbp9/R
 iJGQzpmY77FcSEvGUnwdJPYiIyL4YwAu45J3MTJWjjyU8O7gL6CBhxp8pm9b/FYmkBTw
 oFvE/F3ViDPBjF77CT9DXSqjoLDUbbVEeToFcdugh0DzUuNNNtatJlFnl9SZePFGxTeK
 6iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3WfaCL3FS4pSYbvlWCpoJft7VL4Fq66tocMCF3OeqQ=;
 b=DTJujuigRcm9RB0WDpM9JpED6Js6tVZNTQ0H+gzGMLfSQxry6aEY4uFo9NwTcD8QCd
 Yd2laVJYMWxZYQZ6wvhst2v6e9Qu4rljV/gnVJiuubt5iBJFYfx9/eGoKgav//MepXV7
 b8jqmXwVU0ONZq/Rtgm1Ntmv1rAnDJy8VWxldZ//QUcBp7c9CYTSmFCNkgFhMPqo6KUc
 Tz1i/DsCohqoBgoyw6vjGdcgLK2qT1UojvWQJ4U11slIpZ9Ro2Vf0IlwIVKY4zfglPuW
 4cni94yY7CILHeVNgN5Y9EQE5Jjk/cMDqGU0gE6zW2lftluqIDuhJtA8QqL0k4r/KiZ1
 jF3w==
X-Gm-Message-State: AOAM5314QRBQ/R1eF16TNtD/iChbSDr/hb8NMYTpnfxK0GUvgCP88h19
 u6qlgHoW3npSG/H4M7Fmdug=
X-Google-Smtp-Source: ABdhPJzb9l160fmBTypoUMaQwID81myib1MLDuFk9To8EyOA9NCZZY3HJfE71HtM8gzhokChzPuUTw==
X-Received: by 2002:a62:c585:0:b0:416:2c4b:cc3f with SMTP id
 j127-20020a62c585000000b004162c4bcc3fmr688523pfg.55.1631055399820; 
 Tue, 07 Sep 2021 15:56:39 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:49eb:5986:4393:7ed3])
 by smtp.gmail.com with ESMTPSA id u24sm130427pfm.85.2021.09.07.15.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 15:56:39 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Tue,  7 Sep 2021 15:56:21 -0700
Message-Id: <20210907225621.28091-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [COMMITTED] gcc: xtensa: fix PR target/102115
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

2021-09-07  Takayuki 'January June' Suwa  <jjsuwa_sys3175@yahoo.co.jp>
gcc/
	PR target/102115
	* config/xtensa/xtensa.c (xtensa_emit_move_sequence): Add
	'CONST_INT_P (src)' to the condition of the block that tries to
	eliminate literal when loading integer contant.
---
 gcc/config/xtensa/xtensa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
index f4f8f1975c55..8d6755144c12 100644
--- a/gcc/config/xtensa/xtensa.c
+++ b/gcc/config/xtensa/xtensa.c
@@ -1084,7 +1084,8 @@ xtensa_emit_move_sequence (rtx *operands, machine_mode mode)
 	{
 	  /* Try to emit MOVI + SLLI sequence, that is smaller
 	     than L32R + literal.  */
-	  if (optimize_size && mode == SImode && register_operand (dst, mode))
+	  if (optimize_size && mode == SImode && CONST_INT_P (src)
+	      && register_operand (dst, mode))
 	    {
 	      HOST_WIDE_INT srcval = INTVAL (src);
 	      int shift = ctz_hwi (srcval);
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
