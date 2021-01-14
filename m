Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6112D2F6C28
	for <lists+linux-xtensa@lfdr.de>; Thu, 14 Jan 2021 21:38:04 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 389B23AD5;
	Thu, 14 Jan 2021 20:15:38 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by linux-xtensa.org (Postfix) with ESMTPS id 46E5D32AD
 for <linux-xtensa@linux-xtensa.org>; Thu, 14 Jan 2021 20:15:33 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id l9so4451017ejx.3
 for <linux-xtensa@linux-xtensa.org>; Thu, 14 Jan 2021 12:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dnkY8VhBKX7fyLymuaOgh7Kzhqo6/ffCUUZ+3TB9sfk=;
 b=S1qEdtllkI9bbC4WyizIHS/NrI01+t4naYpVzKo6U7uIUZGgZvp4ipWMMorZBf2JI8
 xh0YtKXQ2E0LYHNKr7uLeqY96YGydw3iS2kK1XqzqieZedhOVpAHmjk1Tc5+JAQm7Uje
 Rt5/6I4aMe40Yahclk0iBTPNB+efQ7/HzM/Im7N1SNU53kBndrBGrf2Wj/w4/QkQjBto
 NNRNWNEOqOsFJV7Nt37Dz5+QR6vVpkpiqqcNCdFeffIPgpHHGYc4PlfMJIQnZYxNITcr
 Ipfjh8gfcpTz8xWWZhanhRNzDxR8Zu3Oo9J+pq7/oZ6CcU8MEBWVUHpqv41ydH+3ErYy
 erSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dnkY8VhBKX7fyLymuaOgh7Kzhqo6/ffCUUZ+3TB9sfk=;
 b=VkgFBIh8dn7uG/yDI4/dlFoF/7YlPn3XSl3kWHaxmzprwE5oO6bUYs0t63xMmiyJdd
 +YHZCfIrgYmhkwxRSKGYclnkNNJJY+2Yi5Trfb09aLk7SGmGdbGOhOy85iUwbLRlPfyc
 91QR/mcIkyBxNsW3P4NaONLwzjjQac4+QJwmisridHD3DmhyoexETOjz5RzXAT0M82cg
 rUr1ZfUmZG1i5FcfjMYzMbPgRTPf271AucurMJ4rL9Udg1skQDCWfaHpHxEfnC9l1+sO
 4yBoa3gQEAIYFTJMblpOyEZZnjiLXocfnhPqOPHvr9dye4aZjj128kemJ1C46gveUz5/
 zcMg==
X-Gm-Message-State: AOAM5304CONTod6aTi3TQXU2/E1XYDl4qlIoEdTQ0zBe6Q2n765OTIX/
 CM8gUPKrK5bTf/AmyBELm2BTLO+ooCPjw4DT7x4=
X-Google-Smtp-Source: ABdhPJwLcgK8nT3QnZuXEL5YzyE4ftItoCDBCpkwUddDRrwlLOcFty5eY+Uv/uYvGGwiA/tT70apTQ8ot7KpJF9Cxig=
X-Received: by 2002:a17:906:690:: with SMTP id
 u16mr6536886ejb.186.1610656677483; 
 Thu, 14 Jan 2021 12:37:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610622251.git.viresh.kumar@linaro.org>
 <193f2f177d23eef62b54b48f80e62fb0169c1db9.1610622251.git.viresh.kumar@linaro.org>
In-Reply-To: <193f2f177d23eef62b54b48f80e62fb0169c1db9.1610622251.git.viresh.kumar@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 14 Jan 2021 12:37:45 -0800
Message-ID: <CAMo8BfLoMhH67ref+uVV4yb22B+c61ewvJaaCsgJgOPc+JWUyA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Robert Richter <rric@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 anmar.oueja@linaro.org, oprofile-list@lists.sf.net,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 William Cohen <wcohen@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Linux-Xtensa] [PATCH 16/18] arch: xtensa: Remove
	CONFIG_OPROFILE support
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

On Thu, Jan 14, 2021 at 3:36 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> The "oprofile" user-space tools don't use the kernel OPROFILE support
> any more, and haven't in a long time. User-space has been converted to
> the perf interfaces.
>
> Remove the old oprofile's architecture specific support.
>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/xtensa/Kconfig                         |  1 -
>  arch/xtensa/Makefile                        |  1 -
>  arch/xtensa/configs/audio_kc705_defconfig   |  1 -
>  arch/xtensa/configs/generic_kc705_defconfig |  1 -
>  arch/xtensa/configs/smp_lx200_defconfig     |  1 -
>  arch/xtensa/configs/xip_kc705_defconfig     |  1 -
>  arch/xtensa/kernel/stacktrace.c             |  2 +-
>  arch/xtensa/oprofile/Makefile               | 10 --------
>  arch/xtensa/oprofile/backtrace.c            | 27 ---------------------
>  arch/xtensa/oprofile/init.c                 | 26 --------------------
>  10 files changed, 1 insertion(+), 70 deletions(-)
>  delete mode 100644 arch/xtensa/oprofile/Makefile
>  delete mode 100644 arch/xtensa/oprofile/backtrace.c
>  delete mode 100644 arch/xtensa/oprofile/init.c

Although I still keep userspace oprofile tools that use this interface,
I haven't run them for ages.

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
