Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 905611F321A
	for <lists+linux-xtensa@lfdr.de>; Tue,  9 Jun 2020 03:48:11 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2BE2D5856;
	Tue,  9 Jun 2020 01:33:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by linux-xtensa.org (Postfix) with ESMTPS id BAC9C5808
 for <linux-xtensa@linux-xtensa.org>; Tue,  9 Jun 2020 01:33:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s10so9630590pgm.0
 for <linux-xtensa@linux-xtensa.org>; Mon, 08 Jun 2020 18:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=thuMP4We5CysJTtcnnhJT7Ze77BCqD4kQ3YmKN/wenk=;
 b=ahxYbCjFi+f58JI4I/3zT8ilMGfTzN/WrlDhgDUg5FaI6YMYv82YVOyqliLQDGsMjR
 IQrWvfYVawoREdPCxQ6yUchW9OeQY+LR2wdjFoNUJbNuCWNDlT+uhTDdbeFAqlJxShV8
 3cZgVy3TZY3jY1beQklgURAkztkSNoGnXYFuqhkvLNTyptNr2aDlNr687iHRixFh4Z1c
 yFtETOF9yX48a48fc1gKxvBNlje3i5yiZiQX5sjTTG4leDpg469Xzr+3v4NL9s1IFF8n
 8WBbDKbpIbCyJha0TNzNWITCGjKSY2/2OibrX8Q516hKwuAabImUayD40fCNTiu6/xEC
 M5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=thuMP4We5CysJTtcnnhJT7Ze77BCqD4kQ3YmKN/wenk=;
 b=Q3N01aVT+KFIp1SiBj3LE/YuzpEka1BTi1NDRTjjFAdxr+kbZizadayi9fymFspdcY
 nWB5PNd8Vv4KaDE69YmxdEcgMLznbGjvljeeDDcsbLNOj99Ag4RvnDo5XPCPjoIXt8EP
 e76//VauKwTvB6uP1SkYnLomxJ2++vQfALkVR3uHHzVPBmMquvJQF8XDTQDybGE74/Zd
 96WPPouK9B1/od5nSY260RgEytvxYDt1EV7jrYotb06lba6hDYe0M7d/KqKwgRb+bF2W
 3J+CeYhbb67beP3VQo8bR9C9veXGRbxTOLPph6LsxLTusqUWr1/cDKsh9/Do3z7SA681
 Q/Gg==
X-Gm-Message-State: AOAM531vCikLzJDtryaHRXaMesMGbLBhJnme7X84ZZllzIiD5APrWJ9s
 TWW67wWIkTg0z0ZvgyY+TwE=
X-Google-Smtp-Source: ABdhPJwcN9gWSDTWFMO02MsKMhYkWyrOmc+joCX/q11k90wQbDlNCwbg4exssjpwV0w3jnA57x+n6g==
X-Received: by 2002:aa7:9abc:: with SMTP id x28mr21241355pfi.39.1591667287594; 
 Mon, 08 Jun 2020 18:48:07 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id a14sm8009514pfc.133.2020.06.08.18.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 18:48:06 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Mon,  8 Jun 2020 18:47:48 -0700
Message-Id: <20200609014748.10670-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [committed] xtensa: libgcc: fix PR target/95571
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

Rewrite uw_install_context without function calls to avoid register
spilling in _Unwind_RaiseException during return context installation.

2020-06-08  Max Filippov  <jcmvbkbc@gmail.com>
gcc/testsuite/
	* g++.target/xtensa/pr95571.C: New test.
	* g++.target/xtensa/xtensa.exp: New testsuite.

libgcc/
	* config/xtensa/unwind-dw2-xtensa.c (uw_install_context): Merge
	with uw_install_context_1.
---
Tested with xtensa-linux-uclibc, committed to master.

 gcc/testsuite/g++.target/xtensa/pr95571.C  | 43 ++++++++++++++++++++
 gcc/testsuite/g++.target/xtensa/xtensa.exp | 43 ++++++++++++++++++++
 libgcc/config/xtensa/unwind-dw2-xtensa.c   | 46 +++++++++++-----------
 3 files changed, 108 insertions(+), 24 deletions(-)
 create mode 100644 gcc/testsuite/g++.target/xtensa/pr95571.C
 create mode 100644 gcc/testsuite/g++.target/xtensa/xtensa.exp

