Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0861F94D1
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Jun 2020 12:44:29 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 4EE956452;
	Mon, 15 Jun 2020 10:29:23 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by linux-xtensa.org (Postfix) with ESMTPS id 640CB5825
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 10:29:21 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id k2so6648219pjs.2
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NJUJI1TUJ5L4eUOexiDioU8UoPLrS82W8eEKTPmpMR8=;
 b=Ih1gMo2jahPo9NoILnJSdzldXqfdH68F5fc63Sibyr26+NT6CmuQCWjeocL5Cp3IuK
 XyFAkgfmt/ViDHphTK2CazpRxLPnf7QMEvM0MaKQckXqdBDhwMcMnVrKNJVAzwpu5QGX
 gsn5WSAaJy1/uCCy312nBgsr5ie6bu2TybV/8/LdzjtNzzxVo0QXoN9K5qzxZZdupHva
 Dy7sfCfBZmURXwVZX2udIsQ0uxjAhClnyqbkvK9+XOrRCGNnECbB9y11GxBdK+6cHcCM
 tdnTduHrLNoGcuTh5ZSAfu0u2i2s86Doc42QMb3KDGfrujIdY7Sa0dZgDabwpxiFDDU4
 QsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJUJI1TUJ5L4eUOexiDioU8UoPLrS82W8eEKTPmpMR8=;
 b=pM86ZXMdKvh3cFjjwmFG1xS0+zlk/6Q+eaiyyGVTPOTK+wb4J3QXtg2r8djdacSOxs
 6CR37kxi9i7OOGss9Zlpc6iDBCTgZwgUerEL2WFaWl/aupXmbqP6XfVNDi10INNv8oWx
 axc7C5Ffoe4pIhpVLjawQgnEGaJvozMVy4uoaZTKvRQVBYmAjanAkPpRb96fcZll5hpM
 mXVt6o9pgnDtj4rQm3Bk1dc4Y+wD+3/ifVizkYU7fKQZjZfiQyixslWsWpHP7TtJC81f
 bYAwGBvCUqfblLdA2BUxm3RMjkiUMAzh6noYd2GKzXjXVf9UBO8tLEQrl+idPpC8PFPH
 o2JA==
X-Gm-Message-State: AOAM530Yi67IV11dhqPBRyxdv5UC80P6Vdb3UHrkglO9VwvwSXPxYCKj
 sJN2j0+YqpjpQ5GkdW5/fbM=
X-Google-Smtp-Source: ABdhPJxVJzuDNKelTCOfhWZhit4sc/w7orbG82pe+NkbQodnP6MngMYJSv5PzjOOkbKukcjUzBFLSQ==
X-Received: by 2002:a17:90a:db91:: with SMTP id
 h17mr11363831pjv.6.1592217866066; 
 Mon, 15 Jun 2020 03:44:26 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id q65sm13974474pfc.155.2020.06.15.03.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 03:44:25 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Mon, 15 Jun 2020 03:44:07 -0700
Message-Id: <20200615104407.28521-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200615104407.28521-1-jcmvbkbc@gmail.com>
References: <20200615104407.28521-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 2/2] gcc: xtensa: add -mabi option for
	call0/windowed ABI
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
gcc/
	* config/xtensa/elf.h (ASM_SPEC, LINK_SPEC): Pass ABI switch to
	assembler/linker.
	* config/xtensa/linux.h (ASM_SPEC, LINK_SPEC): Ditto.
	* config/xtensa/uclinux.h (ASM_SPEC, LINK_SPEC): Ditto.
	* config/xtensa/xtensa.c (xtensa_option_override): Initialize
	xtensa_windowed_abi if needed.
	* config/xtensa/xtensa.h (TARGET_WINDOWED_ABI_DEFAULT): New
	macro.
	(TARGET_WINDOWED_ABI): Redefine to xtensa_windowed_abi.
	* config/xtensa/xtensa.opt (xtensa_windowed_abi): New target
	option variable.
	(mabi=call0, mabi=windowed): New options.
	* doc/invoke.texi: Document new -mabi= Xtensa-specific options.

gcc/testsuite/
	* gcc.target/xtensa/mabi-call0.c: New test.
	* gcc.target/xtensa/mabi-windowed.c: New test.

libgcc/
	* configure: Regenerate.
	* configure.ac: Use AC_COMPILE_IFELSE instead of manual
	preprocessor invocation to check for __XTENSA_CALL0_ABI__.
