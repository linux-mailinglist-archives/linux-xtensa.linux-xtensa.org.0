Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id CD7611FA0E9
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Jun 2020 22:05:36 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E1D262625;
	Mon, 15 Jun 2020 19:50:28 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by linux-xtensa.org (Postfix) with ESMTPS id B027D2621
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 19:50:25 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id m7so7250488plt.5
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 13:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2907ikTfWaktXAD88NCY/p33FWmWw08RNg6Vw6SgONM=;
 b=KaP5l8HKA4r1yydXjRcH+3li+Xe0wXURoPZ8r8msbBbiYm/XvZQ3LSaizaldgm8TgF
 In3LT27qKRTA1Xf2D491Nu2Ogh4VsMLNEv6L/lVMatUJFdZRlz9UuHDxpAvADDmvrtT+
 /2tR3KQCKSJsyxvOev3hrH4f3POkz8iI+M108qm80sZ16PuWJGh/TVVcylR7A/rQlwk3
 4JeVGJ/HQ3EAbQYBGDtaCQQoZTkZPO8bxMN4vuSR+OGMB9SVVqgTG4UuKy6/NMQZktfr
 N1Go5yso//PenFRxFWbOnWKEPK1pQG9VTyBqXcxxLWyL0AXuZjFTDHx2c6qcX8qUoGro
 A/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2907ikTfWaktXAD88NCY/p33FWmWw08RNg6Vw6SgONM=;
 b=YgAqkY8MZMeKRYDxfS4tuHtNnYmo38SFEDSSAjpozqdxCADGdLQoTwhRN9ITe1KcGQ
 ++pzP7gzmF1K5zTW6hw8wsicqf2d17dh1sKBOHtxDlWWKBYF1KhO7G1m6Pukibl7yZiV
 17QQp+vDKWTxWB6ZDM3hr+652eexLpSibWxNAO/lSf8gVvjH2vPPMpN9dEsu1Hyac0Xp
 y7M7fGFkHH3/v8ieMTwR7K7Ntko3npLOrztOcPEtbgUpR3yRw0qSk4Gz10y7bsO/K1MI
 4O7m7w9uYxpcpW06Xtkm1bTgu63xGzhSldpGXuTg2nBkfpWzPWsGX1zSHMjcpMyaSMN/
 Gn/w==
X-Gm-Message-State: AOAM532ko8RBDtSHcwx7ofPzROkO/dm5eaFi1NvVWGkZE3ymxib4Y/L1
 z3dkpOwQ2UzQ3GzJ49MinQ0=
X-Google-Smtp-Source: ABdhPJx4//t53ndXwHb3TC3VkVmcH0WmFNpNt1bSOfw0rfFid+KcYG2rkf1eSsz2E92IwKej69VThg==
X-Received: by 2002:a17:90b:3842:: with SMTP id
 nl2mr860830pjb.111.1592251531121; 
 Mon, 15 Jun 2020 13:05:31 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id o1sm15557701pfu.70.2020.06.15.13.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 13:05:30 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Mon, 15 Jun 2020 13:05:06 -0700
Message-Id: <20200615200506.11697-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [COMMITTED] xtensa: allow runtime ABI selection
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

2020-06-15  Max Filippov  <jcmvbkbc@gmail.com>
bfd/
	* elf32-xtensa.c (XSHAL_ABI, XTHAL_ABI_UNDEFINED)
	(XTHAL_ABI_WINDOWED, XTHAL_ABI_CALL0): New macros.
	(elf32xtensa_abi): New global variable.
	(xtensa_abi_choice): New function.
	(elf_xtensa_create_plt_entry): Use xtensa_abi_choice instead of
	XSHAL_ABI to select PLT code.

gas/
	* config/tc-xtensa.c (XTHAL_ABI_WINDOWED, XTHAL_ABI_CALL0): New
	macros.
	(elf32xtensa_abi): New declaration.
	(option_abi_windowed, option_abi_call0): New enum constants.
	(md_longopts): Add entries for --abi-windowed and --abi-call0.
	(md_parse_option): Add handlers for --abi-windowed and
	--abi-call0.
	(xtensa_add_config_info): Use xtensa_abi_choice instead of
	XSHAL_ABI to format ABI tag.
	* doc/as.texi (Target Xtensa options): Add --abi-windowed and
	--abi-call0 to the list of options.
	* doc/c-xtensa.texi: Add description for options --abi-windowed
	and --abi-call0.
	* testsuite/gas/xtensa/abi-call0.d: New test definition.
	* testsuite/gas/xtensa/abi-windowed.d: New test definition.
	* testsuite/gas/xtensa/abi.s: New test source.

