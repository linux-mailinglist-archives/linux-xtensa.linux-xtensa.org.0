Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 553CED6B2F
	for <lists+linux-xtensa@lfdr.de>; Mon, 14 Oct 2019 23:25:40 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 581CE583D;
	Mon, 14 Oct 2019 21:18:16 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 4B45B5822
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 21:18:14 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f5so18034203ljg.8
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 14:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJ7ap/mJ4LnJlcvrkffAc0aZKRdl3/lTtd2w5VVgMTc=;
 b=XvlM80LDSXmna1BJMSr5a/bmzis83k48RX5xlT4Z9K98g8V5GLTTt8PvAwFY5M687C
 PLBSSyOO5XIVomNz6DBKoWIwuu4cbQ2Nnq0ApENs0GgqowU/HaeG33u+lJOl56QUkUWX
 T8z4L6EcQT6iT+9nWO4ttuxmwCWZJioPwud8oVqdCrIaq4xHbrDmmtW3ceMiM0OKQ5c7
 MnyIVoLoN/Dc8/SdqXiiuTAXx0AjFg3O7lT60uXtcnt1grLBjkn95fwsckLX27KEtyfo
 9Bl1PkjY3WMRmrdu/bx2vA1Ix9fN955h0yXVUDq6tIv41l0/DY5c70ttDk03gvPkr4Qg
 eBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wJ7ap/mJ4LnJlcvrkffAc0aZKRdl3/lTtd2w5VVgMTc=;
 b=VLH/I8RCjK6ElBQVl6DX/61ViLI8Fa8320S+jn+ktO9v/qZmIvh5BUqN+3ybnOGioe
 k/9Jd3/LwPEFxusibkpw3M8D6+7ykZ4BIOXfdU8tQp6e7QCF6dpjbUN6UHG7aEpwHk5k
 HhuBF4XIkKWhoAqlVOpxHCWzPcBbqrBIvMEP87L+QIswuPWYk+yNCAW1A4DvFXTnnoM2
 ydN8mvzSBir3SOS1vxyAFhrIN/6tgKZeLdiv9/uTQ/xYt1aIALxwMnQYhiOe8V+LkQvi
 dOUR0m2X0NoV/8o5+bn/b7gR3GCGnltAGPCrXAfRpzhGddEmnPMx4yGETQ9aYuSzcC7X
 7DDg==
X-Gm-Message-State: APjAAAUvFpZFqCHFcZEdpHbfDfgRC/CwOsbdgHADgwwPgnc/Kc8Yo/pv
 piN1zqVA0Nw+WnnhCqjr16O4sJmwLys=
X-Google-Smtp-Source: APXvYqwrn/wHJNPs+Z3jEe7EFcLkK+LStFk07lBcqoiLWtIOcwAWjmYTRHgxAOvVccvdGxBdPJ9T7w==
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr20223163lji.80.1571088336158; 
 Mon, 14 Oct 2019 14:25:36 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id m15sm4429434ljh.50.2019.10.14.14.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 14:25:35 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org,
	Al Viro <viro@zeniv.linux.org.uk>
Date: Mon, 14 Oct 2019 14:25:10 -0700
Message-Id: <20191014212513.17661-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v3 0/3] xtensa: fix {get,
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

Changes v2->v3:
- fix assembly argument constraint for error code
- rearrange result zero-initialization for error paths in __get_user_asm

Changes v1->v2:
- initialize result when access_ok check fails in __get_user_check
- initialize result in __get_user_asm for unaligned access

Al Viro (1):
  xtensa: fix {get,put}_user() for 64bit values

Max Filippov (2):
  xtensa: clean up assembly arguments in uaccess macros
  xtensa: fix type conversion in __get_user_[no]check

 arch/xtensa/include/asm/uaccess.h | 94 +++++++++++++++++--------------
 1 file changed, 53 insertions(+), 41 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
