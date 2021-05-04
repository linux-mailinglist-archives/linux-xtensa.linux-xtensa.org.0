Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E4C0E372835
	for <lists+linux-xtensa@lfdr.de>; Tue,  4 May 2021 11:46:18 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6BC0F6AED;
	Tue,  4 May 2021 09:20:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by linux-xtensa.org (Postfix) with ESMTPS id 4543E6ADE
 for <linux-xtensa@linux-xtensa.org>; Tue,  4 May 2021 09:20:07 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id di13so9695226edb.2
 for <linux-xtensa@linux-xtensa.org>; Tue, 04 May 2021 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FMMoB0knpTuesmL7S80gUZGP0uEA+wOrx5OG5Ck4KtQ=;
 b=scnrBqC8w7CnFcQ5v3N0jKjMhFpIsia5XbpW2lEbIwi9mDBavP7Qr1J/E5dbLPwGGi
 kfxu44i6CBIUFoJmRGqPshBv9v9r95jElB52yp+1cfiKLnhwlzLLBvJ24shBXg1NIf4I
 TW09zi2ApCi7K0O8RmTHqDzya6qCTJBn9OBhagrT5amzbHwhXeTtHylqRPQlXujIQ5m7
 d7POAwGN1dXtD187vi4ncI1maUhyl/odexxCfUhec2AoIuVpeXNTAfA4gIk5BvFakFcx
 K989Jnpv0H72ayBFIwrONvUd3iG98IGx2L0MC4CUYyRTmUHvtvr5lFP+sLNjYy67+/go
 hsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMMoB0knpTuesmL7S80gUZGP0uEA+wOrx5OG5Ck4KtQ=;
 b=YSLXHrCPCpmZAsunmi6hVUEV4i/DIo0re7jnk60TVg89KHXoRrf1/Q4g0z9zv1MdAo
 WqK39LNtpFE3cZznLGbvyhErkKXK/5hXsZro3r/EPR8ry0h9Mebvi+pqYgoY/3tW+7dP
 QOeiGHLjwMh4nHnMM4XLUqlfd0TqFyftUCz/PHX9AgsB3DzI457C3lva3TxXrLWUS3bb
 l5TLkJj7fBo5RNyFlfxbwbeLVCnnoQs9N39kBvXcJHfLWpcOc7Yvl5WK/XxuiRGFkiOW
 L2M9L3j0NSZzptUfKKVe9Udad45uoSHi/v6yLAJWOynFCI10l68eOID2ds4mF6QjsUPO
 hWaw==
X-Gm-Message-State: AOAM5319mzIvIpIdnB7jJrQKmNJ8+E6SFg1Z6oR7LqDPnHcjz3FSx7RT
 zLSCo48B+n0eqGjkpywzgw+ki0Ti+qyMR5SEk1k=
X-Google-Smtp-Source: ABdhPJytIlqBg1GSjAvtrTGNIBv6aKqTmnMnu2e5kZW0EfBKg8Xh0c84yVVu4/JqV9YTkecrWRL3P/XHYROlWQerQAk=
X-Received: by 2002:a05:6402:34c5:: with SMTP id
 w5mr3386137edc.237.1620121563132; 
 Tue, 04 May 2021 02:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210501172437.156926-1-masahiroy@kernel.org>
 <20210501172437.156926-2-masahiroy@kernel.org>
In-Reply-To: <20210501172437.156926-2-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 4 May 2021 02:45:51 -0700
Message-ID: <CAMo8BfJgNgNKRi9XsPUFKPzH0GvtFcRxx75+swXaofcMN7kg8Q@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Helge Deller <deller@gmx.de>, "open list:SUPERH" <linux-sh@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH 2/2] arch: use cross_compiling to check
 whether it is a cross build or not
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

On Sat, May 1, 2021 at 10:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'cross_compiling' is defined by the top Makefile and available for
> arch Makefiles to check whether it is a cross build or not. A good
> thing is the variable name 'cross_compiling' is self-documenting.
>
> This is a simple replacement for m68k, mips, sh, for which $(ARCH)
> and $(SRCARCH) always match.
>
> No functional change is intended for xtensa, either.
>
> This is rather a fix for parisc because arch/parisc/Makefile defines
> UTS_MATCHINE depending on CONFIG_64BIT, therefore cc-cross-prefix
> is not working in Kconfig time.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/m68k/Makefile   | 2 +-
>  arch/mips/Makefile   | 2 +-
>  arch/parisc/Makefile | 2 +-
>  arch/sh/Makefile     | 2 +-
>  arch/xtensa/Makefile | 6 +-----
>  5 files changed, 5 insertions(+), 9 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com> # xtensa

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
