Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 04044D37E8
	for <lists+linux-xtensa@lfdr.de>; Fri, 11 Oct 2019 05:35:53 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id DE4476430;
	Fri, 11 Oct 2019 03:28:35 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 697C95823
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Oct 2019 03:28:34 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id 129so2985384ywb.8
 for <linux-xtensa@linux-xtensa.org>; Thu, 10 Oct 2019 20:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OgPaV+qaSMkdCLw3rM07i0HH191EBL2f3oOUwQ7aINM=;
 b=Xk4BT32VWl7rmbedpzjSt5jXZ6YD4Nf9YCauqsxDOhZntTvKg5bpEb0RwAzy4VQMQL
 tlfrsMqcY0JHQAXCXq1ORbpQ5AUUP4m14X8nPaCiH3vSFvTydqmgp69cg/lKPuAoNHC5
 jNL0ADF3se3LDaAQEHYC4/4T5YFmHf9sP/f+5z7VK52bZBBjpEW8dYbZubWDunkCeGbZ
 GpjMunMnDVe+joQv8s74lShKRZBF5901HU+bWB/7jGqTydun6sQFCo/6J9Fn0P3rA9qE
 FsBgquAXoC+peoEcTVVg4+lW2Mn0HYiaGpasCjhtt9nSBGTnAv/l8NbTT4MRLOCul1ER
 axLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OgPaV+qaSMkdCLw3rM07i0HH191EBL2f3oOUwQ7aINM=;
 b=riDv19loiVtpw8VDP+Tgz7LMDmHkuu6n6eQ5k9UMtzXalneRMAmM6UpJy7dEOFrB1u
 Il3ZJ+VD1DBFWDnyiWf30JyZ2ADBpbsNDsYjPnXV+c52Yie94F5GMOHklBvNrJMHASUi
 0/RfYmHz/Cu2SCC3efZgAh7dkTlXspPgqDbD7rYCgWCgdmSuoUGwwENCAvKsVc9jXPM8
 JxWeEjMPHF72xA0i3PPkeRm70DMTPrtZ/xiQ9jwOCYefvRJ0W+lQUPorgkUQLz6Om7Hu
 NiD1M3BhirFwmojsZNh3oWfSVcnazkEGUz3x9PMOZEYONmQ1/CIFtNnHBdljg3JaQtKf
 Gatw==
X-Gm-Message-State: APjAAAU44jSatMHYYllbtQqK3M6llwMP1xv+aGBj1dCQnN9hILsxU5yg
 /ADEvhSd4BrEfuX2NvgGL52rXjTjmkwFZ0pQ2xs=
X-Google-Smtp-Source: APXvYqx3e2s/VJH2fkJJc3gtf+mHISawf0sbgYOGmUSAfyxFrrhUpFi9yXJ4oieBmM3yVFqQsKMZUl/B2rXpoY9JXpc=
X-Received: by 2002:a81:74d4:: with SMTP id p203mr764119ywc.234.1570764950010; 
 Thu, 10 Oct 2019 20:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191009192105.GC26530@ZenIV.linux.org.uk>
 <CAMo8BfKUOmExGRMaUPmcRsy=iyRrguLF6JOLUMegNnzkF9vcvQ@mail.gmail.com>
 <20191010015606.GD26530@ZenIV.linux.org.uk>
 <CAMo8BfLo4hy+WGA7p+7iZaLmmgFOyzMRAtG5dzNj=JEU04GoKA@mail.gmail.com>
 <20191010142956.GG26530@ZenIV.linux.org.uk>
In-Reply-To: <20191010142956.GG26530@ZenIV.linux.org.uk>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 10 Oct 2019 20:35:39 -0700
Message-ID: <CAMo8BfL3j4odehiR8KzHwjohfoBADOhjSjeXFG7AwgBXoXQRTw@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix {get,
	put}_user() for 64bit values
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

On Thu, Oct 10, 2019 at 7:29 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> Hmm...   Looking at __get_user_size(), we have retval = 0; very early
> in it.  So I wonder if it should simply be
> #define __get_user_size(x, ptr, size, retval)                           \
> do {                                                                    \
>         int __cb;                                                       \
>         retval = 0;                                                     \
>         switch (size) {                                                 \
>         case 1: __get_user_asm(x, ptr, retval, 1, "l8ui", __cb);  break;\
>         case 2: __get_user_asm(x, ptr, retval, 2, "l16ui", __cb); break;\
>         case 4: __get_user_asm(x, ptr, retval, 4, "l32i", __cb);  break;\
>         case 8: if (unlikely(__copy_from_user(&x, ptr, 8)) {            \
>                         retval = -EFAULT;                               \
>                         x = 0;                                          \
>                 }                                                       \
>                 break;                                                  \
>         default: (x) = __get_user_bad();                                \
>         }                                                               \
> } while (0)
> so that 64bit case is closer to the others in that respect (i.e. zeroing
> done on failure and out of line).  No?

Ok, I agree.
The intermediate __gu_val in __get_user_[no]check doesn't work well
with some data types used in the kernel, unfortunately. I'll post a series
with what's close to your initial patch on top of rearranged
__get_user_[no]check.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
