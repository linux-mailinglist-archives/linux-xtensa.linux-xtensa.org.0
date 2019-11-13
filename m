Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 00A88FBADF
	for <lists+linux-xtensa@lfdr.de>; Wed, 13 Nov 2019 22:33:04 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9C13864F7;
	Wed, 13 Nov 2019 21:24:41 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 8A21964F0
 for <linux-xtensa@linux-xtensa.org>; Wed, 13 Nov 2019 21:24:40 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id m6so3187339lfl.3
 for <linux-xtensa@linux-xtensa.org>; Wed, 13 Nov 2019 13:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gwFw02yM0gn0O/2nR6UEqEE+kAQdEm7lfjHK+evVCiw=;
 b=FHsetdijhYgmfMq2vvzwJM4eyerN8eJAMRS2FJkKggVsL/hZEih1iXiyq/smgx5/MU
 iaB38vXIaL3BOMkJQ8H5vLKpytO7aIUGro38GI9GuBgrWjAoretY6yq9OxrbnqlXX5mK
 mb7HaF8mlH8Gncc5q1IOeHd63vXaVEwh5QGo4jrMSj1eGomrCNPEWpLzkBKEd8DL4hAa
 SJC7jAnCCRtRHsHzCYjOUba1usQHjzrjMJOyIGW7T5LwhKQ8JX0MoS9j9HKtmG0NE8iZ
 RpSFCaFplCkvsAuLNuamU6gwXQ5a3ZI1vB7hG8GNwMXcPE/vbF491y+hYPgNkXLZUldL
 gUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gwFw02yM0gn0O/2nR6UEqEE+kAQdEm7lfjHK+evVCiw=;
 b=rYCrCM9iXUDcT+jLBYYJTAPwRAmkD0kePLgXIqynF7WXpHOSqhRDqxVZ1p7h7FEmI3
 IHHLDn3l6reLZx1jH5nfeIhSExDtf6YDd3aFCmSydusKWdak5a9E3xih3KDQ5KUbS9U0
 ZMld1FCnwmXfOjZ9hnz3mKp7U2DtUdT/XDG6YDpdZgiuea+R4V4z3T8BvwLcVAWrexem
 sHEoBsXeV1I5KYIgWK6XPaoLqoEcSXuXj1X06ZJcWQm7XUDKoma2g5z1khMHFQplnM80
 7S08FAX+5unXeCXu/aUYSAyJ5OEOhzJfC0RVPgkCWF1g+ym+fojBErCD/cKynFeyd+ep
 f4Ig==
X-Gm-Message-State: APjAAAW0Aue92XtKCRdNo7ut6fSv42BRArolupAmKmWXejm0RHvdUtyg
 SkM8EQQAsASmm5CHQmK8S+AemU9QcJ8=
X-Google-Smtp-Source: APXvYqwqyQJRioR431/UVYLsuuhylHEa4dkMbyV22KA6oBwzSiOsw9P2JPdup0AFfNqRM3ORiTJ3cw==
X-Received: by 2002:a19:6108:: with SMTP id v8mr4083026lfb.160.1573680780516; 
 Wed, 13 Nov 2019 13:33:00 -0800 (PST)
Received: from octofox.cadence.com
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id y9sm1495342lfl.16.2019.11.13.13.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 13:32:59 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Wed, 13 Nov 2019 13:32:45 -0800
Message-Id: <20191113213245.23161-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix TLB sanity checker
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

Virtual and translated addresses retrieved by the xtensa TLB sanity
checker must be consistent, i.e. correspond to the same state of the
checked TLB entry. KASAN shadow memory is mapped dynamically using
auto-refill TLB entries and thus may change TLB state between the
virtual and translated address retrieval, resulting in false TLB
insanity report.
Move read_xtlb_translation close to read_xtlb_virtual to make sure that
read values are consistent.

Fixes: a99e07ee5e88 ("xtensa: check TLB sanity on return to userspace")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/mm/tlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index ec8220973252..f436cf2efd8b 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -224,6 +224,8 @@ static int check_tlb_entry(unsigned w, unsigned e, bool dtlb)
 	unsigned tlbidx = w | (e << PAGE_SHIFT);
 	unsigned r0 = dtlb ?
 		read_dtlb_virtual(tlbidx) : read_itlb_virtual(tlbidx);
+	unsigned r1 = dtlb ?
+		read_dtlb_translation(tlbidx) : read_itlb_translation(tlbidx);
 	unsigned vpn = (r0 & PAGE_MASK) | (e << PAGE_SHIFT);
 	unsigned pte = get_pte_for_vaddr(vpn);
 	unsigned mm_asid = (get_rasid_register() >> 8) & ASID_MASK;
@@ -239,8 +241,6 @@ static int check_tlb_entry(unsigned w, unsigned e, bool dtlb)
 	}
 
 	if (tlb_asid == mm_asid) {
-		unsigned r1 = dtlb ? read_dtlb_translation(tlbidx) :
-			read_itlb_translation(tlbidx);
 		if ((pte ^ r1) & PAGE_MASK) {
 			pr_err("%cTLB: way: %u, entry: %u, mapping: %08x->%08x, PTE: %08x\n",
 					dtlb ? 'D' : 'I', w, e, r0, r1, pte);
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
