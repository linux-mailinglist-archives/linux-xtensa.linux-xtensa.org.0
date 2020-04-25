Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D06061B8918
	for <lists+linux-xtensa@lfdr.de>; Sat, 25 Apr 2020 21:40:34 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 164266583;
	Sat, 25 Apr 2020 19:27:06 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 3C7C46579
 for <linux-xtensa@linux-xtensa.org>; Sat, 25 Apr 2020 19:27:03 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id e6so5379967pjt.4
 for <linux-xtensa@linux-xtensa.org>; Sat, 25 Apr 2020 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0uPM04SlxR8X+eK1OzaeGhuZryo3EcRTbU1gYiQc8Y=;
 b=cknYRaBJJNdC6coEvE7ewwrqQvafmDxGeNIFQzwxrm9MFlnaStsXdoc2SJ0plWetXP
 33KDdYxXK5UnILatDZQBSq9d/HAWiKgD1Ap+p2tPDZRry0kGW2KsMykPgiNDCv4GfUsz
 SbJQRiuhJp6NsH3FtBRSLJHHCwE29NEpGoYLYBQQJIliNgMSwY4Ni1EUBydbP1hVoJch
 +L7nl/BM8DbFjBwE9YACl7s1Dw3bhc7uJa1ImxPV/SYxQeBpszDPURuXBj0dLPItL8b+
 V7Oc4DZabmO5nabu+OUgVXoP/z9w7mTgtxTpnotKcA135qB+jPS7p1Fq3XeMbcNFNY8D
 jD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0uPM04SlxR8X+eK1OzaeGhuZryo3EcRTbU1gYiQc8Y=;
 b=JvRFOLqL9XEq18cLhkwtk6S8fYPSkehsg7PV4DAnSymqjQyfltzXnAQuAdylQXh8xj
 YZTTT/awPtZMjilxeqA9buAPvtA4uKuLqSiCkErU+DM9VvYiS73BikKViJI+9aw1JPsF
 DKCLDyqvh3KkNREWHV/qKl53EBwFFVpjFHC/pYwszJMLNMpdYQUTI6hD7NzF40TcqUgL
 yoY1Eo9pyXLCX6zqndeyT+AO9h+A8rSymedAWg91XP8AvtnoEqE0snKIksdv2+TS6PqS
 XlZH1LXBWAQFGrXLcZOkZIeJzBY9tv+kYVSkVGhZ5OFLwTLjJIkVa1j4KVosIKmb/B9a
 HhcQ==
X-Gm-Message-State: AGi0PuZQikOghPbDgg0+MSpFVL6/pbcJfRNodJAsSe6A9g0qVK6swtCe
 pCi0po0zhQlbtC5mt6+MaNE=
X-Google-Smtp-Source: APiQypJ60JIOwNFRL+Fah7zPmg6dU/FDGB2LrmPo4VapJA5oHArAB2NKf17sljZGgQbzEU2aW9ZlXg==
X-Received: by 2002:a17:90a:224b:: with SMTP id
 c69mr14438609pje.8.1587843629173; 
 Sat, 25 Apr 2020 12:40:29 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:63f0:d555:5eef:1d99:ced6])
 by smtp.gmail.com with ESMTPSA id y21sm2276519pge.42.2020.04.25.12.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 12:40:28 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Sat, 25 Apr 2020 12:40:11 -0700
Message-Id: <20200425194011.19394-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [PATCH] xtensa: fix XTENSA_NDIFF handling for PR
	ld/25861
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

Fields marked with XTENSA_NDIFF relocations are not negated, they only
have sign bits removed. Don't negate their values when relaxation is
performed. Don't add sign bits when the value is zero. Report overflow
when the result has negative sign but all significant bits are zero.

2020-04-25  Max Filippov  <jcmvbkbc@gmail.com>
bfd/
	* elf32-xtensa.c (relax_section): Don't negate diff_value for
	XTENSA_NDIFF relocations. Don't add sign bits whe diff_value
	equals 0. Report overflow when the result has negative sign but
	all significant bits are zero.