include/
	* elf/xtensa.h (xtensa_abi_choice): New declaration.

ld/
	* emultempl/xtensaelf.em (XSHAL_ABI): Remove macro definition.
	(XTHAL_ABI_UNDEFINED, XTHAL_ABI_WINDOWED, XTHAL_ABI_CALL0): New
	macros.
	(elf32xtensa_abi): New declaration.
	(xt_config_info_unpack_and_check): Set elf32xtensa_abi if it is
	undefined.  Use xtensa_abi_choice instead of XSHAL_ABI to test
	ABI tag consistency.
	(xtensa_add_config_info): Use xtensa_abi_choice instead of
	XSHAL_ABI to format ABI tag.
	(PARSE_AND_LIST_PROLOGUE): Define OPTION_ABI_WINDOWED,
	OPTION_ABI_CALL0 and declare elf32xtensa_abi.
	(PARSE_AND_LIST_LONGOPTS): Add entries for --abi-windowed and
	--abi-call0.
	(PARSE_AND_LIST_OPTIONS): Add help text for --abi-windowed and
	--abi-call0.
	(PARSE_AND_LIST_ARGS_CASES): Add handlers for --abi-windowed and
	--abi-call0.
	* ld.texi: Add description for options --abi-windowed and
	--abi-call0.
---
 bfd/elf32-xtensa.c                      | 34 ++++++++++++++++++--
 gas/config/tc-xtensa.c                  | 29 ++++++++++++++---
 gas/doc/as.texi                         |  1 +
 gas/doc/c-xtensa.texi                   |  8 +++++
 gas/testsuite/gas/xtensa/abi-call0.d    |  7 +++++
 gas/testsuite/gas/xtensa/abi-windowed.d |  7 +++++
 gas/testsuite/gas/xtensa/abi.s          |  1 +
 include/elf/xtensa.h                    |  3 ++
 ld/emultempl/xtensaelf.em               | 41 ++++++++++++++++++++++---
 ld/ld.texi                              | 11 +++++++
 10 files changed, 130 insertions(+), 12 deletions(-)
 create mode 100644 gas/testsuite/gas/xtensa/abi-call0.d
 create mode 100644 gas/testsuite/gas/xtensa/abi-windowed.d
 create mode 100644 gas/testsuite/gas/xtensa/abi.s

diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
index 9dc815edbb33..b223424cce4e 100644
--- a/bfd/elf32-xtensa.c
+++ b/bfd/elf32-xtensa.c
@@ -37,6 +37,22 @@
 
 #define XTENSA_NO_NOP_REMOVAL 0
 
+#ifndef XSHAL_ABI
+#define XSHAL_ABI 0
+#endif
+
+#ifndef XTHAL_ABI_UNDEFINED
+#define XTHAL_ABI_UNDEFINED -1
+#endif
+
+#ifndef XTHAL_ABI_WINDOWED
+#define XTHAL_ABI_WINDOWED 0
+#endif
+
+#ifndef XTHAL_ABI_CALL0
+#define XTHAL_ABI_CALL0 1
+#endif
+
 /* Local helper functions.  */
 
 static bfd_boolean add_extra_plt_sections (struct bfd_link_info *, int);
@@ -164,6 +180,10 @@ int elf32xtensa_no_literal_movement = 1;
 
 bfd_boolean elf32xtensa_separate_props = FALSE;
 
+/* Xtensa ABI.  It affects PLT entry code.  */
+
+int elf32xtensa_abi = XTHAL_ABI_UNDEFINED;
+
 /* Rename one of the generic section flags to better document how it
    is used here.  */
 /* Whether relocations have been processed.  */
@@ -2247,6 +2267,13 @@ bfd_elf_xtensa_reloc (bfd *abfd,
   return flag;
 }
 
+int xtensa_abi_choice (void)
+{
+  if (elf32xtensa_abi == XTHAL_ABI_UNDEFINED)
+    return XSHAL_ABI;
+  else
+    return elf32xtensa_abi;
+}
 
 /* Set up an entry in the procedure linkage table.  */
 
