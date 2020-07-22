Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B4FD4228EDA
	for <lists+linux-xtensa@lfdr.de>; Wed, 22 Jul 2020 06:00:50 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id C80954241;
	Wed, 22 Jul 2020 03:44:25 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 980082D7F
 for <linux-xtensa@linux-xtensa.org>; Wed, 22 Jul 2020 03:44:24 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id q17so302310pls.9
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 21:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xa3ZZYGnoP85/3zV1lZZil7QKFpmT3uyhbiDkzmb3pw=;
 b=d7qkkZzBvWH2EGTJl6d/xeU0OZVDjSrLJ0nJ9h+STGVXGF2EOVqbTk7CSjMjiON26V
 M0LwvjihL4Vm/tB7kntykC0gcYIEyVe4rJ+F4xJN7YKkmJ9pIZQ6WV8ABzM0AjYgNMSu
 /pSoTz+NB+wDP/hvAhMUfF3f+yh5RPf6Q6z3NYGDWAa/ruh7OkmiToFTCAcxl3AdZ2AR
 V7lBXEDYIeMkNe6eTzGsTfWP+LEgeSuFVXA4wr2BO40XXyyQgK8ZsILcysIJePJCb7Wq
 PA3492XWoXkhab/RVxAyvIcbXxc1NezI07/4N5tVAah3lUxgpE9pNLJuVwBG12azvHfi
 nqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xa3ZZYGnoP85/3zV1lZZil7QKFpmT3uyhbiDkzmb3pw=;
 b=RTrn+0e0j+XqFiekuPkbu+z31S7wEhj4PNyvEqnzSqoH0Kg6/GFfjOdPUuUxwhtKgN
 7TyPQ6bSF48YYSCKq7XZhoNjism2WtnyH4d35d7kkrVcLfYAyxod2rL5bXNBsX1tllf/
 +DM1yeykfZjHzbp8Lg+p8wJEnpjd1CSNdOHimTJcx4xSbm+2JWSp0LIHRnes531+tzA0
 tywkwSfjaHhnjzNeFPDWSdNFwj9Kg0waqSZqMEInEXW9Vyp6umIrMLaz8+16M21Had5z
 IH7UqJHj2Vpu/ksNVn+s67Vv6wlx0kN1dARvGDGMvDd38XEY99AYzERciXJStLEwQM/z
 6tfQ==
X-Gm-Message-State: AOAM532Kj1KWR/rIma1AdlUipoBIWyt2t9/4/6Vi+p145YDf16WWUEBz
 wWpYDFGu6vZZ2b4GwpXC0vR8+985TdLcQHFCnA0C1g==
X-Google-Smtp-Source: ABdhPJxMnoMbokZoyYXBiE1wvxWIhZnR0lnPeJYdNlzCOuI35DjncY/cX4KxwfkPDilk9thENiU4THsQoZzGthKL3D4=
X-Received: by 2002:a17:90a:20e9:: with SMTP id
 f96mr8129677pjg.13.1595390448025; 
 Tue, 21 Jul 2020 21:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200721093748.26627-1-jcmvbkbc@gmail.com>
 <CAK7LNARtTZD5x3CYLVj48dwC9n7Z4kMx1gCLq3aD2_OfQKuXnA@mail.gmail.com>
In-Reply-To: <CAK7LNARtTZD5x3CYLVj48dwC9n7Z4kMx1gCLq3aD2_OfQKuXnA@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 21 Jul 2020 21:00:37 -0700
Message-ID: <CAMo8BfKS=nJi_BdOCYTzRutKBSHwZ8ZNOuk=+ZGD_mi6zwJ=Bw@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH v2] xtensa: add boot subdirectories
	targets to extra-y
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

On Tue, Jul 21, 2020 at 5:53 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Tue, Jul 21, 2020 at 6:37 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > The commit 8fe87a92f262 ("kbuild: always create directories of targets")
> > exposed an issue in the xtensa makefiles that results in the following
> > build error in a clean directory:
>
> But, we need to fix this in the kbuild tree
> to retain the bisectability.
>
> I will insert the following before the offending commit.
> https://patchwork.kernel.org/patch/11676883/
>
> I used 'targets' instead of 'extra-y'
> because they are built on demand
> while building the final boot image.

Sure, please go ahead with your version.
Thank you for taking care of it.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
