Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DDAA73EAFAD
	for <lists+linux-xtensa@lfdr.de>; Fri, 13 Aug 2021 07:32:47 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 86EBF65DE;
	Fri, 13 Aug 2021 05:03:16 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by linux-xtensa.org (Postfix) with ESMTPS id 23DF865D8
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Aug 2021 05:03:02 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id qk33so16131160ejc.12
 for <linux-xtensa@linux-xtensa.org>; Thu, 12 Aug 2021 22:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SjY0/FqpdDSUzmYDD6o6NUxD8vYkaJFdfIaMbxp4reQ=;
 b=Pom5kFB+D2EtF1yj0MgO35Ntwe7FczYHcIaX7Xgf/ypWo0eEV5SmBEpNDebM3FXl/b
 gLznHtg0E7u58vlgLjBSExfjkqGfMl80GAVfdoWRmC+7iRQ3XFNRKvgH+zfwKlRYr0ug
 5U+4t6lR4VZRtPkjPHxN16aIeXuowoF7AIyKNYAltWh91UoDQxVP5bZtu3y+I5Bb/tV2
 SK9hN16AGRpOHjDuAC/r5Yp2PBCyn10zO2N+7KNC6ACm6CBCcyJfw+NjBxfkMeaNHz0z
 FhdYvqivjRJp3rUeJu1anTWoBajQUaH8ZXH0OWB9WYYKnv63CjXQIu3osh6c2K0+04le
 5arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjY0/FqpdDSUzmYDD6o6NUxD8vYkaJFdfIaMbxp4reQ=;
 b=aXxgf21UdkFpUYMYphKlR1gjdjFBr4kzSx4493cxXUJQulH9TvhAWk5AOI0QkRJLs9
 HoGDt3ErQaJYERYcaGgP0+mBNyL38dzwA6O6Lg0q4cZ8yY1kbtOOckXNUc+LDshPXE+g
 InbFpQd5qQVaweYVol/TakL8a4hBdm/7VsvPbTg/B/YYeAdASQgfBu5u/M0P6qakwugB
 V/9oS1Or9RTcZJDsqtegn6X7RJzPDFjjymGfDkk4TPLddZ76o1RdkemMN3e28PEYYdNJ
 gc4lHheAB0YfW1kXbnJ+hf+DVokKBH9Ym7ffFF+QqVKJqjNQzgkDnrhRAXxLZTHoRaRR
 yeFw==
X-Gm-Message-State: AOAM533BmNgxm25FFJD+eFj9rrVevQIUPpS4Eeq/ImWv+fliHu+NqBoq
 0eLiFKTuZhSpMG8XQ3WFN6usXw6/QDdQJsCalb0=
X-Google-Smtp-Source: ABdhPJz3LzQVh4SrAjmPOjHK2w9471Nj+pCHrjHILeGY4/+wJN/F/TjnuN9g8j+Qc0WpEYuEfUHZ5ilLgNjWOKixwso=
X-Received: by 2002:a17:906:4ad8:: with SMTP id
 u24mr809791ejt.186.1628832748914; 
 Thu, 12 Aug 2021 22:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210811163731.186125-1-masahiroy@kernel.org>
 <20210811163731.186125-4-masahiroy@kernel.org>
In-Reply-To: <20210811163731.186125-4-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 12 Aug 2021 22:32:17 -0700
Message-ID: <CAMo8BfJtpUY-FC-cwU5HXSqOSwUwn15kTYWOhx-tsgybPe8mpw@mail.gmail.com>
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

