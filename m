Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7A52814F326
	for <lists+linux-xtensa@lfdr.de>; Fri, 31 Jan 2020 21:28:16 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 120F9648E;
	Fri, 31 Jan 2020 20:17:28 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by linux-xtensa.org (Postfix) with ESMTPS id 979516464
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jan 2020 20:17:27 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id b15so5780719lfc.4
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jan 2020 12:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5DBX4yD78/iH19T1X6zMW9mR+W+JxGUwOLGGZTAaig=;
 b=O40d+7s7u7pu66H7PA35WXrQiSA7FL4oS+wU4OW9AchjV3Czcg71/oKQOOMQuI+B18
 ixgPEPsmkyPoeYvtZfsOz57bl/HVMrQqIR2PrKMhcC3kfF7p/X9LVevETcgNndhOBq5/
 eKb/uodrlR4d4SurX5avQdfwEDSrBB9zJ5sgu6YsJNqKOnkwQhlduxzyeQYLW0Z+V3ZP
 HSxy7gFRLBRzJ2XPg7j6uuTPfYzWzHRYD8479x4pYmHMyaTH8N/xDPtx8qa3z9+XkCGe
 OqdIy2Jz5P6jN5Q4FClvsr+BPORG+2CCXW2MOK1AJVKuCPI+QlKPMSu6zUnCpJo5ZuqC
 EyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5DBX4yD78/iH19T1X6zMW9mR+W+JxGUwOLGGZTAaig=;
 b=GKMcrkGrq5AAnmKuY99jGBMfUIG8ZFJ5hm8PuVrmvCT+w2SWd1K/CkyavA/RxhXf7d
 UDe475A0o2obafTcH6R0xKCs6mWmcNMSpM0jeJi3r+bt3gWLqC8qLJV7XzqeHZPoihE8
 jrpwBEaLe0PGYJI1DfGqaqGG7s2J+zITfGv3BE6OyVXt8728gEg84ctGwULtVRnXoBOe
 H0bj+fXoMhzdw3u+rnOAAkh8x9OEtbzVNTJO7t2j/Npo/hjAhik5sTF5yXKsGKOpf6uq
 OMrAVHm5zLp6LAgR/EpI97aiA768UmVe1tZ1Nk0icquA6iJr93rmq45hN1OJbx/TKvez
 Ow3Q==
X-Gm-Message-State: APjAAAX7Y18WAD3GkkAwMYE8gjna/vANy1M0Mxffj/R99GGn6QAEFPm+
 +zf7oNThnNyMYXQAVg/fV0/nIyvP
X-Google-Smtp-Source: APXvYqxZuvFaAPM3xhO6ulnoG3JsjzMYzJD1xjY3+XaFJiroUhWVkAi5ngxVegzs+hOBUb0Iw5E8gg==
X-Received: by 2002:ac2:42ca:: with SMTP id n10mr6293457lfl.215.1580502494113; 
 Fri, 31 Jan 2020 12:28:14 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 5sm5215216lju.69.2020.01.31.12.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 12:28:13 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 31 Jan 2020 12:27:49 -0800
Message-Id: <20200131202751.10375-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131202751.10375-1-jcmvbkbc@gmail.com>
References: <20200131202751.10375-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/3] xtensa: drop set_except_vector
	declaration
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

There's no implementation for set_except_vector function in the xtensa
code. Drop its declaration.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/uapi/asm/setup.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/xtensa/include/uapi/asm/setup.h b/arch/xtensa/include/uapi/asm/setup.h
index 57e6c210e84f..5356a5fd4d17 100644
--- a/arch/xtensa/include/uapi/asm/setup.h
+++ b/arch/xtensa/include/uapi/asm/setup.h
@@ -14,6 +14,4 @@
 
 #define COMMAND_LINE_SIZE	256
 
-extern void set_except_vector(int n, void *addr);
-
 #endif
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
