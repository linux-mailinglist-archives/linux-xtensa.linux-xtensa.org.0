Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 97BAB17B7C8
	for <lists+linux-xtensa@lfdr.de>; Fri,  6 Mar 2020 08:54:15 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 0FDDD52CD;
	Fri,  6 Mar 2020 07:42:22 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 987195249
 for <linux-xtensa@linux-xtensa.org>; Fri,  6 Mar 2020 07:42:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w12so522695pll.13
 for <linux-xtensa@linux-xtensa.org>; Thu, 05 Mar 2020 23:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UWIoMeEB2CUV9mwiKAX71h5fko7k2os2QipVNvf6bCo=;
 b=PNrX6AM0uaL/bBdobe7dNADUo+F4/G1hUMaxudkNpBcH04picEhD9scb8esJBu6Q8a
 A7NTB9tyLFjUqB0Vb41KIuF5FxaKvLvWhw+T3Vo62B3dpWk75cmacDwHBt3zF1aizmPG
 N6NQ0FxUXTlZL+gPZkCLmVzv/rkU2ShqN9g8ELn3yjtOxdhMkq8ZuTaMeuEEjZNG+KZj
 qPvK7hZhtn27i/JgwlrAdko9a3PCR3Eq7bYcoaTGUGV/FdXuzzbksDpnqZK+fe0HFbD5
 3bwKi8/YJ227AsaLnnoEwW575gt7UXxRPjLV4V8wyTXWk+4KsQFkWq2K8S72dKjhXnVV
 XQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UWIoMeEB2CUV9mwiKAX71h5fko7k2os2QipVNvf6bCo=;
 b=P3H6mzKNy5cXGr+2Drw16tdEHTx8ssbYZTEcggJtK/M0n0hLTVIkAXh7sJgkGsxrYT
 gDYKPeNOBGTwBHf5ALFsd+FXWklTB5xNBWAdWjjUbY7Xj55Sy1zpIly0cuhnU/ACip7n
 qlBtDTYOoneBniXPlbLrIXpLsh4dW8iov2xVTCXAoH8NzeMCbGINm12JrA+XdFjQns5R
 DJtTpCgdKFTqq+z2PEzACY5DR1mIAzRZOBp42TtVHriCb0Zit+LCa0vI5blVi+NJGSyQ
 QdyZa5lYYBQqNh8cmqdtfilZoxYQ5jlykKvANbTtOSmcuHekGdVwR8kxCqs8SO/qDvnG
 J/QQ==
X-Gm-Message-State: ANhLgQ0jYuFEpE3clC/rVfeVburkMauud04F4jjh8/ZFWKiHHi3f3Do8
 vXqbI1bqPghr7Bxatv1gCeUSDE1/aRb/mK4RdfE=
X-Google-Smtp-Source: ADFU+vvQFehPqcFAEG48yvZ7aCbXwYyl9wcrvV8Hrk3L/zkur4PN0je35ufuF1mZ6Z0WKNa8hjuWx2TxU5yX8MAX2j0=
X-Received: by 2002:a17:90a:d205:: with SMTP id
 o5mr2271425pju.46.1583481251417; 
 Thu, 05 Mar 2020 23:54:11 -0800 (PST)
MIME-Version: 1.0
References: <202003021038.8F0369D907@keescook>
 <20200305151144.836824-1-nivedita@alum.mit.edu>
In-Reply-To: <20200305151144.836824-1-nivedita@alum.mit.edu>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 5 Mar 2020 23:54:00 -0800
Message-ID: <CAMo8BfKDF+6uw_jxMa2BuNScJS=PMiwFhb9YhH4DWD+jo4+dyg@mail.gmail.com>
To: Arvind Sankar <nivedita@alum.mit.edu>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Tycho Andersen <tycho@tycho.ws>,
 Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 LKML <linux-kernel@vger.kernel.org>, "Tobin C . Harding" <me@tobin.cc>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa/mm: Stop printing the virtual
	memory layout
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

On Thu, Mar 5, 2020 at 7:11 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> For security, don't display the kernel's virtual memory layout.

Given that primary users of xtensa linux kernels are developers
removing this information, and even disabling it by default doesn't
sound reasonable to me.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
