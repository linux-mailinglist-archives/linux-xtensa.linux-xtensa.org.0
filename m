Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B15073DDEE2
	for <lists+linux-xtensa@lfdr.de>; Mon,  2 Aug 2021 20:04:13 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id C3AF6655B;
	Mon,  2 Aug 2021 17:35:06 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by linux-xtensa.org (Postfix) with ESMTPS id 614FC6545
 for <linux-xtensa@linux-xtensa.org>; Mon,  2 Aug 2021 17:35:04 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id yk17so24557318ejb.11
 for <linux-xtensa@linux-xtensa.org>; Mon, 02 Aug 2021 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KpOmQ9FDFdEDp1DRxCOS4/jNxSUC+b7VQifrd/M4FUE=;
 b=bllfssUh1l3Cfof1I9S9zG5MovjfwF9CypWcpRvDmWpOEx759rPpO8GjtwWqnstMf2
 1QwJGh+kGvZKoMFQKf6FhnPOMkpo3JEJzP0z2jokepgekez40su6FDqDQO76azQW4aaY
 ndpMqrh8QhqQUbO9PB7UVTzGgkGjnuiB8BDrnOUlo6IfpOOOD5wRbVnNH3nzFEb8Jlvv
 f2sHv6d82OwwrINjEhGy7L8YhBy8Uq7x29x9aN5cqnZAFpZ+YseiNvbNJLRthMaSdJt+
 GNYBQGlDLHbH2bDQodG8T6OzjQiYO36wOgJ2MGUlCkSsxnL4jcZpqW+jXXGFabstpv3T
 roTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KpOmQ9FDFdEDp1DRxCOS4/jNxSUC+b7VQifrd/M4FUE=;
 b=UZ72CbH3Ay67gWHn8TolopzobKfm/r7arbo2B8F/fsqf/fdv2gR8H2LgRvneNpjUYk
 nKTmzKdz9UlC8O8Z8NASxnGqYlbvbQu5eNuULowQWnMz9ibIw+iHm2ajxEFdjCSCRA+v
 CYQyiZ5HiaW7ryV/3vTN6nYvJ8YvXGa+ijngweytS4VDnqBgrJAfvgVIGQmHwjIbpV4R
 Gcd/KKltfW+LNDHTaH4dZ8REKGLKv8T3yMO/aH74+ifp2CVtLEnIDZC+jvU9umTGJo8r
 QDx6DTx1hYDQSpUH68cNwYGahc1sGC/lauGnN1EMbdF//qNHnEY2vG+aQUoNGFZFPwGv
 aaLA==
X-Gm-Message-State: AOAM5301EpvKttRlM2yRv3lNxOYQNY+znMv3/K0dxD2PgJm8nrPxTMEZ
 +gINQCF6LbJTfKN/h7FTfXbzJmQhINXzLCnav50=
X-Google-Smtp-Source: ABdhPJx4CTYoE1N/7r5r3Yv59NCnUgpiXyVEWPBrQR2H8OPpQmdyOckhCi7flWDeCgEu3pc8T6+GCYt+gQKqcxApyio=
X-Received: by 2002:a17:906:34da:: with SMTP id
 h26mr16470323ejb.376.1627927449046; 
 Mon, 02 Aug 2021 11:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 2 Aug 2021 11:03:57 -0700
Message-ID: <CAMo8BfLDjw71xiCDo8uk4pQFuOzqAoak0k3R4YJDnRsA2hoCtw@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 YiFei Zhu <yifeifz2@illinois.edu>, Richard Weinberger <richard@nod.at>,
 Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Stafford Horne <shorne@gmail.com>, linux-snps-arc@lists.infradead.org,
 Jeff Dike <jdike@addtoit.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mips@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH 2/3] trace: refactor
	TRACE_IRQFLAGS_SUPPORT in Kconfig
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

On Fri, Jul 30, 2021 at 10:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  arch/xtensa/Kconfig           | 4 +---

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
