Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 82122BD5C5
	for <lists+linux-xtensa@lfdr.de>; Wed, 25 Sep 2019 02:41:39 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6423F6517;
	Wed, 25 Sep 2019 00:34:55 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id E810864EF
 for <linux-xtensa@linux-xtensa.org>; Wed, 25 Sep 2019 00:34:53 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q64so3745911ljb.12
 for <linux-xtensa@linux-xtensa.org>; Tue, 24 Sep 2019 17:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hFaa96WCTF9r1qw0ARuNfVLtc2/tq+jCz14HC9WGz6Y=;
 b=kBjSt7EqpgwasUU5GLgxnEEO5B2tSTJMEU1H0k77HWoBkP4AIZycQwKtrto3GESPeo
 FwDzxHbyAS9aMgaFGNty7lJM1CiSgfx63EQ8O2ZlhCtCtafBZfuVnw5n/F1HleMqdiBn
 gD50k2ymNK3/Eb0FadjypCtfO+67kWuGa31aHb+TIXI6bfRJavzoW0J2FzZsfgwlOV+9
 btsSyPvR0wRG7EALbYrZEK1DOsyXV4dKwSjxhq+iaNKApiGbBwj747rfTK/Rk75gc2x2
 gDZ4p6PvF9jn2sx3Sv19nvvwBc9w0gvLpimU/7g7mP8XGl0XWVKXSWOHvuxWaRmn24l/
 3Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hFaa96WCTF9r1qw0ARuNfVLtc2/tq+jCz14HC9WGz6Y=;
 b=BUfYV9DD0VBkTGBP0hYf6czZKaOA4wHm6VIaqkxhO8ciYBZb5mf3wHhDu5al/VJXaL
 TW8ULbI1S6TSL0BcGCbgjQVQbNWH06Wy3y/D0P2QtJuqTgm/6yfQt9fOslCSji686/WW
 eszsrZWVL2vEtoPHFOnYxEYLsnPaDTbxeQMV4GU0/55vHE8klPz4g8laK0uDRNG9b6WR
 FP2oVsjqn/AqOCafFPDzv5unmlgia/9RzfSHHLIL27vE0fDC3Wlerv27PThVzQVmKaiU
 830/dUD4S4Oy/qnLr3nOrbi4QyUhGB3YZaFAcnXRGRHxC26y1LSU8ooHfWWktrSSzFXt
 X1zg==
X-Gm-Message-State: APjAAAXhA9GR8qtIkiROyGiJEztCHLJ4Wmfo0kn8NGqkCT+I2cYuhB+N
 fKuTSBHsEIqG1SH/3ZKlcm4=
X-Google-Smtp-Source: APXvYqz1e3p26AI3CrrdGP6dgCYqQRc2awMT9hvBKpbnCRmZx4i7ll9DeIqm4C64XJDU/7CU8I+Gqg==
X-Received: by 2002:a05:651c:21b:: with SMTP id
 y27mr3780710ljn.219.1569372094849; 
 Tue, 24 Sep 2019 17:41:34 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id g21sm878482lje.67.2019.09.24.17.41.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 17:41:34 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Tue, 24 Sep 2019 17:41:11 -0700
Message-Id: <20190925004111.14989-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix PR target/91880
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

Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
inserted as the first instruction of the function.
Insert zero overhead loop instruction into new basic block before the
loop when basic block that precedes the loop is empty.

2019-09-24  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	* config/xtensa/xtensa.c (hwloop_optimize): Insert zero overhead
	loop instruction into new basic block before the loop when basic
	block that precedes the loop is empty.

gcc/testsuite/
	* gcc.target/xtensa/pr91880.c: New test case.
	* gcc.target/xtensa/xtensa.exp: New test suite.
---
 gcc/config/xtensa/xtensa.c                 |  5 ++--
 gcc/testsuite/gcc.target/xtensa/pr91880.c  | 10 ++++++++
 gcc/testsuite/gcc.target/xtensa/xtensa.exp | 41 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 gcc/testsuite/gcc.target/xtensa/pr91880.c
 create mode 100644 gcc/testsuite/gcc.target/xtensa/xtensa.exp

diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
index ee5612441e25..2527468d57db 100644
--- a/gcc/config/xtensa/xtensa.c
+++ b/gcc/config/xtensa/xtensa.c
@@ -4235,7 +4235,9 @@ hwloop_optimize (hwloop_info loop)
 
   seq = get_insns ();
 
-  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1)
+  entry_after = BB_END (entry_bb);
+  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1
+      || !entry_after)
     {
       basic_block new_bb;
       edge e;
@@ -4256,7 +4258,6 @@ hwloop_optimize (hwloop_info loop)
     }
   else
     {
-      entry_after = BB_END (entry_bb);
       while (DEBUG_INSN_P (entry_after)
              || (NOTE_P (entry_after)
 		 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
diff --git a/gcc/testsuite/gcc.target/xtensa/pr91880.c b/gcc/testsuite/gcc.target/xtensa/pr91880.c
new file mode 100644
index 000000000000..f4895a1bb8ec
--- /dev/null
+++ b/gcc/testsuite/gcc.target/xtensa/pr91880.c
@@ -0,0 +1,10 @@
+/* { dg-do compile } */
+/* { dg-options "-O3 -fomit-frame-pointer -fno-tree-vectorize" } */
+
+void foo (unsigned int n, char *a, char *b)
+{
+  int i;
+
+  for (i = 0; i <= n - 1; ++i)
+    a[i] = b[i];
+}
diff --git a/gcc/testsuite/gcc.target/xtensa/xtensa.exp b/gcc/testsuite/gcc.target/xtensa/xtensa.exp
new file mode 100644
index 000000000000..8720327f526e
--- /dev/null
+++ b/gcc/testsuite/gcc.target/xtensa/xtensa.exp
@@ -0,0 +1,41 @@
+# Copyright (C) 2019 Free Software Foundation, Inc.
+
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 3 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with GCC; see the file COPYING3.  If not see
+# <http://www.gnu.org/licenses/>.
+
+# GCC testsuite that uses the `dg.exp' driver.
+
+# Exit immediately if this isn't an Xtensa target.
+if ![istarget xtensa*-*-*] then {
+  return
+}
+
+# Load support procs.
+load_lib gcc-dg.exp
+
+# If a testcase doesn't have special options, use these.
+global DEFAULT_CFLAGS
+if ![info exists DEFAULT_CFLAGS] then {
+    set DEFAULT_CFLAGS " -ansi -pedantic-errors"
+}
+
+# Initialize `dg'.
+dg-init
+
+# Main loop.
+dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cS\]]] \
+	"" $DEFAULT_CFLAGS
+
+# All done.
+dg-finish
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
