Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 739672B4121
	for <lists+linux-xtensa@lfdr.de>; Mon, 16 Nov 2020 11:31:12 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 972CA5825;
	Mon, 16 Nov 2020 10:10:39 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id CAE315289
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 10:10:36 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v144so24330324lfa.13
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 02:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EeFwfXRkZ5mTFjbHPs+YdFt7GCH/z/SaefTbs/c6Zps=;
 b=WlESugNPPAE0O9BzfishSL57brpam42kEsA3MWVOk6NEKIbAHTUQwGHOH2teWuciY2
 6qNKZBZLRdehN3trbNX+kfhocGVjmHP3nA0d6Sg+ZIGFvtr9z6HHZOxq5QKd+CPKY2TR
 sCgkcq0ormE+6a/qb5YtiaP9ToU1U4Czs5q0RecotrEMEPBIr25W8gDuzfZvby7pqRoZ
 mk47MFzyGHhlLLETVZtge+wlABQ6jHASM1lxm1f1/Rv7UdlSRZOMZQecm1QbPfgWf+l2
 6aHBVvB/N51m+bEoo5K11D4da8aB9q+nvIIxUYvMUaN7uH7GqnvSsAmNMYmeH2mHEdGu
 9T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EeFwfXRkZ5mTFjbHPs+YdFt7GCH/z/SaefTbs/c6Zps=;
 b=cE5HtiO8s33UsENKibEDw8fsShVW13YVbhAUshmmztAwx6DxAKv4oF+FchtXAhSStp
 92WmhepY0MdJukqyl7i3XmJ4c8JarPJiiZqsf0ucQIjRbx2ReE13hMfHLc8Da+CCe7Uh
 UFp171Ge4tdvpSJ89Wv9N0AFpDgY+vmCmsbrZvI0rYNJTPvPb3DyTdP+n8IWqNa40YT+
 HIgmEm92XLIZiiwGSrQoOmcS4MFqCq0tGTxlMZzFoVna+nWi6ZjaHLSaOyoc/v5IbaE+
 8BpYUVgUhuPTPBATFNHtLaTqFtmg4phJmbgUb/ImX90lS8WZvEo1ftKaGFurux0mKcpp
 PP/A==
X-Gm-Message-State: AOAM533qz1A+21L0tfJFgtXQPWjHkcRnRtnjqkOCI4sb+ZYRgUSym+74
 di0zDzhwffOjF3Y1b2hpli4Ma5Ga8BR7/Q==
X-Google-Smtp-Source: ABdhPJzFhbUr1wqUW26Rv41Zcv05XdjU9AYHaExE1SYwnkP3q92Epc8CKegki+1XzXiFg2jmCxn19g==
X-Received: by 2002:ac2:5219:: with SMTP id a25mr5105145lfl.264.1605522666908; 
 Mon, 16 Nov 2020 02:31:06 -0800 (PST)
Received: from octofox.metropolis ([5.19.183.212])
 by smtp.gmail.com with ESMTPSA id f1sm2687362lfm.184.2020.11.16.02.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:31:06 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 16 Nov 2020 02:30:56 -0800
Message-Id: <20201116103058.5461-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/2] xtensa: cache aliasing fixes
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

this series changes TLBTEMP region placement and disables preemption
around all cache alias management calls. This fixes TLB miss and
multihit issues in the TLBTEMP area seen on cores with aliasing cache.

Max Filippov (2):
  xtensa: fix TLBTEMP area placement
  xtensa: disable preemption around cache alias management calls

 Documentation/xtensa/mmu.rst      |  9 ++++++---
 arch/xtensa/include/asm/pgtable.h |  2 +-
 arch/xtensa/mm/cache.c            | 14 ++++++++++++++
 3 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
