Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7A25D40BE14
	for <lists+linux-xtensa@lfdr.de>; Wed, 15 Sep 2021 05:16:11 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6AB016E24;
	Wed, 15 Sep 2021 02:45:33 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by linux-xtensa.org (Postfix) with ESMTPS id 81CA26E05
 for <linux-xtensa@linux-xtensa.org>; Wed, 15 Sep 2021 02:45:30 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id r2so1280097pgl.10
 for <linux-xtensa@linux-xtensa.org>; Tue, 14 Sep 2021 20:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCQItLYKjDC4XQNJh08kk8mX9beF2rRIynWYvYsubPU=;
 b=NXU2B91QM1tqoQl7jLyXRnXSv05MIg3mG0g0qKkQ8/b0kCsVv3Lu7D+XR0eHdA3xiR
 VXHKzGVq85EISq3X/+laEkPkTjnjAcSxND0PeP0cBoNkoDpi06JhsVBapspVpYq5kpea
 akgZ4CDVvFOcBIx2SyLBMVxG/ur8XWAofGdjiDWNpStpea0OawD5o/hxfYCiEtwo+hTd
 sh/SknZR6L7MhQtvEfeRlzVxQwhGVwOaiEzIkSC5A23mCcDnv+Zjty6Yzncb+3T1YrLU
 5lLrGr2eHqKC/cAsg2lvfZQZZLkH0yyyU7LfFLwyJ4grZp97655xsSu49KiwdI45Mtdu
 +Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCQItLYKjDC4XQNJh08kk8mX9beF2rRIynWYvYsubPU=;
 b=g20BI64h8My1LfyvztM6q/Rb2yIuiX1TXsiTm0ZrynoxBHOlJRGuHUT8n8wxSDhGHs
 PqaylauyXjIBknn6fI8B5WXyxDtKiVlXWHIt/mnfOGF5VSkNuda00u0Wk9WIqNDi8Rps
 r+4YQrRmLXOrRGnIu8gZ9tCtevYD/wGG576XnZbXaycIOo4rNGAKKEGigxoVxYFqv/FA
 O1V6bkXd39aLPcv6guewPIfmotRSD3jxSTo5+84+xJkNvaMRMuhGRt6+xDinuAzmpY6F
 OXALqK3ZC6c2VLMl0/8ffYzbzwxVSTah77cK7db40TH8k4lgO8a3f6FzVyB0afgeOnAN
 qeOw==
X-Gm-Message-State: AOAM5311Qh2dLGUF2haeaaZx0xK6RQlUb4oqCVIjLTq688kOVcRkGv3U
 EIk+gHlR3z4P3RpD0TExPr4=
X-Google-Smtp-Source: ABdhPJzm5aZfo8Tt7xpNy1+Yx24lXryrfYnAdYFGliPAPdQZiCOaCeZqwTp8VcRfAyYJd0joMCRJMA==
X-Received: by 2002:a05:6a00:1396:b0:40d:bb7c:92d0 with SMTP id
 t22-20020a056a00139600b0040dbb7c92d0mr8280714pfg.38.1631675766782; 
 Tue, 14 Sep 2021 20:16:06 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:cc92:5b36:c2f0:9715])
 by smtp.gmail.com with ESMTPSA id b10sm11453473pfi.122.2021.09.14.20.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 20:16:06 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Tue, 14 Sep 2021 20:15:51 -0700
Message-Id: <20210915031551.16548-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [COMMITTED] gcc: xtensa: fix PR target/102336
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

2021-09-14  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	PR target/102336
	* config/xtensa/t-xtensa (TM_H): Add include/xtensa-config.h.
---
 gcc/config/xtensa/t-xtensa | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gcc/config/xtensa/t-xtensa b/gcc/config/xtensa/t-xtensa
index 973815c8c2d6..d06e49280545 100644
--- a/gcc/config/xtensa/t-xtensa
+++ b/gcc/config/xtensa/t-xtensa
@@ -16,4 +16,5 @@
 # along with GCC; see the file COPYING3.  If not see
 # <http://www.gnu.org/licenses/>.
 
+TM_H += $(srcdir)/../include/xtensa-config.h
 $(out_object_file): gt-xtensa.h
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
