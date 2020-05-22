Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id CD9BE1DF1E4
	for <lists+linux-xtensa@lfdr.de>; Sat, 23 May 2020 00:35:48 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 87B2B64EB;
	Fri, 22 May 2020 22:21:29 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by linux-xtensa.org (Postfix) with ESMTPS id DD06064C3
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 22:21:27 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w20so647213pga.6
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 15:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6S4JNYMJWRAwO/i7PXs3hCIkg0U+E9CuPFrfo6fBoo=;
 b=jaWOyASn27zgR8XbAGwLWXsStS+E4f55phNrI7PCbknABMvSIQwrLoglZtD1+GwC4m
 JJU6/Z8yVQYKvkKmWGAH4N4lJKhEthUDt6ht/BfxrP66LCHgaPn/GTSYhCdwI8zg5POT
 ZQqIwVGUV46lAWvZlZlGX0kbzBReDr4j9rNxNmftvcte3GF0dhnr/sIu3e+QAGRtaJYa
 Bgezz0PsR1fakDp/Of5CuXKqpfjbt5yE6MhAvMzSj8/7e4QV4WoD2xX+oBpI6Jv2975L
 W1M2WNocPL+CJULkztSjY/xeL2uAdK0fnD2lH5YlkyqoXirE92ANf3mSWY+V0amlg5sf
 AVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6S4JNYMJWRAwO/i7PXs3hCIkg0U+E9CuPFrfo6fBoo=;
 b=LF5tIHUKGgoRHLkyx4TDeAvebabTHtVNsyKWARjEWb8q8ul5Ns5w3pVTNENEIf6Zdi
 hliT+uZDIGrGpoQOaAL3jddtM3LvomqhK+ege9Tu+f8AFmi6kjtfCS0ryUY3wD3n/RD+
 ziMlxMupA722lB618DZI4ROqG+JsUEMUJO2123w4lf5q1ztNAbiXRNgHbJzjCmmTBFtQ
 bYEsmsz/iVQHdcQz1Es4Fz/liT6jMszvcbMvoTmk9rwm+OfHZs97VjqvLqd0ZzxyeTu0
 c+c5Z3BDaaQ2VXr0rpwOJvTJiEBSPKUBn4FJgJcDz3T63jnrVDwnfi7yoL7JbUBln5jV
 09Yg==
X-Gm-Message-State: AOAM532yvgW3ovvodjUkR7YpfXP4uvKAEx7GJoTpmqX1uZzGr+zpDxD/
 Pi7xTKAjKvDy69lqOvPAeDvIjSpekRLS1RDD5Cw=
X-Google-Smtp-Source: ABdhPJyg5RUevHsGRTxGQ2U4Uy3JBWUfYrLcfXGTdfqNZfhjZfYLYu6K5/NtZux+J297Fu5Vas2ZcsLAsXie/cSO9Qg=
X-Received: by 2002:a63:6e8a:: with SMTP id
 j132mr13824373pgc.301.1590186945084; 
 Fri, 22 May 2020 15:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200522214153.30163-1-jcmvbkbc@gmail.com>
 <20200522215814.GW23230@ZenIV.linux.org.uk>
In-Reply-To: <20200522215814.GW23230@ZenIV.linux.org.uk>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 22 May 2020 15:35:34 -0700
Message-ID: <CAMo8BfJrxt2_Zr4w2=ebfEhsXeZbJ0yUb+i57ELSjnZd=7383g@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-Xtensa] [PATCH 0/3] xtensa: clean up __user annotations
	in asm/uaccess.h
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

On Fri, May 22, 2020 at 2:58 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Fri, May 22, 2020 at 02:41:50PM -0700, Max Filippov wrote:
> Useful test:
>
> void __user *f(void __user * __user *p)
> {
>         void __user *q;
>         (void)get_user(q, p);
>         return q;
> }

I think this change passes this test, i.e. originally reported warning
does not show up.
There's other kind of warning that it triggers:  'Using plain integer
as NULL pointer',
I'll post an updated version that fixes that as well.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
