Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE4C1CDF2
	for <lists+linux-xtensa@lfdr.de>; Tue, 14 May 2019 19:28:45 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2F1BE5822;
	Tue, 14 May 2019 17:26:44 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 0034C581D
 for <linux-xtensa@linux-xtensa.org>; Tue, 14 May 2019 17:26:42 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 14so3082ljj.5
 for <linux-xtensa@linux-xtensa.org>; Tue, 14 May 2019 10:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BfVGHciNPwUS+Np4qsLt3zszQTnrnXJmTo0MtobD9KA=;
 b=lcyXP3DKMc2jGSflmJgW9wiPxBWQ3SQN+7IQUA+gBCVf1w5uQwRxzcpGuDhcdW+LYp
 cA6wfylGvZs4rhR9hzrQdx8TmpBFBhND+aY3+e8ri2a+Z1u0KNpBEVFMcWTdlK8G8Jdd
 5bwgmbie3CdDeL2XIWqJi6DjGvqgSKHx/DVDr2P92XBqI7uNW6Say/s/EpYHR2iz+nCm
 NaFeT1KLCzLjgYsBrfAQJkZ9Xwx3RvpMrurJN7xkl4ba5LY7hMW9jHXaGK1uyHIOfSk0
 P19ZVVVFdXoS9WIVmT+G9Wp6WO0eUBnDzGI0UNA2HWwYI8PDJNFrZ4blZbYYd6+mobs8
 Vxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BfVGHciNPwUS+Np4qsLt3zszQTnrnXJmTo0MtobD9KA=;
 b=I94LQiQ4U+dTBCxptd4cn6FvtHET+Penns4kB/ex9cpk8Z3FZFUjfvANhwAu88JkGt
 Quq4MGgRbwWugCmbHpYEn/plsk3ogEFzvDD4NHCpM7w1u13qNq8YXH393O2H8ASatjdB
 CPuKfmrjRBFqrCX52rDOlnIdeU95Ny76PCglMGaLbc2WrPymzhtoUwbRmPftMOZo0U86
 MFRxSk0km/L0Zduj8glFLJ4xzpyLUK4EmFshXvgbZ7Y+kz7YbEXgXDft0Vh9XHEQ9IRo
 yS+lrBB2Re0LDnD9Ep6OigPnBdbjmmI6jFyXPzWKxy1J5ZFt2vaElxwGpz/SpmFc9jrV
 chlA==
X-Gm-Message-State: APjAAAVMdOJK7CqxYStbD3M3jgeHhs2op92GC4AtX1dtFvwdHuGW3T/l
 R8hJiYQ+t8Rkh2kS7+IoYOg=
X-Google-Smtp-Source: APXvYqyInQLegLeFgOJe0XI3glabrgFGH4yjd/Do6Ari6EAkcvVKr8wbSid4RMbX4qplZUpfd0gKbg==
X-Received: by 2002:a2e:88ce:: with SMTP id a14mr10964778ljk.122.1557854920494; 
 Tue, 14 May 2019 10:28:40 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id w19sm3827919lfe.23.2019.05.14.10.28.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 10:28:39 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Tue, 14 May 2019 10:28:22 -0700
Message-Id: <20190514172822.8408-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>,
 Jeff Law <law@redhat.com>
Subject: [Linux-Xtensa] [PATCH] gcc: move assemble_start_function /
	assemble_end_function to output_mi_thunk
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

Let backends call assemble_start_function after they have generated
thunk function body so that a constant pool could be output if it is
required. This may help backends to avoid implementing custom constant
loading code specifically for the MI thunk and reuse existing
functionality.

