Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 24058228EC7
	for <lists+linux-xtensa@lfdr.de>; Wed, 22 Jul 2020 05:54:13 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id EE1835865;
	Wed, 22 Jul 2020 03:37:47 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by linux-xtensa.org (Postfix) with ESMTPS id BFAB9584B
 for <linux-xtensa@linux-xtensa.org>; Wed, 22 Jul 2020 03:37:45 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 72so312864ple.0
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 20:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kv16/ZtjvsqzwhA67RXGlNKlymdPTZgYcbB4t9a+XQQ=;
 b=teU76l4onNGxGGAkHnfmRlYyyoNjrAl9sepXE+/Q09UB3kodYSezX/yBSJS+QYvmNa
 rveHjIAqpceNwjoChgvGHRZc/hnLc9EB7NI7dtGueridPlvY10dO856x0XkjS7tWECEE
 tVH7ySR5EdkQQtKFM62MYFe0IgX4VMKj2lpFGVI9keCTmxOTfV65woEDPjrsPLkvR5LJ
 x+FvkLyBB9D4Mw03wpJH6B+05Otq8WappntG5IUU2LIcCjclzqC8nJsEtGJkxPMhjFkG
 VoEhVcA/8PfcbbNxQYhyg0EcdY/nqDwa2oOpkh6w16ESpfoybMuLkNtPcJK5rM9EclS1
 yMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kv16/ZtjvsqzwhA67RXGlNKlymdPTZgYcbB4t9a+XQQ=;
 b=iLFWJkZpz0fx/jEGxU3Y8t94ZoEoFGvAgj0gNl2kb73uiHLahG2PKW1EaSThjQcp15
 NQzXes5l0ej2XlyNtUseEuuPdBOQm9LHlaa0Jj8jwHWaquxm5jCyAfpeCN91dgIKkYyx
 2icdP5n5PSaTTvL2RiP5dp0LQjZXay4Zfa9eYxRh9Ro5wS2OhqtYCL1kmWWTw1HJi1VJ
 3gLwI4U7QonEF0MJgHwF0/axiPHBynfjdtMle3S1fPblU8l8RPF2kGdCtK2I3eXWLcfk
 6Uv6vtE7kcX7EybJx0xq6CYpquSTg9CxP87rL2cS8br5C81IQJwTqi5y400R6zJjeK+U
 rkpg==
X-Gm-Message-State: AOAM531NiwQtToUOirX42fhxkwhX+h3zZupA0tOo0kkC7ZOVGmXgfzqf
 03w45DF2/+nLs3i1/ijo/340pU4TN6H64d46KtU=
X-Google-Smtp-Source: ABdhPJwLXKXlBkbUAozr7t276aXIY29yYGr0q6JEskKQGLgYu10nsGdUytlaq69xIjhcH2qrdUFm/wzJ96H8ikmYiS4=
X-Received: by 2002:a17:90b:1045:: with SMTP id
 gq5mr8043357pjb.30.1595390049137; 
 Tue, 21 Jul 2020 20:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200721220035.32584-1-jcmvbkbc@gmail.com>
 <20200721230426.GC2786714@ZenIV.linux.org.uk>
In-Reply-To: <20200721230426.GC2786714@ZenIV.linux.org.uk>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 21 Jul 2020 20:53:57 -0700
Message-ID: <CAMo8BfJeM0_MHcZWc4aZs0XVv9XH3vXwpiU0xjmU1G24fXV4tw@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix access check in
	csum_and_copy_from_user
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

On Tue, Jul 21, 2020 at 4:04 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, Jul 21, 2020 at 03:00:35PM -0700, Max Filippov wrote:
> > Commit d341659f470b ("xtensa: switch to providing
> > csum_and_copy_from_user()") introduced access check, but incorrectly
> > tested dst instead of src.
> > Fix access_ok argument in csum_and_copy_from_user.
>
> Applied, with apologies...  Which tree do you want it to go through?
> I'm dropping it into vfs.git#fixes, will send to Linus unless you
> prefer it to go some other way...

NP. Anything that will go into 5.8 is good.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
