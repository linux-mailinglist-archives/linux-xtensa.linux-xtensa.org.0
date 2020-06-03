Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 225801ECC7E
	for <lists+linux-xtensa@lfdr.de>; Wed,  3 Jun 2020 11:23:51 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id A461D2264;
	Wed,  3 Jun 2020 09:09:08 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by linux-xtensa.org (Postfix) with ESMTPS id E53672261
 for <linux-xtensa@linux-xtensa.org>; Wed,  3 Jun 2020 09:09:03 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id e9so1339351pgo.9
 for <linux-xtensa@linux-xtensa.org>; Wed, 03 Jun 2020 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRW5SDnwIIr3cbppv0Ovv932qqur7lY5ZkGh2JacUsk=;
 b=SrC6qUm/64CLgN3/RvGv1EbqL2YSyzHZIpP6OHKPon7X0WlfEKShW4M8gx5w8aMmOU
 dZddmkrbX9131LFUbWJoZo5VU+WARINRbsQHUTPweB2EwruDc7vnM+v1WTUiU+fYigsU
 GwV0LiOA55GXJEP5TJV8WlhiOK+BBjpAVo0XCxcL2TrjBpxTzRwbdLGw68MtzEDiQJAB
 mNEzcygjYmM2vbT8bwlrd+jeFsb1JkhY0g4O80GQNtU9OyW4h23ov8J6cTOcyGbSPOkM
 R0AM3Jg4DDM+I6iMEmtRdcgcy9tqJ8xJAoUOC9vtoh20S2qMk4tb5RuC8pCRyjLeeibm
 uRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sRW5SDnwIIr3cbppv0Ovv932qqur7lY5ZkGh2JacUsk=;
 b=ZXb5aiOdoxxFEa0YTwvnrzsR3eTy7CUC7liy4OyHXKb+j8ov/3uXCt79ru9B1tN5oD
 h/nF1hx/qOPM5s3tbmFC3UE8PdFWzXgC7HjjduN5Cw7Jf6pnJjf7s/vjh4Yzg9S/kSI7
 6/FtrrOOhZ1lDZbMcQ5pMRgpHImPbW4G1bzr57NqeWM9Kdh/VkIFuHV1y+C+nfdu+sfY
 Quql9T/x63jzdo0tgSQoIl9SS8ptJoOxIxAxrtUyn+j5svlbbou/jebCLdVZWsHN1lDB
 Pj9mvfqlLseAVoHYFmVzDHzT/W0cSqyo4cPg8sxD4hLKq+x3+9CJM/phfsQhEqIBXsCk
 bz4w==
X-Gm-Message-State: AOAM532J4mVeXuwrokp7dce2i1ZqDddOyNf8kRj/T9zaiRawfI1ja9cR
 XPtU9NeVnzr/RtMejSo8vd4=
X-Google-Smtp-Source: ABdhPJyDo2fa0sS2MRLPdXgs/OGzNP9/ZnQfPHnPnHRSdq0RnJSa0rQFN7bQJH8W+muWs2lOpKgt+g==
X-Received: by 2002:a17:90b:1244:: with SMTP id
 gx4mr973127pjb.136.1591176223846; 
 Wed, 03 Jun 2020 02:23:43 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id h20sm1313260pfo.105.2020.06.03.02.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 02:23:43 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed,  3 Jun 2020 02:23:29 -0700
Message-Id: <20200603092329.10427-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PULL 0/5] xtensa updates for v5.8
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

Hi Linus,

please pull the following Xtensa architecture updates for v5.8:

The following changes since commit b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce:

  Linux 5.7-rc6 (2020-05-17 16:48:37 -0700)

are available in the Git repository at:

  git://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20200603

for you to fetch changes up to 3ead2f97bd44a9a106572d306cb04a878c569cb2:

  xtensa: Fix spelling/grammar in comment (2020-05-25 16:11:43 -0700)

----------------------------------------------------------------
Xtensa updates for v5.8:

- fix __user annotations in asm/uaccess.h
- fix comments in entry.S

----------------------------------------------------------------
Chris Packham (1):
      xtensa: Fix spelling/grammar in comment

Max Filippov (4):
      xtensa: add missing __user annotations to __{get,put}_user_check
      xtensa: fix type conversion in __get_user_size
      xtensa: fix error paths in __get_user_{check,size}
      xtensa: add missing __user annotations to asm/uaccess.h

 arch/xtensa/include/asm/uaccess.h | 32 ++++++++++++++++----------------
 arch/xtensa/kernel/entry.S        |  4 ++--
 2 files changed, 18 insertions(+), 18 deletions(-)

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
