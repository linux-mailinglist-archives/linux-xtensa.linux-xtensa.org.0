Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0B64FA3DEE
	for <lists+linux-xtensa@lfdr.de>; Fri, 30 Aug 2019 20:50:08 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B1B27580B;
	Fri, 30 Aug 2019 18:44:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by linux-xtensa.org (Postfix) with ESMTPS id D5FE557E4
 for <linux-xtensa@linux-xtensa.org>; Fri, 30 Aug 2019 18:44:16 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h15so7364111ljg.10
 for <linux-xtensa@linux-xtensa.org>; Fri, 30 Aug 2019 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yehGuBD3OuYld50+5DBfHoKCYNH5GVjIrYmsVwm20BI=;
 b=Js45YniywEleFbuQ87jRGDgJEIIJj3Vj0glldCDIehfGEmvTJtDnSClIzCVWpER5Nc
 VYDU3FKT0r7Cvw/86jD1wGbtLYafTYO4OyWPVFNhIzomPdqaWvv3VTla8Qs/gfl1hHzq
 XkYLmX/6QDZrQNbYBcor7/ZeHmWwEHtXDQIrYEuB59NIL4WF5QaspOVvyiZ/0FkLyTvB
 8Xwue9FXyD6x9Cwjcvguyi3vY8ZyKdbd/hjvu0KxcBekH10RBeISMiGqazEC+4QuY88Y
 laALhB5PzaKTGKTs536lRlqUwqZciPK6eib8Fqj5JWEDC7iqynsIq2rSzDfb8RbsGp4K
 89XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yehGuBD3OuYld50+5DBfHoKCYNH5GVjIrYmsVwm20BI=;
 b=hGR9pgccjSe9V3Y6WtjS15lEoXHKgHjXWZn44dT/+3L6z/ihu8hZAptLitPu0nGLzs
 rPbN1V2ikWQ435IEp8/89Ib5Of0uXTCh1n+i6SosbABT4gh4RcW0m/JNacwG1ZYbxJ6H
 ZZPUCBdS2C7Bn9Hh3P15FW6Jesw6tzWRVwW0vXk2g6xVqHHyp6dClin2gBoGW+UIq1YM
 k/8KI1Ld/XV73IxnngQbP63M43OcYUuHAwmGAuSG5e43t73RSed+waf6+Qrakoy9Pld5
 CFRHbdbejp3EBqMB5pYdZbAde8hERadFWIP7djaePASxzJCPDWYRsdRuarIu+9ey+USf
 ff2w==
X-Gm-Message-State: APjAAAXWahqucEKYND2Ht9r+tMQbg1pNx23JurU86DZ5eemJaFQsvPtk
 W/LLnId1Png3MpML5zJYH9ECoIpu
X-Google-Smtp-Source: APXvYqw+u0vE8ztPcQjGkgKbxUGhwJjm5aWPpzrl4B1qr+KbzqhhdjvYm4EvdUl5gedeN1XJ1jnI5g==
X-Received: by 2002:a2e:8e87:: with SMTP id z7mr9351018ljk.211.1567191003573; 
 Fri, 30 Aug 2019 11:50:03 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id u13sm970890ljj.40.2019.08.30.11.50.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 11:50:02 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 30 Aug 2019 11:49:49 -0700
Message-Id: <20190830184951.31083-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/2] xtensa: call0 ABI support in userspace
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

Hello,

this series adds support for call0 ABI in userspace.

Max Filippov (2):
  xtensa: clean up PS_WOE_BIT usage
  xtensa: add support for call0 ABI in userspace

 arch/xtensa/Kconfig                 | 48 +++++++++++++++++++++++++++++++++++++
 arch/xtensa/include/asm/processor.h | 11 +++++++--
 arch/xtensa/include/asm/regs.h      |  1 +
 arch/xtensa/kernel/entry.S          | 42 ++++++++++++++++++++++++++++----
 arch/xtensa/kernel/head.S           |  2 +-
 arch/xtensa/kernel/signal.c         | 26 +++++++++++++-------
 arch/xtensa/kernel/stacktrace.c     |  5 ++++
 arch/xtensa/kernel/traps.c          |  4 ++++
 8 files changed, 124 insertions(+), 15 deletions(-)

-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
