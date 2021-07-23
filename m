Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D349A3D387E
	for <lists+linux-xtensa@lfdr.de>; Fri, 23 Jul 2021 12:18:25 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 17DB466C4;
	Fri, 23 Jul 2021 09:49:41 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by linux-xtensa.org (Postfix) with ESMTPS id 8233566C2
 for <linux-xtensa@linux-xtensa.org>; Fri, 23 Jul 2021 09:49:34 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id df26so1082390edb.9
 for <linux-xtensa@linux-xtensa.org>; Fri, 23 Jul 2021 03:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FBPRKY3kAU7k5qQgFJyXkiaf1woJOD/WKKAjcqGHd5U=;
 b=hkYhqb+jNLAqV05N76rJ81VuMYz8g6RicGw00y/l3CFcIHdn7GaLggMFnHYy70sZYJ
 mTeZZ1a1OKe5GW27ABJqWKTACATxk+3V8P9iAvSzg9xzq/gBGNRKcwNqpTj2s6H/Ydgj
 1OUxVyw/RkETRVb8coSDiE+5+XAI0jfpXpZ2yDTfHbLDqdlhW8v/xFD/SXy+N+pWLo8c
 FaNFz4yBP2VA8LwWSZciw/W8B68pJn/ZSVph6OwF3So7crEVZXeatwvUszBzXqnllAaF
 TYgMrz/PxzIt0uVjJjALEiSTnm094dd1RtbaCPinu9Wr8EW9YqeOJJ88yvqVep5mv3Yc
 iixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FBPRKY3kAU7k5qQgFJyXkiaf1woJOD/WKKAjcqGHd5U=;
 b=boizvSvG1FoS21MPVG0jzTgK0WpmraZWfszxPKUpbUvYrqsvRSI5hWKip25Wefc3ih
 iUO83UgqCBgs3gACzBVuQhqGiSmdXPvGEBXfSdcZKPJ0rc4/0nbA92Krd4GiXlR5cy/U
 IOqjLURGp0Z/xOo+N8D770HUI5P0CQWz/gzmYxfROluN6rp/SHml5g4hMy4htfRkWqPA
 Az757cs6L6oWbXmpP1h4X2NAVtWsmyNu5r9RqpL+VdUqggJfdqvrXH4Odzp/hx0uA29T
 cftaDemY5ORmyfha3X8tErBzwvzkaXPaJQJ01yl1PxdSJtVssXtPFv81n+2JDOTuLLbL
 tBOw==
X-Gm-Message-State: AOAM533xWMvb9y9FQSROkcEWMNpAbVa1v958/hsMbbAPJLKRjnr7PDQz
 ysBf43YesFlMX0VcEJ282xFWuPPcif88X/Mq2ZM=
X-Google-Smtp-Source: ABdhPJw2Ynvl7onUFB8T7RfBl9YWi2ELmdwKrnUPYTZpXvVDDoy4Uf6lMGaBkm6qck3YoWSYv+Eb+kS9i2d9p7EoC8w=
X-Received: by 2002:aa7:c1ca:: with SMTP id d10mr4479428edp.107.1627035497315; 
 Fri, 23 Jul 2021 03:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210723074317.32690-1-jslaby@suse.cz>
 <20210723074317.32690-2-jslaby@suse.cz>
In-Reply-To: <20210723074317.32690-2-jslaby@suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 23 Jul 2021 03:18:05 -0700
Message-ID: <CAMo8Bf+Hm+qg_oUjN6P8ATOqXxHFBPnXA3D9SG+X4P3+wDzPjw@mail.gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH 1/8] xtensa: ISS: don't panic in rs_init
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

On Fri, Jul 23, 2021 at 12:43 AM Jiri Slaby <jslaby@suse.cz> wrote:
>
> While alloc_tty_driver failure in rs_init would mean we have much bigger
> problem, there is no reason to panic when tty_register_driver fails
> there. It can fail for various reasons.
>
> So handle the failure gracefully. Actually handle them both while at it.
> This will make at least the console functional as it was enabled earlier
> by console_initcall in iss_console_init. Instead of shooting down the
> whole system.
>
> We move tty_port_init() after alloc_tty_driver(), so that we don't need
> to destroy the port in case the latter function fails.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/platforms/iss/console.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