@@ -2259,6 +2286,7 @@ elf_xtensa_create_plt_entry (struct bfd_link_info *info,
   bfd_vma plt_base, got_base;
   bfd_vma code_offset, lit_offset, abi_offset;
   int chunk;
+  int abi = xtensa_abi_choice ();
 
   chunk = reloc_index / PLT_ENTRIES_PER_CHUNK;
   splt = elf_xtensa_get_plt_section (info, chunk);
@@ -2279,10 +2307,10 @@ elf_xtensa_create_plt_entry (struct bfd_link_info *info,
   /* Fill in the entry in the procedure linkage table.  */
   memcpy (splt->contents + code_offset,
 	  (bfd_big_endian (output_bfd)
-	   ? elf_xtensa_be_plt_entry[XSHAL_ABI != XTHAL_ABI_WINDOWED]
-	   : elf_xtensa_le_plt_entry[XSHAL_ABI != XTHAL_ABI_WINDOWED]),
+	   ? elf_xtensa_be_plt_entry[abi != XTHAL_ABI_WINDOWED]
+	   : elf_xtensa_le_plt_entry[abi != XTHAL_ABI_WINDOWED]),
 	  PLT_ENTRY_SIZE);
-  abi_offset = XSHAL_ABI == XTHAL_ABI_WINDOWED ? 3 : 0;
+  abi_offset = abi == XTHAL_ABI_WINDOWED ? 3 : 0;
   bfd_put_16 (output_bfd, l32r_offset (got_base + 0,
 				       plt_base + code_offset + abi_offset),
 	      splt->contents + code_offset + abi_offset + 1);
diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
index 14a5a2a9497e..b512f7a36bac 100644
--- a/gas/config/tc-xtensa.c
+++ b/gas/config/tc-xtensa.c
@@ -31,8 +31,12 @@
 #include "elf/xtensa.h"
 
 /* Provide default values for new configuration settings.  */
-#ifndef XSHAL_ABI
-#define XSHAL_ABI 0
+#ifndef XTHAL_ABI_WINDOWED
+#define XTHAL_ABI_WINDOWED 0
+#endif
+
+#ifndef XTHAL_ABI_CALL0
+#define XTHAL_ABI_CALL0 1
 #endif
 
 #ifndef XTENSA_MARCH_EARLIEST
@@ -648,6 +652,10 @@ static bfd_boolean workaround_all_short_loops = FALSE;
    This option is defined in BDF library.  */
 extern bfd_boolean elf32xtensa_separate_props;
 
+/* Xtensa ABI.
+   This option is defined in BDF library.  */
+extern int elf32xtensa_abi;
+
 static void
 xtensa_setup_hw_workarounds (int earliest, int latest)
 {
@@ -735,6 +743,9 @@ enum
 
   option_separate_props,
   option_no_separate_props,
+
+  option_abi_windowed,
+  option_abi_call0,
 };
 
 const char *md_shortopts = "";
@@ -816,6 +827,9 @@ struct option md_longopts[] =
 
   { "separate-prop-tables", no_argument, NULL, option_separate_props },
 
+  { "abi-windowed", no_argument, NULL, option_abi_windowed },
+  { "abi-call0", no_argument, NULL, option_abi_call0 },
+
   { NULL, no_argument, NULL, 0 }
 };
 
@@ -1044,6 +1058,14 @@ md_parse_option (int c, const char *arg)
       elf32xtensa_separate_props = FALSE;
       return 1;
 
+    case option_abi_windowed:
+      elf32xtensa_abi = XTHAL_ABI_WINDOWED;
+      return 1;
+
+    case option_abi_call0:
+      elf32xtensa_abi = XTHAL_ABI_CALL0;
+      return 1;
+
     default:
       return 0;
     }
@@ -8958,7 +8980,6 @@ is_local_forward_loop (const TInsn *insn, fragS *fragP)
   return FALSE;
 }
 
-
 #define XTINFO_NAME "Xtensa_Info"
 #define XTINFO_NAMESZ 12
 #define XTINFO_TYPE 1
@@ -8975,7 +8996,7 @@ xtensa_add_config_info (void)
 
   data = XNEWVEC (char, 100);
   sprintf (data, "USE_ABSOLUTE_LITERALS=%d\nABI=%d\n",
-	   XSHAL_USE_ABSOLUTE_LITERALS, XSHAL_ABI);
+	   XSHAL_USE_ABSOLUTE_LITERALS, xtensa_abi_choice ());
   sz = strlen (data) + 1;
 
   /* Add enough null terminators to pad to a word boundary.  */
