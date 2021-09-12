Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 82862407B5A
	for <lists+linux-xtensa@lfdr.de>; Sun, 12 Sep 2021 05:05:23 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id AE03266CF;
	Sun, 12 Sep 2021 02:34:51 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by linux-xtensa.org (Postfix) with ESMTPS id 43BB766BB
 for <linux-xtensa@linux-xtensa.org>; Sun, 12 Sep 2021 02:34:51 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g8so8636361edt.7
 for <linux-xtensa@linux-xtensa.org>; Sat, 11 Sep 2021 20:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sd5WF+pIcO5DhcoFv/B3hGgVVb1vEUiUbaxcHE8vxMU=;
 b=B+4CSmBgsYiW+AwniIyTYkaAPXBby22GaaGzVbP5WI4XE6SNgGuAI2ywXMVO7Gt5Fp
 8WRHCCvJNyi/cki0pJhLfppO13sT/2TPS32KMgYOhYzUAfeaohf7qBlZi4POsT/uuMzc
 1+LkGID0kTpGpaFJpkrTxL+5kmesiZYp7HfZMTcwccrz0lKQdNn5Tm/n1rBKCl/L2Hkj
 bBiZ1mk46IaSGEu6oT/SZ9e0xm/dcBWLca4PpzXJvcKLusqTlEpnYMBOLfyd1YDXdjly
 y3NaPNUJ5EScxTYQhJg0sWKMEToNVOFZaUGFBnjVOlsHjSJ2P3/iOz4HI0ajEKKr/AUh
 hxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sd5WF+pIcO5DhcoFv/B3hGgVVb1vEUiUbaxcHE8vxMU=;
 b=GENRNTmAeda3ZWtYPtRDwQojSfuGWbAeViyeyHeQwcL45tchzONITCcg/Qpe6wX/FK
 mMHm1qTKlL7iUoDJQ6LGiKAcqdxd9TvZ8jbKle3cGzSVQNWJIapdTyRfDVat3nRVdahZ
 lQBxezYw/StZVZMQk4azOCRiqho1W+q1Teay0onL/v0e/qPL6KAXA82/bhKR4mBlK7C/
 EmbVhaA51MBECdSQjb1bhNykGlZIXyEiMTMiwMsu/bk7eKrUQq6sNLMmpZzvlHyjfnBP
 dBwKTza3uYOLcz5Y/OhjaMfWDeD4IvhhSbawdxttIrg6aAQztKKxrJ9+O9v9IohOFUCD
 XD+Q==
X-Gm-Message-State: AOAM533mq8N1uA+8bul+VyaVQWBES0Fdc9yJb0pN13nu4cpQ9LTtc+6h
 sPhwL6vDjBLHGjxKoyP90tRnRX1ugIKSXBrBnp0=
X-Google-Smtp-Source: ABdhPJw7cIZLpKPkFy1iGfM4QfhtKcxAPMVJ4l/whWicwMKSgIzLcMG1Pvd4yZ1pMGu7o5Tyb2ZOh6o0yXVTnUwfemY=
X-Received: by 2002:aa7:d592:: with SMTP id r18mr6041634edq.172.1631415921224; 
 Sat, 11 Sep 2021 20:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210912025235.3514761-1-linux@roeck-us.net>
In-Reply-To: <20210912025235.3514761-1-linux@roeck-us.net>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 11 Sep 2021 20:05:09 -0700
Message-ID: <CAMo8BfJ8f+4AmBD1B7J9vOp0xQbB=zRW-NyGZP6gTPTA-74OPQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: Increase size of gcc stack frame
	check
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

On Sat, Sep 11, 2021 at 7:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> xtensa frame size is larger than the frame size for almost all other
> architectures. This results in more than 50 "the frame size of <n> is
> larger than 1024 bytes" errors when trying to build xtensa:allmodconfig.
>
> Increase frame size for xtensa to 1536 bytes to avoid compile errors
> due to frame size limits.
>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  lib/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index ed4a31e34098..afad11e57d6b 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -346,7 +346,7 @@ config FRAME_WARN
>         int "Warn for stack frames larger than"
>         range 0 8192
>         default 2048 if GCC_PLUGIN_LATENT_ENTROPY
> -       default 1536 if (!64BIT && PARISC)
> +       default 1536 if (!64BIT && (PARISC || XTENSA))
>         default 1024 if (!64BIT && !PARISC)

Shouldn't that line also be changed to
  default 1024 if (!64BIT && !(PARISC || XTENSA))
?

>         default 2048 if 64BIT
>         help
> --
> 2.33.0
>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
