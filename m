Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0501F15A447
	for <lists+linux-xtensa@lfdr.de>; Wed, 12 Feb 2020 10:10:15 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 4223F6494;
	Wed, 12 Feb 2020 08:59:04 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 33CDF6489
 for <linux-xtensa@linux-xtensa.org>; Wed, 12 Feb 2020 08:59:02 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j4so893464pgi.1
 for <linux-xtensa@linux-xtensa.org>; Wed, 12 Feb 2020 01:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMWEtLnC4u+GSkpyrMggEcsRqsLKGC5Kgx8RCoWgoP8=;
 b=S3xL0M+iWbah1a5O2X9Ter5DBgCXGP2spoBe9HeyBU9F+JKH06Wyyhjtp44GJAmUmf
 3/6rdzhHsX3KBDKwzgUYBO2mwQztR6RuS0ZOS5LgRabbo8YvX0WcqTmQigE8PIYstjSG
 m4A4xvsSBQzUKebBqoyei996nGneoiREz8kmx4gOO2IK0E/8vm9C5eRwFOI4jD++hApP
 J1m5Hv8S+H8IkB7fj1mWC9DkKSR7Dw4VhwzffPlgzheUn0lxjHlnojexRA6PooAc5I8H
 z+G8WTgzb5UwWqHYiJp2gAmH2a1oCcDq35n4azrD8wvuJytckCaU0Ur10YkzLksVFP5E
 idSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMWEtLnC4u+GSkpyrMggEcsRqsLKGC5Kgx8RCoWgoP8=;
 b=gAkt9dS2kNS/ds66mFTsHgGP4+druMNY3k9x6Tx4VNyJMs7AvY6KygGe45GOZbvBCM
 xk6xyfG0DFWgdVng3+IDVaW7U5m3oJhNEK/ItxtEWbJFrZ6TG7wjI8OICJnoEFCrdm+k
 cbUJPEB894iYDuYgYOfcTbxCuNMS6A21Ss0UEZ3RmFfyncCa0C7SYMrrzYVcKNGGoOtU
 qc7TT1XUuTn/6KFKH2mS/eh1QwRsrG73pM702rCNeKnom7pkws38GD6itg3iPS8Y8SbN
 ZkV4UvhKDTQpV1pAzoAv+BstQb8Y1f+Tb4iobDkUyHASy7z7dkRucQaIah4f5Qgk+SZZ
 oEPg==
X-Gm-Message-State: APjAAAVvFdU45bVtlravHg0M2xwW0GzMGbByVbWuVVOFSBLb12O5TDAH
 RXJPllWwqVlFfWojj88ajwjKy2a3OQrWB87TsKk=
X-Google-Smtp-Source: APXvYqzTyTPBy6ErJ7sdnn64C7zYEpu4NkgvC94ld48iVT2BcZSQyrHuPKvNYehhj2FTj2NFitd4ubKoO4TcYjWQO2s=
X-Received: by 2002:a63:fc0c:: with SMTP id j12mr11223909pgi.378.1581498611254; 
 Wed, 12 Feb 2020 01:10:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <85574e1ae1e6870ef01b6e61c5b1c5f393c2ac4b.1581478324.git.afzal.mohd.ma@gmail.com>
In-Reply-To: <85574e1ae1e6870ef01b6e61c5b1c5f393c2ac4b.1581478324.git.afzal.mohd.ma@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 12 Feb 2020 01:10:00 -0800
Message-ID: <CAMo8BfJU5Uz7uDcbX8QZX=16JJNKvaZvDoS1fqK1fsOaKQ-0mg@mail.gmail.com>
To: afzal mohammed <afzal.mohd.ma@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Kees Cook <keescook@chromium.org>,
 Sinan Kaya <okaya@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [Linux-Xtensa] [PATCH 15/18] xtensa: replace setup_irq() by
	request_irq()
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

On Wed, Feb 12, 2020 at 12:05 AM afzal mohammed <afzal.mohd.ma@gmail.com> wrote:
>
> request_irq() is preferred over setup_irq(). Existing callers of
> setup_irq() reached mostly via 'init_IRQ()' & 'time_init()', while
> memory allocators are ready by 'mm_init()'.
>
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
>
> Hence replace setup_irq() by request_irq().
>
> Seldom remove_irq() usage has been observed coupled with setup_irq(),
> wherever that has been found, it too has been replaced by free_irq().
>
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
>
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
> ---
>  arch/xtensa/kernel/smp.c  |  8 ++------
>  arch/xtensa/kernel/time.c | 10 +++-------
>  2 files changed, 5 insertions(+), 13 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
