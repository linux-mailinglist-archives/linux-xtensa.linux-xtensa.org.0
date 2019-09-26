Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id BC783BFAC4
	for <lists+linux-xtensa@lfdr.de>; Thu, 26 Sep 2019 22:53:26 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5BA0A52BF;
	Thu, 26 Sep 2019 20:46:38 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by linux-xtensa.org (Postfix) with ESMTPS id BC02A52BA
 for <linux-xtensa@linux-xtensa.org>; Thu, 26 Sep 2019 20:46:36 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id f1so1172210ybq.11
 for <linux-xtensa@linux-xtensa.org>; Thu, 26 Sep 2019 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJAqwHUoeit82kIXfJFbaFXE1+izLPQNZWxGSOdK2YI=;
 b=heX0bB9Q9d/N/x/6OXBzJq2IJUIjHomYkQbd+DuKWcgwxMIjcCCLYDXN8xo914hoK6
 S3WNiGeyo59/V1PxoRfKDEMiN1LkHTkvjvnaSoyUFF02OdfpuPlT4VwjpLhVxl8Dnk+X
 97omqDtyGK25QC6EROdqvgXgcovlzkMZ0H4jAgkCYHsMLPzr/xwAXfvjhqhYQ79chnls
 Tm87KkAwHdM2zrXtIxAgePr5c5Jh4hIHrrpuVzEWVQ0WGYuAkAIltG45kBq2VzrK4+sX
 YcCOBWuIfxIYfKBmU1lOkA4yphoYJXOGv45n5/pCs3ZRTyxi4VpGwbLi7HYpG6Lqgs0p
 A+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJAqwHUoeit82kIXfJFbaFXE1+izLPQNZWxGSOdK2YI=;
 b=BEZlJfJaw6rQHJJdcPA62JX5aOWHVH4o4aKH7WjXexkdHr2v7nGsBhxL+2FVkIoksD
 R4qjKt2BSA4WSZYrfMWKH9fDTL0i+TzqYMAFfmu9EBGttfI8TPDnSLkEBSZsFmD8TV1M
 YoSceJgFzUCkGSEN0v3T7UHcNQEj6z8Rj43a2HcbfNLF/N2W9j+k+hCr7qilv+PzRhYj
 6Om/l/0/Y78KKggjtkZnC039GXbIdjAg9RO8AyLj3bO5zXY/UwKt9jEvld4MeeZOBHuH
 qCg43j9E8yfSBryyOIQ8430PxJjppcaksPGxGXRCRoveVDFyodmyBe1w7ygACZDER31q
 V8rA==
X-Gm-Message-State: APjAAAW284k91J629jZhAnL7qG72dXHXMdNE8kPYiMT3J5XZ7RqIzvXU
 Y74MkH+e3wLwFleQ8Nw93XisFYeKJLrYGkf8YfM=
X-Google-Smtp-Source: APXvYqytTugZBGGsrCiKC8m55LVsEbnUaY9Vw+yJErtruR4VvjgyMhmH79nB15+eC7/L9Hdy4wiavJpJAL7+u+X63eM=
X-Received: by 2002:a25:911:: with SMTP id 17mr3724538ybj.143.1569531202387;
 Thu, 26 Sep 2019 13:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190925004111.14989-1-jcmvbkbc@gmail.com>
 <CAGSvup-sM7b7_XiGdfUde0ugvJKubWBNU64SFOtM=KQUd2wsZQ@mail.gmail.com>
In-Reply-To: <CAGSvup-sM7b7_XiGdfUde0ugvJKubWBNU64SFOtM=KQUd2wsZQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 26 Sep 2019 13:53:11 -0700
Message-ID: <CAMo8BfJ1SjovYkZpnxa6cE+YDvDpvocfwXvranH3USiunZO82g@mail.gmail.com>
To: "augustine.sterling@gmail.com" <augustine.sterling@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, GCC Patches <gcc-patches@gcc.gnu.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix PR target/91880
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

On Thu, Sep 26, 2019 at 1:42 PM augustine.sterling@gmail.com
<augustine.sterling@gmail.com> wrote:
>
> On Tue, Sep 24, 2019 at 5:41 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> >
> > Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
> > inserted as the first instruction of the function.
> > Insert zero overhead loop instruction into new basic block before the
> > loop when basic block that precedes the loop is empty.
> >
> > 2019-09-24  Max Filippov  <jcmvbkbc@gmail.com>
> > gcc/
> >         * config/xtensa/xtensa.c (hwloop_optimize): Insert zero overhead
> >         loop instruction into new basic block before the loop when basic
> >         block that precedes the loop is empty.
> >
> > gcc/testsuite/
> >         * gcc.target/xtensa/pr91880.c: New test case.
> >         * gcc.target/xtensa/xtensa.exp: New test suite.
> > ---
> >  gcc/config/xtensa/xtensa.c                 |  5 ++--
> >  gcc/testsuite/gcc.target/xtensa/pr91880.c  | 10 ++++++++
> >  gcc/testsuite/gcc.target/xtensa/xtensa.exp | 41 ++++++++++++++++++++++++++++++
> >  3 files changed, 54 insertions(+), 2 deletions(-)
> >  create mode 100644 gcc/testsuite/gcc.target/xtensa/pr91880.c
> >  create mode 100644 gcc/testsuite/gcc.target/xtensa/xtensa.exp
>
> Approved. Thanks.

Thanks. Applied to trunk.
I'll backport it later to gcc-7..9 branches.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
