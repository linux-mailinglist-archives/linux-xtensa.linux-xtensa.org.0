Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC3A4ADD3
	for <lists+linux-xtensa@lfdr.de>; Wed, 19 Jun 2019 00:23:58 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id A1C6B64CB;
	Tue, 18 Jun 2019 22:20:44 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 by linux-xtensa.org (Postfix) with ESMTPS id 5BE5E64C0
 for <linux-xtensa@linux-xtensa.org>; Tue, 18 Jun 2019 22:20:42 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id k128so7423785ywf.2
 for <linux-xtensa@linux-xtensa.org>; Tue, 18 Jun 2019 15:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lblnjD8yKxjblXQJpvE8hIHPuogt1K2Mmlgr/5+atTY=;
 b=qS2+l1XFU59Fk0nEg8XNz49InCLjrnlaF1CmU6iwQKLFpc49JI0PinvI0EJVvddD4C
 nBuHwJKIYts9Wr8evAYrUiBoW4fhlsMPxZz/1Qu1qZcUcRptrHaEnpp53wNA0Ka3K/A6
 0gyIWqDewVEMqH5vJto4GbEIYpX0LupyolP9svPcPKoTYVojK3XfI+BKN66sVgmudUAA
 38HM96oH05NTRHbJyd2D7eUqxcoj9WVr5OUiyYYjDR3DuC1wf6q8wBgx/dmEdB2/VYWk
 cobBbEcs8SlvDij4wI43iEo9kZIT+CY4O5Gxr9xwgjMfVWgyJNkHmfzCH+APcGKZy/+T
 bfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lblnjD8yKxjblXQJpvE8hIHPuogt1K2Mmlgr/5+atTY=;
 b=HHg6/8mDYar+xl3tCQZOaMuvrdTWv8REH8hBMjQg5y7yei0KFu+V1h1sBEvUG4Y9j3
 iiN6s+rFZAcWPfD3ssxXoK4V9WyfZVZzSOQvYf/2zUIOQ9QQsxyeKt3LFneNx9mjLerg
 FfCzO05mJcdCcri5hyir5FbFaDoN2B+LYqeCvoB+ltmJ1BOqWKIGpCX49txSxUJqIcvX
 wDqi/PzMbRDEBq3qjFaFC/u/bP+erChpIhxS8GYS57L51PDo4Zewi24BJrRvJBjBj2yF
 MSdA2e0eejFdtnS5GHl4rzpZe0lfRTyETHaCyYusVbPmbyj3X6rMOTPs22LA+BGWH3aE
 K9Ww==
X-Gm-Message-State: APjAAAX3WOgGMZ++9fieBNuM18xmdOwzCMGji1S5Hatf7q1u15yjCw1m
 ksUI2g0pQuDkcFyR4NB4+PFgKbb2SxrNt8JdYzE=
X-Google-Smtp-Source: APXvYqxG+jOKapX5HZagSWuQj8KFhElvqrAceoKaJgSgOYlz4a6grx9ExErD8b0z5qyJRodaocgQD65azDDU2cQhMtw=
X-Received: by 2002:a81:6d07:: with SMTP id i7mr69639490ywc.112.1560896634549; 
 Tue, 18 Jun 2019 15:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190618212715.10938-1-jcmvbkbc@gmail.com>
 <CAGSvup_SsBpJf+nh6UTScxN0KLS21ZbGukDqK=OQ97Nm3NyCqw@mail.gmail.com>
In-Reply-To: <CAGSvup_SsBpJf+nh6UTScxN0KLS21ZbGukDqK=OQ97Nm3NyCqw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 18 Jun 2019 15:23:43 -0700
Message-ID: <CAMo8BfJifHVmtQRPafvrROY+ybaZ=ArWwW7=hR8hEyM_b48mHQ@mail.gmail.com>
To: "augustine.sterling@gmail.com" <augustine.sterling@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, GCC Patches <gcc-patches@gcc.gnu.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix PR target/90922
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

On Tue, Jun 18, 2019 at 3:09 PM augustine.sterling@gmail.com
<augustine.sterling@gmail.com> wrote:
>
> On Tue, Jun 18, 2019 at 2:27 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> >
> > Stack pointer adjustment code in prologue missed a case of no
> > callee-saved registers and a stack frame size bigger than 128 bytes.
> > Handle that case.
> >
> > This fixes the following gcc tests with call0 ABI:
> >   gcc.c-torture/execute/stdarg-2.c
> >   gcc.dg/torture/pr55882.c
> >   gcc.dg/torture/pr57569.c
>
> Approved, please apply.

Thanks. Applied to trunk.
I'll backport it later to gcc-7..9 branches.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
