Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id BA3A54AD4B
	for <lists+linux-xtensa@lfdr.de>; Tue, 18 Jun 2019 23:27:44 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 693946430;
	Tue, 18 Jun 2019 21:24:31 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 1262A58BA
 for <linux-xtensa@linux-xtensa.org>; Tue, 18 Jun 2019 21:24:30 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 131so1051755ljf.4
 for <linux-xtensa@linux-xtensa.org>; Tue, 18 Jun 2019 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZG084NGQCXCAYZubYWZ8BkgyVvysLzXv/AN9++CILd0=;
 b=fRc9Q98JiHgZ65dxOEiar2HfDsWSzMnvSqNpUyZfEsc0bgTQGXfPv0xsDyyuHWU/NN
 Vq8DcMDXFKfcKG3ex+qvzGa5/TEge3/EMcmykUABlhLj1KqXLARkRq3tQ6z27bm7T9Ap
 EeOOSLjGyO9HpuEATJgBtNOW+Y2kstj1ml67nFpy+zuSfz8QVhcMBexCF+4zLvw9a3kx
 qQTXb8H0UB5lB1ZW8q1MO4g9abWoUW8sqY297DOiRZY53XI8PxETLZUq68KPUxHCAQKR
 ozUQPY686l4MUJkQeqxP03Q+YIZwxfBbtYZ0lIHN8aOo9EYAoEN6KrZ7GrhY1X7X5G+F
 o24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZG084NGQCXCAYZubYWZ8BkgyVvysLzXv/AN9++CILd0=;
 b=Ew+xFSY4d+QepRKNdYR3X09/6ZJ6EWSgn56oWKZg/y20wwpTJ6Mr3PD1R8ApL1Raxs
 IjR0E+LoLpN9okWZNmCJDdcJIt5Cu2qqXyJPUFhHoU5Z811MYLIVshcp70GxuvjGjhZm
 JBfxQ7CMyG3j9ONDN1bWPTixKcaliSkpHFZdWKCH00yxOVxql6WP+iys9JpT7ylsVB8H
 pXo/U/1W5lcyXNS3YO/oBqmTmmpT2w/y1kZUZg4zUFLg3Nxp9NWFptxisX2bebwKmdds
 Vungy/C+87+G3EZMLbu2fLtHWs0vAixBJ6a3YvqEy1kXn3bYzpN6vqNtUCV1LSFW0uh6
 XlFA==
X-Gm-Message-State: APjAAAVo0eyA40TWp6xwy4aD+aPb7PqkBC86S/AMm7F0nT1JPARvmMMl
 KKNIFyZWPJ4Mix3cr15LWJw=
X-Google-Smtp-Source: APXvYqwCeOkEzLbumYpx/yOzcLfACinKTHrcFiddcz8w+0f9VuCjH8HTzZEGl9RBnmtnTAPSgS3fVQ==
X-Received: by 2002:a2e:8793:: with SMTP id n19mr22352173lji.174.1560893260138; 
 Tue, 18 Jun 2019 14:27:40 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 137sm2765737ljj.46.2019.06.18.14.27.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 14:27:39 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Tue, 18 Jun 2019 14:27:15 -0700
Message-Id: <20190618212715.10938-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix PR target/90922
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

Stack pointer adjustment code in prologue missed a case of no
callee-saved registers and a stack frame size bigger than 128 bytes.
Handle that case.

This fixes the following gcc tests with call0 ABI:
  gcc.c-torture/execute/stdarg-2.c
  gcc.dg/torture/pr55882.c
  gcc.dg/torture/pr57569.c

2019-06-18  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	* config/xtensa/xtensa.c (xtensa_expand_prologue): Add stack
	pointer adjustment for the case of no callee-saved registers and
	stack frame bigger than 128 bytes.
---
 gcc/config/xtensa/xtensa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
index 19bd616d67f6..ee5612441e25 100644
--- a/gcc/config/xtensa/xtensa.c
+++ b/gcc/config/xtensa/xtensa.c
@@ -2865,7 +2865,8 @@ xtensa_expand_prologue (void)
 			    gen_rtx_SET (mem, reg));
 	    }
 	}
-      if (total_size > 1024)
+      if (total_size > 1024
+	  || (!callee_save_size && total_size > 128))
 	{
 	  rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
 	  emit_move_insn (tmp_reg, GEN_INT (total_size -
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
