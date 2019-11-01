Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 04DF1EC9EC
	for <lists+linux-xtensa@lfdr.de>; Fri,  1 Nov 2019 21:51:35 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 83D4F52C9;
	Fri,  1 Nov 2019 20:43:34 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 8FEB542CD
 for <linux-xtensa@linux-xtensa.org>; Fri,  1 Nov 2019 20:43:32 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id i2so4016262ywg.13
 for <linux-xtensa@linux-xtensa.org>; Fri, 01 Nov 2019 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KDdbYxI+/BLdRecYxHcZGOBRSWl+O6WJ4eBTOSY7DrU=;
 b=Fcq1khqRLojp6TjGs8Ax0L1GozfKMQxrDRq4c3gJpHNmaUoVMoYP1m24399Vc+CPF/
 wjYE66yHcftlhoPmDLi+IhLRNMfToqt5wO3VrUwvNbgi+1nZSvhPq0v5ciAXPooKx4Ti
 MBN9B/Zw3cmghxXlVMEhZYKcRjAqReYfGBtduyXS36UxfKxUYsZQCowExxbWzwLWoSgT
 0cAf+gdCHBPrtWiZAv66jkDwoajVerARl3ZxGCV7HSAlH7DQkLUvLq2pHGgSH24tVlQ3
 vcCEFjs1vx09c6oR+DZxnx2vfKXaq30enMkqnHsnVPEWJQDHWH5/auICfqE5spelGDcz
 5qrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KDdbYxI+/BLdRecYxHcZGOBRSWl+O6WJ4eBTOSY7DrU=;
 b=tLugWTUw2EQGH6Yl5sx+N1lCkeEC09sRmwmzlaxMm485HL8c+NTGyGFrpcFPSg1h7h
 alIdGYBvV+S9QbAXz9NoQcMBecCCwT7lOfoj3kt/e3xn3EHqHuHXMJQnS76XtbqIhT0C
 ey9k09/etdvQu0ed8Ksm6QwE61EBCOPMYytQQh134texdAnI19VCX14pvvBRu6pp6+0W
 aXF8z9Kp1kGfXTt9yjWW4+6R37J3Okorw/MtZrFrhwdDvyVUnkyTNCwKPS64OQp80bwU
 murbqssZ3k4vtjnOSqEfAxYIrMiNSQBE/D8VOD+BUeXq9GoljA1qVHvmDoRdrXv8strb
 4exQ==
X-Gm-Message-State: APjAAAVo12gfqN5g+vaao1iRrnSy1M3e0D+13faVRzz1+rEsVJz4RgDy
 vf+fRjL2Y0UiktKb19M4WzjakHNXQxQ6deBKxpY=
X-Google-Smtp-Source: APXvYqyBIf+fOUXaiSM++7E8/X74iJ6416lCdmuWCi468pAoPvCESKZSRyratYe0qMCELb4xN1apbFZ5iIGjERIwElk=
X-Received: by 2002:a81:8415:: with SMTP id u21mr10014886ywf.129.1572641491459; 
 Fri, 01 Nov 2019 13:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191015212526.1775-1-jcmvbkbc@gmail.com>
 <20191029120451.GA23463@lst.de>
 <CAMo8Bf+-nQbfjnCh=BDco8XUjbBsjjDe8BD3iq10ehG1iTWNmw@mail.gmail.com>
 <20191101164223.GA14763@lst.de>
In-Reply-To: <20191101164223.GA14763@lst.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 Nov 2019 13:51:18 -0700
Message-ID: <CAMo8BfKH+CsGyOTo5J18b9=5BvfYRwaZcCOYftP+385QN-nk9w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: implement
	arch_dma_coherent_to_pfn
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

On Fri, Nov 1, 2019 at 9:42 AM Christoph Hellwig <hch@lst.de> wrote:
> On Thu, Oct 31, 2019 at 04:53:23PM -0700, Max Filippov wrote:
> > On Tue, Oct 29, 2019 at 5:04 AM Christoph Hellwig <hch@lst.de> wrote:
> > > Can you give this branch:
> > >     git://git.infradead.org/users/hch/misc.git xtensa-generic-dma
> > > gitweb:
> > >     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/xtensa-generic-dma
> > > a try?
> >
> > it doesn't break in any obvious way, but mmapping ALSA streams doesn't work.
> > >From a glance it seems that I need to implement arch_setup_dma_ops for xtensa
> > to make it work, does that sound right?
>
> That is just because I failed to adjust the dma_can_mmap logic.  I've
> force pushed the branch and it should hopefully work now.

That didn't change any visible behavior.
I see that dma_can_mmap still expects dev->dma_coherent
to be set.

--
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