diff --git a/gcc/testsuite/g++.target/xtensa/pr95571.C b/gcc/testsuite/g++.target/xtensa/pr95571.C
new file mode 100644
index 000000000000..59fe28528380
--- /dev/null
+++ b/gcc/testsuite/g++.target/xtensa/pr95571.C
@@ -0,0 +1,43 @@
+/* { dg-do run } */
+
+extern "C" void abort(void);
+extern "C" void __xtensa_libgcc_window_spill(void);
+
+static int call;
+static int cnt;
+
+extern "C" void *memcpy(void *dst, const void *src, unsigned int sz)
+{
+  char *a = (char *)dst;
+  const char *b = (const char *)src;
+
+  if (call++ == cnt)
+    __xtensa_libgcc_window_spill();
+
+  while (sz--)
+    *a++ = *b++;
+
+  return dst;
+}
+
+int main()
+{
+  int i;
+
+  for (i = 0; i < 100; ++i)
+    {
+      call = 0;
+      cnt = i;
+
+      try
+	{
+	  throw 1;
+	}
+      catch (int v)
+	{
+	  if (v != 1)
+	    abort ();
+	}
+    }
+  return 0;
+}
diff --git a/gcc/testsuite/g++.target/xtensa/xtensa.exp b/gcc/testsuite/g++.target/xtensa/xtensa.exp
new file mode 100644
index 000000000000..f4191201d11f
--- /dev/null
+++ b/gcc/testsuite/g++.target/xtensa/xtensa.exp
@@ -0,0 +1,43 @@
+#  Specific regression driver for Xtensa.
+#  Copyright (C) 2020 Free Software Foundation, Inc.
+#
+#  This file is part of GCC.
+#
+#  GCC is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 3, or (at your option)
+#  any later version.
+#
+#  GCC is distributed in the hope that it will be useful, but
+#  WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+#  General Public License for more details.
+#
+#  You should have received a copy of the GNU General Public License
+#  along with GCC; see the file COPYING3.  If not see
+#  <http://www.gnu.org/licenses/>.  */
+
+# GCC testsuite that uses the `dg.exp' driver.
+
+# Exit immediately if this isn't an Xtensa target.
+if {![istarget xtensa*-*-*] } then {
+  return
+}
+
+# Load support procs.
+load_lib g++-dg.exp
+
+global DEFAULT_CXXFLAGS
+if ![info exists DEFAULT_CXXFLAGS] then {
+    set DEFAULT_CXXFLAGS " -pedantic-errors"
+}
+
+# Initialize `dg'.
+dg-init
+
+# Main loop.
+dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.C]] \
+        "" $DEFAULT_CXXFLAGS
+
+# All done.
+dg-finish
diff --git a/libgcc/config/xtensa/unwind-dw2-xtensa.c b/libgcc/config/xtensa/unwind-dw2-xtensa.c
index 056182a794aa..8a6a44a8b685 100644
--- a/libgcc/config/xtensa/unwind-dw2-xtensa.c
+++ b/libgcc/config/xtensa/unwind-dw2-xtensa.c
@@ -481,37 +481,35 @@ uw_init_context_1 (struct _Unwind_Context *context, void *outer_cfa,
 
 /* Install TARGET into CURRENT so that we can return to it.  This is a
    macro because __builtin_eh_return must be invoked in the context of
-   our caller.  */
+   our caller, and also because spilling registers of the caller before
+   the context installation may result in reload of wrong register values
+   after the context installation due to the change of the stack pointer
+   in the base save area.  This spilling may be caused by an interrupt
+   handler on baremetal host.  */
 
-#define uw_install_context(CURRENT, TARGET, FRAMES)				 \
+#define uw_install_context(CURRENT, TARGET, FRAMES)			 \
   do									 \
     {									 \
-      long offset = uw_install_context_1 ((CURRENT), (TARGET));		 \
       void *handler = __builtin_frob_return_addr ((TARGET)->ra);	 \
-      __builtin_eh_return (offset, handler);				 \
+      long i;								 \
+									 \
+      /* The eh_return insn assumes a window size of 8, so don't bother	 \
+	 copying the save areas for registers a8-a15 since they won't be \
+	 reloaded.  */							 \
+      for (i = 0; i < 2; ++i)						 \
+	{								 \
+	  _Unwind_Word *c = (CURRENT)->reg[i];				 \
+	  _Unwind_Word *t = (TARGET)->reg[i];				 \
+	  int j;							 \
+									 \
+	  if (t && c && t != c)						 \
+	    for (j = 0; j < 4; ++j)					 \
+	      *c++ = *t++;						 \
+	}								 \
+      __builtin_eh_return (0, handler);					 \
     }									 \
   while (0)
 
-static long
-uw_install_context_1 (struct _Unwind_Context *current,
-		      struct _Unwind_Context *target)
-{
-  long i;
-
-  /* The eh_return insn assumes a window size of 8, so don't bother copying
-     the save areas for registers a8-a15 since they won't be reloaded.  */
-  for (i = 0; i < 2; ++i)
-    {
-      void *c = current->reg[i];
-      void *t = target->reg[i];
-
-      if (t && c && t != c)
-	memcpy (c, t, 4 * sizeof (_Unwind_Word));
-    }
-
-  return 0;
-}
-
 static inline _Unwind_Ptr
 uw_identify_context (struct _Unwind_Context *context)
 {
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
