Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A1E64F957E
	for <lists+linux-xtensa@lfdr.de>; Tue, 12 Nov 2019 17:23:52 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 38B4A643E;
	Tue, 12 Nov 2019 16:15:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 713D9643A
 for <linux-xtensa@linux-xtensa.org>; Tue, 12 Nov 2019 16:15:30 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id i2so6613951ywg.13
 for <linux-xtensa@linux-xtensa.org>; Tue, 12 Nov 2019 08:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Q1cQSXXccuUTN1Ss9zMJqdgVizhYDIhjY92yJUaC6I=;
 b=O3piHuow5ELlk8jDb5ZoGxiSQ5RhIR/9v5R0S9tcVkF625c5F2WV4F0L4GHHgmeuQX
 Dm/0PuHlzjay/3EnbTB9HSxsYCV7Y2DFFhRqoItbnp6Ri8b/o1S2+kGiv4RoYFqiuA+w
 daYR3Rdl48LwhuyDQaE6i/GQq4kiXnFbOJAJcFhU69XFgtntpty6+29BfM9yTPc53OGB
 bMWqXc7+OqQFhkXWaewAHJ1GkKeyRvLDYptaf+LgAqGmtiyX97tsjlE5rOStoGLeBbUg
 RDn3Z1j147Et2O3iPQ1h+aK6IR1ESrYQhHSJvQxT59Ay0ToeqJ3vPxV585mKB6RV77zI
 MioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Q1cQSXXccuUTN1Ss9zMJqdgVizhYDIhjY92yJUaC6I=;
 b=Q2rLsaZumBvY9043wslpVB5YPErFzjwH5xklGpK+5vpDwANquI+J9dSaznn89/nzYT
 hdXXafTMs0Xdg00O2NukQUpmEFiDHB2vl5VP5BdWjd3pjTH6Bud7MLdL7v+Vu5iatHHe
 Sn3DRxjyUHE8r2zJ7njTMy2Gd2TuKdfp8yy2C7m6SaNqVplQ9dVs5ktTdS9xicV3qKb/
 EZLz1Ua58Ax1FdURsgD7GivvkprEGPqolNMq5vrX5djHYjUQycxc+0d8v/feN4faSD1J
 HzJmT2BGLjbzhJH1l8iPuRgLFhCPRM0LIRJdF0TJxh4sxppRqoMx6YSoiPJA1u2ppkuw
 Ns6g==
X-Gm-Message-State: APjAAAUPOqYnXZRiCbofFK2QyOpH1p0LN/Up9Sl8MYgjOsyxgOpFvN0m
 m/qCtGWcpAhDs/Ogh++H3WndM+shXTSlbQRwIpk=
X-Google-Smtp-Source: APXvYqzHQVZzOwk+ZXxtjpuNnuKivOPZNwCB1YjbeiRnIyYtvIT4zVdcLGWSNiSNBM0w0xEsxpb1ewBn8T3ZRtc31rA=
X-Received: by 2002:a81:ad60:: with SMTP id l32mr21343115ywk.388.1573575829291; 
 Tue, 12 Nov 2019 08:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20191108004448.5386-1-jcmvbkbc@gmail.com>
 <20191112094917.fl57dhtennwo2tlz@pathway.suse.cz>
In-Reply-To: <20191112094917.fl57dhtennwo2tlz@pathway.suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 12 Nov 2019 08:23:38 -0800
Message-ID: <CAMo8Bf+Q5-8qBJSkvwa9xoh07eDUDD45suD+uZObuxDJ3uPLWg@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Joe Perches <joe@perches.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Dmitry Safonov <dima@arista.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH v2] xtensa: improve stack dumping
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

On Tue, Nov 12, 2019 at 1:49 AM Petr Mladek <pmladek@suse.com> wrote:
>
> On Thu 2019-11-07 16:44:48, Max Filippov wrote:
> > Calculate printable stack size and use print_hex_dump instead of
> > opencoding it.
> > Make size of stack dump configurable.
> > Drop extra newline output in show_trace as its output format does not
> > depend on CONFIG_KALLSYMS.
>
> > diff --git a/arch/xtensa/Kconfig.debug b/arch/xtensa/Kconfig.debug
> > index 39de98e20018..83cc8d12fa0e 100644
> > --- a/arch/xtensa/Kconfig.debug
> > +++ b/arch/xtensa/Kconfig.debug
> > @@ -31,3 +31,10 @@ config S32C1I_SELFTEST
> >         It is easy to make wrong hardware configuration, this test should catch it early.
> >
> >         Say 'N' on stable hardware.
> > +
> > +config PRINT_STACK_DEPTH
> > +     int "Stack depth to print" if DEBUG_KERNEL
> > +     default 64
> > +     help
> > +       This option allows you to set the stack depth that the kernel
> > +       prints in stack traces.
>
> I would split this into separate patch.

Sure, I'll split it out.

> > diff --git a/arch/xtensa/kernel/traps.c b/arch/xtensa/kernel/traps.c
> > index 4a6c495ce9b6..fe090ab1cab8 100644
> > --- a/arch/xtensa/kernel/traps.c
> > +++ b/arch/xtensa/kernel/traps.c
> > @@ -491,32 +491,24 @@ void show_trace(struct task_struct *task, unsigned long *sp)
> >
> >       pr_info("Call Trace:\n");
> >       walk_stackframe(sp, show_trace_cb, NULL);
> > -#ifndef CONFIG_KALLSYMS
> > -     pr_cont("\n");
> > -#endif
> >  }
> >
> > -static int kstack_depth_to_print = 24;
> > +static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
> >
> >  void show_stack(struct task_struct *task, unsigned long *sp)
> >  {
> > -     int i = 0;
> > -     unsigned long *stack;
> > +     size_t len;
> >
> >       if (!sp)
> >               sp = stack_pointer(task);
> > -     stack = sp;
> >
> > -     pr_info("Stack:\n");
> > +     len = min((-(unsigned long)sp) & (THREAD_SIZE - 4),
> > +               kstack_depth_to_print * 4ul);
>
> I would replace the hardcoded 4 with sizeof(void *).

It's not necessarily pointers, more like register-wide entries
on the stack. Ok, I guess I'll give it a name.

> > -     for (i = 0; i < kstack_depth_to_print; i++) {
> > -             if (kstack_end(sp))
> > -                     break;
> > -             pr_cont(" %08lx", *sp++);
> > -             if (i % 8 == 7)
> > -                     pr_cont("\n");
> > -     }
> > -     show_trace(task, stack);
> > +     pr_info("Stack:\n");
> > +     print_hex_dump(KERN_INFO, " ", DUMP_PREFIX_NONE, 32, 4,
> > +                    sp, len, false);
> > +     show_trace(task, sp);
> >  }
>
> The conversion looks fine to me. It is up to you (as a maintainer)
> what you do with the above proposal for two cosmetic changes ;-)
> Either way, feel free to use:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks for the review.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
