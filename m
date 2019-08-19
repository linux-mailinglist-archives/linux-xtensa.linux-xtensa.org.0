Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE2F94B3D
	for <lists+linux-xtensa@lfdr.de>; Mon, 19 Aug 2019 19:06:45 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id F25376583;
	Mon, 19 Aug 2019 17:01:19 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 6AAFA656B
 for <linux-xtensa@linux-xtensa.org>; Mon, 19 Aug 2019 17:01:18 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id g7so668829ybd.7
 for <linux-xtensa@linux-xtensa.org>; Mon, 19 Aug 2019 10:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csGSFDEdSWqw3dz2PgL0VnXwJ2fZOjcWs1UiwIbpOh8=;
 b=BExNnfSwIIIYOd2fPFOYG/vCFL2tOZqPG9oCAekHhn6/qBPnYcBCfFYgHijbOFgSIV
 3DGpD6Gy4Yxe5tJ0y7ZDtPSbwdLfyXB8xV8HKV3QZokspTWK+H60PPr6tNBa71zjvjEq
 rDkPhzkM4GFacH7LMMWGfYsPXnbNLm8sYSaEGxEVpju8hAy7aMBTE3SSceq9PIT7WuWh
 sTzuvvnJCkLo1WwK+2CpqagEBM4t3E1OIt3MnqcTZn83/B1PR4Re9UMl/PdTgYf/ZlH4
 UzWl4h+JNq8bi9ol4GaYY7DF3EHEeft6IC54G7JgHD9K3vmdEpTW1LySlpoqUoXgI+qN
 Gn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csGSFDEdSWqw3dz2PgL0VnXwJ2fZOjcWs1UiwIbpOh8=;
 b=rnoVNHoTwNh3HGyaFNsUIUpcs6idawXDwV1/WNwmEsnVbAsKZIvDtWzaRoNQvPDHC4
 QeDndXfb4NNRpXMz3le1gluaqQt4fotKswvnmNkvjWhqDLvw15SMJ0avHdxY4H50xzAa
 iLZZ97YtPIqv4Ds9cUIh2YJiV68/AbJHBL03+TRdq04oJ4pApiT98Mlgp23KTF+M3uXT
 0VR/bjHgmQTl09iX8K6f+uBS7cIGAXHSe/KjEc2blF1BLY26s06m13aGBkFfp91rZda1
 hu/Dekn5kEI1QluSCpcWJRtVFtFGpYdPU3lB+gOfdwKBMZnKsp1ltOh44rGFu1kZ8n4N
 yL4A==
X-Gm-Message-State: APjAAAWRpFlwrj5N0fDCYMJEByeBajeVquTz1eXhzro4q45Bg8D8lfh6
 zs1Jhsj6nVp9h7iWdwI77qHGK92wolLMP7JJ3+Y=
X-Google-Smtp-Source: APXvYqwQA66V3JZQ8sRo/iPqtTGs+feQWRX34c7uh9WJv+pUv2pSCy/Tkk/vsf3jr7t3twT4WPViCaVg1rYVma41ndA=
X-Received: by 2002:a25:ed0e:: with SMTP id k14mr17889604ybh.286.1566234402617; 
 Mon, 19 Aug 2019 10:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190806213749.20689-1-sashal@kernel.org>
 <35579e00d27344b853cafea0b29b13c5aaf9e1fc.camel@codethink.co.uk>
In-Reply-To: <35579e00d27344b853cafea0b29b13c5aaf9e1fc.camel@codethink.co.uk>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 19 Aug 2019 10:06:32 -0700
Message-ID: <CAMo8Bf+g68JemdWzc2DQ43JCdO125EzpT9r42WWA48OYAcksag@mail.gmail.com>
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc: Sasha Levin <sashal@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH AUTOSEL 4.4 01/14] xtensa: fix build for
	cores with coprocessors
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

On Mon, Aug 19, 2019 at 9:53 AM Ben Hutchings
<ben.hutchings@codethink.co.uk> wrote:
>
> On Tue, 2019-08-06 at 17:37 -0400, Sasha Levin wrote:
> > From: Max Filippov <jcmvbkbc@gmail.com>
> >
> > [ Upstream commit e3cacb73e626d885b8cf24103fed0ae26518e3c4 ]
> >
> > Assembly entry/return abstraction change didn't add asmmacro.h include
> > statement to coprocessor.S, resulting in references to undefined macros
> > abi_entry and abi_ret on cores that define XTENSA_HAVE_COPROCESSORS.
> > Fix that by including asm/asmmacro.h from the coprocessor.S.
> [...]
>
> This seems to be fixing commit d6d5f19e21d9 "xtensa: abstract 'entry'
> and 'retw' in assembly code" so it wouldn't be needed for any stable
> branches.

That's correct.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
