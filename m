Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 81466FB9D8
	for <lists+linux-xtensa@lfdr.de>; Wed, 13 Nov 2019 21:30:54 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2001758A1;
	Wed, 13 Nov 2019 20:22:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by linux-xtensa.org (Postfix) with ESMTPS id A79AE52BF
 for <linux-xtensa@linux-xtensa.org>; Wed, 13 Nov 2019 20:22:30 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id v15so1482957ybp.13
 for <linux-xtensa@linux-xtensa.org>; Wed, 13 Nov 2019 12:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HhUJSPQDvSVcW6lExUu0Aos25QWc66JPMYbcEiKuXrc=;
 b=Nn03DCxiI7YI0L9xwwcV+FWANHJyX0Nosiah9C9ZEYM6RrUknHizEw0/Ycd051SlK3
 p+Abqia/sM7br2NF1iq6mgg7c3AqnCya0VFzL+xCg6m/DvN2uAaXNdeI+hA1pF0mlLm7
 lajPR7C6kVPLXfNzWmevC8ueutQUsmor9IfCJkTa6m9g1VjBQ0cCm0ROz3JWUfbpI+eB
 PiOheiqaWiP9+CJ6BJaOZOv4+4gGvcJ41Un+Wqvod2rKcV1KbUYOz4xORFCqDAbJgbQQ
 562C+TZg0L8TjWX3oLB+QWrwC15uulzsY5TV58YDTkSLEnYd9pPzqLJ2FvpCLH1ZoccY
 jJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HhUJSPQDvSVcW6lExUu0Aos25QWc66JPMYbcEiKuXrc=;
 b=gtBrKReKnlcC5I8i+bPtiMr/RHT+bQArNFfkrfu+GwqRZ3lOPrYCHx9Hw9l6ctnCnT
 GvQvZ7zd/YUDRbs7amnPj33xqKPRRpS/W1slc+ItE1DkRDEKG9WQt9F5anjj635BKu/s
 bcjyCibSy3Y5ERpzpalA/Uxoi+SCV+sHd0rccQjAS3UpTpVYbM+dDZSVCdkL375/4wDp
 v+yxZFjoghqGZFvhT+zy/c9m0cfm7porL8zHVJZCouWyGqWS58LdblT8UVet51Xfmyaz
 Vmicuq1qJ44ZVoRauq5mXiziMzKFRQukOyBzYly74MqUxan7mUhg4xh0Geddg+V6PhNO
 j2cQ==
X-Gm-Message-State: APjAAAW3MsfN3pzDztGKvasp5MeGKtUFw0NE7ocy/P0dW4XHZMO90yXj
 nSBwrwx/NlTx1SNfB77sqkf8C4V4Wkhzc62PmNM=
X-Google-Smtp-Source: APXvYqxtTDE1DuX7odfSWA32rCc5N/jNL04v+VM3rGUIhjMW0FCHmUvG7BWWqqzfvcrhoqFMyCvgmEKAHAX+rTFSN4k=
X-Received: by 2002:a25:768d:: with SMTP id r135mr3778035ybc.25.1573677051679; 
 Wed, 13 Nov 2019 12:30:51 -0800 (PST)
MIME-Version: 1.0
References: <1572964400-16542-1-git-send-email-rppt@kernel.org>
 <1572964400-16542-3-git-send-email-rppt@kernel.org>
In-Reply-To: <1572964400-16542-3-git-send-email-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 13 Nov 2019 12:30:39 -0800
Message-ID: <CAMo8BfLpdy4biZ4UvE4PDhscCFOj75nHWTwO+HFXpWx1qQOmEQ@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Mike Rapoport <rppt@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 2/2] xtensa: get rid of
	__ARCH_USE_5LEVEL_HACK
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

Hi Mike,

On Tue, Nov 5, 2019 at 6:33 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> xtensa has 2-level page tables and already uses pgtable-nopmd for page
> table folding.
>
> Add walks of p4d level where appropriate and drop usage of
> __ARCH_USE_5LEVEL_HACK.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/xtensa/include/asm/pgtable.h |  1 -
>  arch/xtensa/mm/fault.c            | 10 ++++++++--
>  arch/xtensa/mm/kasan_init.c       |  6 ++++--
>  arch/xtensa/mm/mmu.c              |  3 ++-
>  arch/xtensa/mm/tlb.c              |  5 ++++-
>  5 files changed, 18 insertions(+), 7 deletions(-)

This change missed a spot in arch/xtensa/include/asm/fixmap.h.
I've added the following hunk and queued both patches to the xtensa tree:

diff --git a/arch/xtensa/include/asm/fixmap.h b/arch/xtensa/include/asm/fixmap.h
index 7e25c1b50ac0..cfb8696917e9 100644
--- a/arch/xtensa/include/asm/fixmap.h
+++ b/arch/xtensa/include/asm/fixmap.h
@@ -78,8 +78,10 @@ static inline unsigned long virt_to_fix(const
unsigned long vaddr)

 #define kmap_get_fixmap_pte(vaddr) \
        pte_offset_kernel( \
-               pmd_offset(pud_offset(pgd_offset_k(vaddr), (vaddr)), (vaddr)), \
-               (vaddr) \
-       )
+               pmd_offset(pud_offset(p4d_offset(pgd_offset_k(vaddr), \
+                                                (vaddr)), \
+                                     (vaddr)), \
+                          (vaddr)), \
+               (vaddr))

 #endif


-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