ld/
	* testsuite/ld-xtensa/relax-diff1.d: New test definition.
	* testsuite/ld-xtensa/relax-diff1.s: New test source.
	* testsuite/ld-xtensa/relax-ndiff.d: New test definition.
	* testsuite/ld-xtensa/relax-ndiff.s: New test source.
	* testsuite/ld-xtensa/xtensa.exp: (relax-diff1)
	(relax-ndiff): New tests.
---
 bfd/elf32-xtensa.c                   | 26 +++++++++++++++-----------
 ld/testsuite/ld-xtensa/relax-diff1.d |  6 ++++++
 ld/testsuite/ld-xtensa/relax-diff1.s | 18 ++++++++++++++++++
 ld/testsuite/ld-xtensa/relax-ndiff.d |  6 ++++++
 ld/testsuite/ld-xtensa/relax-ndiff.s | 20 ++++++++++++++++++++
 ld/testsuite/ld-xtensa/xtensa.exp    |  2 ++
 6 files changed, 67 insertions(+), 11 deletions(-)
 create mode 100644 ld/testsuite/ld-xtensa/relax-diff1.d
 create mode 100644 ld/testsuite/ld-xtensa/relax-diff1.s
 create mode 100644 ld/testsuite/ld-xtensa/relax-ndiff.d
 create mode 100644 ld/testsuite/ld-xtensa/relax-ndiff.s

diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
index fded42d52a9a..4327b027911f 100644
--- a/bfd/elf32-xtensa.c
+++ b/bfd/elf32-xtensa.c
@@ -9670,37 +9670,44 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
 		  switch (r_type)
 		    {
 		    case R_XTENSA_DIFF8:
+		      diff_mask = 0x7f;
 		      diff_value =
 			bfd_get_signed_8 (abfd, &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_DIFF16:
+		      diff_mask = 0x7fff;
 		      diff_value =
 			bfd_get_signed_16 (abfd, &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_DIFF32:
+		      diff_mask = 0x7fffffff;
 		      diff_value =
 			bfd_get_signed_32 (abfd, &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_PDIFF8:
 		    case R_XTENSA_NDIFF8:
+		      diff_mask = 0xff;
 		      diff_value =
 			bfd_get_8 (abfd, &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_PDIFF16:
 		    case R_XTENSA_NDIFF16:
+		      diff_mask = 0xffff;
 		      diff_value =
 			bfd_get_16 (abfd, &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_PDIFF32:
 		    case R_XTENSA_NDIFF32:
+		      diff_mask = 0xffffffff;
 		      diff_value =
 			bfd_get_32 (abfd, &contents[old_source_offset]);
 		      break;
 		    }
 
 		  if (r_type >= R_XTENSA_NDIFF8
-		      && r_type <= R_XTENSA_NDIFF32)
-		    diff_value = -diff_value;
+		      && r_type <= R_XTENSA_NDIFF32
+		      && diff_value)
+		    diff_value |= ~diff_mask;
 
 		  new_end_offset = offset_with_removed_text_map
 		    (&target_relax_info->action_list,
@@ -9710,43 +9717,40 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
 		  switch (r_type)
 		    {
 		    case R_XTENSA_DIFF8:
-		      diff_mask = 0x7f;
 		      bfd_put_signed_8 (abfd, diff_value,
 				 &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_DIFF16:
-		      diff_mask = 0x7fff;
 		      bfd_put_signed_16 (abfd, diff_value,
 				  &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_DIFF32:
-		      diff_mask = 0x7fffffff;
 		      bfd_put_signed_32 (abfd, diff_value,
 				  &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_PDIFF8:
 		    case R_XTENSA_NDIFF8:
-		      diff_mask = 0xff;
 		      bfd_put_8 (abfd, diff_value,
 				 &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_PDIFF16:
 		    case R_XTENSA_NDIFF16:
-		      diff_mask = 0xffff;
 		      bfd_put_16 (abfd, diff_value,
 				  &contents[old_source_offset]);
 		      break;
 		    case R_XTENSA_PDIFF32:
 		    case R_XTENSA_NDIFF32:
-		      diff_mask = 0xffffffff;
 		      bfd_put_32 (abfd, diff_value,
 				  &contents[old_source_offset]);
 		      break;
 		    }
 
-		  /* Check for overflow. Sign bits must be all zeroes or all ones */
-		  if ((diff_value & ~diff_mask) != 0 &&
-		      (diff_value & ~diff_mask) != (-1 & ~diff_mask))
+		  /* Check for overflow. Sign bits must be all zeroes or
+		     all ones.  When sign bits are all ones diff_value
+		     may not be zero.  */
+		  if (((diff_value & ~diff_mask) != 0
+		       && (diff_value & ~diff_mask) != ~diff_mask)
+		      || (diff_value && (bfd_vma) diff_value == ~diff_mask))
 		    {
 		      (*link_info->callbacks->reloc_dangerous)
 			(link_info, _("overflow after relaxation"),
diff --git a/ld/testsuite/ld-xtensa/relax-diff1.d b/ld/testsuite/ld-xtensa/relax-diff1.d
new file mode 100644
index 000000000000..900b55bb9c8e
--- /dev/null
+++ b/ld/testsuite/ld-xtensa/relax-diff1.d
@@ -0,0 +1,6 @@
+#as: --text-section-literals
+#ld:
+#objdump: -s
+#...
+ 410154 06fa0006 fffa.*
+#...
diff --git a/ld/testsuite/ld-xtensa/relax-diff1.s b/ld/testsuite/ld-xtensa/relax-diff1.s
new file mode 100644
index 000000000000..6cc8e2b9cef0
--- /dev/null
+++ b/ld/testsuite/ld-xtensa/relax-diff1.s
@@ -0,0 +1,18 @@
+	.globl	_start
+	.globl	_ResetVector
+	.text
+_ResetVector:
+_start:
+	.literal_position
+	movi	a2, 0x12345678
+	movi	a2, 0x12345678
+1:
+	.space	250
+2:
+	.space	65530
+3:
+	.align	4
+	.byte	1b - 2b
+	.byte	2b - 1b
+	.short	2b - 3b
+	.short	3b - 2b
diff --git a/ld/testsuite/ld-xtensa/relax-ndiff.d b/ld/testsuite/ld-xtensa/relax-ndiff.d
new file mode 100644
index 000000000000..2a1cfd3fff3d
--- /dev/null
+++ b/ld/testsuite/ld-xtensa/relax-ndiff.d
@@ -0,0 +1,6 @@
+#as: --text-section-literals
+#ld:
+#objdump: -s
+#...
+ 400074 fffffff6 0000000a fff6000a f60a.*
+#...
diff --git a/ld/testsuite/ld-xtensa/relax-ndiff.s b/ld/testsuite/ld-xtensa/relax-ndiff.s
new file mode 100644
index 000000000000..4e4176b129c2
--- /dev/null
+++ b/ld/testsuite/ld-xtensa/relax-ndiff.s
@@ -0,0 +1,20 @@
+	.globl	_start
+	.globl	_ResetVector
+	.text
+_ResetVector:
+_start:
+	.literal_position
+	movi	a2, 0x12345678
+	movi	a2, 0x12345678
+1:
+	.space	10
+2:
+	.space	10
+3:
+	.align	4
+	.word	1b - 2b
+	.word	3b - 2b
+	.short	1b - 2b
+	.short	3b - 2b
+	.byte	1b - 2b
+	.byte	3b - 2b
diff --git a/ld/testsuite/ld-xtensa/xtensa.exp b/ld/testsuite/ld-xtensa/xtensa.exp
index de39887936ad..5334bc60df34 100644
--- a/ld/testsuite/ld-xtensa/xtensa.exp
+++ b/ld/testsuite/ld-xtensa/xtensa.exp
@@ -27,7 +27,9 @@ run_dump_test "call_overflow"
 run_dump_test "coalesce"
 run_dump_test "diff_overflow"
 run_dump_test "lcall"
+run_dump_test "relax-diff1"
 run_dump_test "relax-loc"
+run_dump_test "relax-ndiff"
 
 run_dump_test "relax-static-pie"
 run_dump_test "relax-static-local-pie"
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