gcc/
2019-01-08  Max Filippov  <jcmvbkbc@gmail.com>

	* cgraphunit.c (cgraph_node::expand_thunk): Remove
	assemble_start_function and assemble_end_function calls.
	* config/alpha/alpha.c (alpha_output_mi_thunk_osf): Call
	assemble_start_function and assemble_end_function.
	* config/arc/arc.c (arc_output_mi_thunk): Likewise.
	* config/arm/arm.c (arm_output_mi_thunk): Likewise.
	* config/bfin/bfin.c (bfin_output_mi_thunk): Likewise.
	* config/c6x/c6x.c (c6x_output_mi_thunk): Likewise.
	* config/cris/cris.c (cris_asm_output_mi_thunk): Likewise.
	* config/csky/csky.c (csky_output_mi_thunk): Likewise.
	* config/epiphany/epiphany.c (epiphany_output_mi_thunk): Likewise.
	* config/frv/frv.c (frv_asm_output_mi_thunk): Likewise.
	* config/i386/i386.c (x86_output_mi_thunk): Likewise.
	* config/ia64/ia64.c (ia64_output_mi_thunk): Likewise.
	* config/m68k/m68k.c (m68k_output_mi_thunk): Likewise.
	* config/microblaze/microblaze.c (microblaze_asm_output_mi_thunk):
	Likewise.
	* config/mips/mips.c (mips_output_mi_thunk): Likewise.
	* config/mmix/mmix.c (mmix_asm_output_mi_thunk): Likewise.
	* config/mn10300/mn10300.c (mn10300_asm_output_mi_thunk): Likewise.
	* config/nds32/nds32.c (nds32_asm_output_mi_thunk): Likewise.
	* config/nios2/nios2.c (nios2_asm_output_mi_thunk): Likewise.
	* config/or1k/or1k.c (or1k_output_mi_thunk): Likewise.
	* config/pa/pa.c (pa_asm_output_mi_thunk): Likewise.
	* config/riscv/riscv.c (riscv_output_mi_thunk): Likewise.
	* config/rs6000/rs6000.c (rs6000_output_mi_thunk): Likewise.
	* config/s390/s390.c (s390_output_mi_thunk): Likewise.
	* config/sh/sh.c (sh_output_mi_thunk): Likewise.
	* config/sparc/sparc.c (sparc_output_mi_thunk): Likewise.
	* config/spu/spu.c (spu_output_mi_thunk): Likewise.
	* config/stormy16/stormy16.c (xstormy16_asm_output_mi_thunk):
	Likewise.
	* config/tilegx/tilegx.c (tilegx_output_mi_thunk): Likewise.
	* config/tilepro/tilepro.c (tilepro_asm_output_mi_thunk): Likewise.
	* config/vax/vax.c (vax_output_mi_thunk): Likewise.
---

Bootstrapped/regtested on x86_64-pc-linux-gnu, no new regressions.

Build tested for the following targets:
alpha-linux-gnu, arc-elf, arm-linux-gnueabi, bfin-elf, c6x-elf, cris-elf,
csky-elf, epiphany-elf, frv-elf, ia64-elf, m68k-elf, microblaze-elf,
mips-elf, mmix-knuth-mmixware, mn10300-elf, nds32-elf, nios2-elf,
or1k-elf, parisc-elf, riscv-elf, ppc-elf, s390-linux-gnu, sh-elf,
sparc-elf, spu-elf, xstormy16-elf, tilegx-linux-gnu, tilepro-linux-gnu,
vax-linux-gnu

OK for trunk?

 gcc/cgraphunit.c                   | 4 ----
 gcc/config/alpha/alpha.c           | 3 +++
 gcc/config/arc/arc.c               | 4 ++++
 gcc/config/arm/arm.c               | 4 ++++
 gcc/config/bfin/bfin.c             | 3 +++
 gcc/config/c6x/c6x.c               | 3 +++
 gcc/config/cris/cris.c             | 4 ++++
 gcc/config/csky/csky.c             | 3 +++
 gcc/config/epiphany/epiphany.c     | 3 +++
 gcc/config/frv/frv.c               | 4 ++++
 gcc/config/i386/i386.c             | 5 ++++-
 gcc/config/ia64/ia64.c             | 3 +++
 gcc/config/m68k/m68k.c             | 3 +++
 gcc/config/microblaze/microblaze.c | 3 +++
 gcc/config/mips/mips.c             | 3 +++
 gcc/config/mmix/mmix.c             | 6 +++++-
 gcc/config/mn10300/mn10300.c       | 3 +++
 gcc/config/nds32/nds32.c           | 3 +++
 gcc/config/nios2/nios2.c           | 3 +++
 gcc/config/or1k/or1k.c             | 5 ++++-
 gcc/config/pa/pa.c                 | 3 +++
 gcc/config/riscv/riscv.c           | 3 +++
 gcc/config/rs6000/rs6000.c         | 3 +++
 gcc/config/s390/s390.c             | 3 +++
 gcc/config/sh/sh.c                 | 3 +++
 gcc/config/sparc/sparc.c           | 3 +++
 gcc/config/spu/spu.c               | 3 +++
 gcc/config/stormy16/stormy16.c     | 3 +++
 gcc/config/tilegx/tilegx.c         | 3 +++
 gcc/config/tilepro/tilepro.c       | 3 +++
 gcc/config/vax/vax.c               | 4 ++++
 31 files changed, 99 insertions(+), 7 deletions(-)

