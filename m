Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D48A21B23A2
	for <lists+linux-xtensa@lfdr.de>; Tue, 21 Apr 2020 12:13:28 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5ABCE6564;
	Tue, 21 Apr 2020 10:00:09 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by linux-xtensa.org (Postfix) with ESMTPS id 6047F655C
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Apr 2020 10:00:07 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id 7so1053209pjo.0
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Apr 2020 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pyBMhloWsmOcoLsc9GZAOjj3ndJh2ffdCeMC9Mo16l0=;
 b=hXKkAkg1R7WTxemSSeiWHMv+QYXpftuJ9G1Z6xYuQFIS3GkLo+xQpuFax27reSUtPN
 pOTXxw7pimKz1wH703BOjdPHMVSeEnIny4eGu9N9mJ27OgpMQbDY96vhpXzbCsBRHt8K
 myK+nw+EwOzdtaj2GVTJF/N80NoZW2AynVXUDHJwdvlAgha6iIf+URCsF08gofzHRJ88
 RUjBrO+EjuAVwn44mSqkipGdJ04v9WjC0mm1pTVUdHSO9VEjCrPAel5GRJ1IXsILfDQt
 r1JL80m2VEQsoDG30v2NlB6dB/uW6zLTV4C/4HK334U4sG8dly80YMux07ZYeeLDBAa0
 +arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pyBMhloWsmOcoLsc9GZAOjj3ndJh2ffdCeMC9Mo16l0=;
 b=lLSNE5QQkcM9AGZaL2hVuW/7rHPNo7/GxVXqr/nhXtfgHq1mEoRGo23bkVQzA1krIh
 5pogsnOd9e4HTtrFDRcJXc/CKrbt6vRPmmyoJg9uaOussr4+BlgcY1GysIGtozTarJCS
 C9qIZsiUmRwHKhgP4/92NK+SrwHsTXSXAfjBDgt+aR5fYRDyI20A0EABEEhLzNDkVVNW
 AVRNHa4qIYOv9or5xf+LuvZ8PzcqWx//IMJVumo8OrwQZXAqfPqg2ZdP5V6jTbSd7uVX
 jSez4uhYBJg1vHkiJ5aFaqi9hPpZtN8qcsh5VQ+YAKcCEn/9njIzjAb1EFZAQMJCgagW
 LNIQ==
X-Gm-Message-State: AGi0PuZAZbOOssX030FfbEL7yEe5/iYDPJ7iQyb10sY5JU5emOkDwwqN
 MqclIby65Vqf4G/uDADW2jI=
X-Google-Smtp-Source: APiQypIIyhijMrH4LAKNfyil+rlIauD2NTPMfbsyx0HWTZwsb90q9GCbAT793hF9xwAV1R0mWGYCog==
X-Received: by 2002:a17:90a:2401:: with SMTP id h1mr4838993pje.1.1587464005027; 
 Tue, 21 Apr 2020 03:13:25 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:63f0:d555:5eef:1d99:ced6])
 by smtp.gmail.com with ESMTPSA id k193sm1815731pga.43.2020.04.21.03.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 03:13:24 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Tue, 21 Apr 2020 03:13:09 -0700
Message-Id: <20200421101309.19304-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [PATCH] xtensa: fix PR ld/25861
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

Introduce new relaxations XTENSA_PDIFF{8,16,32} for positive differences
(subtracted symbol precedes diminished symbol) and XTENSA_NDIFF{8,16,32}
for negative differences (subtracted symbol follows diminished symbol).
Don't generate XTENSA_DIFF relocations in the assembler, generate
XTENSA_PDIFF or XTENSA_NDIFF based on relative symbol position.

Handle XTENSA_DIFF in BFD for compatibility with old object files.
Handle XTENSA_PDIFF and XTENSA_NDIFF in BFD, treating difference value
as unsigned.

2020-04-21  Max Filippov  <jcmvbkbc@gmail.com>
bfd/
	* bfd-in2.h: Regenerated.
	* elf32-xtensa.c (elf_howto_table): New entries for
	R_XTENSA_PDIFF{8,16,32} and R_XTENSA_NDIFF{8,16,32}.
	(elf_xtensa_reloc_type_lookup, elf_xtensa_do_reloc)
	(relax_section): Add cases for R_XTENSA_PDIFF{8,16,32} and
       	R_XTENSA_NDIFF{8,16,32}.
	* libbfd.h (bfd_reloc_code_real_names): Add names for
	BFD_RELOC_XTENSA_PDIFF{8,16,32} and
       	BFD_RELOC_XTENSA_NDIFF{8,16,32}.
	* reloc.c: Add documentation for BFD_RELOC_XTENSA_PDIFF{8,16,32}
       	and BFD_RELOC_XTENSA_NDIFF{8,16,32}.

