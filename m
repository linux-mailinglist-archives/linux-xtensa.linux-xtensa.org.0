Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C273AE5822
	for <lists+linux-xtensa@lfdr.de>; Sat, 26 Oct 2019 04:51:00 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E51B042EB;
	Sat, 26 Oct 2019 02:43:12 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 607254240
 for <linux-xtensa@linux-xtensa.org>; Sat, 26 Oct 2019 02:43:11 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y3so5145210ljj.6
 for <linux-xtensa@linux-xtensa.org>; Fri, 25 Oct 2019 19:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nL9yqTXZXLcYbJqI4efchXgk8h3W/T1DwBx62Grvg7U=;
 b=rkfSwBa3A8YGzC+qx4kYdsDQGTnByEalsKb2ZFkZ7W9dgLJ7WloCAV1hChHdWfQrFf
 LH0+ffNGntn7q46GGzBNb6xeBPi72xSciaGBTz1bByFtc/c79hQwbOJ/J0eOAId6VNOi
 Fsx+lVymicYjDmFxx5Hfyv+tACWPTgkHulOFL5ShszacDoHg2NWF9YtT2y+/YF6L/c3i
 mI759cjY14jTSICj9q2fwtxrofVN9pNzJ0Zbdkawto1CtzFzHkBwhj+00l7Lwo5qfsms
 NjV0aJBDg+GWjDRX79O8/lcWiDwe7YeOHC4BXuKlS7+0ZmeASAazfgffvbF+2ipFA9Ud
 doAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nL9yqTXZXLcYbJqI4efchXgk8h3W/T1DwBx62Grvg7U=;
 b=t9aaneN5tC+iyJ6dmhmZdb1QqJ6mQRBeCBwlyvmwDi0f7bFPyRXLXpoa+1Q8+bpngl
 9CM3Nq+rcOFt3Vszzn9e6gllZDZME5LLDgkAKqTRI/v1nHizWA2JXdsbcjT+Zi3jTrTj
 c2mGqDnbuN0EuGI5AY6eXwhKGqgIBqa76WLPZ0misl+IpZbbVU5oVJH9Wf5kXIYlahO6
 ktr7+kr653kxA3N0xD+YpK9lMfCipltnv1SyUkj69o+IXL5JYqtGeZ667hGn50EUIeSa
 K0sBpnGo15Hu1AQjqh6TndWolmB+1wZ1CPWWFWaw1UFsoWF8ZtG5MPj92dGzRTsY8E0i
 BX8A==
X-Gm-Message-State: APjAAAUqQPDJClqq8d09U5PcyWBJZErdphrJ4AnGA634e/rlyTvWolu3
 u0BWyyCRXul1OlXaQTHulbOPZont
X-Google-Smtp-Source: APXvYqx/wg9daH7Enaj1hcfG+zAz2IqZPb7R0lVx1/kzS1E5F/onImwQu0AA9qshau3xlQUT2R9o2Q==
X-Received: by 2002:a2e:9192:: with SMTP id f18mr4500222ljg.172.1572058255282; 
 Fri, 25 Oct 2019 19:50:55 -0700 (PDT)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r20sm1506462ljj.84.2019.10.25.19.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 19:50:54 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 25 Oct 2019 19:50:25 -0700
Message-Id: <20191026025033.17797-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/8] xtensa: clean up and optimize inline
	assembly
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

this series rewrites inline assembly in uaccess.h, bitops.h, atomic.h
and cmpxchg.h to use named arguments and "m" constraint to access memory
where possible.
Named arguments are much easier to understand and modify.
"m" constraint allows compiler to use single load/store instruction with
offset instead of address calculation followed by load/store instruction
with offset zero for small offsets. This change reduces .text section
size of the virt defconfig kernel for dc233c core by 7KB.

Max Filippov (8):
  xtensa: use "m" constraint instead of "a" in uaccess.h assembly
  xtensa: use macros to generate *_bit and test_and_*_bit functions
  xtensa: use named assembly arguments in bitops.h
  xtensa: use "m" constraint instead of "a" in bitops.h assembly
  xtensa: use named assembly arguments in atomic.h
  xtensa: use "m" constraint instead of "a" in atomic.h assembly
  xtensa: use named assembly arguments in cmpxchg.h
  xtensa: use "m" constraint instead of "a" in cmpxchg.h assembly

 arch/xtensa/include/asm/atomic.h  | 124 ++++++------
 arch/xtensa/include/asm/bitops.h  | 323 +++++++++---------------------
 arch/xtensa/include/asm/cmpxchg.h |  71 +++----
 arch/xtensa/include/asm/uaccess.h |  16 +-
 4 files changed, 202 insertions(+), 332 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
