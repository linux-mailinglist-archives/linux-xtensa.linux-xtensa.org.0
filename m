Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 755AFBAECC
	for <lists+linux-xtensa@lfdr.de>; Mon, 23 Sep 2019 09:59:29 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 52EA864EF;
	Mon, 23 Sep 2019 07:52:49 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 065B664EC
 for <linux-xtensa@linux-xtensa.org>; Mon, 23 Sep 2019 07:52:48 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id o80so5089334ybc.6
 for <linux-xtensa@linux-xtensa.org>; Mon, 23 Sep 2019 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4VC54+iUDcIhCp6XH00ZYdvA5IUiqllztCq7ZR21saM=;
 b=JQe9tBG2taNlTM75J2nr89UWC3ZIcnqKXuiV+3cPo3XUyXu135P/ZPk2B7+nrmGGpl
 Lzue/Zm1R55PwdEDgiH+xGv/6cK0Tvu/T9tq8q1xPfb+73VyyZsSrAbbb7ZFVYIyhB8K
 mMQCNm25wjwvz+fMq5teL0bf4x9PzExRZ6Dv0KwOn48pSKHGD5cnETS0SxtS2+U1X7Lb
 tdowKhiF+d5KA6JEL5H5iNUXvpebcW5sswWMDfEyLioEJgV/9OlGyAkXPE36ockT9u96
 fHYdajkwM1MJkCSn9s1Nqlw4jl9zIjrteKKXtejlXGDsdmi8IvbDhDWTMQb9VYn6nIFt
 CDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4VC54+iUDcIhCp6XH00ZYdvA5IUiqllztCq7ZR21saM=;
 b=nBs3b/ngHkh2MRWasLLvovQT3kgGb0zhH7y71KHSHMyA9yAnuxuu6xWYyIL0SGIxW/
 NWcb11gLoHSAFWCkwhy2Te/B/fMOIulggSSbvTWQr62JfFfTffj1AoQXb226sLf4oBsL
 2Q3i5d++MnGHi2xZjBqfbHBGT/+CFQzqWVL/48KpmMXGQm3LR7fdk6+xW8GC7PgPw9fi
 XQor3ppt1DbEWbKpnUkGnxbmaF5LrALDm7zOIrcDdCJ353ZLlgM9P6MCvChTEsxbUMjX
 0alVzFhR4IUPWNSh1xw4cYbBO52wfFlIw2ZdsjWhZ29wOm/oocQUDSTCU3DU3uxn6gXC
 X1Iw==
X-Gm-Message-State: APjAAAWpppOD/qBBwhJmPbfC92GeE6hsp1LXS3re8yx4rRNt05X275qc
 8VdLCbfoZ7JR/s24fU/o5+C56jrP4jbnFbayzwQ=
X-Google-Smtp-Source: APXvYqxT+wH0aK1dMMyTsIGAlZu0a1KozbYDc5jqxW3fpBr5xac2KMPb+kxF/wF3pAzXYorxNDQy6R8Z0efbi+0P2Lo=
X-Received: by 2002:a25:d787:: with SMTP id
 o129mr13188419ybg.329.1569225566127; 
 Mon, 23 Sep 2019 00:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190618212715.10938-1-jcmvbkbc@gmail.com>
 <CAGSvup_SsBpJf+nh6UTScxN0KLS21ZbGukDqK=OQ97Nm3NyCqw@mail.gmail.com>
 <CAMo8BfJifHVmtQRPafvrROY+ybaZ=ArWwW7=hR8hEyM_b48mHQ@mail.gmail.com>
In-Reply-To: <CAMo8BfJifHVmtQRPafvrROY+ybaZ=ArWwW7=hR8hEyM_b48mHQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 23 Sep 2019 00:59:15 -0700
Message-ID: <CAMo8BfKsWJBABaW5GBM9ROo27Z03gY4z-0U4c6NMqJQ6K_mCUA@mail.gmail.com>
To: "augustine.sterling@gmail.com" <augustine.sterling@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, GCC Patches <gcc-patches@gcc.gnu.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix PR target/90922
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

On Tue, Jun 18, 2019 at 3:23 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> On Tue, Jun 18, 2019 at 3:09 PM augustine.sterling@gmail.com
> <augustine.sterling@gmail.com> wrote:
> >
> > On Tue, Jun 18, 2019 at 2:27 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > >
> > > Stack pointer adjustment code in prologue missed a case of no
> > > callee-saved registers and a stack frame size bigger than 128 bytes.
> > > Handle that case.
> > >
> > > This fixes the following gcc tests with call0 ABI:
> > >   gcc.c-torture/execute/stdarg-2.c
> > >   gcc.dg/torture/pr55882.c
> > >   gcc.dg/torture/pr57569.c
> >
> > Approved, please apply.
>
> Thanks. Applied to trunk.
> I'll backport it later to gcc-7..9 branches.

I've committed the backported versions to gcc-7..9 branches.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
