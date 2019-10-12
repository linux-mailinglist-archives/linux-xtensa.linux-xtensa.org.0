Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 14800D4B44
	for <lists+linux-xtensa@lfdr.de>; Sat, 12 Oct 2019 02:07:31 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7C03364BF;
	Sat, 12 Oct 2019 00:00:12 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id C501264BC
 for <linux-xtensa@linux-xtensa.org>; Sat, 12 Oct 2019 00:00:10 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id n14so11377758ljj.10
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 17:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DP/pIZ7Dk1r0Q1hAF8O62ASZwsVKnOksJciqBlvU9ik=;
 b=Q7kTfk7MSE6QawaFDXeSSzLymvp4F8fw5HDlXIrhbSMRYSOL2Bs/kBZY6CvwwBktap
 pQEhlW3IqjqiVmd9yzYIUpEPMypBT5AIhmcsnyYzd1ZBaah/uVjt9FmJN3wQ6Y/mu1vV
 9cmWtcLBuoMIKagHz3hrlORigpkYyNJnx+bND7R/O9A2GdkTli3uLg+/6QnDihRTKqTK
 vZ7cYwZjqkZlG4JDUb1aG4D2sSZZ4Fqc0m0BzMvbhDV3BUTeT8qeO6oSDJ+wyP/0lGp8
 tMVmz33GbIh6e7WFkI2cjOubo4mVEG3jul7rs0ZFkn1wPFtS1bGqsXjIMuDVzXCanSfa
 KKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DP/pIZ7Dk1r0Q1hAF8O62ASZwsVKnOksJciqBlvU9ik=;
 b=Y0DNeFeQZhh4NJlF5VrCB4OywG15bAxE9E3i1P098z0QflzRD3J/H9le1hREO1hQJJ
 gwcFVjCfg5YiOeFhHXSvWHMmw92scyxce3FJzTZPT2bGaago/NxDSaLnsxhwkcNrXEnh
 d5GDB4MS2HAy9jJPHdZt3dfEqGjtKFeEyTvZk70MPNRptYC9/jlbUhK9ErM5mI66wXXl
 ztAdlEl0Tomy+VoeXdgLujwWoa1cV9s7nMqRlzFzDGJbKk6rdDkNRNuv1L8yiT6A/H3L
 s043CsbPISehdyEYfz4dSYU3+wxXyu2gBAhmJ0Fxov0Faoy/Z80gN7vYOn/cmc8kT/Z3
 bRQQ==
X-Gm-Message-State: APjAAAVuyCVG3BvoJX6jTpTnQ1JRNIXH8J/2sY6iucddLssmSIYf7zW1
 3BfKdr+PutZV6CWI02NsINpQcO97
X-Google-Smtp-Source: APXvYqyG4EQRdcZnPtOacNPj+2wtZVQmew6gNw/unYbzGH39NbH2j7vfVUco9+sdZYdF9zjlSBVZJg==
X-Received: by 2002:a05:651c:1b9:: with SMTP id
 c25mr10299063ljn.163.1570838847064; 
 Fri, 11 Oct 2019 17:07:27 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x17sm2215705lji.62.2019.10.11.17.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 17:07:25 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 11 Oct 2019 17:07:08 -0700
Message-Id: <20191012000711.3775-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/3] xtensa: fix {get,
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

Al Viro (1):
  xtensa: fix {get,put}_user() for 64bit values

Max Filippov (2):
  xtensa: clean up assembly arguments in uaccess macros
  xtensa: fix type conversion in __get_user_[no]check

 arch/xtensa/include/asm/uaccess.h | 93 +++++++++++++++++--------------
 1 file changed, 52 insertions(+), 41 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
