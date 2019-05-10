Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7501A364
	for <lists+linux-xtensa@lfdr.de>; Fri, 10 May 2019 21:28:09 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7CF3765B3;
	Fri, 10 May 2019 19:26:17 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id DF64065B1
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 19:26:15 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j20so4946431lfh.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 12:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uI3gLb2dl7PkzNp9XPPLS1n448gi0tsEm0Fsk/DiuEA=;
 b=Mf5zSVS94VADNKW8ElkuaEhKwWH3I2hquchaxPSqDy3rHNFTkHdktRIiRKV+QpfpiY
 1C1GhT0+jWncQcK2OBSmb9IoSoJ/esMCm1527O1aJXq/5Y4vvbJ4gA2TwpdEXAia+LYj
 la2tizgMBgsO3Z+OzeUD6kTBQ36LI0JKpqbOxl4t8/rjIghCbKeuD7BSdFQtOtOMQZmz
 Ib85KEkm9SGpyEwEFaeyRy1ehmCxO8/MaoPq4hmniHorqv/pmR8MEVqVAU4A1pmYUh1w
 qUmaNph4CJ/m+uv/YHPCKuHh6avWLDJF5Uk59FoCk2F0xwACUGYnmpKeRC9KcHWDsAmI
 xtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uI3gLb2dl7PkzNp9XPPLS1n448gi0tsEm0Fsk/DiuEA=;
 b=sqEZRsH+eZEf97pWZpinEUWC3PmmNS+cN2ObQGfn7ebwOpbEMbawscgOZOBocp9dV/
 rxIlzUzNoquQXr16ZbDU4wEofXwGIX7zu7/ogx4fqus6lhk2d6G32MdFLcT07sMQ03/T
 KPrGMauxly62pUTUphL+3BykC7LK3mU6whBSS4Rk0EBq4p0lmk63b77Em4UMx80hMa62
 Kn0XmaGiB9yVbmD/GwlN8nVUyq/1QXsW9JibopKd6fbyvG09ghD2qbJImdajA8DQTdqW
 wreLlWdRXvOFMBx2yxC+o+zfKSLt+u1ClPM4OsWc7+trcHN5vAXXOpauEWt93Kl+iQJ1
 ntRQ==
X-Gm-Message-State: APjAAAULc5IRonlZxoVdEpGXqhGPN1DMNBTD3RluBPnN7F5fBZ9MkEu9
 QjhuR2FmyMzLyUbkIULFXfk=
X-Google-Smtp-Source: APXvYqzEX5ejmKKNJwIAqzb++DAeZBVACARndajl2ZGP3DmjfwnLIaaJiynY9SSSNVmOWOcRLbIhhg==
X-Received: by 2002:a19:e619:: with SMTP id d25mr7286270lfh.66.1557516485686; 
 Fri, 10 May 2019 12:28:05 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id i187sm1020536lfe.64.2019.05.10.12.28.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 12:28:04 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Fri, 10 May 2019 12:27:53 -0700
Message-Id: <20190510192753.27598-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Waldemar Brodkorb <wbx@uclibc-ng.org>, linux-xtensa@linux-xtensa.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] dics/defines.txt: clarify LFS-related macros
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

Add description for _LARGEFILE_SOURCE, _LARGEFILE64_SOURCE,
_FILE_OFFSET_BITS and __USE_LARGEFILE, __USE_LARGEFILE64 and
__USE_FILE_OFFSET64 macros.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 docs/defines.txt | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/defines.txt b/docs/defines.txt
index b23fac9c0036..6af44bdd809f 100644
--- a/docs/defines.txt
+++ b/docs/defines.txt
@@ -10,11 +10,28 @@ __USE_GNU, __USE_BSD, __USE_XOPEN[2K], __USE_SVID, __USE_POSIX...
     If defined, user program which included us requests compat additions
     from relevant standard or Unix flavor. See features.h for full list.
 
-__USE_FILE_OFFSET64
+_LARGEFILE_SOURCE
+   If defined, headers will provide functions fseeko and ftello.
+_LARGEFILE64_SOURCE
+    If defined, headers will in addition to data types, constants and
+    functions named xxx (e.g. off_t, struct stat, F_SETLK, ftruncate())
+    supply data types, constants and functions named xxx64 (e.g. off64_t,
+    struct stat64, F_SETLK64, ftruncate64()) known as an interface for
+    64-bit file offsets.
 __USE_LARGEFILE[64]
-_LARGEFILE[64]_SOURCE
+    Defined to 1 and used internally when built with _LARGEFILE[64]_SOURCE.
+    Undefined otherwise.
+
 _FILE_OFFSET_BITS
-    ???
+    Select default filesystem interface. When defined as 64 the data types,
+    constants and functions mentioned in _LARGEFILE64_SOURCE as xxx are
+    aliased to the corresponding xxx64 data types, constants and functions.
+    _FILE_OFFSET_BITS=64 enables both __USE_LARGEFILE and __USE_LARGEFILE64.
+    This flag does not affect the way libc itself is built, it only affects
+    what declarations are provided to library user.
+__USE_FILE_OFFSET64
+    Defined to 1 and used internally when built with _FILE_OFFSET_BITS=64.
+    Undefined otherwise.
 
 __THROW
     Function annotation "I do not throw anything".
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
