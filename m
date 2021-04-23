Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5D936906F
	for <lists+linux-xtensa@lfdr.de>; Fri, 23 Apr 2021 12:34:26 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 620346FDC;
	Fri, 23 Apr 2021 10:08:50 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by linux-xtensa.org (Postfix) with ESMTPS id C3C7D6A09
 for <linux-xtensa@linux-xtensa.org>; Fri, 23 Apr 2021 10:08:47 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 12so76554426lfq.13
 for <linux-xtensa@linux-xtensa.org>; Fri, 23 Apr 2021 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DfsbGcYIWSkCpm7rPZ8rRnvaFvLPxfbq9QgjNcS+KEE=;
 b=BY63zKDlL/G7ooKKbxer1umb6DksCzRFsu79NIQcia7Td90b/OKhuCc0T8RQemlzYT
 dufXTVkbUinaUwHGSztQcHjp0kgc2RHZ2LDM/bK7GHL6gRDQ4NNAoJ8CJnM0z0Ad8eAx
 jW2TVtH1v9kw838QAtmcXkB9c+K8ryn1t4Jewg9YsP3blyPXyT9gr/40ShjftvWn+tMO
 aEkco7mCAu/DQOxY3qzocaUUPcmJoNG9ILjkaBVzvM8hpHGbVZw2UJfHiL1y/b2KZHw1
 GoPCtk3kl/nGxHR35/XOsigh2ELRFCLC7QVObtFf3J2Wj/7rYGm0ddVzybpARP5ms8E9
 e2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DfsbGcYIWSkCpm7rPZ8rRnvaFvLPxfbq9QgjNcS+KEE=;
 b=Zd3oc4yjrXtC+hcXDZzjQz3zBIPyEk80qaW0bbZjgn63xXKziFcdj5kjw/b4vGM7Z+
 7kbUXkRAfLd5KRIH0cumQZNjnam1Gey4gkIYYCkBANv/CUQMLs+aimKMyi8FqHaOh8i7
 N6nwhV3ot3Z/KLfF+VD9Te43Mz6q2yGwo+vjpic0z81VxnRbmRMSniLSi5NthS5lk/LM
 7Fw4tZG/bEJYanotx+Y/rB06o3DW1YE8x3RGcemDIW6dT8D2Gzoy8FBz6Dz6p6g/wjM/
 3Fx9tnI43RMypNIU0YktHIAjyX1HMbJiCF6TwIiKDLSfTQ8/o9pqiv65Kr5E3JK+Sfbc
 4W9Q==
X-Gm-Message-State: AOAM530qrmYhCr8htI13ej/+8dyHt9DurxgQ/p6BbZoYH4JsEBwWycTQ
 DIn5xBmj4dj0u4wKtthVAfA=
X-Google-Smtp-Source: ABdhPJz88buspzfQgowac5bLrplTFA94puRAlIQdSAWtZSpygoUXdmdi4Ins/fuXC6I4RWSFr5aYlg==
X-Received: by 2002:a05:6512:21a5:: with SMTP id
 c5mr2308097lft.534.1619174061507; 
 Fri, 23 Apr 2021 03:34:21 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id z28sm515235lfq.72.2021.04.23.03.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 03:34:21 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Fri, 23 Apr 2021 03:34:08 -0700
Message-Id: <20210423103408.29069-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [COMMITTED] opcodes: xtensa: display loaded literal
	value
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

Display literal value loaded with l32r opcode as a part of disassembly.
This significantly simplifies reading of disassembly output.

2020-04-23  Max Filippov  <jcmvbkbc@gmail.com>
opcodes/
	* xtensa-dis.c (print_xtensa_operand): For PC-relative operand
	of l32r fetch and display referenced literal value.
---
 opcodes/xtensa-dis.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/opcodes/xtensa-dis.c b/opcodes/xtensa-dis.c
index e38fc39f4e7e..cfa058f96c71 100644
--- a/opcodes/xtensa-dis.c
+++ b/opcodes/xtensa-dis.c
@@ -194,7 +194,8 @@ print_xtensa_operand (bfd_vma memaddr,
 		      unsigned operand_val)
 {
   xtensa_isa isa = xtensa_default_isa;
-  int signed_operand_val;
+  int signed_operand_val, status;
+  bfd_byte litbuf[4];
 
   if (show_raw_fields)
     {
@@ -216,6 +217,23 @@ print_xtensa_operand (bfd_vma memaddr,
 					    &operand_val, memaddr);
 	  info->target = operand_val;
 	  (*info->print_address_func) (info->target, info);
+	  /*  Also display value loaded by L32R (but not if reloc exists,
+	      those tend to be wrong):  */
+	  if ((info->flags & INSN_HAS_RELOC) == 0
+	      && !strcmp ("l32r", xtensa_opcode_name (isa, opc)))
+	    status = (*info->read_memory_func) (operand_val, litbuf, 4, info);
+	  else
+	    status = -1;
+
+	  if (status == 0)
+	    {
+	      unsigned literal = bfd_get_bits (litbuf, 32,
+					       info->endian == BFD_ENDIAN_BIG);
+
+	      (*info->fprintf_func) (info->stream, " (");
+	      (*info->print_address_func) (literal, info);
+	      (*info->fprintf_func) (info->stream, ")");
+	    }
 	}
       else
 	{
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
