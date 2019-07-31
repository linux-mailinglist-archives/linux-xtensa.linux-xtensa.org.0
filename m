Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5071D7BAA2
	for <lists+linux-xtensa@lfdr.de>; Wed, 31 Jul 2019 09:22:47 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 4B33657FC;
	Wed, 31 Jul 2019 07:18:03 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by linux-xtensa.org (Postfix) with ESMTPS id 05E1F57E7
 for <linux-xtensa@linux-xtensa.org>; Wed, 31 Jul 2019 07:18:02 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id h28so46646159lfj.5
 for <linux-xtensa@linux-xtensa.org>; Wed, 31 Jul 2019 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=s5DtgNuRaDXNThNOiblD8HPBRkh6vVfMGV1zy3pIfqg=;
 b=dgo98/qDv+MUWHDbZAToIJLMPW/kUQMATaY9jCHSlapajD5Q8pALyc7I1+vKMptuCb
 RNc1ICtBBiBZNWa/nAreKOVQFOd4sF5e1pPvujx9CSJs15HTpTyi93Iu61nIAnBhQiVT
 9hQF7ThGa1XwKE+V9LATfQK7pFi9gfCZOeND8T7SdtNZqufycbP1nj0YRlq2rRJy03Hy
 wjAFSfFP//GZ1BgGDGmH7BwhPMOiM6s05DGvGR2UPe3C5jnOfPHPepVvSC65K/qVeGlo
 nXIEU00/H8Ov3pAbm9kWoXdHRjdLW0kDBrJJ8sIX4K0PcdvBMPIaBcBD2U6cYIR8muKY
 ohAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=s5DtgNuRaDXNThNOiblD8HPBRkh6vVfMGV1zy3pIfqg=;
 b=uiNXN+UulVlxpqw9S8ynfvZQsbpg1jOCE/3LmRSbPNV3tLiRleW7WfFMxhrKPVJlav
 +LCq3By5+cfRF8IkzzPOb+yDrfDau515U1rROgAzQSz4sWTP3K9olmipuIrRfil3sB7O
 PxiKkDqrp/Xk5HmDAOo/Y48CajPX2zltTKuozM1LMN5auSAh5uZzdMVr1Ly/EQGi5QfQ
 UNoYBazpx/Zo8tADpwWkxexu+5QNwQBppFYiBWr/tZ9B9uOlkEnEV9t87J0L4048I6I6
 2lI1o6PvranT5i11p/w0UZAgz8BXggaSYLgZGTSABujQccAtzmSJpZyOqLjGYFOOeZpb
 l+Gw==
X-Gm-Message-State: APjAAAW130qd8bN0qPqVu/KAbh23RJ1InnyMKu96rxBFkNlutISam7/f
 ROJEeAVb3UbLr64rpggcf/c=
X-Google-Smtp-Source: APXvYqwp/+TXgcA0b5xyTD/XJj21SQnMKTfPt/c7ArrjDtoGB5v1XdusuZhwuIqjg3lz6mSZV/HyFg==
X-Received: by 2002:ac2:42c7:: with SMTP id n7mr56387015lfl.65.1564557763853; 
 Wed, 31 Jul 2019 00:22:43 -0700 (PDT)
