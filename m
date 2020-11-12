Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 708412B01D1
	for <lists+linux-xtensa@lfdr.de>; Thu, 12 Nov 2020 10:12:53 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7713464B6;
	Thu, 12 Nov 2020 08:52:28 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 3C2A664B2
 for <linux-xtensa@linux-xtensa.org>; Thu, 12 Nov 2020 08:52:25 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id v4so5350002edi.0
 for <linux-xtensa@linux-xtensa.org>; Thu, 12 Nov 2020 01:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+AJ0MtKTSuiOVnktbsY1wSBOvhhxyrrl0Zdi0eqZQE=;
 b=Yr5OqyCrJgAhEpc244v7Qvka/xIThXVLxwqQH87toI+hJbeTqlurMsFdGFvUw3s/GE
 nqYMQcH+u6VGg5zAFrW/hRvVhQncHSjGjEGoE9D/ZD2hvuD22lb0MVv8JkmRThHCorwO
 cJ0yGb3Fk8IPGOyHGxxQ9SvM+lKMW1ZNv1uUNTI+yIBj7UXaoq/Z4YeQV/++CJ+3aBs1
 XwSR/9YuPq2i+f3SZXbjMuTeovS/wb9tgzXx0q6ZmtDzA46rbKolQDWIYWyGGNQYyD6b
 2OuIW5oDvO8eX4t21EXznq+ir0skVPvRuh7h/aE+QS46KXkdKR0NJmKHEtPQJNj6+SnZ
 08AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+AJ0MtKTSuiOVnktbsY1wSBOvhhxyrrl0Zdi0eqZQE=;
 b=EJwbGjA3ifTpUWsS0YtsVgpIoZGAr/iP2OXOtnwhcis7/TRF8PlTk+fP4oJ3517fnW
 zYxEPciJSzXhbTYVfWsundJu96R9G/sycRcEUreK9PJA+uoV3DUGoxdd6OoIia8Lnvm6
 f7H+yc89AqHFTclfahdSgDLE1RpzPDN2mJbz3Q3nT0sLAbXhCiSpEIGlloD3JO47MZHK
 VxND1mN7YpfNkEmlyHCE4UKNRbictx3Fn5hwhyx5TJGCEuHlR4AGY54NWfErmEORAr8i
 5Irdr6FlHQVWjEo6lIhIGeYqB4Eky6vmnm+WzuqS9D08xfSGC6I0+VYd1fwG20ntbwcA
 XJuQ==
X-Gm-Message-State: AOAM5310RSkJrL4xTqwoyhqv1vBi+CdiygwukHjgYjHldOx/PRIQULQA
 bZUcNutiIqQcJaVHd7nmzNy1XBgjYy1sCTh9Yuc=
X-Google-Smtp-Source: ABdhPJwU31YdUs2P629F5+pkbucgCCB6zNWXzH23kbsffjednjzEsVbxTr/5VrGbr5AS9hIaI6idJ6xj4Xxm2k7RsSA=
X-Received: by 2002:a05:6402:755:: with SMTP id
 p21mr4105242edy.349.1605172367553; 
 Thu, 12 Nov 2020 01:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20201111205349.24815-1-jcmvbkbc@gmail.com>
 <faf78325-3aef-e4aa-ddc6-c21e84a8c7ef@kernel.dk>
In-Reply-To: <faf78325-3aef-e4aa-ddc6-c21e84a8c7ef@kernel.dk>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 12 Nov 2020 01:12:36 -0800
Message-ID: <CAMo8BfL=3PEi3GWd6LR9kiKViN=t1KbgbkjEEwT8GAb-Uvnp0A@mail.gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH v2] xtensa: fix broken TIF_NOTIFY_SIGNAL
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

On Wed, Nov 11, 2020 at 1:05 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 11/11/20 1:53 PM, Max Filippov wrote:
> > TIF_NOTIFY_SIGNAL handling in xtensa assembly is implemented
> > incorrectly: there should be a call to do_notify_resume when either
> > TIF_SIGPENDING, TIF_NOTIFY_RESUME or TIF_NOTIFY_SIGNAL bit is set in the
> > thread_info::flags. The straightforward way to do it would be
> >
> >     _bbsi.l a4, TIF_NEED_RESCHED, 3f
> >     _bbsi.l a4, TIF_NOTIFY_RESUME, 2f
> >     _bbsi.l a4, TIF_NOTIFY_SIGNAL, 2f
> >     _bbci.l a4, TIF_SIGPENDING, 5f
> >
> > Optimize it a little bit and use bit mask and bnone opcode to skip
> > do_notify_resume invocation. Shuffle _TIF_* flags a bit so that used bit
> > mask fits into the immediate field of movi opcode.
>
> Thanks - do you mind if I fold this in with a reference to your
> changes? Seems like that'd be a better option than leaving it
> broken for a bit.

Sure Jens, by all means!

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
