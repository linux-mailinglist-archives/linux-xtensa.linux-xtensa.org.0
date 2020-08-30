Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E00D5256C93
	for <lists+linux-xtensa@lfdr.de>; Sun, 30 Aug 2020 09:30:00 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 860AA64D8;
	Sun, 30 Aug 2020 07:12:08 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 2750464D6
 for <linux-xtensa@linux-xtensa.org>; Sun, 30 Aug 2020 07:12:05 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l63so2675334edl.9
 for <linux-xtensa@linux-xtensa.org>; Sun, 30 Aug 2020 00:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvLwOF27u2HMyFoAOh2OBgXTpYXjzE8rGPa+77xJpBc=;
 b=JL8LzWsJsirEeaoKaU30Dg0fcGAZgIGhHvcS0+J54+OtgE8m8Y55hpR0hxL2fIeIq3
 ehREgGizEd7Hk1GhEwRw3gPQ3abRlIsn47Z75DQOugxwKThyLU2BPUgTF/S3AOFipPim
 Ki1m+Lit/0NGdV2+LWFN44Bd8T6ym2tNGx6RcUWcViyJAml4CGrx6UOc60+rTVrBpeXB
 p8Tn4FN7Oy+QP5jqSH0KtDVzKPhdZeOOWbO4fofybQjfhsrqmXEiXqp1aA/29cLO6pEV
 PwQjXZ8Qcizs6QgpD34I05Cn3shWSNjjYFBm6TPlxqsDFgbrLygOCbNLHcYOvG0UFqfJ
 XbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvLwOF27u2HMyFoAOh2OBgXTpYXjzE8rGPa+77xJpBc=;
 b=Y2XoqU2mDXM3P6wtN/zvz4Sqc+DyIIJSH7LY0RsyweEyt+nyjWmBhe65nFWZmP8HvU
 2rtJc/OHF2haPdueCS6lI4fhHl87TvVMp8qB+SL49URZWH6/RRZejBoSIUk4bXEDDiy3
 YgCDdIX6LTIxrMhE9S7AI6VF00SBbJsDWMjWO5J2Oq7a+mPZUexdDjM70TI0y7vXgald
 74fqSpUZCJcU13GxZekUzRyHeqc6NVB+i4A7rCzML76AWPqinFEDHR0SGB8yXm4VwW1l
 AWZ0XPcsqr0rgLffq7xiCOE190gJas+mfd/QwFWHQ1hpWdUhlnMr2+9NEDQ9LKolYK9j
 whSg==
X-Gm-Message-State: AOAM531Nvp+ZS73lJfLzxyldN4LJYfKU/z34LRcFvicQxcrpcZ/0iDEi
 evzEA7qaDuyGg1ocNOGi13y8BeBnXT0bHmwEXXs=
X-Google-Smtp-Source: ABdhPJzpjX/dvRAjzpvW+yv60CtJiWvJMVSrjPnUTdFXEodPoY1oZJcne4hW0niFp5o6pAXGQQ7YH9JxgEw82A8Lbqs=
X-Received: by 2002:a05:6402:1210:: with SMTP id
 c16mr6354034edw.71.1598772593486; 
 Sun, 30 Aug 2020 00:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <b91f2285-48b1-67bd-69b2-85fd9decafcf@infradead.org>
In-Reply-To: <b91f2285-48b1-67bd-69b2-85fd9decafcf@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Aug 2020 00:29:43 -0700
Message-ID: <CAMo8BfLNFQ+kzK8JN=5mLAMFCMB722nWQ2qVbsei0oCrgT7=Fg@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Jiri Kosina <trivial@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH trivial] xtensa: fix Kconfig typo
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

On Sat, Aug 29, 2020 at 10:57 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Correct trivial typo (ful -> full).
>
> Fixes: 76743c0e0915 ("xtensa: move kernel memory layout to platform options")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> Cc: Jiri Kosina <trivial@kernel.org>
> ---
>  arch/xtensa/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
