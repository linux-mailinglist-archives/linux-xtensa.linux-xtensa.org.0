Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DE52933A548
	for <lists+linux-xtensa@lfdr.de>; Sun, 14 Mar 2021 16:09:33 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 80B94646A;
	Sun, 14 Mar 2021 14:45:17 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by linux-xtensa.org (Postfix) with ESMTPS id E8A79582D
 for <linux-xtensa@linux-xtensa.org>; Sun, 14 Mar 2021 14:45:14 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ci14so61932837ejc.7
 for <linux-xtensa@linux-xtensa.org>; Sun, 14 Mar 2021 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfDq+xbpQTSxBagga+kuMHQuw6M5WXdS6DbeFFRtt9c=;
 b=FQhyGsAK4SFajSgHlzfV9CAyyxvCAW4V1dsdO30YZyFHlw/yct1W5z/p1MBkNvrxAZ
 NNB5Bj9mysZyufHgin0lh+0P75dpsKxS1/YqqS5evVdE1Uy27VZ98KnlsOkVpFKESzPm
 gIG+xAWs+8coznHKd4t/bOXjQMBJGiaG4vUzsg0EpEYJW8T3GNqr6sWtdb0bkDwEiTUX
 BYzDrVzcCWsc49PTzO1JKrivqoMGzdtG7NB8WatynCVA+rcEwMIbu56jgoi1ZLszpry4
 WApMfLDumbtWpwMgcgauba5BJiklW4t3uf0GWyNFi92Z0eCcHim6iick4bZLyT6bjYRU
 RreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfDq+xbpQTSxBagga+kuMHQuw6M5WXdS6DbeFFRtt9c=;
 b=WzX3+M/MmOHJg+LUvziTZKqsEdgAItBJ+CidxqXMTjRfZBuMF3IoQKrwi+BcAOQ/QU
 kd16dX84VQMVsVyw8vHClbFKg155b6s+U9WPXuxRPKzEuQ9JTpd56LzpUa8lLe7dZCqe
 U8oEKlD52dZYNNUDzo5l369CBhmzJpQjQxtFaCUoj5SfEF+tJgmNKreuNgyOvrvmv15y
 jPEyvuLkpzxg6e4VkSur2bVgL+yNr7Apd9pgh/Whlgk7UyIXDlSdUHhifBEx5oL3Hwb4
 B0gquD3tr/oILfOBkRkYPdDL97CvYaLlsU2JA7CuJj7ZQKGlQHgElWXxMbGJNg+98RtS
 TimQ==
X-Gm-Message-State: AOAM5301DUi7O0LrspiBrJS2uMisPnApqOdTZvJJvwWcwDciOQidrbV+
 3fBxXyRVxuxK9P7rHwnFRnE3I5VpqPrYqwWR+0E=
X-Google-Smtp-Source: ABdhPJzs1bhEzBrZnwMHWi78g+ReQod68AsTpJHEHiQt4sjFzigmdJrrVp0FLKqq5+NUYQjZ+pOBq0CoEw0F3MFHbGw=
X-Received: by 2002:a17:906:30da:: with SMTP id
 b26mr18950811ejb.376.1615734569776; 
 Sun, 14 Mar 2021 08:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210301153656.363839-1-masahiroy@kernel.org>
In-Reply-To: <20210301153656.363839-1-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 14 Mar 2021 08:09:18 -0700
Message-ID: <CAMo8BfJALr7=QjYzx4jBq=DWXn8WsVwudygpAAh9eN6wk0qLJw@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 1/3] xtensa: stop filling syscall array
	with sys_ni_syscall
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

On Mon, Mar 1, 2021 at 7:37 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> arch/xtensa/kernel/syscalls/syscalltbl.sh fills missing syscall numbers
> with sys_ni_syscall.
>
> So, the generated arch/xtensa/include/generated/asm/syscall_table.h
> has no hole.
>
> Hence, the line:
>
>   [0 ... __NR_syscalls - 1] = (syscall_t)&sys_ni_syscall,
>
> is meaningless.
>
> The number of generated __SYSCALL() macros is the same as __NR_syscalls
> (this is 442 as of v5.11).
>
> Hence, the array size, [__NR_syscalls] is unneeded.
>
> The designated initializer, '[nr] =', is also unneeded.
>
> This file does not need to know __NR_syscalls. Drop the unneeded
> <asm/unistd.h> include directive.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/xtensa/kernel/syscall.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Thanks. I've applied the whole series to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
