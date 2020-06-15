Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E35561FA3F7
	for <lists+linux-xtensa@lfdr.de>; Tue, 16 Jun 2020 01:13:19 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 28F5C5874;
	Mon, 15 Jun 2020 22:58:12 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 5E20F5856
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 22:58:10 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id s23so8546768pfh.7
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 16:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gCN6TnTiCi8K0gBGCrSWRSdQxoTqdDw82hOjy8EbDD4=;
 b=Z8KpbfQz2lb+n+zm+c8pXwrgXG+ypStjQfRPk5R72bJVqDqaBh55FpRZlx8RX2b4C0
 uqZyiqoiYD8X1Sf+qCjasry8UVlhsEZ9KnLNtqCmzrBi8RA1KkK1lZ2j9I09OXpemvwI
 /U2Be+AeGmDW5+xNbU/79+/OsT5aCNXx0xQYxSFcMjqpmk8cGHiuh9QYCW341zqFe1zY
 4AXWxfOKeNF3DV4mOqErPSQIiBQXc/7QS6QwWzAZZqALF/SmaFgM/XZsIU28jRiwZaRx
 akVyy2zrWI7UHcTSbfRlD7hYOhDI+jlP5mau0PvDUb6WatsBEeyJa1BJoD71ZVF2X/6b
 wJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gCN6TnTiCi8K0gBGCrSWRSdQxoTqdDw82hOjy8EbDD4=;
 b=LRfzMCdidAds46qU8hXXHpwdfgjfCLgh5GVRAyXGAyK94S1bJ++HznE08Bn1xSEFPi
 nBfGkGnbELA9k4ZSXJ6GDrdO47TUyPVNbrnK8ncHBbKeCNJ3+8y3vXAmujwWQScgs3W2
 b+03tx8/IrGEhrFRP/O6FhMqkfQAAQsL7ZhYeI4xY0mM+aJlpDJPQFty8NJIOHe442YV
 icSA60K9WB2zxSPHbUaGdVrsRoGsasv68itNJv1t1X21F0fiLpxbqiORI5aOiD7BdLts
 kK15MuN4xx7sUsaNJrWXA/UzhTc8jtxPWWhieuR4HW3HC4kOfLipU4iVkkoMQK167AJq
 KT5A==
X-Gm-Message-State: AOAM531egwMZbgBYBk+s6ei8O0FCTCscmNtjzqNgCO3/nHlFVlyKPec1
 F1n5guITNbSrAr7yndaqayr8IV3AGYTLsL+rntM=
X-Google-Smtp-Source: ABdhPJzRKk2HjvNyBI7fVWuqOXrE1rxaTm/7+1ZDhLgwPpEvjVzcdKcg5b6dnnvptoOfIf2kolRLemepl1Cnyw9LRVk=
X-Received: by 2002:a63:d501:: with SMTP id c1mr8848877pgg.159.1592262796111; 
 Mon, 15 Jun 2020 16:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200615221607.7764-1-peterx@redhat.com>
 <20200615222328.8745-1-peterx@redhat.com>
In-Reply-To: <20200615222328.8745-1-peterx@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 15 Jun 2020 16:13:04 -0700
Message-ID: <CAMo8BfLPRF5BZV3CS5JKPo3+bDZm3ihXu4bX9b90XNMcYx+SLQ@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Subject: Re: [Linux-Xtensa] [PATCH 25/25] mm/xtensa: Use
	mm_fault_accounting()
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

On Mon, Jun 15, 2020 at 3:23 PM Peter Xu <peterx@redhat.com> wrote:
>
> Use the new mm_fault_accounting() helper for page fault accounting.
>
> Avoid doing page fault accounting multiple times if the page fault is retried.
>
> CC: Chris Zankel <chris@zankel.net>
> CC: Max Filippov <jcmvbkbc@gmail.com>
> CC: linux-xtensa@linux-xtensa.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/xtensa/mm/fault.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
