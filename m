Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A5790229596
	for <lists+linux-xtensa@lfdr.de>; Wed, 22 Jul 2020 12:01:06 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id EEA7F52ED;
	Wed, 22 Jul 2020 09:44:40 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by linux-xtensa.org (Postfix) with ESMTPS id 3DF6B262C
 for <linux-xtensa@linux-xtensa.org>; Wed, 22 Jul 2020 09:44:37 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id u5so920787pfn.7
 for <linux-xtensa@linux-xtensa.org>; Wed, 22 Jul 2020 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ouOWx6V2h+u+J9V7YQHSXFNa27YdnSoHAYVFdOzvJPY=;
 b=gYwNOUGoYTRsC/G5QeKW1mBTn5iUdYnsGchf6YfspmAVXUqXnab99+EB3Nw9JRjuCo
 4yEltGX8Mnf1c9OpXmZCmj6SrLRgnPHSp96rv/hVcHx8EibtD7QZ0doGMD5japPo0mpk
 Rl/9y4CcJIMnxqdd7cBHOD3QtLlYIrkTh1nBrVvtEOthrlrioRZzrC2tVHLqk4n/DDWj
 kp3EDkPM/3o2P41NTsmYTILEHAb6TWHFH6ggzUlYq4DWbblaC1S/1J9HptFTj2i7y+yF
 z9G7mE6WgQ5fMimD4jRJ+CNrcOdUqlRy9fb9+k3pCP+AHwkXWQcBNqwfkCBfabv++cWH
 vIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ouOWx6V2h+u+J9V7YQHSXFNa27YdnSoHAYVFdOzvJPY=;
 b=V30K7lMLsZxGqpczcGdEf1lCZdfQAtJiq3CrsvBS1bgZ0lZQzLl9KIkbwviPv9Bs0S
 fexW5Y57gi478pN0ebW+3JHO5bxv8za0ckntapOv4OeD8JO1nfHl203pgrkfxFAh3wBd
 exSH84nB1BQzq9JbCiA1ePd2eD68tvu2bokJkqbqug3/aoQd1D52Hge2jN4bZ3ULPXPZ
 W+iyROHDxM8j37q4lPNc2PB5fIxvZ6oCPVWF9AWMboBBeX863aM+82d3jCdMVxhmNda3
 N+wCnvOEGw/A3jSt9ZGHbMpRpGyi+4b1UrEU/5jlv1FWhmkkw4xGr0BtWi+mO292s7CF
 PsHw==
X-Gm-Message-State: AOAM532cjyZHAQm1EIDfpSorIoRQx+hYL2ukHyzSjWgSAd85aPRk4vJs
 r70NtmqTGmmLoGNDED22dgg=
X-Google-Smtp-Source: ABdhPJyCgE3C45nlz4UqTvW7d71P4AtLUadBbPmdW1L1EY2oA+nvU8i0gOL7AXNSL/f+redLVOPCfQ==
X-Received: by 2002:a63:720b:: with SMTP id n11mr25333028pgc.137.1595412061042; 
 Wed, 22 Jul 2020 03:01:01 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id u8sm6004235pjn.24.2020.07.22.03.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 03:01:00 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Wed, 22 Jul 2020 03:00:53 -0700
Message-Id: <20200722100053.31565-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [COMMITTED] bfd: xtensa: pr26246: fix
	removed_literal_compare
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

2020-07-22  Max Filippov  <jcmvbkbc@gmail.com>
bfd/
	PR 26246
	* elf32-xtensa.c (removed_literal_compare): Use correct pointer
	type for the first function argument. Rename pointers to reflect
	that they have distinct types.
---
 bfd/elf32-xtensa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
index 45727b3f805c..8928b11fbce3 100644
--- a/bfd/elf32-xtensa.c
+++ b/bfd/elf32-xtensa.c
@@ -5989,13 +5989,13 @@ map_removed_literal (removed_literal_list *removed_list)
 static int
 removed_literal_compare (const void *a, const void *b)
 {
-  const removed_literal_map_entry *pa = a;
-  const removed_literal_map_entry *pb = b;
+  const bfd_vma *key = a;
+  const removed_literal_map_entry *memb = b;
 
-  if (pa->addr == pb->addr)
+  if (*key == memb->addr)
     return 0;
   else
-    return pa->addr < pb->addr ? -1 : 1;
+    return *key < memb->addr ? -1 : 1;
 }
 
 /* Check if the list of removed literals contains an entry for the
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
