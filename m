Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 74123D4B63
	for <lists+linux-xtensa@lfdr.de>; Sat, 12 Oct 2019 02:37:30 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 69C7A581E;
	Sat, 12 Oct 2019 00:30:11 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id CBCE35814
 for <linux-xtensa@linux-xtensa.org>; Sat, 12 Oct 2019 00:30:09 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m7so11459757lji.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 17:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4Ki0HjVKaflfmxJ2byTawmZD59wBPdISnRBsFf1+EE=;
 b=GwdKcecDHoPtTKefPJDFPiTifnR2o2DiQsdu9eYxjZKHNGVh4M3eyOGTtSM4dIBG9w
 2RD8MYbieejLw0IVF+lNSxv0IoF0Tg5WlyczNlhvVquO1YUWfqC+lsZsa+DTKHu9ThbS
 t+PHqCQqQFlR0W2nZ4ZSIuYfyJmz7hREKLdbJEofiuaDJXYcxJNbydcD0h0c8WqVUJl9
 493ZoqzSV/+idkqjGDTon1NwD63dr4FCuieLRUOIjNQXWGJjMIBC2EOAfdD4LJ2YPLKp
 DXao1EjYBaRXqpKvw2MFhPr5LpYkb+twKkkUXKum9dBP/sPfT68zeszbwuqWLzIRsIQE
 MQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f4Ki0HjVKaflfmxJ2byTawmZD59wBPdISnRBsFf1+EE=;
 b=PzIK4Kk9PGo6yXvtILQ3FOWhALo56hxdnO5vHDn/kuAd2FvtJHHOKeejvVOvfU1KaZ
 dcSHMMmEDMfI/0I70pxm3Fpiew9WdCzV8dApn1bmHuMGkfsduau+Q9OVAxC/8hVwafh1
 6o1z0l0t59RmMvzcATlR3s6G9lhe1P4rlqzD600sAwqAvnBVOWAFiiqeoy+ZK7mZ+2z8
 UMdhj7HwCJchdM7I1oWeZLyQTFyncyE0oxfRTHYpPrBAB+vhCt/eVvqBf1Hvc2RyWmnL
 AAFT+zM8mV/qhJovOGlGJjGBJkFoScCkOLDee7DyzQGSF6VSdBl5FwK9xC8bkXTr+UfI
 GU2g==
X-Gm-Message-State: APjAAAUwqLRLbX0NQzrOunb0iY3d8WkGQVCeXuHjAKpsq4izBLsY2lyb
 rxfvjrIOgdSel/vl12/6IwdY7W5xLwI=
X-Google-Smtp-Source: APXvYqytgLNEilHpnDPZTz37dMIPamPyEfsAHb42Fyj4zkTggkCK5P5YAx4Af6P5wT6BgrshuxohoQ==
X-Received: by 2002:a2e:858d:: with SMTP id b13mr9538774lji.71.1570840646279; 
 Fri, 11 Oct 2019 17:37:26 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id f22sm2346620lfa.41.2019.10.11.17.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 17:37:25 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 11 Oct 2019 17:37:04 -0700
Message-Id: <20191012003708.22182-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 0/4] xtensa: fix {get,
	put}_user() for 64bit values
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

this series fixes return value, out-of-bound stack access and value
truncation in xtensa implementation of {get,put}_user() for 64bit
values. It also cleans up naming of assembly parameters in
__{get,put}_user_asm and __check_align_{1,2,4}.

Changes v1->v2:
- initialize result when access_ok check fails in __get_user_check
- initialize result in __get_user_asm for unaligned access

Al Viro (1):
  xtensa: fix {get,put}_user() for 64bit values

Max Filippov (3):
  xtensa: clean up assembly arguments in uaccess macros
  xtensa: fix type conversion in __get_user_[no]check
  xtensa: initialize result in __get_user_asm for unaligned access

 arch/xtensa/include/asm/uaccess.h | 105 +++++++++++++++++-------------
 1 file changed, 60 insertions(+), 45 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
