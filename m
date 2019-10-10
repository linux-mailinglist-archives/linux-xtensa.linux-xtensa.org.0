Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id EF151D1E10
	for <lists+linux-xtensa@lfdr.de>; Thu, 10 Oct 2019 03:38:26 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3D44164E8;
	Thu, 10 Oct 2019 01:31:12 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 7BC7E64E2
 for <linux-xtensa@linux-xtensa.org>; Thu, 10 Oct 2019 01:31:10 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id s7so1404620ybq.7
 for <linux-xtensa@linux-xtensa.org>; Wed, 09 Oct 2019 18:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UFJYsUva5FRhcAbZsdQcSuIVXzC9BSS6Ql6F/47Wmsk=;
 b=cvXsAm1qlmc+Kbv8i7YhK9zObTtu1ly7yMvlUxQMutSbYVH95MgCajf07z+x+zufvJ
 agz6VDwepjFNpv0zWKXH1nYHgoOgA+JmuYf63UOHiqz8yowM+06edu7A8w+EWHGDJcC3
 4/JCFGwNqfNV8Z5rt+xsZVoLuslm2q1AMNPPeofdPgphamXuUaIZAKOZXkvnaRi2XIaU
 f0+WcyTD0LVRdG4VnbNCpnmyhyVOPDkWYhCdLGB7hGP4PgsbAuz9ZwQ7/yAfaOpyL7VF
 jZKlHGYStG7dboM/75SjdMtz1mNsq3C3npFYuxO3IQlg+qxZCbFXtXfAV6a5IVUwppxn
 ZGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFJYsUva5FRhcAbZsdQcSuIVXzC9BSS6Ql6F/47Wmsk=;
 b=HccMWWyqITA4dwQ8wfQPHTQGvQNuSvSpSZ65HdXMACHLtoG+W6MOp/bVUl9i2yZOzo
 0wYi9j6LFMJ2nDDmIXIcds5ksiLJMmbXJcGZPJ3i/WwAUCDt4LeEIxpHi9WDRyk4Eqd1
 +b43rcSZbEdo4D+Gb7gjNONvwTlavTzOj1EZykQce7B0E2kwtED7qyWKfV+OZsVtYNMb
 sq9zzjfzKsmyDx9nvLuprouP18GJ4o+2G1S/AyWmMNXs34UOr9/q4XjxfNlUAmfoD1Bu
 pwOj9B2i4QNMYwirh3g31h6NbHz2pUZKmgJEYI3wvpfWtm6w5++l4KiZUtO5awnb+HOD
 ie6w==
X-Gm-Message-State: APjAAAW80fpLPm681lQh6Pj9MnBdLmpnFVnyFgJLiSTSgVxv3o+m9/UL
 acJXCOhUdviAOzBas/dbfLLMk3l5Unl4VzZzq2M=
X-Google-Smtp-Source: APXvYqy5qQm96zZkZ//ly0S8Fu08YzPKTdph55FfVXIY19+1yN1kD1nrf2mh/IACpgkcsDp8rZx4QM+4gtNJMtIXviI=
X-Received: by 2002:a5b:d50:: with SMTP id f16mr3995164ybr.25.1570671503860;
 Wed, 09 Oct 2019 18:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191009192105.GC26530@ZenIV.linux.org.uk>
In-Reply-To: <20191009192105.GC26530@ZenIV.linux.org.uk>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 9 Oct 2019 18:38:12 -0700
Message-ID: <CAMo8BfKUOmExGRMaUPmcRsy=iyRrguLF6JOLUMegNnzkF9vcvQ@mail.gmail.com>
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

