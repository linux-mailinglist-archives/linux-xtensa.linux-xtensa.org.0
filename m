Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C99BF10DC46
	for <lists+linux-xtensa@lfdr.de>; Sat, 30 Nov 2019 04:45:12 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 117DC6583;
	Sat, 30 Nov 2019 03:36:20 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id BC8256579
 for <linux-xtensa@linux-xtensa.org>; Sat, 30 Nov 2019 03:36:18 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r15so21001587lff.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 29 Nov 2019 19:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TxQPdJxNyepJ+7HvIw3vGl/aei4/1HLBmK7Ev2iT0B4=;
 b=W+5DX9GzK0eHm3lLdhvbim7aswgBOTJIH3yFZGo0JzlxucTJjfRN7ipbKbdFHw1GZ0
 KtdxUPqHJxf5QvgC0MYJT0hikiIM6NT0MQ/Pv1WOaa4ZafVTH04yv7cPxbcySH+NOVuW
 5MLgxu5bLLdg/BApHiRh+Viy+y12RgzkmHrbBt4wDPCEFSmGFj2f7AU9eRUPvzJ9thVU
 pGIgbtPK59tf7sXElGAScSOBVyJA/kfFqWBDYk80hGNO79uVA96hFMq97qbzr7Mfccre
 ILlpG59ipuA2ldCfmw5WPvJkd7qKRtJxPlzEDzAlQb316peLoU0ijAzXV14neKXrQfIX
 BlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TxQPdJxNyepJ+7HvIw3vGl/aei4/1HLBmK7Ev2iT0B4=;
 b=bJ3NnMFrJlbI2unGSh6T1pZdKojfQokydyOB9SKeMT2OfSCFQMD4RPiIdlY+HT4ulr
 3xrTMCiOfCp93T/z0g5GuE+Ql9R8x7aP3SpqiGWEuc5m0aDmx0YmEwRmKQMF5uhhyugf
 bUP2emwaeS6+ff9bIzrPRrCR0FdGNe5NN191IcX5B1nQ9L0KWKFDUjkUbEr5wsg17svC
 IjRCFeubBjtpDaMr/ua0jwUY9EJKpMCM6vdlzmWD7hFOdun1Ykxzx4+32KcdjsQLFpZs
 u4EiKv+bWAfUHBsbJJHViL3QLzJga7Rz3UptKNJIa+v3zZJNzzt1OwNp8NB4Zftug6Sc
 84FA==
X-Gm-Message-State: APjAAAU7hggrXq4u+d37OlLIMwgMt2BkdPR4jG6pRgjeY5Z6qztvvJVj
 RnFsHiZ0Bhgph9/oqBNC0RkC2YZIgsk=
X-Google-Smtp-Source: APXvYqz0myTBpY75TPNbMuGuk29ju22LjVugURWiR3WNVe1Eo1voorsoJtlJY0ZohkJEIBbeRWS18w==
X-Received: by 2002:ac2:43a7:: with SMTP id t7mr2560620lfl.125.1575085508895; 
 Fri, 29 Nov 2019 19:45:08 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id z9sm2920528ljm.40.2019.11.29.19.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 19:45:08 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 29 Nov 2019 19:44:47 -0800
Message-Id: <20191130034450.25507-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/3] xtensa system_call cleanup
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

this series cleans up xtensa system_call implementation, dropping
workarounds for clone/execv tracing and extra argument passing for
xtensa_rt_sigreturn. It fixes value returned from system call when
call is cancelled by ptrace.

Max Filippov (3):
  xtensa: rearrange syscall tracing
  xtensa: fix system_call interaction with ptrace
  xtensa: clean up system_call/xtensa_rt_sigreturn interaction

 arch/xtensa/include/asm/processor.h |  3 ++-
 arch/xtensa/include/asm/syscall.h   |  2 +-
 arch/xtensa/kernel/entry.S          | 20 +++++---------------
 arch/xtensa/kernel/process.c        |  2 ++
 arch/xtensa/kernel/ptrace.c         | 18 ++++++++++++++++--
 arch/xtensa/kernel/signal.c         |  4 ++--
 6 files changed, 28 insertions(+), 21 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