binutils/
	* readelf.c (is_none_reloc): Recognize
	BFD_RELOC_XTENSA_PDIFF{8,16,32} and
       	BFD_RELOC_XTENSA_NDIFF{8,16,32}.

gas/
	* config/tc-xtensa.c (md_apply_fix): Replace
	BFD_RELOC_XTENSA_DIFF{8,16,32} generation with
	BFD_RELOC_XTENSA_PDIFF{8,16,32} and
        BFD_RELOC_XTENSA_NDIFF{8,16,32} generation.
	* testsuite/gas/xtensa/loc.d: Replace BFD_RELOC_XTENSA_DIFF16
       	with BFD_RELOC_XTENSA_PDIFF16 in the expected output.

include/
	* elf/xtensa.h (elf_xtensa_reloc_type): New entries for
	R_XTENSA_PDIFF{8,16,32} and R_XTENSA_NDIFF{8,16,32}.

ld/
	* testsuite/ld-xtensa/relax-loc.d: New test definition.
	* testsuite/ld-xtensa/relax-loc.s: New test source.
	* testsuite/ld-xtensa/xtensa.exp (relax-loc): New test.
---
 bfd/bfd-in2.h                      | 20 ++++++-
 bfd/elf32-xtensa.c                 | 89 +++++++++++++++++++++++++++++-
 bfd/libbfd.h                       |  6 ++
 bfd/reloc.c                        | 24 ++++++++
 binutils/readelf.c                 |  8 ++-
 gas/config/tc-xtensa.c             | 12 +++-
 gas/testsuite/gas/xtensa/loc.d     |  2 +-
 include/elf/xtensa.h               |  6 ++
 ld/testsuite/ld-xtensa/relax-loc.d |  7 +++
 ld/testsuite/ld-xtensa/relax-loc.s | 15 +++++
 ld/testsuite/ld-xtensa/xtensa.exp  |  1 +
 11 files changed, 183 insertions(+), 7 deletions(-)
 create mode 100644 ld/testsuite/ld-xtensa/relax-loc.d
 create mode 100644 ld/testsuite/ld-xtensa/relax-loc.s

diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
index 37114607b515..be6a30f57955 100644
--- a/bfd/bfd-in2.h
+++ b/bfd/bfd-in2.h
@@ -5217,7 +5217,9 @@ to one of its own internal functions or data structures.  */
 PLT entries.  Otherwise, this is just a generic 32-bit relocation.  */
   BFD_RELOC_XTENSA_PLT,
 
-/* Xtensa relocations to mark the difference of two local symbols.
+/* Xtensa relocations for backward compatibility.  These have been replaced
+by BFD_RELOC_XTENSA_PDIFF and BFD_RELOC_XTENSA_NDIFF.
+Xtensa relocations to mark the difference of two local symbols.
 These are only needed to support linker relaxation and can be ignored
 when not relaxing.  The field is set to the value of the difference
 assuming no relaxation.  The relocation encodes the position of the
@@ -5291,6 +5293,22 @@ BFD_RELOC_XTENSA_ASM_EXPAND.  */
   BFD_RELOC_XTENSA_TLS_ARG,
   BFD_RELOC_XTENSA_TLS_CALL,
 
+/* Xtensa relocations to mark the difference of two local symbols.
+These are only needed to support linker relaxation and can be ignored
+when not relaxing.  The field is set to the value of the difference
+assuming no relaxation.  The relocation encodes the position of the
+subtracted symbol so the linker can determine whether to adjust the field
+value.  PDIFF relocations are used for positive differences, NDIFF
+relocations are used for negative differences.  The difference value
+is treated as unsigned with these relocation types, giving full
+8/16 value ranges.  */
+  BFD_RELOC_XTENSA_PDIFF8,
+  BFD_RELOC_XTENSA_PDIFF16,
+  BFD_RELOC_XTENSA_PDIFF32,
+  BFD_RELOC_XTENSA_NDIFF8,
+  BFD_RELOC_XTENSA_NDIFF16,
+  BFD_RELOC_XTENSA_NDIFF32,
+
 /* 8 bit signed offset in (ix+d) or (iy+d).  */
   BFD_RELOC_Z80_DISP8,
 
diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
index 473a9d76f289..fded42d52a9a 100644
--- a/bfd/elf32-xtensa.c
+++ b/bfd/elf32-xtensa.c
@@ -325,6 +325,20 @@ static reloc_howto_type elf_howto_table[] =
   HOWTO (R_XTENSA_TLS_CALL, 0, 0, 0, FALSE, 0, complain_overflow_dont,
 	 bfd_elf_xtensa_reloc, "R_XTENSA_TLS_CALL",
 	 FALSE, 0, 0, FALSE),
+
+  HOWTO (R_XTENSA_PDIFF8, 0, 0, 8, FALSE, 0, complain_overflow_bitfield,
+	 bfd_elf_xtensa_reloc, "R_XTENSA_PDIFF8", FALSE, 0, 0xff, FALSE),
+  HOWTO (R_XTENSA_PDIFF16, 0, 1, 16, FALSE, 0, complain_overflow_bitfield,
+	 bfd_elf_xtensa_reloc, "R_XTENSA_PDIFF16", FALSE, 0, 0xffff, FALSE),
+  HOWTO (R_XTENSA_PDIFF32, 0, 2, 32, FALSE, 0, complain_overflow_bitfield,
+	 bfd_elf_xtensa_reloc, "R_XTENSA_PDIFF32", FALSE, 0, 0xffffffff, FALSE),
+
+  HOWTO (R_XTENSA_NDIFF8, 0, 0, 8, FALSE, 0, complain_overflow_bitfield,
+	 bfd_elf_xtensa_reloc, "R_XTENSA_NDIFF8", FALSE, 0, 0xff, FALSE),
+  HOWTO (R_XTENSA_NDIFF16, 0, 1, 16, FALSE, 0, complain_overflow_bitfield,
+	 bfd_elf_xtensa_reloc, "R_XTENSA_NDIFF16", FALSE, 0, 0xffff, FALSE),
+  HOWTO (R_XTENSA_NDIFF32, 0, 2, 32, FALSE, 0, complain_overflow_bitfield,
+	 bfd_elf_xtensa_reloc, "R_XTENSA_NDIFF32", FALSE, 0, 0xffffffff, FALSE),
 };
 
 #if DEBUG_GEN_RELOC
