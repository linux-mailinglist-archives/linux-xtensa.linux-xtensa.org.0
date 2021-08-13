Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 333923EAFB4
	for <lists+linux-xtensa@lfdr.de>; Fri, 13 Aug 2021 07:37:20 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id F094665E5;
	Fri, 13 Aug 2021 05:07:50 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by linux-xtensa.org (Postfix) with ESMTPS id 6FAF165E0
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Aug 2021 05:07:44 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id h9so16233131ejs.4
 for <linux-xtensa@linux-xtensa.org>; Thu, 12 Aug 2021 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kbfFIzCXJXm2mb2HL21fYHsJzsbToxStao3lrf8Xu6s=;
 b=RsSxJ35HiHNogTvJHfC/o7Or10a/19DXuVUr9aKlkfAdrL/E8CpzheEeOKgWyoEu1Z
 m5QXB+VZKQSifYBy6s8OyL85N5LK7DyNURyYguM5wkB4twxScIw0zexGnXlYYjjgrKQ0
 BXZolhKgYbABSxKr3YZEAMroumpYhGg2EbAAlu27lpyFOSrj3EWxdEMignmwM/1iqGOs
 psJdgmxtiBUS5O6CJO9GnPa8pxHjJqCRg5G7NqWfwcsF2T9IRTtH5YSo+eV+Jk87rO77
 JUfzyYNOTGptWPD0shv//P6WHY/ZELmU6lEQ7ETlNH8yuAqOSYLA9Oc0hog4jyw+9vZe
 6TPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kbfFIzCXJXm2mb2HL21fYHsJzsbToxStao3lrf8Xu6s=;
 b=WUAkJIvJQ0snfhq5YmHXkj6SmY+H6sHvphSk/a/OEmZ5r1PotJBu0HuvOE5Oy3L55o
 lFifK65h2fkmG1+ljQErIKFE8EDYS/S3AIPmJ9+oX6G10Z/Cxm88TZUXKN1BiiAvFUai
 u5/OYIGWeYtVmAivKei9qfAkM8UX5JrX1T8Det/5Arp4SxifdY1WR2BJFMd28UNfcaYe
 bqADmX06byeGtJ8rKem/YbsYBCxHpAWAsYwfYTW+2HXllhhIjc9fFFEGekC/tV1qHf+4
 8YanEO8o//izZWS+HjcvZSVCb6S8rq8Q6KQ1jklu5CBK9jViBw6BN5Akzy9/LqG0jgOb
 xM/g==
X-Gm-Message-State: AOAM531eSOXdbba6UxudMd24O6F0GiWWiFCEdrtQlHMjCyrZ93F2t26h
 A2W6bXuAt2lFEc/Oxfa4rvVb0vgBgohHaYJkr80=
X-Google-Smtp-Source: ABdhPJzgVjmdjPAB+6bo7s+LzEpblcSMEA5+lydV8hrMyCB6P2Ti2ivVZ0/O9/YwPU2BNNizrVGSMx8i1nIle47EqcA=
X-Received: by 2002:a17:906:5d6:: with SMTP id t22mr811797ejt.98.1628833031203; 
 Thu, 12 Aug 2021 22:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210811163731.186125-1-masahiroy@kernel.org>
 <20210811163731.186125-2-masahiroy@kernel.org>
In-Reply-To: <20210811163731.186125-2-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 12 Aug 2021 22:36:59 -0700
Message-ID: <CAMo8BfJSfxQtDFknb8Zs-DzUMbpB3OCk+02Hq03bGzAJagQ65Q@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 2/4] xtensa: do not build variants
	directory
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
> None of arch/xtensa/variants/*/ has Makefile, so 'buildvar' is always
> empty.
>
> Perhaps, downstream variant code might be dropped in, but given the
> fact that none of upstream variants builds anything in their variant
> directory, I doubt this is needed.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/xtensa/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Thanks, applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
