Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA0B228FB7
	for <lists+linux-xtensa@lfdr.de>; Wed, 22 Jul 2020 07:34:34 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B0915262C;
	Wed, 22 Jul 2020 05:18:09 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 511AD261F
 for <linux-xtensa@linux-xtensa.org>; Wed, 22 Jul 2020 05:18:08 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n5so594753pgf.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ZfWlwCH54AqAy5SVcPssePKiah1fkND2uxw3IEAeNg=;
 b=gevWZ7JVCnYoPCBeQKrhjOSlMv8Lhy+c7ihXuPF76RsyyJ9555v+HOOEe4yzWqGKQm
 lOaxmoSjNXM6eQ4g1VXrx2lhnhcHkPT+q2K/KK5eIIeq9LL4qLm9tcahmwYGBI0l+S/H
 Bhp84Mp3/OpWAe/9NFDVOWwSqJwGheqOXGWO4qv/omL8hiNpfCyKeDTX+jB4dmx6dR61
 0+S+mSgHMvT5Ndhb2JhKnvwwllkSJPkJWE+rD5VkcLJ2k5Pa01EooyTF2bMfAwQxe8De
 Y4yI5YFg+lueod6AV/TV//G48CXnGTousPsd1pah7jVATavV6Vi3ZxazEza/UVN5JKH7
 X0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ZfWlwCH54AqAy5SVcPssePKiah1fkND2uxw3IEAeNg=;
 b=Zkj/OzCv8iyeN9Czw3fT4VF5YGRzVwL/VYS7cHuOqoNaNqf5f+pGveEXS7bVftKSix
 pmyZQSgJZDuKo9fuuB8zBWvy3CNCu9JSgZe8yaD+pfN4Vw9rveV2eHvr6TYDjVJoYZ32
 4f2yyrVgxQv6xt7AzgdiyIuBl75Ag05XuzO6vC2HCv1hd6/XHhsm6cmhx+vnc0FdJVoA
 z98V3JRG5YF0xbpqSBmSh1vT91B2OlosqtxQzb6hNOkS76C5zyjeoEbBImiD7PcKxWhv
 qkkJuoj8Tg+qT9jYjftJUl32/EVeZ7Ac7Muul/PpBXuRRq8pBb/6+x7N8M/gnphNcSRo
 Z6gQ==
X-Gm-Message-State: AOAM533BgGgzwxGaxuKzbO7t+UMl5iEc+zppId6pUCRf1io53RwsqqLG
 o69SwJLfKAzfoYFCQz+2nOX7yzTS
X-Google-Smtp-Source: ABdhPJxoDuOnhLaDsDsJSfYHskC9/Di/I/7obMVU5KcpT3nsNyDo/y7XOyuTxXeavF5eftOIRIpa/w==
X-Received: by 2002:a63:b956:: with SMTP id v22mr25304322pgo.242.1595396071675; 
 Tue, 21 Jul 2020 22:34:31 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id q5sm22536608pfc.130.2020.07.21.22.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 22:34:31 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 21 Jul 2020 22:34:15 -0700
Message-Id: <20200722053417.5915-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: [Linux-Xtensa] [PATCH 0/2] xtensa: boot targets cleanup
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

this small clean up in the xtensa boot subdirectory adds more targets to
the 'targets' variable to avoid unnecessary rebuils.

Max Filippov (2):
  xtensa: move vmlinux.bin[.gz] to boot subdirectory
  xtensa: add uImage and xipImage to targets

 arch/xtensa/boot/Makefile              | 12 +++++++-----
 arch/xtensa/boot/boot-elf/Makefile     |  4 ++--
 arch/xtensa/boot/boot-redboot/Makefile |  4 ++--
 3 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