On Wed, Oct 9, 2019 at 12:21 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> First of all, on short copies __copy_{to,from}_user() return the amount
> of bytes left uncopied, *not* -EFAULT.  get_user() and put_user() are
> expected to return -EFAULT on failure.
>
> Another problem is get_user(v32, (__u64 __user *)p); that should
> fetch 64bit value and the assign it to v32, truncating it in process.
> Current code, OTOH, reads 8 bytes of data and stores them at the
> address of v32, stomping on the 4 bytes that follow v32 itself.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> --
> diff --git a/arch/xtensa/include/asm/uaccess.h b/arch/xtensa/include/asm/uaccess.h
> index 6792928ba84a..155174ddb7ae 100644
> --- a/arch/xtensa/include/asm/uaccess.h
> +++ b/arch/xtensa/include/asm/uaccess.h
> @@ -100,7 +100,7 @@ do {                                                                        \
>         case 4: __put_user_asm(x, ptr, retval, 4, "s32i", __cb); break; \
>         case 8: {                                                       \
>                      __typeof__(*ptr) __v64 = x;                        \
> -                    retval = __copy_to_user(ptr, &__v64, 8);           \
> +                    retval = __copy_to_user(ptr, &__v64, 8) ? -EFAULT : 0;     \

Sure, I agree with that.

>                      break;                                             \
>                 }                                                       \
>         default: __put_user_bad();                                      \
> @@ -198,7 +198,12 @@ do {                                                                       \
>         case 1: __get_user_asm(x, ptr, retval, 1, "l8ui", __cb);  break;\
>         case 2: __get_user_asm(x, ptr, retval, 2, "l16ui", __cb); break;\
>         case 4: __get_user_asm(x, ptr, retval, 4, "l32i", __cb);  break;\
> -       case 8: retval = __copy_from_user(&x, ptr, 8);    break;        \
> +       case 8: {                                                       \
> +               __u64 __x = 0;                                          \
> +               retval = __copy_from_user(&__x, ptr, 8) ? -EFAULT : 0;  \
> +               (x) = *(__force __typeof__(*(ptr)) *) &__x;             \
> +               break;                                                  \
> +       }                                                               \

There's also the following code in the callers of this macro, e.g. in
__get_user_nocheck:

        long __gu_err, __gu_val;                                \
        __get_user_size(__gu_val, (ptr), (size), __gu_err);     \
        (x) = (__force __typeof__(*(ptr)))__gu_val;             \

the last line is important for sizes 1..4, because it takes care of
sign extension of the value loaded by the assembly.
At the same time the first line doesn't make sense for the size 8
as it will result in value truncation.

How about the following change instead:

diff --git a/arch/xtensa/include/asm/uaccess.h
b/arch/xtensa/include/asm/uaccess.h
index 6792928ba84a..c54893651d69 100644
--- a/arch/xtensa/include/asm/uaccess.h
+++ b/arch/xtensa/include/asm/uaccess.h
@@ -100,7 +100,7 @@ do {
                         \
        case 4: __put_user_asm(x, ptr, retval, 4, "s32i", __cb); break; \
        case 8: {                                                       \
                     __typeof__(*ptr) __v64 = x;                        \
-                    retval = __copy_to_user(ptr, &__v64, 8);           \
+                    retval = __copy_to_user(ptr, &__v64, 8) ? -EFAULT
: 0;     \
                     break;                                             \
                }                                                       \
        default: __put_user_bad();                                      \
@@ -172,7 +172,8 @@ __asm__ __volatile__(
         \

 #define __get_user_nocheck(x, ptr, size)                       \
 ({                                                             \
-       long __gu_err, __gu_val;                                \
+       long __gu_err;                                          \
+       __typeof__(*(ptr) + 0) __gu_val;                        \
        __get_user_size(__gu_val, (ptr), (size), __gu_err);     \
        (x) = (__force __typeof__(*(ptr)))__gu_val;             \
        __gu_err;                                               \
@@ -180,7 +181,8 @@ __asm__ __volatile__(
         \

 #define __get_user_check(x, ptr, size)                                 \
 ({                                                                     \
-       long __gu_err = -EFAULT, __gu_val = 0;                          \
+       long __gu_err = -EFAULT;                                        \
+       __typeof__(*(ptr) + 0) __gu_val = 0;                            \
        const __typeof__(*(ptr)) *__gu_addr = (ptr);                    \
        if (access_ok(__gu_addr, size))                 \
                __get_user_size(__gu_val, __gu_addr, (size), __gu_err); \
@@ -198,7 +200,7 @@ do {
                         \
        case 1: __get_user_asm(x, ptr, retval, 1, "l8ui", __cb);  break;\
        case 2: __get_user_asm(x, ptr, retval, 2, "l16ui", __cb); break;\
        case 4: __get_user_asm(x, ptr, retval, 4, "l32i", __cb);  break;\
-       case 8: retval = __copy_from_user(&x, ptr, 8);    break;        \
+       case 8: retval = __copy_from_user(&x, ptr, 8) ? -EFAULT : 0;
 break;  \
        default: (x) = __get_user_bad();                                \
        }                                                               \
 } while (0)

Here __typeof__(*(ptr) + 0) makes enough room for all cases
in the __get_user_size and the "+0" part takes care of pointers
to const data.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
