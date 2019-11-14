Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 577C5FCCF6
	for <lists+linux-xtensa@lfdr.de>; Thu, 14 Nov 2019 19:17:33 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6D6EA2264;
	Thu, 14 Nov 2019 18:09:09 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by linux-xtensa.org (Postfix) with ESMTPS id C462F2258
 for <linux-xtensa@linux-xtensa.org>; Thu, 14 Nov 2019 18:09:07 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id q18so2933959ybq.6
 for <linux-xtensa@linux-xtensa.org>; Thu, 14 Nov 2019 10:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PL2/BS0frIN9r/rql9vL+NYiXX+POn906WNUO708kb8=;
 b=tdkk2lclgAaaumaNuSA2n62iBAg3Vc2V1Cb8sFANskZSlwGCCgptxnkvvRwnz3qULC
 /tCHSmgVFORwe95/A/AS7NECcmHhE9zkiCxRrqMxONwuZIfnCbszRQ4rXmnH/eENuicE
 ZRIgZFBVgGGX1VHS0eOQPHWxS0aU4PYeLs2/QCsfMFgXSxT7a0JylQ+8Vk4pWGafzeTl
 FUy9hvkPIbKiiAj3JMvm1hgjl+xCWiRbB4ANJIBbz0MEW3+yt3+Gd1Dg2nP+MnVbItMs
 vx8/5948mpDKlbpB2wVhBfJFXO2I6drHuSXoIaOtvuYWbvrN+dPLNGKtLiI+QG9VjDz1
 4UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PL2/BS0frIN9r/rql9vL+NYiXX+POn906WNUO708kb8=;
 b=gVfUx2AswOvh3r10rL2Sbg1yvnVYsLMS8wJaru/fUcwFG7QpaEksFsUBUvuF+FLxA8
 oKIA5ezsOKDPKLV+jyl3dgyq2pA39BiXQcQFupyJjTbxQH7qK9IP+JHd4oRhpIZ9qYeF
 xwInGMwRjLXCNGdLDm98g8yXKmMPPpU/PoqkJH+fL9xyWdfOCZbFenlx5Noka1M1bypo
 NqoGAdqDtlDEHKeUeQjGGFDxfpM7fTsnq/2ZXxQicTQZV3bwNVJcS3GYmx2qAij8Grdx
 U8R6jVym5cb2RfB5vJfXfzuuDoWYzSYWDICQmPaZGWEGtxu2xwJdDjCURfQjN0JGVBuc
 Z+eQ==
X-Gm-Message-State: APjAAAXo+9jPL5aJe1tBwBjEnD1BDuOBFAz2/qbyf6ZUknd+/8cayfbN
 D4AkQr9XAK5Ftn+KpO1zPkJN3btBc4QAvbPHWPo=
X-Google-Smtp-Source: APXvYqxwKK1fcX3dN/1WnWVywPIQVg3vwTClEHlB2e9J8UOycek5FQVewADIfuiWdljL74dEyViCieXwgHIHFupeDAQ=
X-Received: by 2002:a25:778c:: with SMTP id s134mr8530150ybc.143.1573755450272; 
 Thu, 14 Nov 2019 10:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20190923143620.29334-1-valentin.schneider@arm.com>
 <20190923143620.29334-10-valentin.schneider@arm.com>
In-Reply-To: <20190923143620.29334-10-valentin.schneider@arm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 14 Nov 2019 10:17:19 -0800
Message-ID: <CAMo8BfJ86CH1w1NUKz-hWNstCARbivaBrx0_uKOrBgxCfNq9OA@mail.gmail.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH v2 9/9] xtensa: entry: Remove unneeded
	need_resched() loop
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

On Mon, Sep 23, 2019 at 7:36 AM Valentin Schneider
<valentin.schneider@arm.com> wrote:
>
> Since the enabling and disabling of IRQs within preempt_schedule_irq()
> is contained in a need_resched() loop, we don't need the outer arch
> code loop.
>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/kernel/entry.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied this patch to the xtensa tree as it doesn't seem to be taken
anywhere else.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