---
 gcc/config/xtensa/elf.h                       |  8 ++++--
 gcc/config/xtensa/linux.h                     |  8 ++++--
 gcc/config/xtensa/uclinux.h                   |  9 +++++--
 gcc/config/xtensa/xtensa.c                    |  3 +++
 gcc/config/xtensa/xtensa.h                    |  3 ++-
 gcc/config/xtensa/xtensa.opt                  | 11 ++++++++
 gcc/doc/invoke.texi                           | 26 ++++++++++++++++++-
 gcc/testsuite/gcc.target/xtensa/mabi-call0.c  | 13 ++++++++++
 .../gcc.target/xtensa/mabi-windowed.c         | 13 ++++++++++
 libgcc/configure                              | 24 ++++++++---------
 libgcc/configure.ac                           | 14 +++++-----
 11 files changed, 103 insertions(+), 29 deletions(-)
 create mode 100644 gcc/testsuite/gcc.target/xtensa/mabi-call0.c
 create mode 100644 gcc/testsuite/gcc.target/xtensa/mabi-windowed.c

diff --git a/gcc/config/xtensa/elf.h b/gcc/config/xtensa/elf.h
index 6fd589fed32b..48e2590e9b69 100644
--- a/gcc/config/xtensa/elf.h
+++ b/gcc/config/xtensa/elf.h
@@ -47,7 +47,9 @@ along with GCC; see the file COPYING3.  If not see
   %{mlongcalls:--longcalls} \
   %{mno-longcalls:--no-longcalls} \
   %{mauto-litpools:--auto-litpools} \
-  %{mno-auto-litpools:--no-auto-litpools}"
+  %{mno-auto-litpools:--no-auto-litpools} \
+  %{mabi=windowed:--abi-windowed} \
+  %{mabi=call0:--abi-call0}"
 
 #undef LIB_SPEC
 #define LIB_SPEC "-lc -lsim -lc -lhandlers-sim -lhal"
@@ -65,7 +67,9 @@ along with GCC; see the file COPYING3.  If not see
   %{!shared: \
     %{!static: \
       %{rdynamic:-export-dynamic} \
-    %{static:-static}}}"
+    %{static:-static}}} \
+  %{mabi=windowed:--abi-windowed} \
+  %{mabi=call0:--abi-call0}"
 
 #undef LOCAL_LABEL_PREFIX
 #define LOCAL_LABEL_PREFIX	"."
diff --git a/gcc/config/xtensa/linux.h b/gcc/config/xtensa/linux.h
index 62a33a9bc101..bd20595c3243 100644
--- a/gcc/config/xtensa/linux.h
+++ b/gcc/config/xtensa/linux.h
@@ -44,7 +44,9 @@ along with GCC; see the file COPYING3.  If not see
   %{mlongcalls:--longcalls} \
   %{mno-longcalls:--no-longcalls} \
   %{mauto-litpools:--auto-litpools} \
-  %{mno-auto-litpools:--no-auto-litpools}"
+  %{mno-auto-litpools:--no-auto-litpools} \
+  %{mabi=windowed:--abi-windowed} \
+  %{mabi=call0:--abi-call0}"
 
 #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
 
@@ -55,7 +57,9 @@ along with GCC; see the file COPYING3.  If not see
     %{!static: \
       %{rdynamic:-export-dynamic} \
       -dynamic-linker " GNU_USER_DYNAMIC_LINKER "} \
-    %{static:-static}}"
+    %{static:-static}} \
+  %{mabi=windowed:--abi-windowed} \
+  %{mabi=call0:--abi-call0}"
 
 #undef LOCAL_LABEL_PREFIX
 #define LOCAL_LABEL_PREFIX	"."
diff --git a/gcc/config/xtensa/uclinux.h b/gcc/config/xtensa/uclinux.h
index 64ba26f39352..374d2947a0dd 100644
--- a/gcc/config/xtensa/uclinux.h
+++ b/gcc/config/xtensa/uclinux.h
@@ -51,10 +51,15 @@ along with GCC; see the file COPYING3.  If not see
   %{mlongcalls:--longcalls} \
   %{mno-longcalls:--no-longcalls} \
   %{mauto-litpools:--auto-litpools} \
-  %{mno-auto-litpools:--no-auto-litpools}"
+  %{mno-auto-litpools:--no-auto-litpools} \
+  %{mabi=windowed:--abi-windowed} \
+  %{mabi=call0:--abi-call0}"
 
 #undef LINK_SPEC
