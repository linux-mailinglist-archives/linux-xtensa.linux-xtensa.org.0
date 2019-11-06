Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 98651F0D9D
	for <lists+linux-xtensa@lfdr.de>; Wed,  6 Nov 2019 05:13:38 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 48AA7653A;
	Wed,  6 Nov 2019 04:05:29 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 89F576537
 for <linux-xtensa@linux-xtensa.org>; Wed,  6 Nov 2019 04:05:27 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id x14so5195254ybq.12
 for <linux-xtensa@linux-xtensa.org>; Tue, 05 Nov 2019 20:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uwFCUxppEaNk2oIdxdIvyDyCNPn0jEdjjgUSJ84+xNQ=;
 b=AlMbyGMa7MWuq5/EpRqZgfCyPBkPCExaX+zZoQkJdTN/lF7YD73QC5yL1+omzJM7yC
 DMlShiA4F34d2KeYyuK9I1/N/t8UW9qAOLtG0SXMGSk0WKfgH9/P8Z8UMEHBlXvUxK0Y
 gJfa637hIOFw5UR8fDHlcvP+aeIevWaL0R0G0Uo1AGUGKCuIbYgANj+zvZqL1s9ZBHNd
 dYbIWIQ0Rt0Z9+Q43NbJhVAoNa9z8XCXn5ZXr9oQ9SNPUmrnmF8uaRRe0P0dFTqosJrf
 Ha94d5+RSx4UcigOCx9oEe9vxQ5CJ1bSkNoTjFKyf8gGL9yEHz30TWTxPhboKHgoSTSe
 53pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uwFCUxppEaNk2oIdxdIvyDyCNPn0jEdjjgUSJ84+xNQ=;
 b=J8HTdh7f5lQ4OeZINEGNc8AU+qL1eJJ55ullpawQ0KXxs8bb4MT2c5COVxc/cwIkOR
 U7RoOmh8Zf/u8yxfkC9dJQNarwfwAU2HUU/cNboBop3ogzKBs8l64fCi5lb51cSpQR01
 dOp8Qi5LfRBJ8j20UJdqkRxYzX8qyIVN3E4l/bDTZccEMEr6Ox/92EHIrbdsS2kuycBy
 q2BkLdniXk2D+4iEs6sOOmxaCUIHUOeX9I6WHd9+iNBWrtzi5ncasKF6k7CcGeGT9A+f
 PmE8eMic9ne7tx9BSvOAKQNuxUtcEgb9Wg95bgC7RWKAHvLpPnV9mCrxnQNS9uyNec5U
 Un3A==
X-Gm-Message-State: APjAAAVMyobMHEBMsDJyI4tvSpXSMs0HUBVWYC6eeFyOylsBtJrC+v0t
 KhzazHXMAlLXkpWkcy6Ef+LfKhP5GfxFQMQrX8k=
X-Google-Smtp-Source: APXvYqxnWqKBQH/WgOTOh+up/B1GJKC4sYZVvsEXYvu2jZjvE4ZuVW38m1dUhYfYXvngfBFi0KCVCzqC/Tp+cm++nDg=
X-Received: by 2002:a25:df81:: with SMTP id w123mr566146ybg.286.1573013614155; 
 Tue, 05 Nov 2019 20:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20191106030542.868541-1-dima@arista.com>
 <20191106030542.868541-44-dima@arista.com>
In-Reply-To: <20191106030542.868541-44-dima@arista.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 5 Nov 2019 20:13:22 -0800
Message-ID: <CAMo8Bf+q0j81VZeUQdvCkXt131uzSBfJ0N7RTe7+NpjRkVpzdA@mail.gmail.com>
To: Dmitry Safonov <dima@arista.com>
Cc: Petr Mladek <pmladek@suse.com>,
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

Hi Dmitry,

