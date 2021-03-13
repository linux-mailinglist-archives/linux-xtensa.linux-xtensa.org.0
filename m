Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF65339D20
	for <lists+linux-xtensa@lfdr.de>; Sat, 13 Mar 2021 09:57:57 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5A4A2657E;
	Sat, 13 Mar 2021 08:33:43 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by linux-xtensa.org (Postfix) with ESMTPS id 348C36577
 for <linux-xtensa@linux-xtensa.org>; Sat, 13 Mar 2021 08:33:38 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id dx17so57892232ejb.2
 for <linux-xtensa@linux-xtensa.org>; Sat, 13 Mar 2021 00:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NfopcM7e7FULIgFg/DNsdzygJHayYXk44PBuqsZGESI=;
 b=BpYngydZZEENcL2xCAnFTsKhxbD50LBfPWrIDDxWPaXNjZbqsD+ThOvJuisFiQMcKW
 UwOvr4yMiOF2mB77tWifmvCrRmVsglSPlpzcuRnqE/JxP5l5cyh5mjzSc68TkANeb786
 zVtYcA5YhqFVf/gqZ49wGy853jfNe8YjIKDwQhwDJGkg/MEvxEQwXt+MTCrvIAg7kYzh
 8StXv5+XcDvpZWidhgEEDB8KQGHPD7Eqhsh7e/vBXwlmNfu4aXqHVfy8QGUMpnqH//ZA
 AUeJrHEFPxVUHZ3A2cgrnA72zYzzDMK7oobRwsMpFEw7DpP00sR/9KcZYDo0snkGvoh5
 r8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NfopcM7e7FULIgFg/DNsdzygJHayYXk44PBuqsZGESI=;
 b=JPB7d49D4BaCgVMOIu4Jj3KLqr0NebsbOWRt45bp0b5e4cWj6eFQD17eCi9tT0OHbz
 2QWpBoGc2w5tnwegyPxneWTOw6f3ogQD7qJXBaatyEZPT3JC7Mbruiq5wY0MAnnpZZPj
 kTkPS6AXNC6bHlcHy0SpsfYd8ImVBRNF2lFdfX+ysyVynHPSxjxlqMPWhXC2YvZj5O3C
 dBO8mPnsUm60EUtIJE7UxIMN2FtwT03zdjjacZYJziSkW0cOxnVvc1IxBglafsWZwTGH
 Pj3l63psYiL3MgqDHaL2QkTudVWnpt/kiuHNRyjpJzUL300FQXahuzGFxQpWuGmmGB9G
 I93A==
X-Gm-Message-State: AOAM533WREsrKi44U/j/8ejoQQlIVxsTD3dmEKhevDcRrS31PWS8lE90
 YAk9AoN+fLkwsP42ws6qaviLmEiBkTgr3h69FTc=
X-Google-Smtp-Source: ABdhPJwfVyA6oCv7ap/msM94zVIf10yLesmM8yd0mQHmMbfW8vkdxgCCs0aNFmip6W07OLiBa0mZmdCjZl3jdg9WLUE=
X-Received: by 2002:a17:906:30da:: with SMTP id
 b26mr12941090ejb.376.1615625870579; 
 Sat, 13 Mar 2021 00:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20210312151411.101942-1-masahiroy@kernel.org>
In-Reply-To: <20210312151411.101942-1-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 13 Mar 2021 00:57:39 -0800
Message-ID: <CAMo8BfL3Zx2_uYD6yJQgju90JJj5=occjsDtcXZY0E2jmqUhow@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: move CONFIG_CPU_*_ENDIAN defines
	to Kconfig
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

On Fri, Mar 12, 2021 at 7:14 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Move the definition of CONFIG_CPU_*_ENDIAN to Kconfig, the best place
> for CONFIG options.
>
> I slightly simplified the test code. You can use the -P option to suppress
> linemarker generation. The grep command is unneeded.
>
>   $ echo __XTENSA_EB__ | xtensa-linux-gcc -E -
>   # 1 "<stdin>"
>   # 1 "<built-in>"
>   # 1 "<command-line>"
>   # 1 "<stdin>"
>   1
>
>   $ echo __XTENSA_EB__ | xtensa-linux-gcc -E -P -
>   1
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

> If I understood correctly, xtensa compilers can support either
> big-endian or little-endian. We cannot change it via a command option.
> Actually, it does not understand -mbig-endian or -mlittle-endian.
> (Is this correct?)

This is correct. The idea is that specific xtensa core has fixed endianness,
but it can be either little or big. The toolchain is configured for the specific
xtensa core at build time, so there's no need for a runtime endian switch.

>   $ xtensa-linux-gcc   -mbig-endian  /dev/null  -c -o /dev/null
>   xtensa-linux-gcc: error: unrecognized command-line option '-mbig-endian'
>
> I see -mbig-endian / -mlittle-endian in old GCC manual.
>   https://gcc.gnu.org/onlinedocs/gcc-3.3.5/gcc/Xtensa-Options.html
> But, I cannot see them in recent gcc manuals.
> So, I have no idea better than checking __XTENSA_EB__ or __XTENSA_EL__.
> I just moved the logic to Kconfig from Makefile.
>
>
>  arch/xtensa/Kconfig  | 6 ++++++
>  arch/xtensa/Makefile | 9 +--------
>  2 files changed, 7 insertions(+), 8 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Please let me know if I should take it into the xtensa tree or you will
carry it in the kbuild tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