-#define LINK_SPEC "%{!no-elf2flt:%{!elf2flt*:-elf2flt}}"
+#define LINK_SPEC \
+ "%{!no-elf2flt:%{!elf2flt*:-elf2flt}} \
+  %{mabi=windowed:--abi-windowed} \
+  %{mabi=call0:--abi-call0}"
 
 #undef LOCAL_LABEL_PREFIX
 #define LOCAL_LABEL_PREFIX	"."
diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
index e3afb70cdf04..e370aa4623c1 100644
--- a/gcc/config/xtensa/xtensa.c
+++ b/gcc/config/xtensa/xtensa.c
@@ -2219,6 +2219,9 @@ xtensa_option_override (void)
   int regno;
   machine_mode mode;
 
+  if (xtensa_windowed_abi == -1)
+    xtensa_windowed_abi = TARGET_WINDOWED_ABI_DEFAULT;
+
   /* Use CONST16 in the absence of L32R.
      Set it in the TARGET_OPTION_OVERRIDE to avoid dependency on xtensa
      configuration in the xtensa-common.c  */
diff --git a/gcc/config/xtensa/xtensa.h b/gcc/config/xtensa/xtensa.h
index fb5aee870dd5..33bfe45a6e11 100644
--- a/gcc/config/xtensa/xtensa.h
+++ b/gcc/config/xtensa/xtensa.h
@@ -64,7 +64,8 @@ along with GCC; see the file COPYING3.  If not see
 #define TARGET_ABSOLUTE_LITERALS XSHAL_USE_ABSOLUTE_LITERALS
 #define TARGET_THREADPTR	XCHAL_HAVE_THREADPTR
 #define TARGET_LOOPS	        XCHAL_HAVE_LOOPS
-#define TARGET_WINDOWED_ABI	(XSHAL_ABI == XTHAL_ABI_WINDOWED)
+#define TARGET_WINDOWED_ABI_DEFAULT (XSHAL_ABI == XTHAL_ABI_WINDOWED)
+#define TARGET_WINDOWED_ABI	xtensa_windowed_abi
 #define TARGET_DEBUG		XCHAL_HAVE_DEBUG
 #define TARGET_L32R		XCHAL_HAVE_L32R
 
diff --git a/gcc/config/xtensa/xtensa.opt b/gcc/config/xtensa/xtensa.opt
index dd7aba403d85..0c4aa921effe 100644
--- a/gcc/config/xtensa/xtensa.opt
+++ b/gcc/config/xtensa/xtensa.opt
@@ -45,3 +45,14 @@ Relax literals in assembler and place them automatically in the text section.
 mserialize-volatile
 Target Report Mask(SERIALIZE_VOLATILE)
 -mno-serialize-volatile	Do not serialize volatile memory references with MEMW instructions.
+
+TargetVariable
+int xtensa_windowed_abi = -1
+
+mabi=call0
+Target Report RejectNegative Var(xtensa_windowed_abi, 0)
+Use call0 ABI.
+
+mabi=windowed
+Target Report RejectNegative Var(xtensa_windowed_abi, 1)
+Use windowed registers ABI.
diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
index 06a04e3d7ddd..74ab149a0359 100644
--- a/gcc/doc/invoke.texi
+++ b/gcc/doc/invoke.texi
@@ -1386,7 +1386,8 @@ See RS/6000 and PowerPC Options.
 -mtext-section-literals  -mno-text-section-literals @gol
 -mauto-litpools  -mno-auto-litpools @gol
 -mtarget-align  -mno-target-align @gol
--mlongcalls  -mno-longcalls}
+-mlongcalls  -mno-longcalls @gol
+-mabi=@var{abi-type}}
 
 @emph{zSeries Options}
 See S/390 and zSeries Options.
@@ -30780,6 +30781,29 @@ assembly code generated by GCC still shows direct call
 instructions---look at the disassembled object code to see the actual
 instructions.  Note that the assembler uses an indirect call for
 every cross-file call, not just those that really are out of range.
