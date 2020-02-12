Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 138F515A490
	for <lists+linux-xtensa@lfdr.de>; Wed, 12 Feb 2020 10:23:53 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 48B0F3A81;
	Wed, 12 Feb 2020 09:12:42 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 3CD882631
 for <linux-xtensa@linux-xtensa.org>; Wed, 12 Feb 2020 09:12:40 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j7so746548plt.1
 for <linux-xtensa@linux-xtensa.org>; Wed, 12 Feb 2020 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sDe1AgAtZMTBswle0D6FGWKTb7hbTE9PCf3WEVHRGts=;
 b=NTmZWD45lEPn6L7REaUGWdMZAGXUIsVeAXTcDm09kMdQPRZkDnK1ZnJiAxj8cH8tFz
 g2xSmoyEdJdU7x1X/DgPqY9ERd8rMB+Aftc4CKnB4nUfUSkB73us/ujbjCiEhZUT2HxJ
 zBhjq6QYgtWoT+Gip38EWBgPkVbrMcT6Tj3+YZ23iIZzdKSkDo9g5WCj3tnR0ISuGbhJ
 cUC7DpE3d8+6UxrBQXIe312wuKs5guDtoWhid3vJfpP2Gzh0N0CZyrCojASPbY9pRvq6
 2Zh5QNldMzhDsdJxitNi88nCyBmmWgX5WF5D5x/NX9Y5G++ggIYBAGfPkiIVguw8H03M
 2gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDe1AgAtZMTBswle0D6FGWKTb7hbTE9PCf3WEVHRGts=;
 b=sk85a0m/R2DIErW2Br1a6/cRiokUze4t9Cwbp9XQw+IlRuve9aNABavIjDVwiWkrKp
 7YuHhsC7A7Tut6IMwCPKrS0xoMfQUTnxG+oOmdfmTeOnPPCakLtoGMo+zlvCRxUB4guh
 Eo4AOkvrksfqQF4IiXOIaFR9uaa+gOlQQTnYCqFTWMzPL2dFrs4+QXnGdSjSWyozy2IG
 iw1fD6OTVbGTamWV8nO7+01EhUa0+VQlpcOHUPxae8JnZ+vwcElePZ5cyEyqidQeG1QQ
 vZeb1AehM9poeLROEmKHpEkHhEwtxtx5tDx0ewWAUB3M3Ba2U0ltS1tVGUI/C2MgIU2k
 KNVw==
X-Gm-Message-State: APjAAAXOkjAyrmzPJ03BTeKirsvZVc3u5BdB7sFOAHdD5HNlsAgHF4Fs
 PwLnkrT+NsZtKPsjaMsEHHoHDi2eN+mJydKof9U=
X-Google-Smtp-Source: APXvYqyZ4tXa/Bz1TU2WB8Qw8s2ub4TYrIldIrHS/DRv6Hw7VztBunHuynb35UMhAgrhnK6n/IvcD4LLg/cdxO9Jwbc=
X-Received: by 2002:a17:902:a588:: with SMTP id
 az8mr7671909plb.123.1581499429334; 
 Wed, 12 Feb 2020 01:23:49 -0800 (PST)
MIME-Version: 1.0
References: <dcdd615f77dacf8a98e18950b66fb5a675277f38.1581498987.git.michal.simek@xilinx.com>
In-Reply-To: <dcdd615f77dacf8a98e18950b66fb5a675277f38.1581498987.git.michal.simek@xilinx.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 12 Feb 2020 01:23:38 -0800
Message-ID: <CAMo8BfLYM-_SbqmMUCVjwqL7MpA2W7toTg_F6HTY4Sg5QxGzfw@mail.gmail.com>
To: Michal Simek <michal.simek@xilinx.com>
Cc: Rich Felker <dalias@libc.org>,
 "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 Stefan Asserhall <stefan.asserhall@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, git@xilinx.com,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-Xtensa] [PATCH v2] asm-generic: Fix unistd_32.h
	generation format
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

On Wed, Feb 12, 2020 at 1:16 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> Generated files are also checked by sparse that's why add newline
> to remove sparse (C=1) warning.
>
> The issue was found on Microblaze and reported like this:
> ./arch/microblaze/include/generated/uapi/asm/unistd_32.h:438:45:
> warning: no newline at end of file
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Reviewed-by: Stefan Asserhall <stefan.asserhall@xilinx.com>
> ---
>
> Changes in v2:
> - Update also others archs not just microblaze - Arnd
> - Align subject and description to match multiarch chagne
>
>  arch/alpha/kernel/syscalls/syscallhdr.sh      | 1 +
>  arch/ia64/kernel/syscalls/syscallhdr.sh       | 1 +
>  arch/m68k/kernel/syscalls/syscallhdr.sh       | 1 +
>  arch/microblaze/kernel/syscalls/syscallhdr.sh | 1 +
>  arch/parisc/kernel/syscalls/syscallhdr.sh     | 1 +
>  arch/sh/kernel/syscalls/syscallhdr.sh         | 1 +
>  arch/sparc/kernel/syscalls/syscallhdr.sh      | 1 +
>  arch/xtensa/kernel/syscalls/syscallhdr.sh     | 1 +
>  8 files changed, 8 insertions(+)

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

...

> diff --git a/arch/m68k/kernel/syscalls/syscallhdr.sh b/arch/m68k/kernel/syscalls/syscallhdr.sh
> index 6f357d68ef44..8ac15be01ac2 100644
> --- a/arch/m68k/kernel/syscalls/syscallhdr.sh
> +++ b/arch/m68k/kernel/syscalls/syscallhdr.sh
> @@ -33,4 +33,5 @@ grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
>         printf "#endif\n"
>         printf "\n"
>         printf "#endif /* %s */\n" "${fileguard}"

Here there's already \n at the end, so no need for another one?

> +       printf "\n"
>  ) > "$out"

...

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