diff --git a/gcc/cgraphunit.c b/gcc/cgraphunit.c
index 8bfbd0bb12f3..325cefad8366 100644
--- a/gcc/cgraphunit.c
+++ b/gcc/cgraphunit.c
@@ -1790,7 +1790,6 @@ cgraph_node::expand_thunk (bool output_asm_thunks, bool force_gimple_thunk)
       && targetm.asm_out.can_output_mi_thunk (thunk_fndecl, fixed_offset,
 					      virtual_value, alias))
     {
-      const char *fnname;
       tree fn_block;
       tree restype = TREE_TYPE (TREE_TYPE (thunk_fndecl));
 
@@ -1814,7 +1813,6 @@ cgraph_node::expand_thunk (bool output_asm_thunks, bool force_gimple_thunk)
 	= build_decl (DECL_SOURCE_LOCATION (thunk_fndecl),
 		      RESULT_DECL, 0, restype);
       DECL_CONTEXT (DECL_RESULT (thunk_fndecl)) = thunk_fndecl;
-      fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
 
       /* The back end expects DECL_INITIAL to contain a BLOCK, so we
 	 create one.  */
@@ -1828,12 +1826,10 @@ cgraph_node::expand_thunk (bool output_asm_thunks, bool force_gimple_thunk)
       insn_locations_init ();
       set_curr_insn_location (DECL_SOURCE_LOCATION (thunk_fndecl));
       prologue_location = curr_insn_location ();
-      assemble_start_function (thunk_fndecl, fnname);
 
       targetm.asm_out.output_mi_thunk (asm_out_file, thunk_fndecl,
 				       fixed_offset, virtual_value, alias);
 
-      assemble_end_function (thunk_fndecl, fnname);
       insn_locations_finalize ();
       init_insn_lengths ();
       free_after_compilation (cfun);
diff --git a/gcc/config/alpha/alpha.c b/gcc/config/alpha/alpha.c
index 984540f0b530..5cf8d486435b 100644
--- a/gcc/config/alpha/alpha.c
+++ b/gcc/config/alpha/alpha.c
@@ -8437,6 +8437,7 @@ alpha_output_mi_thunk_osf (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 			   HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 			   tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   HOST_WIDE_INT hi, lo;
   rtx this_rtx, funexp;
   rtx_insn *insn;
@@ -8517,9 +8518,11 @@ alpha_output_mi_thunk_osf (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
      assemble_start_function and assemble_end_function.  */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 }
 #endif /* TARGET_ABI_OSF */
 
diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
index 2f5753b02fab..1633d01898db 100644
--- a/gcc/config/arc/arc.c
+++ b/gcc/config/arc/arc.c
@@ -7314,6 +7314,7 @@ arc_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 		     HOST_WIDE_INT vcall_offset,
 		     tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   int mi_delta = delta;
   const char *const mi_op = mi_delta < 0 ? "sub" : "add";
   int shift = 0;
@@ -7321,6 +7322,8 @@ arc_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
     = aggregate_value_p (TREE_TYPE (TREE_TYPE (function)), function) ? 1 : 0;
   rtx fnaddr;
 
+  assemble_start_function (thunk, fnname);
+
   if (mi_delta < 0)
     mi_delta = - mi_delta;
 
@@ -7384,6 +7387,7 @@ arc_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 	fputs ("@plt\n", file);
     }
   fputc ('\n', file);
+  assemble_end_function (thunk, fnname);
 }
 
 /* Return true if a 32 bit "long_call" should be generated for
diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
index 45abcd899634..9d34ce8b490a 100644
--- a/gcc/config/arm/arm.c
+++ b/gcc/config/arm/arm.c
@@ -26977,10 +26977,14 @@ static void
 arm_output_mi_thunk (FILE *file, tree thunk, HOST_WIDE_INT delta,
 		     HOST_WIDE_INT vcall_offset, tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
+
+  assemble_start_function (thunk, fnname);
   if (TARGET_32BIT)
     arm32_output_mi_thunk (file, thunk, delta, vcall_offset, function);
   else
     arm_thumb1_mi_thunk (file, thunk, delta, vcall_offset, function);
+  assemble_end_function (thunk, fnname);
 }
 
 int
diff --git a/gcc/config/bfin/bfin.c b/gcc/config/bfin/bfin.c
index 97c2c12d5ce9..e520115f741f 100644
--- a/gcc/config/bfin/bfin.c
+++ b/gcc/config/bfin/bfin.c
@@ -4976,10 +4976,12 @@ bfin_output_mi_thunk (FILE *file ATTRIBUTE_UNUSED,
 		      tree thunk ATTRIBUTE_UNUSED, HOST_WIDE_INT delta,
 		      HOST_WIDE_INT vcall_offset, tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   rtx xops[3];
   /* The this parameter is passed as the first argument.  */
   rtx this_rtx = gen_rtx_REG (Pmode, REG_R0);
 
