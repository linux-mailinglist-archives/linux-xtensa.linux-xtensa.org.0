Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 07C897E219
	for <lists+linux-xtensa@lfdr.de>; Thu,  1 Aug 2019 20:21:31 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E8B0158B4;
	Thu,  1 Aug 2019 18:16:43 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by linux-xtensa.org (Postfix) with ESMTPS id C0E16584E
 for <linux-xtensa@linux-xtensa.org>; Thu,  1 Aug 2019 18:16:42 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id q128so26464255ywc.1
 for <linux-xtensa@linux-xtensa.org>; Thu, 01 Aug 2019 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uziT82TLEzNDslokSMjdgq8NAuexcw/nI7buWS/Yyhg=;
 b=ebU5LIV5/h7eiPBHH/GogzR59usEkgPjAhVy74hMNpuOXi5605sm/9TmOiXQTD32yY
 Nm9cxKwR03IFfSxg73CRvBT17IWsZSATEYp8xIagwYEfKzruOCEp5lqevfmOn9iNNGs3
 jgDs6zjn6DxiLQrexzFT+saB/jSH7c0OmoTfk9/+DXf3AE0k2GdgKADLmIExhTQsOm1m
 i/oGLzfKUHCkeBhDpgAPtN+PnkMTkz7bXYTuxxMZcq4GNiLrQQ+xSh6pheKLBDndHF94
 hE09VaMGfCD2Tw/GxurXuamCxU6/JuyirZpyYneNwxiDLvslVvT7JSCfa60N/1OvRAM1
 Feyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uziT82TLEzNDslokSMjdgq8NAuexcw/nI7buWS/Yyhg=;
 b=MS0wIDIenVFgG8U36ClAc0O8SOjcTB6YOTFwkey2wrQ/I4q3nwRGzP/BwC30qjXDZz
 A9usik+asg2y3XzKKwnyz6xLYJiL5axXot4cBJ7sc7RlU62jyyBvVtVjRpVVDWnWw3md
 YjKCYFUZhDj3avmpJtkdMovE8hss2iijMtH7Gek63RUdNk8YseS3ar//WaavtUyvA1F/
 j+oBvy41fvHklv95DLyFNcmYPL1Qfoiuk01LWJjTWfJCO8blMDJh5k9GbelPhcB/nAaF
 jFxZ9aDtWS39VSfRG1kgbGsE332c642HYDHYl7sEDJC90f3OdHyXFcZa86QR5sIWT31O
 rIJg==
X-Gm-Message-State: APjAAAVj0dv/8Qgsb3qdzHQoxNAxLOKOBmvYM1kCOJ8+jJtYtma0X1ob
 3iFibCmFSLKrsDfPPxLHr5pY4rVwHt7R9iWBrBY=
X-Google-Smtp-Source: APXvYqysoznmHT7yeGKwQfoNdBvzcxkVzcpv+pC3huoSkNaHtNpo8+UtpOZOh0bR9FIf4rmPV0nlvoDDdA36e2yDohw=
X-Received: by 2002:a0d:d947:: with SMTP id b68mr80190709ywe.409.1564683688733; 
 Thu, 01 Aug 2019 11:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190731072227.14893-1-jcmvbkbc@gmail.com>
 <CAGSvup8gjakg=Ddfm44rU9vwDvhx3PuTrU78azsTjjLoUy6qSg@mail.gmail.com>
In-Reply-To: <CAGSvup8gjakg=Ddfm44rU9vwDvhx3PuTrU78azsTjjLoUy6qSg@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 1 Aug 2019 11:21:19 -0700
Message-ID: <CAMo8Bf+pxvPg+DVsOYHwN8sRSu6JRcrz-HE0A_nCRpx65=ghBw@mail.gmail.com>
To: "augustine.sterling@gmail.com" <augustine.sterling@gmail.com>
Cc: Eric Tsai <erictsai@cadence.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, binutils@sourceware.org
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: bfd: add special case to loop
	alignment check
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

On Wed, Jul 31, 2019 at 11:20 AM augustine.sterling@gmail.com
<augustine.sterling@gmail.com> wrote:
>
> On Wed, Jul 31, 2019 at 12:22 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> >
> > check_loop_aligned is used during link time relaxation to only allow
> > transformations that don't violate loop body alignment requirements.
> > Assembler can relax loops that have too long body by adding instructions
> > between the loop instruction and the loop body. check_loop_aligned must
> > check alignment of the first instruction of the actual loop body.
> > Detect loop / rsr.lend / wsr.lbeg sequence used in assembly time
> > relaxation and adjust alignment check when it's detected.
>
> Approved.

Applied to master, thanks.

> I'm surprised no one has noticed this until now.

It was broken by the recent change to long loop relaxation, before that
the whole such loops were marked as non-transformable.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