On Tue, Nov 5, 2019 at 7:08 PM Dmitry Safonov <dima@arista.com> wrote:
>
> Currently, the log-level of show_stack() depends on a platform
> realization. It creates situations where the headers are printed with
> lower log level or higher than the stacktrace (depending on
> a platform or user).
>
> Furthermore, it forces the logic decision from user to an architecture
> side. In result, some users as sysrq/kdb/etc are doing tricks with
> temporary rising console_loglevel while printing their messages.
> And in result it not only may print unwanted messages from other CPUs,
> but also omit printing at all in the unlucky case where the printk()
> was deferred.
>
> Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
> an easier approach than introducing more printk buffers.
> Also, it will consolidate printings with headers.
>
> Introduce show_stack_loglvl(), that eventually will substitute
> show_stack().
>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> [1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>  arch/xtensa/kernel/traps.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/arch/xtensa/kernel/traps.c b/arch/xtensa/kernel/traps.c
> index cbc0d673f542..ba6c150095c6 100644
> --- a/arch/xtensa/kernel/traps.c
> +++ b/arch/xtensa/kernel/traps.c
> @@ -502,7 +502,8 @@ static void show_trace(struct task_struct *task, unsigned long *sp,
>
>  static int kstack_depth_to_print = 24;
>
> -void show_stack(struct task_struct *task, unsigned long *sp)
> +void show_stack_loglvl(struct task_struct *task, unsigned long *sp,
> +                      const char *loglvl)
>  {
>         int i = 0;
>         unsigned long *stack;
> @@ -511,16 +512,21 @@ void show_stack(struct task_struct *task, unsigned long *sp)
>                 sp = stack_pointer(task);
>         stack = sp;
>
> -       pr_info("Stack:\n");
> +       printk("%sStack:\n", loglvl);
>
>         for (i = 0; i < kstack_depth_to_print; i++) {
>                 if (kstack_end(sp))
>                         break;
> -               pr_cont(" %08lx", *sp++);
> +               printk("%s %08lx", loglvl, *sp++);
>                 if (i % 8 == 7)
> -                       pr_cont("\n");
> +                       printk("%s\n", loglvl);
>         }
> -       show_trace(task, stack, KERN_INFO);
> +       show_trace(task, stack, loglvl);
> +}
> +
> +void show_stack(struct task_struct *task, unsigned long *sp)
> +{
> +       show_stack_loglvl(task, sp, KERN_INFO);
>  }
>
>  DEFINE_SPINLOCK(die_lock);
> --
> 2.23.0

This change doesn't work well with printk timestamps, it changes
the following output on xtensa architecture

[    3.404675] Stack:
[    3.404861]  a05773e2 00000018 bb03dc34 bb03dc30 a0008640 bb03dc70
ba9ba410 37c3f000
[    3.405414]  37c3f000 d7c3f000 00000800 bb03dc50 a02b97ed bb03dc90
ba9ba400 ba9ba410
[    3.405969]  a05fc1bc bbff28dc 00000000 bb03dc70 a02b7fb9 bb03dce0
ba9ba410 a0579044

into this:
[    3.056825] Stack:
[    3.056963]  a04ebb20
[    3.056995]  bb03dc10
[    3.057138]  00000001
[    3.057277]  bb03dc10
[    3.057815]  a00083ca
[    3.057965]  bb03dc50
[    3.058107]  ba9ba410
[    3.058247]  37c3f000
[    3.058387]
[    3.058584]  a05773e2
[    3.058614]  00000001
[    3.058755]  a05ca0bc
[    3.058896]  bb03dc30
[    3.059035]  a000865c
[    3.059180]  bb03dc70
[    3.059319]  ba9ba410
[    3.059459]  37c3f000
[    3.059598]
[    3.059795]  37c3f000
[    3.059824]  d7c3f000
[    3.059964]  00000800
[    3.060103]  bb03dc50
[    3.060241]  a02b9809
[    3.060379]  bb03dc90
[    3.060519]  ba9ba400
[    3.060658]  ba9ba410
[    3.060796]

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