+  assemble_start_function (thunk, fnname);
   /* Adjust the this parameter by a fixed constant.  */
   if (delta)
     {
@@ -5034,6 +5036,7 @@ bfin_output_mi_thunk (FILE *file ATTRIBUTE_UNUSED,
   xops[0] = XEXP (DECL_RTL (function), 0);
   if (1 || !flag_pic || (*targetm.binds_local_p) (function))
     output_asm_insn ("jump.l\t%P0", xops);
+  assemble_end_function (thunk, fnname);
 }
 
 /* Codes for all the Blackfin builtins.  */
diff --git a/gcc/config/c6x/c6x.c b/gcc/config/c6x/c6x.c
index 9a07c4013659..742c54be4bb4 100644
--- a/gcc/config/c6x/c6x.c
+++ b/gcc/config/c6x/c6x.c
@@ -769,10 +769,12 @@ c6x_output_mi_thunk (FILE *file ATTRIBUTE_UNUSED,
 		     tree thunk ATTRIBUTE_UNUSED, HOST_WIDE_INT delta,
 		     HOST_WIDE_INT vcall_offset, tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   rtx xops[5];
   /* The this parameter is passed as the first argument.  */
   rtx this_rtx = gen_rtx_REG (Pmode, REG_A4);
 
+  assemble_start_function (thunk, fnname);
   c6x_current_insn = NULL;
 
   xops[4] = XEXP (DECL_RTL (function), 0);
@@ -851,6 +853,7 @@ c6x_output_mi_thunk (FILE *file ATTRIBUTE_UNUSED,
       output_asm_insn ("nop 4", xops);
       output_asm_insn ("add .d1 %2, %1, %2", xops);
     }
+  assemble_end_function (thunk, fnname);
 }
 
 /* Return true if EXP goes in small data/bss.  */
diff --git a/gcc/config/cris/cris.c b/gcc/config/cris/cris.c
index 95bc004d9689..88de088fc9fe 100644
--- a/gcc/config/cris/cris.c
+++ b/gcc/config/cris/cris.c
@@ -2764,6 +2764,9 @@ cris_asm_output_mi_thunk (FILE *stream,
 			  HOST_WIDE_INT vcall_offset ATTRIBUTE_UNUSED,
 			  tree funcdecl)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunkdecl));
+
+  assemble_start_function (thunkdecl, fnname);
   /* Make sure unwind info is emitted for the thunk if needed.  */
   final_start_function (emit_barrier (), stream, 1);
 
@@ -2806,6 +2809,7 @@ cris_asm_output_mi_thunk (FILE *stream,
     }
 
   final_end_function ();
+  assemble_end_function (thunkdecl, fnname);
 }
 
 /* Boilerplate emitted at start of file.
diff --git a/gcc/config/csky/csky.c b/gcc/config/csky/csky.c
index e4ac93323c02..3cfa13e22cd0 100644
--- a/gcc/config/csky/csky.c
+++ b/gcc/config/csky/csky.c
@@ -1967,11 +1967,13 @@ csky_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 		      HOST_WIDE_INT vcall_offset,
 		      tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   const char *thiz = "a0";
   const char *reg0 = "t0";
   const char *reg1 = "t1";
   int maxoff = 4096;		/* Constant range for addi/subi.  */
 
+  assemble_start_function (thunk, fnname);
   final_start_function (emit_barrier (), file, 1);
 
   rtx fnaddr = XEXP (DECL_RTL (function), 0);
@@ -2047,6 +2049,7 @@ csky_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
   fprintf (file, "\n");
 
   final_end_function ();
+  assemble_end_function (thunk, fnname);
 }
 
 
diff --git a/gcc/config/epiphany/epiphany.c b/gcc/config/epiphany/epiphany.c
index 68b9db91c70f..657a8886ac76 100644
--- a/gcc/config/epiphany/epiphany.c
+++ b/gcc/config/epiphany/epiphany.c
@@ -2892,11 +2892,13 @@ epiphany_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 			  HOST_WIDE_INT vcall_offset,
 			  tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   int this_regno
     = aggregate_value_p (TREE_TYPE (TREE_TYPE (function)), function) ? 1 : 0;
   const char *this_name = reg_names[this_regno];
   const char *fname;
 
+  assemble_start_function (thunk, fnname);
   /* We use IP and R16 as a scratch registers.  */
   gcc_assert (call_used_regs [GPR_IP]);
   gcc_assert (call_used_regs [GPR_16]);
@@ -2954,6 +2956,7 @@ epiphany_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
       assemble_name (file, fname);
       fputc ('\n', file);
     }
+  assemble_end_function (thunk, fnname);
 }
 
 void