+
+@item -mabi=@var{name}
+@opindex mabi
+Generate code for the specified ABI@.  Permissible values are: @samp{call0},
+@samp{windowed}.  Default ABI is chosen by the Xtensa core configuration.
+
+@item -mabi=call0
+@opindex mabi=call0
+When this option is enabled function parameters are passed in registers
+@code{a2} through @code{a7}, registers @code{a12} through @code{a15} are
+caller-saved, and register @code{a15} may be used as a frame pointer.
+When this version of the ABI is enabled the C preprocessor symbol
+@code{__XTENSA_CALL0_ABI__} is defined.
+
+@item -mabi=windowed
+@opindex mabi=windowed
+When this option is enabled function parameters are passed in registers
+@code{a10} through @code{a15}, and called function rotates register window
+by 8 registers on entry so that its arguments are found in registers
+@code{a2} through @code{a7}.  Register @code{a7} may be used as a frame
+pointer.  Register window is rotated 8 registers back upon return.
+When this version of the ABI is enabled the C preprocessor symbol
+@code{__XTENSA_WINDOWED_ABI__} is defined.
 @end table
 
 @node zSeries Options
diff --git a/gcc/testsuite/gcc.target/xtensa/mabi-call0.c b/gcc/testsuite/gcc.target/xtensa/mabi-call0.c
new file mode 100644
index 000000000000..65d729528106
--- /dev/null
+++ b/gcc/testsuite/gcc.target/xtensa/mabi-call0.c
@@ -0,0 +1,13 @@
+/* { dg-do compile } */
+/* { dg-options "-mabi=call0" } */
+
+#ifndef __XTENSA_CALL0_ABI__
+#error
+#endif
+
+void foo(void)
+{
+}
+
+/* { dg-final { scan-assembler-not "entry" } } */
+/* { dg-final { scan-assembler-not "retw" } } */
diff --git a/gcc/testsuite/gcc.target/xtensa/mabi-windowed.c b/gcc/testsuite/gcc.target/xtensa/mabi-windowed.c
new file mode 100644
index 000000000000..aaddf41d78d6
--- /dev/null
+++ b/gcc/testsuite/gcc.target/xtensa/mabi-windowed.c
@@ -0,0 +1,13 @@
+/* { dg-do compile } */
+/* { dg-options "-mabi=windowed" } */
+
+#ifndef __XTENSA_WINDOWED_ABI__
+#error
+#endif
+
+void foo(void)
+{
+}
+
+/* { dg-final { scan-assembler "entry" } } */
+/* { dg-final { scan-assembler "retw" } } */
diff --git a/libgcc/configure b/libgcc/configure
index 13548cacb851..284e4db0cddf 100755
--- a/libgcc/configure
+++ b/libgcc/configure
@@ -5330,19 +5330,17 @@ esac
 # This is after config.host so we can augment tmake_file.
 case ${host} in
 xtensa*-*)
-  cat > conftest.c <<EOF
-	#ifdef __XTENSA_CALL0_ABI__
-	#error
-	#endif
-EOF
-  if { ac_try='${CC-cc} -E -o conftest.i conftest.c 1>&5'
-  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
-  (eval $ac_try) 2>&5
-  ac_status=$?
-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-  test $ac_status = 0; }; }; then
-      tmake_file="${tmake_file} xtensa/t-windowed"
-  fi
+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+/* end confdefs.h.  */
+#ifdef __XTENSA_CALL0_ABI__
+		      #error
+		      #endif
+
+_ACEOF
+if ac_fn_c_try_compile "$LINENO"; then :
+  tmake_file="${tmake_file} xtensa/t-windowed"
+fi
+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
   ;;
 esac
 
diff --git a/libgcc/configure.ac b/libgcc/configure.ac
index bff6e54f22e0..ef0d79975e16 100644
--- a/libgcc/configure.ac
+++ b/libgcc/configure.ac
@@ -515,14 +515,12 @@ AC_SUBST(solaris_ld_v2_maps)
 # This is after config.host so we can augment tmake_file.
 case ${host} in
 xtensa*-*)
-  cat > conftest.c <<EOF
-	#ifdef __XTENSA_CALL0_ABI__
-	#error
-	#endif
-EOF
-  if AC_TRY_COMMAND(${CC-cc} -E -o conftest.i conftest.c 1>&AS_MESSAGE_LOG_FD); then
-      tmake_file="${tmake_file} xtensa/t-windowed"
-  fi
+  AC_COMPILE_IFELSE([AC_LANG_SOURCE(
+		     [#ifdef __XTENSA_CALL0_ABI__
+		      #error
+		      #endif
+		      ])],
+		      [tmake_file="${tmake_file} xtensa/t-windowed"])
   ;;
 esac
 
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
