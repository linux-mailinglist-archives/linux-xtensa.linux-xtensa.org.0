Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D178314F325
	for <lists+linux-xtensa@lfdr.de>; Fri, 31 Jan 2020 21:28:15 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 04154645D;
	Fri, 31 Jan 2020 20:17:27 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 6225C6443
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jan 2020 20:17:25 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h23so8417186ljc.8
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jan 2020 12:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wbJQJH6EdFt/V7nLW3ajkAWISboC2w5swRQw5wcUX5c=;
 b=MdE9/8LbhBD1EtkSgEWDTb2zRYzooIw3gha87Lfc0C8QYgzqBJI7tO30uVKP/9HRY2
 JkxW2ebzz/ideoGu/zpr4MEas+5YX8XTRVYPbu1bI6bnevaYMVfelfm5LCTqSgYxPXXS
 fWN2x7ccTdxd0ZzyMhjtAliCk4LqtwzHfFuLqnZ91OSoANE+EIJCQPVpoTb4OsxYSstD
 MVdScI0SxsAElhmGEGk64f2BBWJDGtU9yZoinz0SYF6H1MCC2jjBm0Bd9dSUaLqjwBKr
 KKFE4OvJCDgK+lM3rRzLUcNdg80d+OkCQTjnskt/pI70LyLHB9Tj7I8jVd2T+h1DO2D9
 6aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wbJQJH6EdFt/V7nLW3ajkAWISboC2w5swRQw5wcUX5c=;
 b=jZ3p2tIijBYI2CDzxro3JA7lGEqnGp8gwCkBpGSB9UQz7BCgsOqPulRXTm/kF6FUFr
 wkp0QqivJtO6EqzBlGPtiZ3EvlYQ5rS7xz+kGEE2eH6EC01Qgio/VIuxG8Mt3cJ3fF4J
 YyebyNx0aXjKGWKh3fQ3mJwR1dKSPEqeZbtqKnt39x96NrRrUeJrj1MVBhGEXedqw7dw
 fbVQmsCEhMmLf0ITXncXKmEQUpUxTiNMKjtcSm1k3vDJ2RTRtpEKLseHrdvGDTNDzRgC
 2a2k7uiWk7NDoEloMo5mDRvdKCCBrY+3Q+cWdMluAZz878zc3IBbRRquJruzgchuwKTC
 qF6Q==
X-Gm-Message-State: APjAAAU1iBdXxRhtqLB8kAgjWuIIc8VQc95Nujs8YH17EXlIk0jEbgXk
 UwunI6yj087snV6C2+BWayFfhE1e
X-Google-Smtp-Source: APXvYqzYhz5JgRy/Hmv6GNdlUkVmTRBn9CWK1OhcOWmHJCeZ1q++J1CGplr8UXq331/PJVgvn58jAg==
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr7100822ljj.257.1580502491799; 
 Fri, 31 Jan 2020 12:28:11 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id 5sm5215216lju.69.2020.01.31.12.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 12:28:10 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 31 Jan 2020 12:27:48 -0800
Message-Id: <20200131202751.10375-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/3] xtensa: cleanups
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

Hello,

this series removes unused headers and duplicate empty platform_* hooks
from platform-specific xtensa code.

Max Filippov (3):
  xtensa: drop set_except_vector declaration
  xtensa: clean up platform headers
  xtensa: drop empty platform_* functions from platforms

 arch/xtensa/include/asm/platform.h   |  2 --
 arch/xtensa/include/uapi/asm/setup.h |  2 --
 arch/xtensa/kernel/platform.c        |  5 ++---
 arch/xtensa/platforms/iss/setup.c    | 25 ++++---------------------
 arch/xtensa/platforms/xtfpga/setup.c | 17 +----------------
 5 files changed, 7 insertions(+), 44 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
