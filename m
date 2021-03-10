Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB1D333673
	for <lists+linux-xtensa@lfdr.de>; Wed, 10 Mar 2021 08:35:26 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 07EEF2635;
	Wed, 10 Mar 2021 07:11:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by linux-xtensa.org (Postfix) with ESMTPS id 5ACBA2621
 for <linux-xtensa@linux-xtensa.org>; Wed, 10 Mar 2021 07:11:16 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id p8so36475615ejb.10
 for <linux-xtensa@linux-xtensa.org>; Tue, 09 Mar 2021 23:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BOyazx73bKuDxT9YFQZ+98Lel151zbsjsLGlPaNK1No=;
 b=GQX3w3HgDZ3XpcKbxx6BPNluskMFI30wJnXIqgGw2DCsm14QOrhZ7iU/BMYQ7KZag8
 AUMVg16XZCUGtNVRgI8IOjQy6V2l00Zx9ujX0KW8YjenSiK2A5YbzF4rjl3m6I9I3LmI
 X5JYIWdqwYWzxqLRFNhkxVwi3fbUJF7XRF7ftHNbre+LvkkKhUyJixnwSlxhGVlPUDzv
 +L6WZ0WCBr2ENGzS1+c+iL9oMCDyyB0EiOTJcOxrsm1W6qVZTvAYVb/4WK+mO24xf6RW
 St8cj2sYoR1Sew0wE2TCV/GcKbCiFAgXBwemM81Bm+u6sh0KcKoQXIXIEIphYbsqQA+g
 EcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BOyazx73bKuDxT9YFQZ+98Lel151zbsjsLGlPaNK1No=;
 b=FBBloWzwYKl0NiepePtrJBIQzZ8CsUvLqNBIzTD6Ml4WAPrU+xg/J22EwqMEcIOulD
 2nlxyFXeBNdlpq8e0GOGiKjkC4Iu061jLXasyHt46AF7uMqcWf2UbcsSQ4vrK43y/30G
 txNhzdQsYwleoZjkJAK+b/zCBnsgKGkXoskEWW8QCvFAwmz5mn9wJrm6F/iO2ywvygdq
 5/hw2i2OQAq8S5S/OJkJeuzh2CaxFclowi3lhAeWm3iF+zPZlWVio/TZk8nUrOh45WXy
 tnzqDR91na0QvZwAw/biy3SDigACv2sce7elfWlNbyQ6ZASzxCDNgmy9gvCgpf2lrwT2
 mNfQ==
X-Gm-Message-State: AOAM532wbYkDH/gXKL+bHzUKHYkoN0jc3CCoKf5eIw586XOjSe9q9aLM
 zEyS1kv7T8lwEAnI89LYiQl3ygGAJltAahNgBkM=
X-Google-Smtp-Source: ABdhPJzPMz7HPUreJVDfjQKXo8NHbxnL8gyAMIBrPKJN4gvyPKqTZ4D0zTwlg0Qpd7ksTpXGl2yCYahZgyyOGFR2pXc=
X-Received: by 2002:a17:906:30da:: with SMTP id
 b26mr2207660ejb.376.1615361722831; 
 Tue, 09 Mar 2021 23:35:22 -0800 (PST)
MIME-Version: 1.0
References: <1615360238-22508-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1615360238-22508-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 9 Mar 2021 23:35:11 -0800
Message-ID: <CAMo8BfKwfBXXpkubu=W30S+q0Xt3xYFrD8QBDiWq=H=pLo=bCQ@mail.gmail.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix warning comparing pointer to
	0
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

On Tue, Mar 9, 2021 at 11:10 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
>
> ./arch/xtensa/kernel/pci.c:79:17-18: WARNING comparing pointer to 0.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  arch/xtensa/kernel/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