Received: from octofox.lan1 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net.
 [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id m17sm13957092lji.16.2019.07.31.00.22.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 00:22:43 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Wed, 31 Jul 2019 00:22:27 -0700
Message-Id: <20190731072227.14893-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [PATCH] xtensa: bfd: add special case to loop
	alignment check
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

check_loop_aligned is used during link time relaxation to only allow
transformations that don't violate loop body alignment requirements.
Assembler can relax loops that have too long body by adding instructions
between the loop instruction and the loop body. check_loop_aligned must
check alignment of the first instruction of the actual loop body.
Detect loop / rsr.lend / wsr.lbeg sequence used in assembly time
relaxation and adjust alignment check when it's detected.

bfd/
2019-07-31  Max Filippov  <jcmvbkbc@gmail.com>

	* elf32-xtensa.c (insn_num_slots, get_rsr_lend_opcode)
	(get_wsr_lbeg_opcode): New functions.
	(check_loop_aligned): Detect relaxed loops and adjust loop_len
	and insn_len for the first actual instruction of the loop.
---
 bfd/elf32-xtensa.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
index 93394547ce4a..8a7bf7e96f8c 100644
--- a/bfd/elf32-xtensa.c
+++ b/bfd/elf32-xtensa.c
@@ -63,6 +63,8 @@ static bfd_boolean is_alt_relocation (int);
 static bfd_boolean is_operand_relocation (int);
 static bfd_size_type insn_decode_len
   (bfd_byte *, bfd_size_type, bfd_size_type);
+static int insn_num_slots
+  (bfd_byte *, bfd_size_type, bfd_size_type);
 static xtensa_opcode insn_decode_opcode
   (bfd_byte *, bfd_size_type, bfd_size_type, int);
 static bfd_boolean check_branch_target_aligned
@@ -3857,6 +3859,33 @@ l32r_offset (bfd_vma addr, bfd_vma pc)
 }
 
 
+static xtensa_opcode
+get_rsr_lend_opcode (void)
+{
+  static xtensa_opcode rsr_lend_opcode = XTENSA_UNDEFINED;
+  static bfd_boolean done_lookup = FALSE;
+  if (!done_lookup)
+    {
+      rsr_lend_opcode = xtensa_opcode_lookup (xtensa_default_isa, "rsr.lend");
+      done_lookup = TRUE;
+    }
+  return rsr_lend_opcode;
+}
+
+static xtensa_opcode
+get_wsr_lbeg_opcode (void)
+{
+  static xtensa_opcode wsr_lbeg_opcode = XTENSA_UNDEFINED;
+  static bfd_boolean done_lookup = FALSE;
+  if (!done_lookup)
+    {
+      wsr_lbeg_opcode = xtensa_opcode_lookup (xtensa_default_isa, "wsr.lbeg");
+      done_lookup = TRUE;
+    }
+  return wsr_lbeg_opcode;
+}
+
+
 static int
 get_relocation_opnd (xtensa_opcode opcode, int r_type)
 {
@@ -4057,6 +4086,28 @@ insn_decode_len (bfd_byte *contents,
   return insn_len;
 }
 
+int
+insn_num_slots (bfd_byte *contents,
+		bfd_size_type content_len,
+		bfd_size_type offset)
+{
+  xtensa_isa isa = xtensa_default_isa;
+  xtensa_format fmt;
+  static xtensa_insnbuf ibuff = NULL;
+
+  if (offset + MIN_INSN_LENGTH > content_len)
+    return XTENSA_UNDEFINED;
+
+  if (ibuff == NULL)
+    ibuff = xtensa_insnbuf_alloc (isa);
+  xtensa_insnbuf_from_chars (isa, ibuff, &contents[offset],
+			     content_len - offset);
+  fmt = xtensa_format_decode (isa, ibuff);
+  if (fmt == XTENSA_UNDEFINED)
+    return XTENSA_UNDEFINED;
+  return xtensa_format_num_slots (isa, fmt);
+}
+
 
 /* Decode the opcode for a single slot instruction.
    Return 0 if it fails to decode or the instruction is multi-slot.  */
@@ -4136,6 +4187,20 @@ check_loop_aligned (bfd_byte *contents,
       return FALSE;
     }
 
+  /* If this is relaxed loop, analyze first instruction of the actual loop
+     body.  It must be at offset 27 from the loop instruction address.  */
+  if (insn_len == 3
+      && insn_num_slots (contents, content_length, offset + loop_len) == 1
+      && insn_decode_opcode (contents, content_length,
+			     offset + loop_len, 0) == get_rsr_lend_opcode()
+      && insn_decode_len (contents, content_length, offset + loop_len + 3) == 3
+      && insn_num_slots (contents, content_length, offset + loop_len + 3) == 1
+      && insn_decode_opcode (contents, content_length,
+			     offset + loop_len + 3, 0) == get_wsr_lbeg_opcode())
+    {
+      loop_len = 27;
+      insn_len = insn_decode_len (contents, content_length, offset + loop_len);
+    }
   return check_branch_target_aligned_address (address + loop_len, insn_len);
 }
 
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
