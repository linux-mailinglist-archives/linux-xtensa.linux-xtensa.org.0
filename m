Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6078B3706B7
	for <lists+linux-xtensa@lfdr.de>; Sat,  1 May 2021 11:49:11 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 08FC96FB9;
	Sat,  1 May 2021 09:23:20 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by linux-xtensa.org (Postfix) with ESMTPS id B2C996FB7
 for <linux-xtensa@linux-xtensa.org>; Sat,  1 May 2021 09:23:16 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id o16so1087102ljp.3
 for <linux-xtensa@linux-xtensa.org>; Sat, 01 May 2021 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCVQ+16A2LqNBmv6L42lkk2RqVOjkhO5zhwRq0FFss0=;
 b=MVYtWx5CIzlc+cMY2PoyhMNMhLYL+w9gSPCFTqosW4hU4WKfHAPNvZy7iUe9I13amB
 YZKR+KuFpW2E1PQDEjbzynRPkTi7HCDRp1LWASuNFzo4IFahL8/b0tuBuAaqAHTNfAqu
 oSU+2RYjMochgtmlECMiNWLUBdkVWgkchkvnhJhSsde4k9Szhw0J4uToss/5eVYg8OkA
 QRVmmPY5fifG1B9pipwvOL+h+EZbZGBecIF4FPE8JAWZY+a7Sq+oE9em0gt+3c8a3HOC
 y+VkGDz0zdlj8cuLJ8bEFGmk7MF2YILC0hiymIaLmiIpsSmC+FY0MCVGtn5y++F1nF20
 vYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCVQ+16A2LqNBmv6L42lkk2RqVOjkhO5zhwRq0FFss0=;
 b=cPSbKZHMjuX32pR63Wb7MkdveUo7Gjx/E58ZbqTiqG1ccvMPkFhScP3nNXzVm9uaLz
 pBNDur2knmc6CvyYWMInPaZ4ru6HJnFzlDnGCYCaRGmMy2BnOccPDzt+zzVARais26o0
 fhoBeY+eaeJv10WYoMcLB5ZyTDt8IIty6+DfRmW6A97cLpaVs5zVy4/r6XDZ5xTDeOcv
 xUJbkzYyPxpg2u9f5Ul5r/MsxrT00aGJeQjPa6lrvkginIPOPC25fnROMe9J2gVxAz86
 34U3LPn+ENlymS5kWDJXOBF1Cr624yS9Aha3plMBG0hg+hxNVrmom+oqkr9meMaXTeNz
 NiOw==
X-Gm-Message-State: AOAM532nncxM77WnV5Ry9rRFpbeK/M2TihlbM3ZEo6B6LyJnG1uZ+ZLg
 L1uItDtVcWbvvLKL6bPEOmI=
X-Google-Smtp-Source: ABdhPJwSuZ71aGMpOyTeZCO+N94i8WkYOFEq86HJPWdoJzCZNIVlV3SQ8NmLSBbi7mCCo0L6BKeYWw==
X-Received: by 2002:a05:651c:210:: with SMTP id
 y16mr6599118ljn.210.1619862545966; 
 Sat, 01 May 2021 02:49:05 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id m13sm505896ljb.10.2021.05.01.02.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:49:05 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Sat,  1 May 2021 02:48:55 -0700
Message-Id: <20210501094855.19423-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [COMMITTED] opcodes: xtensa: support branch
	visualization
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

2021-05-01  Max Filippov  <jcmvbkbc@gmail.com>
opcodes/
	* xtensa-dis.c (print_insn_xtensa): Fill in info->insn_type and
	info->insn_info_valid.
---
 opcodes/xtensa-dis.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/opcodes/xtensa-dis.c b/opcodes/xtensa-dis.c
index cfa058f96c71..c1cf4c82d608 100644
--- a/opcodes/xtensa-dis.c
+++ b/opcodes/xtensa-dis.c
@@ -412,6 +412,9 @@ print_insn_xtensa (bfd_vma memaddr, struct disassemble_info *info)
   if (nslots > 1)
     (*info->fprintf_func) (info->stream, "{ ");
 
+  info->insn_type = dis_nonbranch;
+  info->insn_info_valid = 1;
+
   first_slot = 1;
   for (n = 0; n < nslots; n++)
     {
@@ -425,6 +428,13 @@ print_insn_xtensa (bfd_vma memaddr, struct disassemble_info *info)
       (*info->fprintf_func) (info->stream, "%s",
 			     xtensa_opcode_name (isa, opc));
 
+      if (xtensa_opcode_is_branch (isa, opc))
+	info->insn_type = dis_condbranch;
+      else if (xtensa_opcode_is_jump (isa, opc))
+	info->insn_type = dis_branch;
+      else if (xtensa_opcode_is_call (isa, opc))
+	info->insn_type = dis_jsr;
+
       /* Print the operands (if any).  */
       noperands = xtensa_opcode_num_operands (isa, opc);
       first = 1;
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
