Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5AC33A52F
	for <lists+linux-xtensa@lfdr.de>; Sun, 14 Mar 2021 15:33:43 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3FF4B5842;
	Sun, 14 Mar 2021 14:09:26 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by linux-xtensa.org (Postfix) with ESMTPS id 3B847582B
 for <linux-xtensa@linux-xtensa.org>; Sun, 14 Mar 2021 14:09:25 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id r17so61967807ejy.13
 for <linux-xtensa@linux-xtensa.org>; Sun, 14 Mar 2021 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqQ7BWzs0leRC0mvm+I19KmZ7oC1YUe+0V+fLsVPHow=;
 b=CSqz1Z+qhr2AFvmFjC2pnfSPNn4YcayScF73cKhnFjoiESI4H+ihCQr9X4JAk2tHvh
 HwvYxw0zVuF2286U4yb7e/rNkfPyyh5jcp+cQXpRZ/Dqd4SWK6NFvptIiI7zTfKtuFSk
 91zBhOilifSO/aMEbkC5KrLlv35RcCH/KoSyNgKN2G+jmU+PzVoRbaYUnNwA/1J/AoIg
 nFmZUCe/wSecZ1ehh9TB5ZbCEzzOMlyNgjILB3/+sXGd2yxJRtu58oEBoSiKbp2oUHRh
 jdrKaT0mSuM1TxK/rh0KtrIrT4teSq3cE1RNoIKThzY/lenYGrZndZJnABo1CA5D1zy6
 bwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqQ7BWzs0leRC0mvm+I19KmZ7oC1YUe+0V+fLsVPHow=;
 b=grpn84eeNDkfbJrdbQYQmnBTFo/8fYS2Bq3GNnyYALFoqjnwBpTJ3m4ekk1t1gmf9b
 3bx54i01rlK5xAAiJZ4u2H/Ta1SpzrLG6sBX45Nm1XgUDIex1hbuy8V9A1ffqnK+/IfG
 f8JduNyhAK2Ju6xKq/As7tNWEWdNRuk9uQmiKePBVBdLoczcVnXPVxJKnwGWJBtK0UAY
 46bjsnqllDCqRozB4QVSTk+3md1aAMZoFaU/tOWBNuXGa/VL8/KuGkqa7hpsg2+k57Nc
 dZmxqF2106tU8zdbX7ZBL+OEo9VinV4N9B4mSBe1B4KewXjW/AoKAfQH3lc5MVmTUHid
 VOng==
X-Gm-Message-State: AOAM531j0eMvNRjFMNkK9KO8Jn9tFSR1AYVDZgpnuvhgJ5z4oR1YQJBh
 HBZolPZQP+w/aOd40883LFjzsCblwK8JXORyVfo=
X-Google-Smtp-Source: ABdhPJxgGpA4SfB0YnHTM5E9/RJ2E0gGVR8MoYLaLsEHXVfngatbugIpVyhG/nUF/Q3gN4JCE304QL+rkork6p0xCfs=
X-Received: by 2002:a17:906:7150:: with SMTP id
 z16mr18515701ejj.103.1615732419947; 
 Sun, 14 Mar 2021 07:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210313122342.69995-1-masahiroy@kernel.org>
In-Reply-To: <20210313122342.69995-1-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 14 Mar 2021 07:33:28 -0700
Message-ID: <CAMo8Bf+4qs9O8XhCtbmNP22esuzXuxu3HRWtQbgOWX=hdTSrmQ@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH v2 1/2] xtensa: move CONFIG_CPU_*_ENDIAN
	defines to Kconfig
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

On Sat, Mar 13, 2021 at 4:24 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
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
>
> Changes in v2:
>  - more cleanups
>
>  arch/xtensa/Kconfig                    | 6 ++++++
>  arch/xtensa/Makefile                   | 9 +--------
>  arch/xtensa/boot/Makefile              | 4 ----
>  arch/xtensa/boot/boot-elf/Makefile     | 6 +-----
>  arch/xtensa/boot/boot-redboot/Makefile | 6 +-----
>  5 files changed, 9 insertions(+), 22 deletions(-)

Thanks. I've made one change and applied both patches to my xtensa tree.

[...]

> diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
> index cf0940708702..f43c731dec89 100644
> --- a/arch/xtensa/Makefile
> +++ b/arch/xtensa/Makefile
> @@ -52,14 +52,7 @@ ifneq ($(CONFIG_LD_NO_RELAX),)
>  KBUILD_LDFLAGS := --no-relax
>  endif
>
> -ifeq ($(shell echo __XTENSA_EB__ | $(CC) -E - | grep -v "\#"),1)
> -CHECKFLAGS += -D__XTENSA_EB__
> -KBUILD_CPPFLAGS += -DCONFIG_CPU_BIG_ENDIAN
> -endif
> -ifeq ($(shell echo __XTENSA_EL__ | $(CC) -E - | grep -v "\#"),1)
> -CHECKFLAGS += -D__XTENSA_EL__
> -KBUILD_CPPFLAGS += -DCONFIG_CPU_LITTLE_ENDIAN
> -endif
> +CHECKFLAGS += -D $(if $(CONFIG_CPU_BIG_ENDIAN),__XTENSA_EB__,__XTENSA_EL__)

I've removed the space between -D and the $(if ...) to make the result
look like the rest of -D options.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
