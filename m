Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id CB39D32968D
	for <lists+linux-xtensa@lfdr.de>; Tue,  2 Mar 2021 07:57:24 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 0D4575861;
	Tue,  2 Mar 2021 06:33:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by linux-xtensa.org (Postfix) with ESMTPS id C6E18585E
 for <linux-xtensa@linux-xtensa.org>; Tue,  2 Mar 2021 06:33:29 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id lr13so33122343ejb.8
 for <linux-xtensa@linux-xtensa.org>; Mon, 01 Mar 2021 22:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gKUeJiCjz76ZYfYznUcE/FJF+AgYNAVfjdNl+41kQHM=;
 b=DSJUrWolKcsUJPc/uOpsS82Fd5ta60KGvcOI5BhLQJhg4BRNQknqSbQl89mvmiaGzW
 a6NGhlfgMwndx9LH/PVebtAwVtxdafFmRePToI2HugybUOS52TllZMb1EVav1ggkY5iL
 lw/PWq3eo/8KIebucPB+Rr/xSCCsc2DURjnDcF9wEJ8LZBsWQ/ODeHLqlJL/3/8t2s5s
 O4i62GN2i2/GSLIwh1bLypX0H5AnocVcjU98WiAEJHGJ2ttH9xWOkeyT2KNO/Ro6u/9p
 qSBStt5DOeUrlSJn4RDUMjZZCBp5TcrfB5FE7i1YBQ7A3KbniDC3FB7mDwOjR+WiN5xP
 54ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gKUeJiCjz76ZYfYznUcE/FJF+AgYNAVfjdNl+41kQHM=;
 b=gnC5GofeDhcBAE/U6J4aCGfQo4c/w9jwcXKPqvZMMuv7r42zvwZbBuTTFMrs1AJKxs
 CkaYxcl11XOawmlYEFz/jLXHyI628T1KkdudtmfFO4Z6e/WBRV55Xa2BfL4VxIibAjgH
 MmEmoXKSd4a5rrprWFtb+cvQwPcdDlzPik4Ykaq8LbU9ldR1vmqwB49RErOTIa66hPR7
 ILh/EnIedLHOWp2dGxy4DjvOU+Ag8nrtHa0YxVbLJygRM1lmdHzUFF+5w8KLQmVdjEkl
 7deMVqDOy06Ujv4a2hPD2t9ukQ4wFcicP1hF5WIlykN6FLpUMsgRArlTjhpfR8d6TvxU
 k/bw==
X-Gm-Message-State: AOAM533xtSFLcehCsCc0k5gfKhxVpU5D762FdbJAOQTspK2sOA9KDFhO
 xDWsTMvgcLuGJW6r+fZv35KTRpWe2KPI+03ZMA8=
X-Google-Smtp-Source: ABdhPJyZ11FjQVbO8yuH7NZDCm0O4aX40diBY4KJiBSEC2ZlV/UhSlNjI03TY9W42r4dQE6y8dFTRFb3y0R42Q+tJuM=
X-Received: by 2002:a17:906:5ac2:: with SMTP id
 x2mr19485321ejs.486.1614668241339; 
 Mon, 01 Mar 2021 22:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-34-jslaby@suse.cz>
In-Reply-To: <20210302062214.29627-34-jslaby@suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 1 Mar 2021 22:57:10 -0800
Message-ID: <CAMo8BfKCY2TP43y=EM5CHxoGwRLykUVELvLyCos94PRj6t5RMg@mail.gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Kosina <jikos@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, David Sterba <dsterba@suse.com>
Subject: Re: [Linux-Xtensa] [PATCH 34/44] tty: do not check
	tty_unregister_driver's return value
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

On Mon, Mar 1, 2021 at 10:22 PM Jiri Slaby <jslaby@suse.cz> wrote:
>
> These drivers check tty_unregister_driver return value. But they don't
> handle a failure correctly (they free the driver in any case). So stop
> checking tty_unregister_driver return value and remove also the prints.
>
> In the next patch, tty_unregister_driver's return type will be switched
> to void.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: David Sterba <dsterba@suse.com>
> ---
>  arch/xtensa/platforms/iss/console.c | 6 +-----
>  drivers/tty/amiserial.c             | 8 ++------
>  drivers/tty/ipwireless/tty.c        | 7 +------
>  drivers/tty/moxa.c                  | 4 +---
>  drivers/tty/serial/kgdb_nmi.c       | 4 +---
>  drivers/tty/synclink_gt.c           | 5 +----
>  6 files changed, 7 insertions(+), 27 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
