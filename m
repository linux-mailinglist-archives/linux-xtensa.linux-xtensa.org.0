Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D928F3105EC
	for <lists+linux-xtensa@lfdr.de>; Fri,  5 Feb 2021 08:35:44 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8D988348C;
	Fri,  5 Feb 2021 07:12:38 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by linux-xtensa.org (Postfix) with ESMTPS id F3E282635
 for <linux-xtensa@linux-xtensa.org>; Fri,  5 Feb 2021 07:12:36 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id lg21so10315089ejb.3
 for <linux-xtensa@linux-xtensa.org>; Thu, 04 Feb 2021 23:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wv36x8mtHzmEU9YPki70QUxQfyr8hVegQBKr9eSudfs=;
 b=jfnYXYEvdfI4h7/UWIZHtNkFsQeIwZ0vVf96h7Ea1vEREN7GDyJQjNQTziqsyK93SM
 SrllI6oEXxIdij2KhlPTlOCloXdrV9V3GN68mlUKfHyR2LJNUi7MeQJ5Q+xUucB0Dug3
 7IWh6T+8XVQdN06sCVefljeOC4iw84lxJ/lnMM3/RGswlYicE2Mv2iYHx/9/uQ4h5Pi7
 HWfw8qx9SYrBVGnSDuzry+FMQQaRFE+t9+hfgqr02iH2nxF+eS3Ma0WN+LmVvM81HTe4
 29u+psiO3lmg/kVK/18SINZgUCqAsMN3vfUb3UxyKgLsEtTRxr285NAmrFCTlI0RZy+R
 qWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wv36x8mtHzmEU9YPki70QUxQfyr8hVegQBKr9eSudfs=;
 b=BaZr5kJpTJidm+Y2Mvfl5nJmPvgDkrAjqdZU3O3rYnToBFxR638V7N/lZKcw0zyRAw
 7/fwbLdXatDquiDXJaqWMQPjhhey45awtbRUeFrUxeY6JxQp3da+o7lOW6AkNf1BpTJo
 29SVdsOVYwCgVLxZGZXYiZIIsMpG6+RncO4r0H4Mo7tV07KApAqTlDQfGRQJ8cTnkpG0
 oCdoBaqSMdg2J+qDBH9ASW+XQasqUVN3umLb6NoGzeNB3j9h19CeTbByorGUPISktnUZ
 QFNwv3ZSpprdcvnwj/KE+5lRINAd0R8Nf84akhCRdMQ+a+a0ZYQVwneswrz+Gmt8yRf7
 et7g==
X-Gm-Message-State: AOAM532TJ8lArbVUWhqvCf891Si0s1/TJEwHqczBw/o+g/duoGLOdfWT
 s4l4C9ccAYWiPbSB726n/kj3eeiPWu8nefwDoGc=
X-Google-Smtp-Source: ABdhPJwiJI3Hop+xvVQbRaPOon5GbNAbJYLAlRrdHwA+vovQOBasmWF2Yp4Dn9sup2NiIomv4GSH52Fi+5x0Lse0lcE=
X-Received: by 2002:a17:906:780c:: with SMTP id
 u12mr2807943ejm.125.1612510541275; 
 Thu, 04 Feb 2021 23:35:41 -0800 (PST)
MIME-Version: 1.0
References: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 4 Feb 2021 23:35:29 -0800
Message-ID: <CAMo8BfLXaycXgy-F=TaWzpEZZJKEhbZecxwvBVd6jTo0RJ8atQ@mail.gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-Xtensa] [PATCH] mm/memtest: Add ARCH_USE_MEMTEST
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

On Thu, Feb 4, 2021 at 8:10 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> early_memtest() does not get called from all architectures. Hence enabling
> CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
> option might not trigger the memory pattern tests as would be expected in
> normal circumstances. This situation is misleading.
>
> The change here prevents the above mentioned problem after introducing a
> new config option ARCH_USE_MEMTEST that should be subscribed on platforms
> that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
> Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
> not be tested anyway.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v5.11-rc6 and has been tested on arm64 platform. But
> it has been just build tested on all other platforms.
>
>  arch/arm/Kconfig     | 1 +
>  arch/arm64/Kconfig   | 1 +
>  arch/mips/Kconfig    | 1 +
>  arch/powerpc/Kconfig | 1 +
>  arch/x86/Kconfig     | 1 +
>  arch/xtensa/Kconfig  | 1 +
>  lib/Kconfig.debug    | 9 ++++++++-
>  7 files changed, 14 insertions(+), 1 deletion(-)

Anshuman, entries in arch/*/Konfig files are sorted in alphabetical order,
please keep them that way.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
