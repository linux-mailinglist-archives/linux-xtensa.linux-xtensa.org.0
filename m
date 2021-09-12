Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 810BE407BF4
	for <lists+linux-xtensa@lfdr.de>; Sun, 12 Sep 2021 07:17:05 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id C558D6650;
	Sun, 12 Sep 2021 04:46:33 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by linux-xtensa.org (Postfix) with ESMTPS id DDBDF663B
 for <linux-xtensa@linux-xtensa.org>; Sun, 12 Sep 2021 04:46:32 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id q3so8897735edt.5
 for <linux-xtensa@linux-xtensa.org>; Sat, 11 Sep 2021 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=joknhrwptzMt0Qa8G/pJkdX8paSHxbwa4QtgcIWTarA=;
 b=a/limXqWwOtfT5eciR3wVVu7qSk3b/KCwoUyr21lcWQ6/FQsC5w9A58MMDTjOeXgoG
 mt0hE7ukUAgFSdaitxxarPudvvWnja0laQVIb/3sg9gkf0PExFi05PXnGackA7SeJiqa
 /dYis26NVQYPcmCgl4hQf01QjPeRROhADs7/dLHe5qw28U/uCXY5QqH0QpQZxvJmyG/+
 +rqCr3KcEEnB+olXKl/Ccyl63+vJWO7NBRdaqkzpThdpVv4bi8K3Ft6cvjkr3qmqqB0y
 QwURHCvbU6bOD0E1UA7XrwBbh+MpandHiXM5HrXVWvoWwf2B9HVBOpwpvGXdZKJZi3dd
 ijKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=joknhrwptzMt0Qa8G/pJkdX8paSHxbwa4QtgcIWTarA=;
 b=ThFEzFAteKqX942UPhihBqW/FoUyHg5moL8Euxi9MP7WOGlnLw3OKa23rWFtXKZo4y
 7XXk9OT7kBKnI76lgKQnujKPDeduwx3oJ/ubo3feorKORk7WeFq/DFeQ0fLjysZSYXyj
 dzgW6zU7/EZVeIfGLht1a56r+h58+LFy7qmD1c787LI3DwLoiLLzwPuyjG5y1x4Daepo
 UO0nyriHiQBc0CSg4vk6gEnju/rpsdbKr9aFQ9tgBeQbs8RDzzH1ADqH6G2awVCg83GG
 LhIUDNsVLuSwifrPeFwesloZPRoNRTlI4l9z9Im1B+Z5QfwsiiAScBZV/wKfAsTgKTrB
 VB0g==
X-Gm-Message-State: AOAM530JgCF9YvziOXe9fBUke0CYD2RqkwVrXtTxpCR7gWx3hweM6wyt
 Upzt8XeJiq3jA/R92HHd0YInxQj8uarJQAygIif5GFyi
X-Google-Smtp-Source: ABdhPJzjfQMIojU+ogiBMRMLY6W8jotdYEoZevd9RyrHq7fICBUbH7Dvnc4Um3KT4W5q3nl6xU/he+SC5g068In4728=
X-Received: by 2002:aa7:d592:: with SMTP id r18mr6422418edq.172.1631423823089; 
 Sat, 11 Sep 2021 22:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210912025235.3514761-1-linux@roeck-us.net>
 <CAMo8BfJ8f+4AmBD1B7J9vOp0xQbB=zRW-NyGZP6gTPTA-74OPQ@mail.gmail.com>
 <49f8f332-a964-5b98-64c6-9fa5d028731a@roeck-us.net>
In-Reply-To: <49f8f332-a964-5b98-64c6-9fa5d028731a@roeck-us.net>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 11 Sep 2021 22:16:51 -0700
Message-ID: <CAMo8BfK0+G01bw9UQ=fgGy3fNV+69NwUcpAO3msX0+FU4zKttQ@mail.gmail.com>
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

On Sat, Sep 11, 2021 at 9:02 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/11/21 8:05 PM, Max Filippov wrote:
> > On Sat, Sep 11, 2021 at 7:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> xtensa frame size is larger than the frame size for almost all other
> >> architectures. This results in more than 50 "the frame size of <n> is
> >> larger than 1024 bytes" errors when trying to build xtensa:allmodconfig.
> >>
> >> Increase frame size for xtensa to 1536 bytes to avoid compile errors
> >> due to frame size limits.
> >>
> >> Cc: Chris Zankel <chris@zankel.net>
> >> Cc: Max Filippov <jcmvbkbc@gmail.com>
> >> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> ---
> >>   lib/Kconfig.debug | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> >> index ed4a31e34098..afad11e57d6b 100644
> >> --- a/lib/Kconfig.debug
> >> +++ b/lib/Kconfig.debug
> >> @@ -346,7 +346,7 @@ config FRAME_WARN
> >>          int "Warn for stack frames larger than"
> >>          range 0 8192
> >>          default 2048 if GCC_PLUGIN_LATENT_ENTROPY
> >> -       default 1536 if (!64BIT && PARISC)
> >> +       default 1536 if (!64BIT && (PARISC || XTENSA))
> >>          default 1024 if (!64BIT && !PARISC)
> >
> > Shouldn't that line also be changed to
> >    default 1024 if (!64BIT && !(PARISC || XTENSA))
> > ?
>
> I could do that, but I tested it and it looks like the evaluation
> is top-down, so it didn't seem necessary or useful. For example,
> the default value is 2048 for 32-bit systems (such as arm, riscv32,
> or i386) if GCC_PLUGIN_LATENT_ENTROPY is enabled, even though the
> line with the default of 1024 matches as well.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
