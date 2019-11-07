Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E1064F233D
	for <lists+linux-xtensa@lfdr.de>; Thu,  7 Nov 2019 01:22:05 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id AEA2B5815;
	Thu,  7 Nov 2019 00:13:55 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by linux-xtensa.org (Postfix) with ESMTPS id B5DD55810
 for <linux-xtensa@linux-xtensa.org>; Thu,  7 Nov 2019 00:13:53 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id v84so19832ywc.4
 for <linux-xtensa@linux-xtensa.org>; Wed, 06 Nov 2019 16:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IoBKiF8gKZ9/YDxTbalV/OjHsBLCzrm1vO49Me9eDAI=;
 b=EDoDOczYRYd4+XNT+wFjozTXCFmMi8WfCp99vh5Y6lxe35MMRziQr69H7Ln1xuu4Hj
 N+esKa18r9/P8Zexe9oAdTuMWOtWl2t/Pu31Tpgv+iSSwjIJm0LcpkwuzZ3fPpD2Axvs
 Jy7mhaVl5EDe7AuktWs1agsAQlW0LVm2+g/CkIiF9KZT9S+5OkNgbrnqkhd9cREnafKt
 vZfNdZosd7c7o4ZAaehQnl8UIrrLEL3wHpAIdsggYgzM8stayD20TUSSUV85YvXa7Sn0
 1PJ3EpWioqkNTqfmCNUiRis3fhGlPwsjXk/BtUDRGXNVY8A1CElFPqgams6RyVT9XlKY
 ClmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IoBKiF8gKZ9/YDxTbalV/OjHsBLCzrm1vO49Me9eDAI=;
 b=FQK3IzXgrKElH9oLVmZZbtbzmIGk/UQ5ieA3Ejf/awLikzrrr3Q2cmi8r7GS3UdkqW
 mE/AgTV14jqoykFnbr8iscHmPCU1bceuI4CVnFTS5EOWDScEBJip5Wueak5pAih0CROn
 ktLfHBVJ2JKkangpLCw//nrENM6XbbBEozYgVNvAIige/AbKmoBO1YVxYU4DAzV1XuPI
 SLHReFEmpNRCKkrEfQfBfARbpkknYEbu1XE8uorWXucYcRXeFagmqFbitZ+mex1otU7H
 +0DexiS4TVouAj+vxAzQUqHD1tI3o59uFUZloYn9mFgqVFEAWJtcDL3ZCkpsfSbbDSpz
 cI9Q==
X-Gm-Message-State: APjAAAV6QungCPXYZSMnMjs5H922xztqBoIF6dikhOrrmSsI0QRWr1XA
 DktjT9LaCTsQOAoXvv/onID6JRSXWMJpXgb8Yxw=
X-Google-Smtp-Source: APXvYqyvX1NrX3ydfgyd4RGYuuWRxDsJYwAtqNxFwCWks7zkHFlIpNFvBvqii1uenGKfhv+H3DdrBFoQsL4aYFTWlT8=
X-Received: by 2002:a81:8415:: with SMTP id u21mr268081ywf.129.1573086122063; 
 Wed, 06 Nov 2019 16:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20191106181617.1832-1-jcmvbkbc@gmail.com>
 <a9e2f6b65d4c098ab027ea849120d3cf61858e67.camel@perches.com>
In-Reply-To: <a9e2f6b65d4c098ab027ea849120d3cf61858e67.camel@perches.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 6 Nov 2019 16:21:51 -0800
Message-ID: <CAMo8BfLmcCOAinyjB3iEuOF36TYBig=724=s9b6EKr3LzwF5QQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Dmitry Safonov <dima@arista.com>,
 LKML <linux-kernel@vger.kernel.org>, Petr Mladek <pmladek@suse.com>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: improve stack dumping
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

On Wed, Nov 6, 2019 at 2:34 PM Joe Perches <joe@perches.com> wrote:
> > @@ -512,10 +510,12 @@ void show_stack(struct task_struct *task, unsigned long *sp)
> >       for (i = 0; i < kstack_depth_to_print; i++) {
> >               if (kstack_end(sp))
> >                       break;
> > -             pr_cont(" %08lx", *sp++);
> > +             sprintf(buf + (i % 8) * 9, " %08lx", *sp++);
> >               if (i % 8 == 7)
> > -                     pr_cont("\n");
> > +                     pr_info("%s\n", buf);
> >       }
> > +     if (i % 8)
> > +             pr_info("%s\n", buf);
>
> Could this be done using hex_dump_to_buffer
> by precalculating kstack_end ?

I've got this, but it doesn't look very attractive to me:

void show_stack(struct task_struct *task, unsigned long *sp)
{
        unsigned long *stack;
        int len;

        if (!sp)
                sp = stack_pointer(task);
        stack = sp;

        len = min((-(unsigned long)stack) & (THREAD_SIZE - 4),
                  kstack_depth_to_print * 4ul);

        pr_info("Stack:\n");

        for (; len > 0; len -= 32) {
                char buf[9 * 8 + 1];

                hex_dump_to_buffer(sp, min(len, 32), 32, 4,
                                   buf, sizeof(buf), false);
                pr_info(" %08lx:  %s\n", (unsigned long)sp, buf);
                sp += 8;
        }
        show_trace(task, stack);
}

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
