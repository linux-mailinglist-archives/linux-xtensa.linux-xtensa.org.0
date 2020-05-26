Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1731E2A3F
	for <lists+linux-xtensa@lfdr.de>; Tue, 26 May 2020 20:43:50 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 829D06472;
	Tue, 26 May 2020 18:29:23 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by linux-xtensa.org (Postfix) with ESMTPS id D16EB645D
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 May 2020 18:29:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id n15so10566648pfd.0
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 May 2020 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sYuVSuHkK0QB/HkLKRMzYYA4s+PbC029mrD8xxwWfQ8=;
 b=huIY35A9VlokiXUv02+WwYqBtNh421rFcbpq8dFnJbzJPAEYzTFxn5SEKrIyAlBwfm
 mlcnwivx34+mtEEO+NX5VCr22eLsSBBBG7bMSconE+Th2lZr3fFqFvzCHSad0ORnD3gD
 sZQ1k6gIuqzv58o1g9esMnNqBIAmNYJ2GP/acHPLtHbH4Dm8LPjWIzepxL7Gr4pet8xh
 ru8L2sUtBW8EYd4wqEM6e8a3NNJPLT9bveKdHovfdma0uWdKexcJrhg/NyXqNc/t/HXx
 tboxaNWqB276rMtpcEY9vI6lQEfl3cbDPswtGSmF3x6BqhAZpZzF3+KVxFn8sHS4UZzy
 NnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sYuVSuHkK0QB/HkLKRMzYYA4s+PbC029mrD8xxwWfQ8=;
 b=UCdzCtDpUVFhSG1amg0GPobyyWEysHFT3jNzvh4g8kiEnmXdC/MY5imJUbTzw74VhC
 A+tFsrH2b2UEt/u6JmyWvK2p/4VwRzfKQz6Hl+UDgnUpRszCDYKwIDxoD74JssfaFtx2
 d962kEycSGSLJiHTAq3K811zADUO/JRDFsAM3iMOrVFBLe+EAIatPQ163y6v7wJFvO5u
 r7F3+ZIxr8bq4rsaLMTGpCIAVt1g1ftQkGH94RjzM4VvRTq4oTMzIo+L0/A5lEMfUXS6
 PlMv/D/uTX7GuiI/h3YFFN9TF2YG6ewhboP0b+225NrZ7RFgybr2E4/iKXdsq5/j1adc
 mPVg==
X-Gm-Message-State: AOAM531SsBeeZnkKvWqVwZ03rNQQVDQlh8OsFIKfSNK9MUCvFrmnKNGg
 8wwy3qBlULbBNos8bcQEhbc=
X-Google-Smtp-Source: ABdhPJw93u9zk+g7lNGkI9GzMPVDK4jySLbaqHndV1QXIW1RRPbc59UCQ/3PhJIdblbAnbuXm1xoLg==
X-Received: by 2002:a62:7c94:: with SMTP id x142mr167141pfc.155.1590518626446; 
 Tue, 26 May 2020 11:43:46 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id t21sm319206pgu.39.2020.05.26.11.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 11:43:45 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Tue, 26 May 2020 11:43:37 -0700
Message-Id: <20200526184337.19874-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] gcc: xtensa: delegitimize UNSPEC_PLT
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

This fixes 'non-delegitimized UNSPEC 3 found in variable location' notes
issued when building libraries which interferes with running tests.

2020-05-24  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	* config/xtensa/xtensa.c (xtensa_delegitimize_address): New
	function.
	(TARGET_DELEGITIMIZE_ADDRESS): New macro.
---
 gcc/config/xtensa/xtensa.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
index 5696951fb655..e3afb70cdf04 100644
--- a/gcc/config/xtensa/xtensa.c
+++ b/gcc/config/xtensa/xtensa.c
@@ -188,6 +188,8 @@ static bool xtensa_can_eliminate (const int from ATTRIBUTE_UNUSED,
 static HOST_WIDE_INT xtensa_starting_frame_offset (void);
 static unsigned HOST_WIDE_INT xtensa_asan_shadow_offset (void);
 
+static rtx xtensa_delegitimize_address (rtx);
+
 
 
 /* These hooks specify assembly directives for creating certain kinds
@@ -338,6 +340,9 @@ static unsigned HOST_WIDE_INT xtensa_asan_shadow_offset (void);
 #undef TARGET_HAVE_SPECULATION_SAFE_VALUE
 #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed
 
+#undef TARGET_DELEGITIMIZE_ADDRESS
+#define TARGET_DELEGITIMIZE_ADDRESS xtensa_delegitimize_address
+
 struct gcc_target targetm = TARGET_INITIALIZER;
 
 
@@ -4440,4 +4445,23 @@ xtensa_asan_shadow_offset (void)
   return HOST_WIDE_INT_UC (0x10000000);
 }
 
+static rtx
+xtensa_delegitimize_address (rtx op)
+{
+  switch (GET_CODE (op))
+    {
+    case CONST:
+      return xtensa_delegitimize_address (XEXP (op, 0));
+
+    case UNSPEC:
+      if (XINT (op, 1) == UNSPEC_PLT)
+	return XVECEXP(op, 0, 0);
+      break;
+
+    default:
+      break;
+    }
+  return op;
+}
+
 #include "gt-xtensa.h"
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