diff --git a/gcc/config/frv/frv.c b/gcc/config/frv/frv.c
index 71bf819ee7d3..f0c9351f0835 100644
--- a/gcc/config/frv/frv.c
+++ b/gcc/config/frv/frv.c
@@ -1938,11 +1938,14 @@ frv_asm_output_mi_thunk (FILE *file,
                          HOST_WIDE_INT vcall_offset ATTRIBUTE_UNUSED,
                          tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   const char *name_func = XSTR (XEXP (DECL_RTL (function), 0), 0);
   const char *name_arg0 = reg_names[FIRST_ARG_REGNUM];
   const char *name_jmp = reg_names[JUMP_REGNO];
   const char *parallel = (frv_issue_rate () > 1 ? ".p" : "");
 
+  assemble_start_function (thunk_fndecl, fnname);
+
   /* Do the add using an addi if possible.  */
   if (IN_RANGE (delta, -2048, 2047))
     fprintf (file, "\taddi %s,#%d,%s\n", name_arg0, (int) delta, name_arg0);
@@ -2018,6 +2021,7 @@ frv_asm_output_mi_thunk (FILE *file,
 
   /* Jump to the function address.  */
   fprintf (file, "\tjmpl @(%s,%s)\n", name_jmp, reg_names[GPR_FIRST+0]);
+  assemble_end_function (thunk_fndecl, fnname);
 }
 
 
diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
index 8a1ffd3769f5..8358006045f0 100644
--- a/gcc/config/i386/i386.c
+++ b/gcc/config/i386/i386.c
@@ -41491,9 +41491,10 @@ x86_can_output_mi_thunk (const_tree, HOST_WIDE_INT, HOST_WIDE_INT vcall_offset,
    *(*this + vcall_offset) should be added to THIS.  */
 
 static void
-x86_output_mi_thunk (FILE *file, tree, HOST_WIDE_INT delta,
+x86_output_mi_thunk (FILE *file, tree thunk_fndecl, HOST_WIDE_INT delta,
 		     HOST_WIDE_INT vcall_offset, tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_param = x86_this_parameter (function);
   rtx this_reg, tmp, fnaddr;
   unsigned int tmp_regno;
@@ -41673,9 +41674,11 @@ x86_output_mi_thunk (FILE *file, tree, HOST_WIDE_INT delta,
      Note that use_thunk calls assemble_start_function et al.  */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 }
 
 static void
diff --git a/gcc/config/ia64/ia64.c b/gcc/config/ia64/ia64.c
index e8d905e22494..e4dcd34767db 100644
--- a/gcc/config/ia64/ia64.c
+++ b/gcc/config/ia64/ia64.c
@@ -10913,6 +10913,7 @@ ia64_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 		      HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		      tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   rtx this_rtx, funexp;
   rtx_insn *insn;
   unsigned int this_parmno;
@@ -11038,9 +11039,11 @@ ia64_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
   emit_all_insn_group_barriers (NULL);
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk, fnname);
 
   reload_completed = 0;
   epilogue_completed = 0;
diff --git a/gcc/config/m68k/m68k.c b/gcc/config/m68k/m68k.c
index 7a0d6f7c62b4..ca89f37935ed 100644
--- a/gcc/config/m68k/m68k.c
+++ b/gcc/config/m68k/m68k.c
@@ -5071,6 +5071,7 @@ m68k_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 		      HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		      tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   rtx this_slot, offset, addr, mem, tmp;
   rtx_insn *insn;
 
@@ -5147,9 +5148,11 @@ m68k_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
   /* Run just enough of rest_of_compilation.  */
   insn = get_insns ();
   split_all_insns_noflow ();
+  assemble_start_function (thunk, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk, fnname);
 
   /* Clean up the vars set above.  */
   reload_completed = 0;
diff --git a/gcc/config/microblaze/microblaze.c b/gcc/config/microblaze/microblaze.c
index 55c1becf9757..947eef867307 100644
--- a/gcc/config/microblaze/microblaze.c
+++ b/gcc/config/microblaze/microblaze.c
@@ -3312,6 +3312,7 @@ microblaze_asm_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
         HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
         tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, funexp;
   rtx_insn *insn;
 
@@ -3367,9 +3368,11 @@ microblaze_asm_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
      "borrowed" from rs6000.c.  */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   reload_completed = 0;
   epilogue_completed = 0;
diff --git a/gcc/config/mips/mips.c b/gcc/config/mips/mips.c
index 1de33b28c385..252773a95317 100644
--- a/gcc/config/mips/mips.c
+++ b/gcc/config/mips/mips.c
@@ -19420,6 +19420,7 @@ mips_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 		      HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		      tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, temp1, temp2, fnaddr;
   rtx_insn *insn;
   bool use_sibcall_p;
@@ -19532,9 +19533,11 @@ mips_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
   split_all_insns_noflow ();
   mips16_lay_out_constants (true);
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   /* Clean up the vars set above.  Note that final_end_function resets
      the global pointer for us.  */
diff --git a/gcc/config/mmix/mmix.c b/gcc/config/mmix/mmix.c
index c2136e223053..380ecde44808 100644
--- a/gcc/config/mmix/mmix.c
+++ b/gcc/config/mmix/mmix.c
@@ -916,7 +916,7 @@ mmix_target_asm_function_epilogue (FILE *stream)
 
 static void
 mmix_asm_output_mi_thunk (FILE *stream,
-			  tree fndecl ATTRIBUTE_UNUSED,
+			  tree thunk_fndecl ATTRIBUTE_UNUSED,
 			  HOST_WIDE_INT delta,
 			  HOST_WIDE_INT vcall_offset ATTRIBUTE_UNUSED,
 			  tree func)
@@ -925,6 +925,9 @@ mmix_asm_output_mi_thunk (FILE *stream,
      location of structure to return as invisible first argument), you
      need to tweak this code too.  */
   const char *regname = reg_names[MMIX_FIRST_INCOMING_ARG_REGNUM];
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
+
+  assemble_start_function (thunk_fndecl, fnname);
 
   if (delta >= 0 && delta < 65536)
     fprintf (stream, "\tINCL %s,%d\n", regname, (int)delta);
@@ -939,6 +942,7 @@ mmix_asm_output_mi_thunk (FILE *stream,
   fprintf (stream, "\tJMP ");
   assemble_name (stream, XSTR (XEXP (DECL_RTL (func), 0), 0));
   fprintf (stream, "\n");
+  assemble_end_function (thunk_fndecl, fnname);
 }
 
 /* FUNCTION_PROFILER.  */
diff --git a/gcc/config/mn10300/mn10300.c b/gcc/config/mn10300/mn10300.c
index 51116f5c1bbd..8fdd1c5adf61 100644
--- a/gcc/config/mn10300/mn10300.c
+++ b/gcc/config/mn10300/mn10300.c
@@ -2585,8 +2585,10 @@ mn10300_asm_output_mi_thunk (FILE *        file,
 			     HOST_WIDE_INT vcall_offset,
 			     tree          function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   const char * _this;
 
+  assemble_start_function (thunk_fndecl, fnname);
   /* Get the register holding the THIS parameter.  Handle the case
      where there is a hidden first argument for a returned structure.  */
   if (aggregate_value_p (TREE_TYPE (TREE_TYPE (function)), function))
@@ -2613,6 +2615,7 @@ mn10300_asm_output_mi_thunk (FILE *        file,
   fputs ("\tjmp ", file);
   assemble_name (file, XSTR (XEXP (DECL_RTL (function), 0), 0));
   putc ('\n', file);
+  assemble_end_function (thunk_fndecl, fnname);
 }
 
 /* Return true if mn10300_output_mi_thunk would be able to output the
diff --git a/gcc/config/nds32/nds32.c b/gcc/config/nds32/nds32.c
index fe5c26091116..eba981267053 100644
--- a/gcc/config/nds32/nds32.c
+++ b/gcc/config/nds32/nds32.c
@@ -2227,8 +2227,10 @@ nds32_asm_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 			   HOST_WIDE_INT vcall_offset ATTRIBUTE_UNUSED,
 			   tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   int this_regno;
 
+  assemble_start_function (thunk, fnname);
   /* Make sure unwind info is emitted for the thunk if needed.  */
   final_start_function (emit_barrier (), file, 1);
 
@@ -2299,6 +2301,7 @@ nds32_asm_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
     }
 
   final_end_function ();
+  assemble_end_function (thunk, fnname);
 }
 
 /* -- Permitting tail calls.  */
diff --git a/gcc/config/nios2/nios2.c b/gcc/config/nios2/nios2.c
index 1f00b8abbda6..541e51450d8a 100644
--- a/gcc/config/nios2/nios2.c
+++ b/gcc/config/nios2/nios2.c
@@ -4469,6 +4469,7 @@ nios2_asm_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 			   HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 			   tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, funexp;
   rtx_insn *insn;
 
@@ -4522,9 +4523,11 @@ nios2_asm_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
      assemble_start_function and assemble_end_function.  */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   /* Stop pretending to be a post-reload pass.  */
   reload_completed = 0;
diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
index fc10fcfabde0..5e79b306a62a 100644
--- a/gcc/config/or1k/or1k.c
+++ b/gcc/config/or1k/or1k.c
@@ -2028,10 +2028,11 @@ or1k_expand_atomic_op_qihi (rtx_code code, rtx mem, rtx val,
    (*THIS + VCALL_OFFSET) should be additionally added to THIS.  */
 
 static void
-or1k_output_mi_thunk (FILE *file, tree /* thunk_fndecl */,
+or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
 		      HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		      tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, funexp;
   rtx_insn *insn;
 
@@ -2115,9 +2116,11 @@ or1k_output_mi_thunk (FILE *file, tree /* thunk_fndecl */,
      assemble_start_function and assemble_end_function.  */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   reload_completed = 0;
   epilogue_completed = 0;
diff --git a/gcc/config/pa/pa.c b/gcc/config/pa/pa.c
index 532046cff552..6509dc42b1f0 100644
--- a/gcc/config/pa/pa.c
+++ b/gcc/config/pa/pa.c
@@ -8369,6 +8369,7 @@ pa_asm_output_mi_thunk (FILE *file, tree thunk_fndecl, HOST_WIDE_INT delta,
 			HOST_WIDE_INT vcall_offset ATTRIBUTE_UNUSED,
 			tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   static unsigned int current_thunk_number;
   int val_14 = VAL_14_BITS_P (delta);
   unsigned int old_last_address = last_address, nbytes = 0;
@@ -8379,6 +8380,7 @@ pa_asm_output_mi_thunk (FILE *file, tree thunk_fndecl, HOST_WIDE_INT delta,
   xoperands[1] = XEXP (DECL_RTL (thunk_fndecl), 0);
   xoperands[2] = GEN_INT (delta);
 
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (emit_barrier (), file, 1);
 
   /* Output the thunk.  We know that the function is in the same
@@ -8596,6 +8598,7 @@ pa_asm_output_mi_thunk (FILE *file, tree thunk_fndecl, HOST_WIDE_INT delta,
   if (old_last_address > last_address)
     last_address = UINT_MAX;
   update_total_code_bytes (nbytes);
+  assemble_end_function (thunk_fndecl, fnname);
 }
 
 /* Only direct calls to static functions are allowed to be sibling (tail)
diff --git a/gcc/config/riscv/riscv.c b/gcc/config/riscv/riscv.c
index e7440f390951..739b67cc15e0 100644
--- a/gcc/config/riscv/riscv.c
+++ b/gcc/config/riscv/riscv.c
@@ -4361,6 +4361,7 @@ riscv_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 		      HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		      tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, temp1, temp2, fnaddr;
   rtx_insn *insn;
 
@@ -4420,9 +4421,11 @@ riscv_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
   insn = get_insns ();
   split_all_insns_noflow ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   /* Clean up the vars set above.  Note that final_end_function resets
      the global pointer for us.  */
diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
index f0de18d4dcd0..f0e5259765f5 100644
--- a/gcc/config/rs6000/rs6000.c
+++ b/gcc/config/rs6000/rs6000.c
@@ -29554,6 +29554,7 @@ rs6000_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 			HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 			tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, funexp;
   rtx_insn *insn;
 
@@ -29627,9 +29628,11 @@ rs6000_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
      assemble_start_function and assemble_end_function.  */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   reload_completed = 0;
   epilogue_completed = 0;
diff --git a/gcc/config/s390/s390.c b/gcc/config/s390/s390.c
index fc4571d0d0c2..3ae12190265a 100644
--- a/gcc/config/s390/s390.c
+++ b/gcc/config/s390/s390.c
@@ -12864,9 +12864,11 @@ s390_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 		      HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		      tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   rtx op[10];
   int nonlocal = 0;
 
+  assemble_start_function (thunk, fnname);
   /* Make sure unwind info is emitted for the thunk if needed.  */
   final_start_function (emit_barrier (), file, 1);
 
@@ -13120,6 +13122,7 @@ s390_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 	}
     }
   final_end_function ();
+  assemble_end_function (thunk, fnname);
 }
 
 /* Output either an indirect jump or a an indirect call
diff --git a/gcc/config/sh/sh.c b/gcc/config/sh/sh.c
index 8dc79a764df4..b7153075fa29 100644
--- a/gcc/config/sh/sh.c
+++ b/gcc/config/sh/sh.c
@@ -10796,6 +10796,7 @@ sh_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 		    HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		    tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   CUMULATIVE_ARGS cum;
   int structure_value_byref = 0;
   rtx this_rtx, this_value, sibcall, funexp;
@@ -10953,9 +10954,11 @@ sh_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 
   sh_reorg ();
   shorten_branches (insns);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insns, file, 1);
   final (insns, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   reload_completed = 0;
   epilogue_completed = 0;
diff --git a/gcc/config/sparc/sparc.c b/gcc/config/sparc/sparc.c
index 93479ab6bdce..cba3a568091b 100644
--- a/gcc/config/sparc/sparc.c
+++ b/gcc/config/sparc/sparc.c
@@ -12277,6 +12277,7 @@ sparc_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 		       HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		       tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, funexp;
   rtx_insn *insn;
   unsigned int int_arg_first;
@@ -12465,9 +12466,11 @@ sparc_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
      assemble_start_function and assemble_end_function.  */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   reload_completed = 0;
   epilogue_completed = 0;
diff --git a/gcc/config/spu/spu.c b/gcc/config/spu/spu.c
index 8d7439e697a6..613d30149c15 100644
--- a/gcc/config/spu/spu.c
+++ b/gcc/config/spu/spu.c
@@ -7043,8 +7043,10 @@ spu_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
 		     HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 		     tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
   rtx op[8];
 
+  assemble_start_function (thunk, fnname);
   /* Make sure unwind info is emitted for the thunk if needed.  */
   final_start_function (emit_barrier (), file, 1);
 
@@ -7116,6 +7118,7 @@ spu_output_mi_thunk (FILE *file, tree thunk ATTRIBUTE_UNUSED,
   output_asm_insn ("br\t%0", op);
 
   final_end_function ();
+  assemble_end_function (thunk, fnname);
 }
 
 /* Canonicalize a comparison from one we don't have to one we do have.  */
diff --git a/gcc/config/stormy16/stormy16.c b/gcc/config/stormy16/stormy16.c
index b1769ce18104..bd551100183f 100644
--- a/gcc/config/stormy16/stormy16.c
+++ b/gcc/config/stormy16/stormy16.c
@@ -1512,8 +1512,10 @@ xstormy16_asm_output_mi_thunk (FILE *file,
 			       HOST_WIDE_INT vcall_offset ATTRIBUTE_UNUSED,
 			       tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   int regnum = FIRST_ARGUMENT_REGISTER;
 
+  assemble_start_function (thunk_fndecl, fnname);
   /* There might be a hidden first argument for a returned structure.  */
   if (aggregate_value_p (TREE_TYPE (TREE_TYPE (function)), function))
     regnum += 1;
@@ -1522,6 +1524,7 @@ xstormy16_asm_output_mi_thunk (FILE *file,
   fputs ("\tjmpf ", file);
   assemble_name (file, XSTR (XEXP (DECL_RTL (function), 0), 0));
   putc ('\n', file);
+  assemble_end_function (thunk_fndecl, fnname);
 }
 
 /* The purpose of this function is to override the default behavior of
diff --git a/gcc/config/tilegx/tilegx.c b/gcc/config/tilegx/tilegx.c
index 82226da3a47f..513c81cb8baa 100644
--- a/gcc/config/tilegx/tilegx.c
+++ b/gcc/config/tilegx/tilegx.c
@@ -4920,6 +4920,7 @@ tilegx_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 			HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 			tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, funexp, addend;
   rtx_insn *insn;
 
@@ -5000,9 +5001,11 @@ tilegx_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
    */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   /* Stop pretending to be a post-reload pass.  */
   reload_completed = 0;
diff --git a/gcc/config/tilepro/tilepro.c b/gcc/config/tilepro/tilepro.c
index c8d69d32f2fe..7e249022c30c 100644
--- a/gcc/config/tilepro/tilepro.c
+++ b/gcc/config/tilepro/tilepro.c
@@ -4368,6 +4368,7 @@ tilepro_asm_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
 			     HOST_WIDE_INT delta, HOST_WIDE_INT vcall_offset,
 			     tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk_fndecl));
   rtx this_rtx, funexp;
   rtx_insn *insn;
 
@@ -4423,9 +4424,11 @@ tilepro_asm_output_mi_thunk (FILE *file, tree thunk_fndecl ATTRIBUTE_UNUSED,
    */
   insn = get_insns ();
   shorten_branches (insn);
+  assemble_start_function (thunk_fndecl, fnname);
   final_start_function (insn, file, 1);
   final (insn, file, 1);
   final_end_function ();
+  assemble_end_function (thunk_fndecl, fnname);
 
   /* Stop pretending to be a post-reload pass.  */
   reload_completed = 0;
diff --git a/gcc/config/vax/vax.c b/gcc/config/vax/vax.c
index fe21faebe4df..547a7e068e49 100644
--- a/gcc/config/vax/vax.c
+++ b/gcc/config/vax/vax.c
@@ -1049,11 +1049,15 @@ vax_output_mi_thunk (FILE * file,
 		     HOST_WIDE_INT vcall_offset ATTRIBUTE_UNUSED,
 		     tree function)
 {
+  const char *fnname = IDENTIFIER_POINTER (DECL_ASSEMBLER_NAME (thunk));
+
+  assemble_start_function (thunk, fnname);
   fprintf (file, "\t.word 0x0ffc\n\taddl2 $" HOST_WIDE_INT_PRINT_DEC, delta);
   asm_fprintf (file, ",4(%Rap)\n");
   fprintf (file, "\tjmp ");
   assemble_name (file,  XSTR (XEXP (DECL_RTL (function), 0), 0));
   fprintf (file, "+2\n");
+  assemble_end_function (thunk, fnname);
 }
 
 static rtx
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
