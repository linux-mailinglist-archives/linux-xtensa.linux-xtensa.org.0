Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D94CBF9D59
	for <lists+linux-xtensa@lfdr.de>; Tue, 12 Nov 2019 23:45:14 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 167C26533;
	Tue, 12 Nov 2019 22:36:54 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 190286529
 for <linux-xtensa@linux-xtensa.org>; Tue, 12 Nov 2019 22:36:53 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k15so288516lja.3
 for <linux-xtensa@linux-xtensa.org>; Tue, 12 Nov 2019 14:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Wtk0Nm+D8hYP3oekilrGeRCItYzeICLDQ94WChp85w=;
 b=jAt3rJLfDyeXZiW8yRJ97FcoUdVCvpD5RjRsSd1+3Jk7r1+WjvJOlEn2Ny9o8oHGyI
 j0D/pGowaVvvRsNzW+n3VFNfV1hXCa0IRmAE+kEgKxXj8/GzH7fv0t+HwBjq+KAuZfyh
 mrCSbNTUktOsA1ixh/z+G63o5xkZP6d2CMPyZZHllKNBCrcIPgkKOCFhTPIT12i4c161
 lg28FnNzypgsQtp/Hs/HjT0jKmOxtVq9RGyUn/syjqK0yW32pRlQQZaN+3zs38tNbaoi
 NWoRy4CirPu+18EQ2A2dr8Xktpu3s+hiFUTvKMbGrN09ghn/mayjQOz9WB01ajo3ijOe
 DZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Wtk0Nm+D8hYP3oekilrGeRCItYzeICLDQ94WChp85w=;
 b=JyaXoFk0ObtBwEBVxfNWfpXFjtC5nfLd2qCsGRDK6+YV0qX2buGzf+k6Yonij4LiUk
 EpY2n/Ubg78A6FYN/KcLirUG6zCvZ2c0Zg/EC8zXi5cdi/wGCxl3iNuZJ7bGU01C0bZ6
 dj6YnI0Ai18W6VkOuwWXyShav1inyYgLsylbgoDw37XAb++yqyZ8ZFTEeePhpUCmuqJh
 7BszJXI9gA6HVe28DGFgCJ+wqKsZfR0jeVBlT8DoLGPYADt9n5XRWjUPcFzkCFkYGnhZ
 4UkchGTPXt3LZU+cuEZ5m/3+5bZw/ZPfNNbimvgIfh6Hvap2sY8YEyxVDxeaTGxIFYNw
 xv5w==
X-Gm-Message-State: APjAAAUA8Hg8kBuVUdAWpTKI6j2lsEb9kmyTfFcINElI+FVaL9kU8Q4h
 v8vyW9NmR9iL1PtJmwZgjTSS/KdS
X-Google-Smtp-Source: APXvYqyY8AKQOWp9omhOEkGuuGcANKP4PIIGPttrIFp0Hj7E9Q3BdYb/wOBTZxJOj1Mkdv4FHOvNvw==
X-Received: by 2002:a2e:8183:: with SMTP id e3mr104062ljg.111.1573598711442;
 Tue, 12 Nov 2019 14:45:11 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id x16sm38677ljd.69.2019.11.12.14.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 14:45:10 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue, 12 Nov 2019 14:44:41 -0800
Message-Id: <20191112224443.12267-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Joe Perches <joe@perches.com>
Subject: [Linux-Xtensa] [PATCH v3 0/2] xtensa: improve stack dumping
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

this series cleans up code around stack_dump and makes dump size
configurable.

Changes v2->v3:
- split Kconfig change into separate patch
- use symbolic names instead of hardcoded numbers

Changes v1->v2:
- use print_hex_dump.

Max Filippov (2):
  xtensa: improve stack dumping
  xtensa: make stack dump size configurable

 arch/xtensa/Kconfig.debug  |  7 +++++++
 arch/xtensa/kernel/traps.c | 27 +++++++++++----------------
 2 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