On Wed, Aug 11, 2021 at 9:38 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Use obj-y to clean up Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/xtensa/Kbuild             | 1 +
>  arch/xtensa/Makefile           | 3 ---
>  arch/xtensa/platforms/Makefile | 4 ++++
>  3 files changed, 5 insertions(+), 3 deletions(-)
>  create mode 100644 arch/xtensa/platforms/Makefile
>
> diff --git a/arch/xtensa/Kbuild b/arch/xtensa/Kbuild
> index a4e40e534e6a..fd12f61745ba 100644
> --- a/arch/xtensa/Kbuild
> +++ b/arch/xtensa/Kbuild
> @@ -1 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-y += kernel/ mm/ platforms/ boot/dts/
> diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
> index 093e87b889be..96714ef7c89e 100644
> --- a/arch/xtensa/Makefile
> +++ b/arch/xtensa/Makefile
> @@ -58,9 +58,6 @@ KBUILD_DEFCONFIG := iss_defconfig
>  LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
>
>  head-y         := arch/xtensa/kernel/head.o
> -core-y         += arch/xtensa/kernel/ arch/xtensa/mm/
> -core-y         += arch/xtensa/platforms/$(platform-y)/
> -core-y                 += arch/xtensa/boot/dts/
>
>  libs-y         += arch/xtensa/lib/ $(LIBGCC)
>
> diff --git a/arch/xtensa/platforms/Makefile b/arch/xtensa/platforms/Makefile
> new file mode 100644
> index 000000000000..e2e7e0726979
> --- /dev/null
> +++ b/arch/xtensa/platforms/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_XTENSA_PLATFORM_XT2000)   += xt2000/
> +obj-$(CONFIG_XTENSA_PLATFORM_ISS)      += iss/
> +obj-$(CONFIG_XTENSA_PLATFORM_XTFPGA)   += xtfpga/

With this change platform directory names are duplicated in two
makefiles. Can we move them to Kconfig with something like the
following (on top of this change)?

---8<---
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index b843902ad9fd..fe5ae5ec71c9 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -314,6 +314,12 @@ config PLATFORM_HAVE_XIP

menu "Platform options"

+config XTENSA_PLATFORM
+       string
+       default iss if XTENSA_PLATFORM_ISS
+       default xt2000 if XTENSA_PLATFORM_XT2000
+       default xtfpga if XTENSA_PLATFORM_XTFPGA
+
choice
       prompt "Xtensa System Type"
       default XTENSA_PLATFORM_ISS
diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
index 96714ef7c89e..6b104ecdd19e 100644
--- a/arch/xtensa/Makefile
+++ b/arch/xtensa/Makefile
@@ -26,12 +26,6 @@ ifneq ($(VARIANT),)
  endif
endif

-# Platform configuration
-
-platform-$(CONFIG_XTENSA_PLATFORM_XT2000)      := xt2000
-platform-$(CONFIG_XTENSA_PLATFORM_ISS)         := iss
-platform-$(CONFIG_XTENSA_PLATFORM_XTFPGA)      := xtfpga
-
# temporarily until string.h is fixed
KBUILD_CFLAGS += -ffreestanding -D__linux__
KBUILD_CFLAGS += -pipe -mlongcalls -mtext-section-literals
@@ -47,7 +41,7 @@ endif
CHECKFLAGS += -D$(if $(CONFIG_CPU_BIG_ENDIAN),__XTENSA_EB__,__XTENSA_EL__)

vardirs := $(patsubst %,arch/xtensa/variants/%/,$(variant-y))
-plfdirs := $(patsubst %,arch/xtensa/platforms/%/,$(platform-y))
+plfdirs := $(patsubst %,arch/xtensa/platforms/%/,$(CONFIG_XTENSA_PLATFORM))

KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)/%include,$(vardirs) $(plfdirs))

diff --git a/arch/xtensa/platforms/Makefile b/arch/xtensa/platforms/Makefile
index e2e7e0726979..08d0e9053db6 100644
--- a/arch/xtensa/platforms/Makefile
+++ b/arch/xtensa/platforms/Makefile
@@ -1,4 +1,2 @@
# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_XTENSA_PLATFORM_XT2000)   += xt2000/
-obj-$(CONFIG_XTENSA_PLATFORM_ISS)      += iss/
-obj-$(CONFIG_XTENSA_PLATFORM_XTFPGA)   += xtfpga/
+obj-y += $(CONFIG_XTENSA_PLATFORM)/

---8<---

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
