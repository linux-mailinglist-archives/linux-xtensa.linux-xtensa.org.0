Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 55AA8211420
	for <lists+linux-xtensa@lfdr.de>; Wed,  1 Jul 2020 22:14:34 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 97D476454;
	Wed,  1 Jul 2020 19:58:53 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 0E60D6447
 for <linux-xtensa@linux-xtensa.org>; Wed,  1 Jul 2020 19:58:51 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id t11so6607483pfq.11
 for <linux-xtensa@linux-xtensa.org>; Wed, 01 Jul 2020 13:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j3XX45xXL2ckQCryqen8G8xqi1VBzikcTk3+0I72HLY=;
 b=Z6vdH9ZkagZcUlBeTb3Wb+OYJP8Of8UMSLBsvIZfVVMyI0fB4CvWQFbRRfqZlt3MZf
 SysGd8bwRPRSMClVpd89Yjmkpu/idYcGibwdQlCb3teJ1lEGS3ip+L5eWB/kQoXjFqkc
 RtIpppZrTJcASvarISUfx4CFSiyTTvVxna7HnJldj5BKcS0vySUv7MneDvF30wdQWKaA
 ks55RgQw/cU7Ue/d9V09C/mLR+UgLf1u4HNeadUYxFkXS82SIsMOio18h9PP6upex+VJ
 TZbQYZOg43ZGOukob8QzLfBOg6MGec1hXR521puYqEBLBREvAgZd/lj/f5uglDFi0wC2
 ceQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j3XX45xXL2ckQCryqen8G8xqi1VBzikcTk3+0I72HLY=;
 b=kwjE77Pdxe8i3U11YUzozrZIsl2yP6jvGDcjBowWdbKuperSnoeaVgi7CB3GkeQKEy
 074DWiRHh+4Zf4MwoeSzVO8OAxd7mAYH5MlZ8glncymQukwBXRwpS+GtJUVcYxXtNeVb
 Bn1ijdwnMyodB5IBzQlD9wjXSKYZOpF/kXdOXNjsM2jKa4Xy2pE0JXGlfjp4m6hn4FCb
 oiAlQyPj4BFrj2ivp1oGMTT9QODbMIqsleObKEQBMiqv747qwONhSieXa5cJb4RdqBYF
 uiQyrIx4av8Pv4i/ajGA6wwxWH4e4zXJfzs1DDlQmn8d5Z2EJX/LMCdlYqup2d6R4Q+8
 9BnA==
X-Gm-Message-State: AOAM5312ktZG2QdaMiOfXYWv2gAckwrABgtoSvlNnL9qPuLehfqSvsSq
 5QYntc+sZBa9IT6I+/Aojchc6A01drVLq8WschU=
X-Google-Smtp-Source: ABdhPJwTpVRP0s9Kdt9Cl+CTlfdKHbWBuJdGoK2cC7YIaeI4bE2S1sLDFWylEo6otv0/ysiPMeOeocI+Wb+m9jZ4k/w=
X-Received: by 2002:a62:3645:: with SMTP id d66mr26487346pfa.275.1593634469910; 
 Wed, 01 Jul 2020 13:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200701192936.1397152-1-masahiroy@kernel.org>
In-Reply-To: <20200701192936.1397152-1-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 1 Jul 2020 13:14:18 -0700
Message-ID: <CAMo8Bf+w2ikVxEJecE_DpAbBQFNhY=K1jWpg9y4uDw9jEb5=MQ@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Guan Xuetao <gxt@pku.edu.cn>
Subject: Re: [Linux-Xtensa] [PATCH] kbuild: do not export LDFLAGS_vmlinux
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

On Wed, Jul 1, 2020 at 12:30 PM Masahiro Yamada <masahiroy@kernel.org> wrote:

[...]

> diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
> index 12ae1e91cb75..c6538d3321b9 100644
> --- a/arch/xtensa/boot/boot-elf/Makefile
> +++ b/arch/xtensa/boot/boot-elf/Makefile
> @@ -25,7 +25,7 @@ $(obj)/Image.o: vmlinux.bin $(OBJS)
>                 $(OBJS) $@
>
>  $(obj)/../Image.elf: $(obj)/Image.o $(obj)/boot.lds
> -       $(Q)$(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) \
> +       $(LD) $(KBUILD_LDFLAGS) \

Can that $(Q) be retained, please?
The rest LGTM.

>                 -T $(obj)/boot.lds \
>                 --build-id=none \
>                 -o $@ $(obj)/Image.o

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
