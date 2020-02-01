Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 19E2614F749
	for <lists+linux-xtensa@lfdr.de>; Sat,  1 Feb 2020 09:47:13 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3AD1D6589;
	Sat,  1 Feb 2020 08:36:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by linux-xtensa.org (Postfix) with ESMTPS id DC9CC6585
 for <linux-xtensa@linux-xtensa.org>; Sat,  1 Feb 2020 08:36:18 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id e9so4089897pjr.4
 for <linux-xtensa@linux-xtensa.org>; Sat, 01 Feb 2020 00:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CylU9ftSDJ0Ci9ZsmZEbddejAvubtZZm2KsEiJHwKX4=;
 b=AgnA3KEnv+bmLs+V5VpwlmEWBrJHZ/nDunw/+0aUVOjCPKZJrf2i3PfyW21086fe+M
 F6G8Et5vA0AOJ+zkClCSsOeQHoRzX0w2xGQiGckPbioLMAFiNxCSHwKRZRSMK4Vec4Xh
 VZim0nQIZ9O4CsMXF+F1B7hUEMegqIAj/F7+RxQZPXXA7gyHZakhtg1r8u8pjTDqideD
 EySJJPcZgy2zpygt7jAlvgEwQX6fVAr0dxTk4yebREQwlNjaKBIh4tej/XXWKuWfbLcn
 M8AC/SQ0D693Z6J2a+B8a5oo6fVAB6l9/MtoHKEMBVO0iLb3H5sR7APLLb1MCVmaH3Uo
 Y3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CylU9ftSDJ0Ci9ZsmZEbddejAvubtZZm2KsEiJHwKX4=;
 b=c7IHNf6d5k5fr7fnEIsBQruj17F54B4ZZxoX0txW1EcAIekjfo2y/Fc3vX3OFw4aqT
 BrDxAetHgIrih/dajsIyQwXqu8AzAb/2woGChGAsmW+ScnkyoHEEQh2nbCICSjliCZw2
 76JSyH/kjFaERG8gBx+iUfs+pjvXO1XR9UgRSoef8hbeSoax2Cw0kN3d6p1FA5AeSimr
 DDHtLK9eLYUMKeUyl7FadnEzVwy+zcSx3yBYvRJuaXOwG1GjAKvtB5kqXAweFqAmCLHP
 N/lYJkq5CyH7Ez2qQ3d2VQRJRFnHKc3mki3nslUZomGNFnPdy0oxvdtlM3BzO6lY0swV
 9SOg==
X-Gm-Message-State: APjAAAW64qXhg1E4CPIQqkerG6ZYzxzsT9YlrMdOJxTL0aAz8bW5Ta1e
 91z31rs6pcv28pjY3zw/mfVBw8DP/BiV7oK2NeI=
X-Google-Smtp-Source: APXvYqyIaEfAhfBwNrMQEQUHGwDCLKHG5fjRlKfmP8mxC005JDNfw24zVnSy/nOPHIjJZ0lua2r2YUOGXdBivGJZ1JI=
X-Received: by 2002:a17:90a:c24c:: with SMTP id
 d12mr17614144pjx.113.1580546827051; 
 Sat, 01 Feb 2020 00:47:07 -0800 (PST)
MIME-Version: 1.0
References: <500b2132-ea3c-a385-1f37-05664de5f1dd@infradead.org>
In-Reply-To: <500b2132-ea3c-a385-1f37-05664de5f1dd@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 1 Feb 2020 00:46:56 -0800
Message-ID: <CAMo8BfJ8TsXthhD4pyDcAeODPaE-ueS-+nJcwV8F3JcoSN7dpA@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] arch/xtensa: fix Kconfig typos for
	HAVE_SMP
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

On Fri, Jan 31, 2020 at 5:59 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix typos in xtensa Kconfig help text for HAVE_SMP.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
