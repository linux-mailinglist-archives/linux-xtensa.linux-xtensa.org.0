Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA683E8666
	for <lists+linux-xtensa@lfdr.de>; Wed, 11 Aug 2021 01:21:54 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8CCCA6449;
	Tue, 10 Aug 2021 22:52:28 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by linux-xtensa.org (Postfix) with ESMTPS id 518336446
 for <linux-xtensa@linux-xtensa.org>; Tue, 10 Aug 2021 22:52:20 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id k9so593527edr.10
 for <linux-xtensa@linux-xtensa.org>; Tue, 10 Aug 2021 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLuq5hIP1TC6eCB3bmdE0iWbfeNXvkHejJhYd7AnBm8=;
 b=VN343goDZO0MW5Oyd9qkCinN1a+84Iaq+REbd4dLsZogvnLVV6ELCzY9GZbGZ8yFBy
 yV6apnmcLkx6xtD9b9Lk8q+4up4EHdssaOgn2H2YuKcMa/Q5U5dsL3e9gdBHNEIeYvwB
 pjF4JcwdGBAyizx1ZT6mxxHbk/PYmTOWP8wJZQBjyjnmbXDW0zsw88+nWxC/XID/X6oS
 wr+e9UkJP9jJaqkwCiOdgFLo9SqEKND//fmMt+QjuTYXhsDrInRyn0C+682kFu2ZN8o3
 3XgmFFEq78eCNrVAA7AwZoM+QfzwGLGTn0QCl9p9LCLMjoX8nJ+L6LPDBdu2WeU+Jgqg
 JGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLuq5hIP1TC6eCB3bmdE0iWbfeNXvkHejJhYd7AnBm8=;
 b=XRE4huEBmCXGWozUMUhiPF9T2fYLvW+wp5zvpPHDKjtP7LKLrhAaKPVF0QWdL8eoEP
 waQrO5QuBXBIxQ5uOnohRHn+zPgInWU9RhAjkq/AN+oyZgNm0jwunWkuCnzJtz3pM7u8
 YNWw68MRtBf1DFV70SQ74fc3VOdgHN2heBjxodVA/hi3NbW0F7AMkA0QHEv1ojSUPURG
 qTUbiM4sD0osjnOesSnzugNcjJeBq29uUkSvjAI8ma3Jhg+4EfxIsKcsq+GZS+2ITNyk
 B3kk0+RopTW2eyZv3l/+6aHgaDnarJZtGAlmhvnkZK5WWpkc5VDAQQ7dLBZkaDpEZ8DT
 gpLA==
X-Gm-Message-State: AOAM533wkmJCui5Pe9vOmp2Qn0gFVZqJVlYqVJ8a0W4zWGA/UU2jEkpv
 qQK8bnb3ySROQxh2/CEs1E7DnnpwQEcgsH+I9fc=
X-Google-Smtp-Source: ABdhPJwaVQvYPtD2Tq08mSbIi7a/VmYh0uZ28VlOB80DvSptQcm6YfhNpB6TEUb/rX4ZlPTpxoR0AiDC+G6aEXWmmNo=
X-Received: by 2002:a05:6402:10d9:: with SMTP id
 p25mr7625998edu.51.1628637701475; 
 Tue, 10 Aug 2021 16:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <1627640999-17706-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1627640999-17706-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 10 Aug 2021 16:21:29 -0700
Message-ID: <CAMo8BfL6D3MU-_RO-FQoywPJfdZPaa2=TRZw4ZgxwPfjRXbG=g@mail.gmail.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: ISS: Fix warning comparing
	pointer to 0
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

Hi Jiapeng,

On Fri, Jul 30, 2021 at 3:30 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
>
> ./arch/xtensa/platforms/iss/console.c:204:10-11: WARNING comparing
> pointer to 0.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  arch/xtensa/platforms/iss/console.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/xtensa/platforms/iss/console.c b/arch/xtensa/platforms/iss/console.c
> index 81f9889..92d4624 100644
> --- a/arch/xtensa/platforms/iss/console.c
> +++ b/arch/xtensa/platforms/iss/console.c
> @@ -201,7 +201,7 @@ static void iss_console_write(struct console *co, const char *s, unsigned count)
>  {
>         int len = strlen(s);

Here's a bigger issue in this function: s is used in strlen before it
is checked for NULL.
I've posted another patch that fixes it.

> -       if (s != 0 && *s != 0)
> +       if (s && *s != 0)
>                 simc_write(1, s, count < len ? count : len);
>  }
>
> --
> 1.8.3.1
>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
