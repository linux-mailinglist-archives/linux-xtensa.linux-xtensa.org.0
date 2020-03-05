Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 1F08C179EC0
	for <lists+linux-xtensa@lfdr.de>; Thu,  5 Mar 2020 05:53:49 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B52F664B2;
	Thu,  5 Mar 2020 04:41:57 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 0700564A7
 for <linux-xtensa@linux-xtensa.org>; Thu,  5 Mar 2020 04:41:56 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id u26so4542745ljd.8
 for <linux-xtensa@linux-xtensa.org>; Wed, 04 Mar 2020 20:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYNHbddtUs2E70iGSRPE7rk3ZdXX6C3AwCcA/K65mhM=;
 b=bw39y8L3qQpVAidVRKwAUlYAA4tLyKWdGIUc99l2RdeoMP2x4Tsn9ctplKI3S2XOBU
 zmps1piSR4GqUvWKqgxj8ZXGfjc/6hMt+Bg6mnViGgx80EYm62KObZDj52UOnPtGk9mj
 01VPncHyUvojj3lWzvEy7aHcb3sCtSpjv8XS2NKMRyJisa3lW9wjjHzBQKziXTJuwQ97
 YB3Y4AV4gjmTdsuX5di2mB9LQctCHm/4vqfOYzh7ajNSmYBg00IZFHlfD8GGdnT7qUC7
 D7bB8lb9aBZlCQ46/wlhRvdBeMdnsP8MrHV0SGfHDCJmng3rYab3b8JKr9545t7YRAdV
 EC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYNHbddtUs2E70iGSRPE7rk3ZdXX6C3AwCcA/K65mhM=;
 b=mNAFGPkjY7KpZbqFtPiy04PZ69Uf8mOG1X5adNFeAGbhHssyLbABRpVhUcBwth87qb
 xrQCc+9//k+H57eNipEVHfvV7KBnVwHO2D8UyDxu8eIM/sNfJoRiN2mPicg2rhWthspr
 u6PigJR5HUzX83cqoaf2lbpEriHhJ4U9+WICano6drO7Chz+cf6ylSu/C3fnC07h+Q9R
 C/X7+mLcRv/tu3ULLXlhYL/qDnU5FC8ZmW2KJzg7ZDg6LVCh79xG1vKo3ZxD4jCy/byt
 WOdM3k+8ry2PpPCMvj5dIja5EiaEO9++O5IPr7j5BrDcip1kovnOVx1ckiL+CsTUGuCk
 iyfw==
X-Gm-Message-State: ANhLgQ0VEXcDyUG9EId8/jtymOaRctBxs/yYxsCoPteAsfQKVS58MJzF
 qnL4B7L985o9FMJp4EDwpt0=
X-Google-Smtp-Source: ADFU+vsCKAc5fMMae8ra+DaddlEURqh6WIdDEVaQerpWu4RhO5g/7vZbKrep/97rIUwRdXZiaBtg/w==
X-Received: by 2002:a2e:8898:: with SMTP id k24mr1313778lji.36.1583384025285; 
 Wed, 04 Mar 2020 20:53:45 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r25sm16278524lfn.36.2020.03.04.20.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 20:53:44 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Wed,  4 Mar 2020 20:53:28 -0800
Message-Id: <20200305045328.11298-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [PATCH] bfd: xtensa: fix PR ld/25630
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

bfd/
2020-03-05  Max Filippov  <jcmvbkbc@gmail.com>

	* elf32-xtensa.c (shrink_dynamic_reloc_sections): Shrink dynamic
	relocation sections for any removed reference to a dynamic symbol.
---
 bfd/elf32-xtensa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
index 12ff9f772aaf..65e14d87940c 100644
--- a/bfd/elf32-xtensa.c
+++ b/bfd/elf32-xtensa.c
@@ -10148,10 +10148,9 @@ shrink_dynamic_reloc_sections (struct bfd_link_info *info,
 
   if ((r_type == R_XTENSA_32 || r_type == R_XTENSA_PLT)
       && (input_section->flags & SEC_ALLOC) != 0
-      && (dynamic_symbol || bfd_link_pic (info))
-      && (!h || h->root.type != bfd_link_hash_undefweak
-	  || (dynamic_symbol
-	      && (bfd_link_dll (info) || info->export_dynamic))))
+      && (dynamic_symbol
+	  || (bfd_link_pic (info)
+	      && (!h || h->root.type != bfd_link_hash_undefweak))))
     {
       asection *srel;
       bfd_boolean is_plt = FALSE;
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
