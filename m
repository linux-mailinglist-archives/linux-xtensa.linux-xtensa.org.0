Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0CD1A385
	for <lists+linux-xtensa@lfdr.de>; Fri, 10 May 2019 21:51:41 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 723A86564;
	Fri, 10 May 2019 19:49:49 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by linux-xtensa.org (Postfix) with ESMTPS id BE3316546
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 19:49:47 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id d8so4959517lfb.8
 for <linux-xtensa@linux-xtensa.org>; Fri, 10 May 2019 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=35WEDsr5coRGIFyIoAXIx1KQFPb0JWfCwKFK6UecsiQ=;
 b=V4DkpqNVQPf6WD3h3xDKiZcipo/kNQg/HxXfUiDPS9++6mLoy7T3AAXIVdikdmoXTc
 m1YCAyLSCu7W1W6ogASjkU4cGen7V/Ascs34X+L3s3YT1J/kYOfvOTrA86sfl8rmEhrz
 7maEcSNBKDluMACd+TTEjX2GdXDb1ok6JI/Sb4mWi/QjBzQFKv7T8fTmsPK5KQp1EZ2+
 Dv1XumFt57tfsVvsby/I5eYYlAEa1B7wA5VmcoLi3I47xRzjkoZsSIiZm2TqfSdahwyB
 ivMGnDuVqfPMLx0oZba47WJFP0e7KlX7K/75qx4pqS2ecao24F9nWJwlo+gqKJHXBGU7
 0OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=35WEDsr5coRGIFyIoAXIx1KQFPb0JWfCwKFK6UecsiQ=;
 b=oLHyJ81aTuOE3LogSqvO6YJnwkxY+qZriHGNXGVDn+2zb2AQapAL9DavJ5gT974QIl
 PeZ/Wu9JBrV3xn/FFDN7Q0Cr+OieJWQGdiqOsoLkU3SfO4kJ2aUjequOVVXTIARCQGsX
 862gR/iC3v+HlYxJYf5v0tYEe2c004YehVBkf782u/yrvgJCOrA9qCldAJ6IBEpGVLIB
 No/+lilS2+g1+uZkrEvpeNNE8RmwC0cY3hTAf6y5Ef9yPiHyMu9ISah+VU+EvWhybDSW
 9ZFezNzY5aiYL0VqAvdfOpHgy8yzI1Jmi/5g9Hc4ns41XGpQMkkrZRZ0M2oF8RPb4naK
 4x8w==
X-Gm-Message-State: APjAAAXfwkpvPXENscTq0URt9tPbdIqcD2nZkke1yKpntik+cm43H0ZU
 02mnDiGwGzBt/nY+bMVmQn8=
X-Google-Smtp-Source: APXvYqzj5xJswLIRAw/dthkTidDa+ymy1QO4q9aJOQfh862obgyU08T6zugJPKLZEKXK3ZD2x5kKIQ==
X-Received: by 2002:ac2:483c:: with SMTP id 28mr6978717lft.93.1557517897578;
 Fri, 10 May 2019 12:51:37 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id y186sm1884137lfa.14.2019.05.10.12.51.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 12:51:37 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: devel@uclibc-ng.org
Date: Fri, 10 May 2019 12:51:25 -0700
Message-Id: <20190510195125.29443-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Waldemar Brodkorb <wbx@uclibc-ng.org>, linux-xtensa@linux-xtensa.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2] docs/defines.txt: clarify LFS-related
	macros
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
Changes v1->v2:
- fix subject line

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
