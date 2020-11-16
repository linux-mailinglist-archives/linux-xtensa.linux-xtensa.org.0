Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B18CC2B4630
	for <lists+linux-xtensa@lfdr.de>; Mon, 16 Nov 2020 15:47:19 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3E6B364D7;
	Mon, 16 Nov 2020 14:26:46 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by linux-xtensa.org (Postfix) with ESMTPS id EF11E64D3
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 14:26:43 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id cw8so24756788ejb.8
 for <linux-xtensa@linux-xtensa.org>; Mon, 16 Nov 2020 06:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=37us/O2JuQQ2yWSt9utM2XNcG7HUXMnxEW//yI4vlLg=;
 b=a9hRi/xbObOHWi15XDluUp/RuCjyo9TWYSNG5gEAfGZ6VbBTqZmZ9YNCZ03u0kWv4c
 QeRDQYNgwQY+92LUH3CObQJQlkSR1J+uhAhM/I3RsJv1FSHfWkb4vh8QFdwyb62jrShP
 4+wEWJnVFduAueJhJ07s0/iWyKS1lKegSBsRMPDhjx5KafioA+0hRv1oO0EZ+Q8sTbSD
 jcVGlGgPvcg88V59EHvYILaLOu63eMQcA/FHbvfDtY4wBYK+/9YdMN/tDK4YUdiowysL
 5/iemqpyYNXMml57MFxKRYN+VwY9lGReknnFNoTLkswUyRJQfzQdqW62MzN282dVnLBB
 ZOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=37us/O2JuQQ2yWSt9utM2XNcG7HUXMnxEW//yI4vlLg=;
 b=O84P15B/YJtWstRPFd9ek9CJP7arVyko+ecnpteNnxbqxJASUY8UErEQEtXIrjfeB9
 +WfpRROMBO9grkPGqh5k1P2eYkvzjJ9uMrhvX7EsN9+ZwiBpMZRj3mjr5GUmoGK3cWbi
 DGR8Yle58MWhq2XpochUS49jonqJ8+VHCsJesdBSUsGIOOHn+GmFjQkQls7AChIKEVT2
 GpUaSNN/PRC7ZW2pPef0EVPwHCpErK9wMpT/6NsjeHkmU/ssX/D+Eh+ytKLtTXkCC2zo
 JX/u/ZfbncJ/5qmMhPudRHzUr8EQESIaeyJ9406quUYgwYUUMukiAks3EYnz7Q4+ISq8
 k6MQ==
X-Gm-Message-State: AOAM533x+GmYOTIJwwegHssKUJO/GJKrJOC1gWmMq6JS0utYis9QL3jf
 Ky41RYLmsIhbfRQQH/kwnQFR08t2yb7pfwN5GBo=
X-Google-Smtp-Source: ABdhPJwpRbMQTvr0CF6s5x8FvX/SZKNXSWOieMKYK1Wr0yMxv/pThUC1Rupo6v3JraBPzPBenM8SMBQEzfFfxpG+++Q=
X-Received: by 2002:a17:906:2313:: with SMTP id
 l19mr13373862eja.443.1605538035300; 
 Mon, 16 Nov 2020 06:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20201113122328.22942-1-jcmvbkbc@gmail.com>
 <87zh3ll6hw.fsf@nanos.tec.linutronix.de>
 <CAMo8BfKEr-89awEnV072uWR=4fniDRJ0drWmZrtnyvj-mANk0A@mail.gmail.com>
 <87sg9dl3xk.fsf@nanos.tec.linutronix.de>
 <CAMo8Bf+2kGmg_SvJz8R=qXgPWbYWmf-PSeG71xKe5AB2LeyZ4Q@mail.gmail.com>
 <87mtzklwc7.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87mtzklwc7.fsf@nanos.tec.linutronix.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 16 Nov 2020 06:47:03 -0800
Message-ID: <CAMo8BfLFZ_X8y1XLZnBb-VkOPMhXT4Daau9ydKAU9L_64Zap4w@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH] highmem: fix highmem for xtensa
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

Hi Thomas,

On Fri, Nov 13, 2020 at 2:34 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> I agree that the top down mechanics is not really intuitive, but that
> does not justify the ifdeffery in the generic code.

But then maybe xtensa did the right thing where everyone else just
copied the not really intuitive implementation? If nobody else cares
then maybe generic fix_to_virt/virt_to_fix can be changed for positive
indexing?

> xtensa can just use the generic fix_to_virt/virt_to_fix mechanics. All
> it needs is to adjust the mapping defines and to adjust the color offset
> to
>
>         NR_COLORS - color
>
> which is not an unreasonable ask. As a side effect all highmem inflicted
> systems which do not have the cache aliasing problem can just use the
> generic code as is. See untested patch below.

Thanks. I'll test this patch and post the result.
But still this change doesn't look like a step in the right direction to me:
I can't find the reason why fixmap must be indexed backwards.

> It builds for some configs, but the smp_lx200_defconfig (which has the
> aliasing) it fails to build even without this patch (highmem.o at least
> builds).
>
> Toolchain is the one from https://mirrors.edge.kernel.org/pub/tools/crosstool/

xtensa toolchain must match the selected CPU core. For smp_lx200_defconfig
the toolchain is available here:
https://github.com/foss-xtensa/toolchain/releases/download/2020.07/x86_64-2020.07-xtensa-test_mmuhifi_c3-elf.tar.gz

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
