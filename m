Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 30B4DF1B82
	for <lists+linux-xtensa@lfdr.de>; Wed,  6 Nov 2019 17:44:34 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id CA2CC64F5;
	Wed,  6 Nov 2019 16:36:24 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 397DF64ED
 for <linux-xtensa@linux-xtensa.org>; Wed,  6 Nov 2019 16:36:23 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id j190so4025624ywf.8
 for <linux-xtensa@linux-xtensa.org>; Wed, 06 Nov 2019 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RnIAWuMyz7kDieVNrBUbl2Gvb5/kFTUXSVFfu5Y2MNA=;
 b=onjprryLGJm1op2xyFSo6LKEns+ebTE+WwtbI/KR7L/OuP/jFfOc8vreiDstWJZR5i
 /u34Zaq7MWWxqSd+SGkwtkDpk6tS0d1kTZDR2FdEyd5oj0PFBrd23iUcJfhicjIfPRhy
 zDhP2KmoNL1ZQuLofdscn7ApRDNAtL336tUiKYbvcHRxgSBAagFZWasEnyp1e1HLC7SV
 vCWBlOdp6ZIWKkwM3LLZD9WTkMHawaX303IekXO0G/MYohKPwMddc3BeRW3SwykXDyxV
 zbd3kZe8KO2SHQAFQnfg84pdBayvETXJemPlECfLm1cL1+X3jUEd9SHgDl5zzoVeYSMm
 3FCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RnIAWuMyz7kDieVNrBUbl2Gvb5/kFTUXSVFfu5Y2MNA=;
 b=p4ZNLtk7X4psfqXaIWJ8l83ZpudJ+UciWFXVGXn47uUfbu/0lme7rgfUIybdZV11Eg
 p87Z8gov/uonbclwj8ziKtU39FEFFSpvGTEJg7JFfHOVkqF2o45Mzh4ReGe5nxktkReS
 bpSJ0pvIjCrRO+LkX+veajKqO/T5VBXO7ToUJGy/K0AXFXy7+tw2jUN/WRnQeIvCDDp1
 QyRKkgDTziuZ4Jr7IVNTDr6uiCC0btZQLBNNqGmwFbuKfQOKfVw6zZxhYljoxnPIRhTz
 agJ9lddL4T6O/ukWMeEKHsyUzfMbAT8w6mJgQtvg7usi6mRpU7ANRYF05Z9mZL5/M0Kb
 Mkcg==
X-Gm-Message-State: APjAAAX54a5FbjneYDCRrnfwWINU72BsVyxaW5kDhOa6ju6Ll8a8lm7z
 iELr2RTw7dU3/i7Ishe+0qAkTkcw4eWT/xZklvk=
X-Google-Smtp-Source: APXvYqw5uvqnnms4M9LntHdMzBZDGmmovjOZaUoXw0nc8YS06THSQKVbnZiwnNAj2zKs+Hfa6nXYPA9UZA7vULRnsXE=
X-Received: by 2002:a81:8415:: with SMTP id u21mr2283731ywf.129.1573058670927; 
 Wed, 06 Nov 2019 08:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20191106030542.868541-1-dima@arista.com>
 <20191106030542.868541-44-dima@arista.com>
 <CAMo8Bf+q0j81VZeUQdvCkXt131uzSBfJ0N7RTe7+NpjRkVpzdA@mail.gmail.com>
 <20191106081541.soxefwyvu3o72tqg@pathway.suse.cz>
In-Reply-To: <20191106081541.soxefwyvu3o72tqg@pathway.suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 6 Nov 2019 08:44:19 -0800
Message-ID: <CAMo8Bf+ASTba15G7xj=zLTnnCaU=SeHiEO6Ab-0MCcJMiOXNkw@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Dmitry Safonov <dima@arista.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jiri Slaby <jslaby@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Ingo Molnar <mingo@kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH 43/50] xtensa: Add show_stack_loglvl()
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

On Wed, Nov 6, 2019 at 12:15 AM Petr Mladek <pmladek@suse.com> wrote:
> > >         for (i = 0; i < kstack_depth_to_print; i++) {
> > >                 if (kstack_end(sp))
> > >                         break;
> > > -               pr_cont(" %08lx", *sp++);
> > > +               printk("%s %08lx", loglvl, *sp++);
>
> KERN_CONT can be combined with any other loglevel.
> So you could keep using pr_cont() together with explicit loglevel:
>
>                         pr_cont("%s %08lx", loglvl, *sp++);
>
> It should fix the problems reported below.
>
> Well, the preferred solution would be to snprintf() the continuous
> line into a temporary buffer. And printk() it when it is complete.
> pr_cont() is not reliable when more CPUs print at the same time.

Good point. Let me do this cleanup.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