@@ -364,6 +378,30 @@ elf_xtensa_reloc_type_lookup (bfd *abfd ATTRIBUTE_UNUSED,
       TRACE ("BFD_RELOC_XTENSA_DIFF32");
       return &elf_howto_table[(unsigned) R_XTENSA_DIFF32 ];
 
+    case BFD_RELOC_XTENSA_PDIFF8:
+      TRACE ("BFD_RELOC_XTENSA_PDIFF8");
+      return &elf_howto_table[(unsigned) R_XTENSA_PDIFF8 ];
+
+    case BFD_RELOC_XTENSA_PDIFF16:
+      TRACE ("BFD_RELOC_XTENSA_PDIFF16");
+      return &elf_howto_table[(unsigned) R_XTENSA_PDIFF16 ];
+
+    case BFD_RELOC_XTENSA_PDIFF32:
+      TRACE ("BFD_RELOC_XTENSA_PDIFF32");
+      return &elf_howto_table[(unsigned) R_XTENSA_PDIFF32 ];
+
+    case BFD_RELOC_XTENSA_NDIFF8:
+      TRACE ("BFD_RELOC_XTENSA_NDIFF8");
+      return &elf_howto_table[(unsigned) R_XTENSA_NDIFF8 ];
+
+    case BFD_RELOC_XTENSA_NDIFF16:
+      TRACE ("BFD_RELOC_XTENSA_NDIFF16");
+      return &elf_howto_table[(unsigned) R_XTENSA_NDIFF16 ];
+
+    case BFD_RELOC_XTENSA_NDIFF32:
+      TRACE ("BFD_RELOC_XTENSA_NDIFF32");
+      return &elf_howto_table[(unsigned) R_XTENSA_NDIFF32 ];
+
     case BFD_RELOC_XTENSA_RTLD:
       TRACE ("BFD_RELOC_XTENSA_RTLD");
       return &elf_howto_table[(unsigned) R_XTENSA_RTLD ];
@@ -1851,6 +1889,12 @@ elf_xtensa_do_reloc (reloc_howto_type *howto,
     case R_XTENSA_DIFF8:
     case R_XTENSA_DIFF16:
     case R_XTENSA_DIFF32:
+    case R_XTENSA_PDIFF8:
+    case R_XTENSA_PDIFF16:
+    case R_XTENSA_PDIFF32:
+    case R_XTENSA_NDIFF8:
+    case R_XTENSA_NDIFF16:
+    case R_XTENSA_NDIFF32:
     case R_XTENSA_TLS_FUNC:
     case R_XTENSA_TLS_ARG:
     case R_XTENSA_TLS_CALL:
@@ -9604,7 +9648,13 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
 
 	      if (r_type == R_XTENSA_DIFF8
 		  || r_type == R_XTENSA_DIFF16
-		  || r_type == R_XTENSA_DIFF32)
+		  || r_type == R_XTENSA_DIFF32
+		  || r_type == R_XTENSA_PDIFF8
+		  || r_type == R_XTENSA_PDIFF16
+		  || r_type == R_XTENSA_PDIFF32
+		  || r_type == R_XTENSA_NDIFF8
+		  || r_type == R_XTENSA_NDIFF16
+		  || r_type == R_XTENSA_NDIFF32)
 		{
 		  bfd_signed_vma diff_value = 0;
 		  bfd_vma new_end_offset, diff_mask = 0;
@@ -9631,8 +9681,27 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
 		      diff_value =
 			bfd_get_signed_32 (abfd, &contents[old_source_offset]);
 		      break;
+		    case R_XTENSA_PDIFF8:
+		    case R_XTENSA_NDIFF8:
+		      diff_value =
+			bfd_get_8 (abfd, &contents[old_source_offset]);
+		      break;
+		    case R_XTENSA_PDIFF16:
+		    case R_XTENSA_NDIFF16:
+		      diff_value =
+			bfd_get_16 (abfd, &contents[old_source_offset]);
+		      break;
+		    case R_XTENSA_PDIFF32:
+		    case R_XTENSA_NDIFF32:
+		      diff_value =
+			bfd_get_32 (abfd, &contents[old_source_offset]);
+		      break;
 		    }
 
+		  if (r_type >= R_XTENSA_NDIFF8
+		      && r_type <= R_XTENSA_NDIFF32)
+		    diff_value = -diff_value;
+
 		  new_end_offset = offset_with_removed_text_map
 		    (&target_relax_info->action_list,
 		     r_rel.target_offset + diff_value);
@@ -9655,6 +9724,24 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
 		      bfd_put_signed_32 (abfd, diff_value,
 				  &contents[old_source_offset]);
 		      break;
+		    case R_XTENSA_PDIFF8:
+		    case R_XTENSA_NDIFF8:
+		      diff_mask = 0xff;
+		      bfd_put_8 (abfd, diff_value,
+				 &contents[old_source_offset]);
+		      break;
+		    case R_XTENSA_PDIFF16:
+		    case R_XTENSA_NDIFF16:
+		      diff_mask = 0xffff;
+		      bfd_put_16 (abfd, diff_value,
+				  &contents[old_source_offset]);
+		      break;
+		    case R_XTENSA_PDIFF32:
+		    case R_XTENSA_NDIFF32:
+		      diff_mask = 0xffffffff;
+		      bfd_put_32 (abfd, diff_value,
+				  &contents[old_source_offset]);
+		      break;
 		    }
 
 		  /* Check for overflow. Sign bits must be all zeroes or all ones */