diff --git a/gas/doc/as.texi b/gas/doc/as.texi
index dd6c96835f95..f8d892eaa5c1 100644
--- a/gas/doc/as.texi
+++ b/gas/doc/as.texi
@@ -626,6 +626,7 @@ gcc(1), ld(1), and the Info entries for @file{binutils} and @file{ld}.
  [@b{--[no-]transform}]
  [@b{--rename-section} @var{oldname}=@var{newname}]
  [@b{--[no-]trampolines}]
+ [@b{--abi-windowed}|@b{--abi-call0}]
 @end ifset
 @ifset Z80
 
diff --git a/gas/doc/c-xtensa.texi b/gas/doc/c-xtensa.texi
index e0c5e1ae288f..b17ee83dbf4f 100644
--- a/gas/doc/c-xtensa.texi
+++ b/gas/doc/c-xtensa.texi
@@ -122,6 +122,14 @@ across a greater range of addresses.  @xref{Xtensa Jump Relaxation,
 potentially be out of range.  In the absence of such jumps this option
 does not affect code size or performance.  The default is
 @samp{--trampolines}.
+
+@item --abi-windowed | --abi-call0
+@kindex --abi-windowed
+@kindex --abi-call0
+Choose ABI tag written to the @code{.xtensa.info} section.  ABI tag
+indicates ABI of the assembly code.  A warning is issued by the linker
+on an attempt to link object files with inconsistent ABI tags.
+Default ABI is chosen by the Xtensa core configuration.
 @end table
 
 @c man end
diff --git a/gas/testsuite/gas/xtensa/abi-call0.d b/gas/testsuite/gas/xtensa/abi-call0.d
new file mode 100644
index 000000000000..83ff10d708de
--- /dev/null
+++ b/gas/testsuite/gas/xtensa/abi-call0.d
@@ -0,0 +1,7 @@
+#as: --abi-call0
+#objdump: -j .xtensa.info -s
+#source: abi.s
+
+#...
+.*ABI=1.*
+#...
diff --git a/gas/testsuite/gas/xtensa/abi-windowed.d b/gas/testsuite/gas/xtensa/abi-windowed.d
new file mode 100644
index 000000000000..9f10fd036971
--- /dev/null
+++ b/gas/testsuite/gas/xtensa/abi-windowed.d
@@ -0,0 +1,7 @@
+#as: --abi-windowed
+#objdump: -j .xtensa.info -s
+#source: abi.s
+
+#...
+.*ABI=0.*
+#...
diff --git a/gas/testsuite/gas/xtensa/abi.s b/gas/testsuite/gas/xtensa/abi.s
new file mode 100644
index 000000000000..09cc1e1f7cd8
--- /dev/null
+++ b/gas/testsuite/gas/xtensa/abi.s
@@ -0,0 +1 @@
+	.text
diff --git a/include/elf/xtensa.h b/include/elf/xtensa.h
index bd5c80d13777..eac1a15dc336 100644
--- a/include/elf/xtensa.h
+++ b/include/elf/xtensa.h
@@ -225,6 +225,9 @@ xtensa_read_table_entries (bfd *abfd,
 extern int
 xtensa_compute_fill_extra_space (property_table_entry *entry);
 
+extern int
+xtensa_abi_choice (void);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/ld/emultempl/xtensaelf.em b/ld/emultempl/xtensaelf.em
index 932721c6f16d..53f40c228303 100644
--- a/ld/emultempl/xtensaelf.em
+++ b/ld/emultempl/xtensaelf.em
@@ -30,8 +30,16 @@ fragment <<EOF
 #include "bfd.h"
 
 /* Provide default values for new configuration settings.  */
-#ifndef XSHAL_ABI
-#define XSHAL_ABI 0
+#ifndef XTHAL_ABI_UNDEFINED
+#define XTHAL_ABI_UNDEFINED -1
+#endif
+
+#ifndef XTHAL_ABI_WINDOWED
+#define XTHAL_ABI_WINDOWED 0
+#endif
+
+#ifndef XTHAL_ABI_CALL0
+#define XTHAL_ABI_CALL0 1
 #endif
 
 static void xtensa_wild_group_interleave (lang_statement_union_type *);
@@ -49,6 +57,10 @@ static bfd_boolean xtensa_use_literal_pages = FALSE;
 
 #define EXTRA_VALIDATION 0
 
+/* Xtensa ABI.
+   This option is defined in BDF library.  */
+extern int elf32xtensa_abi;
+
 
 static char *
 elf_xtensa_choose_target (int argc ATTRIBUTE_UNUSED,
@@ -306,7 +318,7 @@ xt_config_info_unpack_and_check (char *data,
 				 char **pmsg)
 {
   char *d, *key;
-  unsigned num;
+  int num;
 
   *pmismatch = FALSE;
 
@@ -341,7 +353,11 @@ xt_config_info_unpack_and_check (char *data,
 
 	  if (! strcmp (key, "ABI"))
 	    {
-	      if (num != XSHAL_ABI)
+	      if (elf32xtensa_abi == XTHAL_ABI_UNDEFINED)
+		{
+		  elf32xtensa_abi = num;
+		}
+	      else if (num != elf32xtensa_abi)
 		{
 		  *pmismatch = TRUE;
 		  *pmsg = "ABI does not match";
@@ -489,7 +505,7 @@ elf_xtensa_before_allocation (void)
 
       data = xmalloc (100);
       sprintf (data, "USE_ABSOLUTE_LITERALS=%d\nABI=%d\n",
-	       XSHAL_USE_ABSOLUTE_LITERALS, XSHAL_ABI);
+	       XSHAL_USE_ABSOLUTE_LITERALS, xtensa_abi_choice ());
       xtensa_info_size = strlen (data) + 1;
 
       /* Add enough null terminators to pad to a word boundary.  */
@@ -1920,20 +1936,29 @@ PARSE_AND_LIST_PROLOGUE='
 #define OPTION_OPT_SIZEOPT              (300)
 #define OPTION_LITERAL_MOVEMENT		(OPTION_OPT_SIZEOPT + 1)
 #define OPTION_NO_LITERAL_MOVEMENT	(OPTION_LITERAL_MOVEMENT + 1)
+#define OPTION_ABI_WINDOWED		(OPTION_NO_LITERAL_MOVEMENT + 1)
+#define OPTION_ABI_CALL0		(OPTION_ABI_WINDOWED + 1)
 extern int elf32xtensa_size_opt;
 extern int elf32xtensa_no_literal_movement;
+extern int elf32xtensa_abi;
 '
 
 PARSE_AND_LIST_LONGOPTS='
   { "size-opt", no_argument, NULL, OPTION_OPT_SIZEOPT},
   { "literal-movement", no_argument, NULL, OPTION_LITERAL_MOVEMENT},
   { "no-literal-movement", no_argument, NULL, OPTION_NO_LITERAL_MOVEMENT},
+  { "abi-windowed", no_argument, NULL, OPTION_ABI_WINDOWED},
+  { "abi-call0", no_argument, NULL, OPTION_ABI_CALL0},
 '
 
 PARSE_AND_LIST_OPTIONS='
   fprintf (file, _("\
   --size-opt                  When relaxing longcalls, prefer size\n\
                                 optimization over branch target alignment\n"));
+  fprintf (file, _("\
+  --abi-windowed              Choose windowed ABI for the output object\n"));
+  fprintf (file, _("\
+  --abi-call0                 Choose call0 ABI for the output object\n"));
 '
 
 PARSE_AND_LIST_ARGS_CASES='
@@ -1946,6 +1971,12 @@ PARSE_AND_LIST_ARGS_CASES='
     case OPTION_NO_LITERAL_MOVEMENT:
       elf32xtensa_no_literal_movement = 1;
       break;
+    case OPTION_ABI_WINDOWED:
+      elf32xtensa_abi = XTHAL_ABI_WINDOWED;
+      break;
+    case OPTION_ABI_CALL0:
+      elf32xtensa_abi = XTHAL_ABI_CALL0;
+      break;
 '
 
 # Replace some of the standard ELF functions with our own versions.
diff --git a/ld/ld.texi b/ld/ld.texi
index b89c1a57c0b4..ecdbf775eb3e 100644
--- a/ld/ld.texi
+++ b/ld/ld.texi
@@ -8565,6 +8565,17 @@ more than performance.  With this option, the linker will not insert
 no-ops or widen density instructions to preserve branch target
 alignment.  There may still be some cases where no-ops are required to
 preserve the correctness of the code.
+
+@item --abi-windowed
+@itemx --abi-call0
+Choose ABI for the output object and for the generated PLT code.
+PLT code inserted by the linker must match ABI of the output object
+because windowed and call0 ABI use incompatible function call
+conventions.
+Default ABI is chosen by the ABI tag in the @code{.xtensa.info} section
+of the first input object.
+A warning is issued if ABI tags of input objects do not match each other
+or the chosen output object ABI.
 @end table
 
 @ifclear GENERIC
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
