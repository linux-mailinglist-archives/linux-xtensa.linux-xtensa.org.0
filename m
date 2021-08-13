Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8C53EB1FC
	for <lists+linux-xtensa@lfdr.de>; Fri, 13 Aug 2021 09:52:07 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 76C876545;
	Fri, 13 Aug 2021 07:22:35 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by linux-xtensa.org (Postfix) with ESMTPS id 8FDF16538
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Aug 2021 07:22:27 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id h9so16778601ejs.4
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Aug 2021 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GK8wq/IOiIxJgDvCUYvsZ+KqziS3kB0R8RP8IZKkltI=;
 b=LdtOhIxb3CQdyFtsCx0t8s7ZbjdhMVfRroj6e9Bu0C5sIfiz3QfG18dDkFFOms71X7
 YzdoijNa4rlLVY35Q8Q9s4USIA8xIwu701vncDGBzNCTS9TmPv5S2gNXY3FjysdKL8Bm
 BfQexaZb9NyOxuE4q+vCMX88srriox7DrdTY68dNcshfDwzcBGveIfAOpXyjtMXwcwyD
 hrzt+SofXy3JYCi0qad59fBxLsVOiC0ebfeig7sY1mIc43y1VmxVWG6xdi8FyUOG4u2g
 yEzYIZ9AqqGAWVS7GcokAufeK3LczPFuW+EfClBOx+45MhjdS3xB+xxh0uIzfavVVzqQ
 JSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GK8wq/IOiIxJgDvCUYvsZ+KqziS3kB0R8RP8IZKkltI=;
 b=KolezvLcVkGNDcIF1EEbc6tvzwDjH7PZ9fs2PmW1dcEDD4pgx+9kDKdNXFvOgaOPOC
 0SPVhi7V6uILEorLosA+pdwDpGE9gqHfZJ42FUKrC+uVhFg6XoMnHL+H9EnCaT5hgKZI
 tlEFkXzutLjdcII8r1Uq+q6lWCchY1oTxjTQippfRFI+2wsL3BL/d/9oImNNxwzbIIIT
 f0/umCjv2CumixYR2MxcqMCbMRtaGQ/x8pll0a8Ak0XF6geu/eb3dA8cb8QWb4wURbG2
 Xn1p75Oq0AIFBVQcFrTMe0WfCjh6qQHcQzuxdjDDMd4Ev6XTMSLAAIcFs6+R0FI3SDiU
 /YvA==
X-Gm-Message-State: AOAM5332bJrJNpIqrL1UUhXp3kVgrITF2CkMRXoKiaMyDQ/HbMt/QM1V
 mrUyCoWyAzNZcrx+ZUU6YFgOKoOmKCc5+kPdiTw=
X-Google-Smtp-Source: ABdhPJwJ5SOLW9apRli3AOrXFL4cVQnh9RqbRN4V3vvm8P4Vzvjl97S95ccpuX4P4FSx16PZBSKVvs7RWqZ+8VFbLCU=
X-Received: by 2002:a17:907:2096:: with SMTP id
 pv22mr1220682ejb.443.1628841114413; 
 Fri, 13 Aug 2021 00:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210811163731.186125-1-masahiroy@kernel.org>
 <20210811163731.186125-4-masahiroy@kernel.org>
 <CAMo8BfJtpUY-FC-cwU5HXSqOSwUwn15kTYWOhx-tsgybPe8mpw@mail.gmail.com>
 <CAK7LNATERCrQc1gDfJTqGNvFPpS3Xyzk9VErQyaj0kvc10oDeA@mail.gmail.com>
In-Reply-To: <CAK7LNATERCrQc1gDfJTqGNvFPpS3Xyzk9VErQyaj0kvc10oDeA@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 13 Aug 2021 00:51:43 -0700
Message-ID: <CAMo8Bf+0r7z=ueD571AFyHphcsb2hB3dLo5wMmLF_ELn8Dm_Qg@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 4/4] xtensa: move core-y in
	arch/xtensa/Makefile to arch/xtensa/Kbuild
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

On Fri, Aug 13, 2021 at 12:10 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Aug 13, 2021 at 2:32 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> >
> > On Wed, Aug 11, 2021 at 9:38 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Use obj-y to clean up Makefile.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  arch/xtensa/Kbuild             | 1 +
> > >  arch/xtensa/Makefile           | 3 ---
> > >  arch/xtensa/platforms/Makefile | 4 ++++
> > >  3 files changed, 5 insertions(+), 3 deletions(-)
> > >  create mode 100644 arch/xtensa/platforms/Makefile
> > >
> > > diff --git a/arch/xtensa/Kbuild b/arch/xtensa/Kbuild
> > > index a4e40e534e6a..fd12f61745ba 100644
> > > --- a/arch/xtensa/Kbuild
> > > +++ b/arch/xtensa/Kbuild
> > > @@ -1 +1,2 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > +obj-y += kernel/ mm/ platforms/ boot/dts/
> > > diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
> > > index 093e87b889be..96714ef7c89e 100644
> > > --- a/arch/xtensa/Makefile
> > > +++ b/arch/xtensa/Makefile
> > > @@ -58,9 +58,6 @@ KBUILD_DEFCONFIG := iss_defconfig
> > >  LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> > >
> > >  head-y         := arch/xtensa/kernel/head.o
> > > -core-y         += arch/xtensa/kernel/ arch/xtensa/mm/
> > > -core-y         += arch/xtensa/platforms/$(platform-y)/
> > > -core-y                 += arch/xtensa/boot/dts/
> > >
> > >  libs-y         += arch/xtensa/lib/ $(LIBGCC)
> > >
> > > diff --git a/arch/xtensa/platforms/Makefile b/arch/xtensa/platforms/Makefile
> > > new file mode 100644
> > > index 000000000000..e2e7e0726979
> > > --- /dev/null
> > > +++ b/arch/xtensa/platforms/Makefile
> > > @@ -0,0 +1,4 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +obj-$(CONFIG_XTENSA_PLATFORM_XT2000)   += xt2000/
> > > +obj-$(CONFIG_XTENSA_PLATFORM_ISS)      += iss/
> > > +obj-$(CONFIG_XTENSA_PLATFORM_XTFPGA)   += xtfpga/
> >
> > With this change platform directory names are duplicated in two
> > makefiles. Can we move them to Kconfig with something like the
> > following (on top of this change)?
>
> I do not like the idea much for the following reasons.

Ok, thanks for the explanation. Applied the original patch to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
