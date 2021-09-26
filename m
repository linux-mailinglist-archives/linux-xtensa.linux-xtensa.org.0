Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6230E418A93
	for <lists+linux-xtensa@lfdr.de>; Sun, 26 Sep 2021 20:56:26 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 36CCF6823;
	Sun, 26 Sep 2021 18:25:22 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by linux-xtensa.org (Postfix) with ESMTPS id 1615A681F
 for <linux-xtensa@linux-xtensa.org>; Sun, 26 Sep 2021 18:25:09 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id l8so11958216edw.2
 for <linux-xtensa@linux-xtensa.org>; Sun, 26 Sep 2021 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=euhjRyQ0dvhOzaWisAQrBRgkNaU3wGFLRW2qXQGz1q8=;
 b=IxZPnAMq/V0yqSjNHnrnmPO58IzCuok1uPDSKG7Gqv7WODWcY1/mqLEBY8qhWMVLoj
 20PkSsmW5mt0Zq1gjPxWRAnR55SQtyq5/b6NU1W7RSqqU94NjHQhpyJruyKgN7Hg1KI6
 V3E/kDJ31FJNtTvyyAvQpC0d+dwPO5fa1MTE7cIL+ML0LsKZdYQtvnLame7E+GK360Eo
 4NK8AAH59aDI9ZpWZFNEaDplCStGbvxRyy/Yg39dAmLbQbscLt7VSlnCtTBfTCGbLR9G
 Vx6S34wa+krhh3zIvJm3PhdnuoAp6GO0D6RY5wIRAwTHondg4rtHTzF2I2O0Qf9WT9+1
 5hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=euhjRyQ0dvhOzaWisAQrBRgkNaU3wGFLRW2qXQGz1q8=;
 b=uyHNLIjzF4raO8luRP0mNgCsz/dejlevuCIwFElVEvaiKVfXiZ5LNUXT86CjvbzEtC
 VojjweC8QPkXa/OPEKg5AQRERub2yh507uiflytLoG6WsPStWb6wqns1H1zKAGXsT/mK
 P9+F2k2nbEWrsG3id36is3b9TqAgurI3WiL4Z/ZnKBpqcUdHTTW25gGtwdvx3H2XRnlt
 muFcf03BPamRV6MgSaTR5DeXSIuWmjNYx1meRh7lJzT4Hv7zoGBTuwhIALHiK8qSbqy8
 RuLxxZrufqutDYxkuHIjI2U+wj+28KH8RWLGSn2QPGQfYAbgLJMezrvzQL1wHUst4yYI
 NL2A==
X-Gm-Message-State: AOAM5302RAS97xFflbQVY3s2DK+nESCwepr7VRho6NebZ14cqVc/TNz+
 RTX5jxoc41EnxP0fXr+CNZB1cugvfv5z4CA1BO4=
X-Google-Smtp-Source: ABdhPJxDX5PpX9LV+llk+yPx86d6jhgF+t80r4FXedvPh9uMo8q8Oa+H7Fz+NT7mJ+ExOflwi23D2D3oooYsnQ2EjmY=
X-Received: by 2002:a17:906:7208:: with SMTP id
 m8mr22939415ejk.82.1632682568970; 
 Sun, 26 Sep 2021 11:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210925032951.6767-1-rdunlap@infradead.org>
In-Reply-To: <20210925032951.6767-1-rdunlap@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 26 Sep 2021 11:55:57 -0700
Message-ID: <CAMo8Bf+TE4PX5PBD8bSsF6Cx+LGunExjuB3xXyyRvwzC0iHMDA@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [RFC PATCH] xtensa: setup: use CONFIG_USE_OF
	instead of CONFIG_OF
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

Hi Randy,

On Fri, Sep 24, 2021 at 8:29 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> CONFIG_OF can be set by a randconfig or by a user -- without setting the
> early flattree option (OF_EARLY_FLATTREE).  This causes build errors.
> However, if randconfig or a user sets USE_OF in the Xtensa config,
> the right kconfig symbols are set to enable xtensa/kernel/setup.c to
> build.
>
> Fixes these build errors:
>
> ../arch/xtensa/kernel/setup.c: In function 'xtensa_dt_io_area':
> ../arch/xtensa/kernel/setup.c:201:14: error: implicit declaration of function 'of_flat_dt_is_compatible'; did you mean 'of_machine_is_compatible'? [-Werror=implicit-function-declaration]
>   201 |         if (!of_flat_dt_is_compatible(node, "simple-bus"))
> ../arch/xtensa/kernel/setup.c:204:18: error: implicit declaration of function 'of_get_flat_dt_prop' [-Werror=implicit-function-declaration]
>   204 |         ranges = of_get_flat_dt_prop(node, "ranges", &len);
> ../arch/xtensa/kernel/setup.c:204:16: error: assignment to 'const __be32 *' {aka 'const unsigned int *'} from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>   204 |         ranges = of_get_flat_dt_prop(node, "ranges", &len);
>       |                ^
> ../arch/xtensa/kernel/setup.c: In function 'early_init_devtree':
> ../arch/xtensa/kernel/setup.c:228:9: error: implicit declaration of function 'early_init_dt_scan'; did you mean 'early_init_devtree'? [-Werror=implicit-function-declaration]
>   228 |         early_init_dt_scan(params);
> ../arch/xtensa/kernel/setup.c:229:9: error: implicit declaration of function 'of_scan_flat_dt' [-Werror=implicit-function-declaration]
>   229 |         of_scan_flat_dt(xtensa_dt_io_area, NULL);
>
> Fixes: da844a81779e ("xtensa: add device trees support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/kernel/setup.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks for your RFC. I've tested it and found a couple more places
where CONFIG_USE_OF should be used instead of CONFIG_OF.
I'll post the revised version.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