diff --git a/bfd/libbfd.h b/bfd/libbfd.h
index 3c184fcadadf..989f4bc0b595 100644
--- a/bfd/libbfd.h
+++ b/bfd/libbfd.h
@@ -2919,6 +2919,12 @@ static const char *const bfd_reloc_code_real_names[] = { "@@uninitialized@@",
   "BFD_RELOC_XTENSA_TLS_FUNC",
   "BFD_RELOC_XTENSA_TLS_ARG",
   "BFD_RELOC_XTENSA_TLS_CALL",
+  "BFD_RELOC_XTENSA_PDIFF8",
+  "BFD_RELOC_XTENSA_PDIFF16",
+  "BFD_RELOC_XTENSA_PDIFF32",
+  "BFD_RELOC_XTENSA_NDIFF8",
+  "BFD_RELOC_XTENSA_NDIFF16",
+  "BFD_RELOC_XTENSA_NDIFF32",
   "BFD_RELOC_Z80_DISP8",
   "BFD_RELOC_Z80_BYTE0",
   "BFD_RELOC_Z80_BYTE1",
diff --git a/bfd/reloc.c b/bfd/reloc.c
index c4dec86d1d46..f5df8e2ab3eb 100644
--- a/bfd/reloc.c
+++ b/bfd/reloc.c
@@ -6556,6 +6556,8 @@ ENUMX
 ENUMX
   BFD_RELOC_XTENSA_DIFF32
 ENUMDOC
+  Xtensa relocations for backward compatibility.  These have been replaced
+  by BFD_RELOC_XTENSA_PDIFF and BFD_RELOC_XTENSA_NDIFF.
   Xtensa relocations to mark the difference of two local symbols.
   These are only needed to support linker relaxation and can be ignored
   when not relaxing.  The field is set to the value of the difference
@@ -6668,6 +6670,28 @@ ENUMX
   BFD_RELOC_XTENSA_TLS_CALL
 ENUMDOC
   Xtensa TLS relocations.
+ENUM
+  BFD_RELOC_XTENSA_PDIFF8
+ENUMX
+  BFD_RELOC_XTENSA_PDIFF16
+ENUMX
+  BFD_RELOC_XTENSA_PDIFF32
+ENUMX
+  BFD_RELOC_XTENSA_NDIFF8
+ENUMX
+  BFD_RELOC_XTENSA_NDIFF16
+ENUMX
+  BFD_RELOC_XTENSA_NDIFF32
+ENUMDOC
+  Xtensa relocations to mark the difference of two local symbols.
+  These are only needed to support linker relaxation and can be ignored
+  when not relaxing.  The field is set to the value of the difference
+  assuming no relaxation.  The relocation encodes the position of the
+  subtracted symbol so the linker can determine whether to adjust the field
+  value.  PDIFF relocations are used for positive differences, NDIFF
+  relocations are used for negative differences.  The difference value
+  is treated as unsigned with these relocation types, giving full
+  8/16 value ranges.
 
 ENUM
   BFD_RELOC_Z80_DISP8
diff --git a/binutils/readelf.c b/binutils/readelf.c
index d4756c93b345..800918f901c8 100644
--- a/binutils/readelf.c
+++ b/binutils/readelf.c
@@ -13262,7 +13262,13 @@ is_none_reloc (Filedata * filedata, unsigned int reloc_type)
       return (reloc_type == 0      /* R_XTENSA_NONE.  */
 	      || reloc_type == 17  /* R_XTENSA_DIFF8.  */
 	      || reloc_type == 18  /* R_XTENSA_DIFF16.  */
-	      || reloc_type == 19  /* R_XTENSA_DIFF32.  */);
+	      || reloc_type == 19  /* R_XTENSA_DIFF32.  */
+	      || reloc_type == 57  /* R_XTENSA_PDIFF8.  */
+	      || reloc_type == 58  /* R_XTENSA_PDIFF16.  */
+	      || reloc_type == 59  /* R_XTENSA_PDIFF32.  */
+	      || reloc_type == 60  /* R_XTENSA_NDIFF8.  */
+	      || reloc_type == 61  /* R_XTENSA_NDIFF16.  */
+	      || reloc_type == 62  /* R_XTENSA_NDIFF32.  */);
     }
   return FALSE;
 }
diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
index 71d4d94a8d7d..ee75c13548ff 100644
--- a/gas/config/tc-xtensa.c
+++ b/gas/config/tc-xtensa.c
@@ -5974,18 +5974,24 @@ md_apply_fix (fixS *fixP, valueT *valP, segT seg)
     case BFD_RELOC_8:
       if (fixP->fx_subsy)
 	{
+	  bfd_boolean neg = S_GET_VALUE (fixP->fx_addsy) + fixP->fx_offset
+	    < S_GET_VALUE (fixP->fx_subsy);
+
 	  switch (fixP->fx_r_type)
 	    {
 	    case BFD_RELOC_8:
-	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF8;
+	      fixP->fx_r_type = neg
+		? BFD_RELOC_XTENSA_NDIFF8 : BFD_RELOC_XTENSA_PDIFF8;
 	      fixP->fx_signed = 0;
 	      break;
 	    case BFD_RELOC_16:
-	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF16;
+	      fixP->fx_r_type = neg
+		? BFD_RELOC_XTENSA_NDIFF16 : BFD_RELOC_XTENSA_PDIFF16;
 	      fixP->fx_signed = 0;
 	      break;
 	    case BFD_RELOC_32:
-	      fixP->fx_r_type = BFD_RELOC_XTENSA_DIFF32;
+	      fixP->fx_r_type = neg
+		? BFD_RELOC_XTENSA_NDIFF32 : BFD_RELOC_XTENSA_PDIFF32;
 	      fixP->fx_signed = 0;
 	      break;
 	    default:
diff --git a/gas/testsuite/gas/xtensa/loc.d b/gas/testsuite/gas/xtensa/loc.d
index 71983cc90055..8fb3425999d5 100644
--- a/gas/testsuite/gas/xtensa/loc.d
+++ b/gas/testsuite/gas/xtensa/loc.d
@@ -6,5 +6,5 @@
 
 RELOCATION RECORDS FOR \[\.debug_line\]:
 #...
-.*R_XTENSA_DIFF16.*\.text\+0x00009c42
+.*R_XTENSA_PDIFF16.*\.text\+0x00009c42
 #...
diff --git a/include/elf/xtensa.h b/include/elf/xtensa.h
index 2eb5e4e52941..bd5c80d13777 100644
--- a/include/elf/xtensa.h
+++ b/include/elf/xtensa.h
@@ -87,6 +87,12 @@ START_RELOC_NUMBERS (elf_xtensa_reloc_type)
      RELOC_NUMBER (R_XTENSA_TLS_FUNC, 54)
      RELOC_NUMBER (R_XTENSA_TLS_ARG, 55)
      RELOC_NUMBER (R_XTENSA_TLS_CALL, 56)
+     RELOC_NUMBER (R_XTENSA_PDIFF8, 57)
+     RELOC_NUMBER (R_XTENSA_PDIFF16, 58)
+     RELOC_NUMBER (R_XTENSA_PDIFF32, 59)
+     RELOC_NUMBER (R_XTENSA_NDIFF8, 60)
+     RELOC_NUMBER (R_XTENSA_NDIFF16, 61)
+     RELOC_NUMBER (R_XTENSA_NDIFF32, 62)
 END_RELOC_NUMBERS (R_XTENSA_max)
 
 /* Processor-specific flags for the ELF header e_flags field.  */
diff --git a/ld/testsuite/ld-xtensa/relax-loc.d b/ld/testsuite/ld-xtensa/relax-loc.d
new file mode 100644
index 000000000000..3c8d673732ff
--- /dev/null
+++ b/ld/testsuite/ld-xtensa/relax-loc.d
@@ -0,0 +1,7 @@
+#as: --text-section-literals
+#ld:
+#objdump: --dwarf=decodedline
+#...
+relax-loc.s[ 	]+1[ 	]+0x400054[ 	]+.*
+relax-loc.s[ 	]+2[ 	]+0x40005c[ 	]+.*
+#...
diff --git a/ld/testsuite/ld-xtensa/relax-loc.s b/ld/testsuite/ld-xtensa/relax-loc.s
new file mode 100644
index 000000000000..d768470e287a
--- /dev/null
+++ b/ld/testsuite/ld-xtensa/relax-loc.s
@@ -0,0 +1,15 @@
+	.file	1 "relax-loc.s"
+	.globl	_start
+	.globl	_ResetVector
+	.text
+_ResetVector:
+_start:
+	.loc	1 1
+	j	1f
+	.literal_position
+1:
+	.loc	1 2
+
+	.rep	10000
+	movi	a2, 0x12345678
+	.endr
diff --git a/ld/testsuite/ld-xtensa/xtensa.exp b/ld/testsuite/ld-xtensa/xtensa.exp
index 9b2235b2151b..de39887936ad 100644
--- a/ld/testsuite/ld-xtensa/xtensa.exp
+++ b/ld/testsuite/ld-xtensa/xtensa.exp
@@ -27,6 +27,7 @@ run_dump_test "call_overflow"
 run_dump_test "coalesce"
 run_dump_test "diff_overflow"
 run_dump_test "lcall"
+run_dump_test "relax-loc"
 
 run_dump_test "relax-static-pie"
 run_dump_test "relax-static-local-pie"
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
