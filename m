Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 42E2625BBAB
	for <lists+linux-xtensa@lfdr.de>; Thu,  3 Sep 2020 09:29:31 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 849C4581A;
	Thu,  3 Sep 2020 07:11:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 967E64242
 for <linux-xtensa@linux-xtensa.org>; Thu,  3 Sep 2020 07:11:30 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id i22so2403668eja.5
 for <linux-xtensa@linux-xtensa.org>; Thu, 03 Sep 2020 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z2ZPyKLU1YkrBtAIw6FNyEviDavWBxV/x7RwKxTnSNY=;
 b=a+nbvgq8jDteeyFU2pmd0V3LboA3T4ib6jbNB2+bFyZ+aLX+5k5xYXVAIuSVnypxrN
 DYcGkl5XFNBy1yfaOeyaXcDw3kbXueho88n9nxSBMd+kZLG+YFQjYK/jCnSLj18E2eF7
 etyrfXYwR2cpswHBvDX9+jlAl6a2CapE4iSF9nw0SoVjNXvpPmW2KPBVhpFpvpHU7+L3
 a8Tn6Gb/NEXHnqSzLZAV1VHpIumwtjlYIytkb6ef6ndGQSbI113+OH7f2DrxMBggZQ1O
 ROQxJYgaAmyXINJW4pBZCmnto/ggRRO+8HBZFMz5hKOOGUD6uQdDl+5uZwsQU5mDs38a
 dWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z2ZPyKLU1YkrBtAIw6FNyEviDavWBxV/x7RwKxTnSNY=;
 b=joc+18PpcPmbUdO0PH7xGiAV3/7BSwb5q1qOphT1agTxSifO7z/drzlsCdxow77ywh
 3Idf2KDHJIouS6sSUPrAjuAqVFixK9tLnX3W2EXOojjUKgMa9rj89FEyU4iEObb9ugIN
 p2QvAPwVbi8Qrq8ZEbxpTAmsGiFbVN1vnoHHyjoXk0nc3LUcivOhHIwgss+qAdInDvjX
 mrCGVL0nHx8eiBte2D0HD+9/pf4qnmv7clgDLWzOjbRMWDHUUeARcER2BUogc46YjTb8
 XIqTlUwyjW4QZ1DqieXQJYr/eT19qC59xVFqroGwNJ96YDBQxsyE+jTODCckAvdX5ujR
 LFeA==
X-Gm-Message-State: AOAM533UQnpB7FginS1mYAfFVKDbnKB/zYZcFB4ESGiYeeyNhlC30gqh
 87DygebZjjLZ0lHR2D/+hIjFqMP3/ow18Zu7lhY=
X-Google-Smtp-Source: ABdhPJywqyR8GIjxi73MMDL2UvtZSyQX7uzjFGvNi6kH8eA5ZNax+GIlMzjUEHcvThINsAkcxV3kJTq3hQqeqY3QKpc=
X-Received: by 2002:a17:906:f1c4:: with SMTP id
 gx4mr822582ejb.98.1599118167544; 
 Thu, 03 Sep 2020 00:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <1599116482-7410-1-git-send-email-alex.shi@linux.alibaba.com>
 <1599116482-7410-3-git-send-email-alex.shi@linux.alibaba.com>
In-Reply-To: <1599116482-7410-3-git-send-email-alex.shi@linux.alibaba.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 3 Sep 2020 00:29:16 -0700
Message-ID: <CAMo8BfJT7JJfwT1-X3vfqKGD-E3-Dbf2xyWs-RiRyUUHmbetVA@mail.gmail.com>
To: Alex Shi <alex.shi@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [Linux-Xtensa] [PATCH v4 3/4] mm/pageblock: work around
 multiple arch's cmpxchg support issue
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

On Thu, Sep 3, 2020 at 12:01 AM Alex Shi <alex.shi@linux.alibaba.com> wrote:
>
> Armv6, sh2, sparc32 and xtensa can not do cmpxchg1, so we have to use
> cmpxchg4 on it.

[...]

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig> index e00d94b16658..03a6c7fd999d 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -48,6 +48,7 @@ config ARM
>         select GENERIC_ALLOCATOR
>         select GENERIC_ARCH_TOPOLOGY if ARM_CPU_TOPOLOGY
>         select GENERIC_ATOMIC64 if CPU_V7M || CPU_V6 || !CPU_32v6K || !AEABI
> +       select NO_CMPXCHG_BYTE if CPU_V6
>         select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>         select GENERIC_CPU_AUTOPROBE
>         select GENERIC_EARLY_IOREMAP
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index d20927128fce..4c7f0ad5b93f 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -155,6 +155,7 @@ menu "System type"
>  config CPU_SH2
>         bool
>         select SH_INTC
> +       select NO_CMPXCHG_BYTE
>
>  config CPU_SH2A
>         bool
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index efeff2c896a5..51ae5c8ede87 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -58,6 +58,7 @@ config SPARC32
>         select CLZ_TAB
>         select HAVE_UID16
>         select OLD_SIGACTION
> +       select NO_CMPXCHG_BYTE
>
>  config SPARC64
>         def_bool 64BIT
> diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
> index e997e0119c02..862b008ab09e 100644
> --- a/arch/xtensa/Kconfig
> +++ b/arch/xtensa/Kconfig
> @@ -42,6 +42,7 @@ config XTENSA
>         select MODULES_USE_ELF_RELA
>         select PERF_USE_VMALLOC
>         select VIRT_TO_BUS
> +       select NO_CMPXCHG_BYTE

Please keep the lists of select statements in Kconfig files above
alphabetically sorted.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
