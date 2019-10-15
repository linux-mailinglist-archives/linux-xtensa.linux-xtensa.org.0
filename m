Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7F6D8080
	for <lists+linux-xtensa@lfdr.de>; Tue, 15 Oct 2019 21:44:06 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 1AAC9666F;
	Tue, 15 Oct 2019 19:36:38 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 by linux-xtensa.org (Postfix) with ESMTPS id BD1FD666D
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Oct 2019 19:36:36 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id m7so7782440ywe.4
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Oct 2019 12:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZwF3UovUJQM4lIZOxzxPbkJHR0pkb72kpecDlmrnReI=;
 b=XODjQi2tQm5hqkLwP+VbgANGcu6RvgWN8kN+xHLxAjnkj3s25skyfNejbMoU92LZno
 YAxE1QgQ5Drh3afgV3gqCh0auh8qm+A9r0gtfi8D8Xm/sI+2cfswt4hT/7/jtY48ce3O
 jJdiOwkHBPpKUfFL/dvKORFBPQoFmi/X1YgX8voScl9VAX8MjLEeVf2HEsAfoOagTyCc
 G8X9C9fGtsiTdhm3gG9ZFbfVyfTdAnHlIuys8P7iP0ifA4O3e2xYB/aKaEb+Q2wHcMCN
 HLxNwzCSzxlZHBZqL3XypTJen0jjEutErT9R+RAAVps4owtcMl6Wn7IuiAciPPZYeD6p
 HwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZwF3UovUJQM4lIZOxzxPbkJHR0pkb72kpecDlmrnReI=;
 b=gpKs63Ksv/disstsspwD6aYGUdsVihpfbrfJ5RuzaZklb0QdsNR8NrmexJxrm9sBgD
 Hfqtjev7gUTBBYh7sIM/qka/PZhGiYjwvExRAM5gTbbsAEeAwq9TK62i2PYl7T/kb9Ll
 vGdvg5FxydToXWNm/jB5U9k451M5GoS0nCpe/96ndDYzZeOw8NQTrv3+6LrCkaJIhgbG
 3aarNZ8GiKY0MxK0S8GmJOy6rX+OxUuINxUlRSudDdfVylqShaEeYG5EdHdNKCCg7FSe
 323NFTAb0E0bgjTseC1EdYFxWCip8cf9Y9IEkjnw0nkXuAq2azFR++X/ZE97LzA91KZE
 2kQA==
X-Gm-Message-State: APjAAAXoUVZtP4CNbPmvcqSZHcng84Bt9SBUmt9cAU5DR54rCHhpq4yg
 70qsR/jnDrZ0iR2mkuamvw5fRHw/w3IP2zTOaZE=
X-Google-Smtp-Source: APXvYqxg/ocWm0Vdt6TA/rSb3L5qnhnb+zg1qq/R2n7id6WlidlESVt5rWqPACBSRFtFQeGLeboCSpx9jA9o07ZPxD0=
X-Received: by 2002:a81:74d4:: with SMTP id
 p203mr17581738ywc.234.1571168641550; 
 Tue, 15 Oct 2019 12:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-21-bigeasy@linutronix.de>
In-Reply-To: <20191015191821.11479-21-bigeasy@linutronix.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 15 Oct 2019 12:43:49 -0700
Message-ID: <CAMo8BfJRN3D4+UW-9FQd7JBJuszRPT5whNXoPuWjdofvzF=NsQ@mail.gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 20/34] xtensa: Use CONFIG_PREEMPTION
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

On Tue, Oct 15, 2019 at 12:18 PM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_RT.
> Both PREEMPT and PREEMPT_RT require the same functionality which today
> depends on CONFIG_PREEMPT.
>
> Switch the entry code over to use CONFIG_PREEMPTION. Add PREEMPT_RT
> output to die().
>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> [bigeasy: +traps.c]
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/xtensa/kernel/entry.S | 2 +-
>  arch/xtensa/kernel/traps.c | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
