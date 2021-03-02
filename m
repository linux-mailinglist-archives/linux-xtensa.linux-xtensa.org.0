Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFB0329698
	for <lists+linux-xtensa@lfdr.de>; Tue,  2 Mar 2021 08:12:39 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id C2C5258B9;
	Tue,  2 Mar 2021 06:48:45 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by linux-xtensa.org (Postfix) with ESMTPS id E3DD0587A
 for <linux-xtensa@linux-xtensa.org>; Tue,  2 Mar 2021 06:48:43 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id v13so7436636edw.9
 for <linux-xtensa@linux-xtensa.org>; Mon, 01 Mar 2021 23:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AFPfuv+YOm+k4DkSctX34qa+OTvzsdZXK2vjFfw1Tm0=;
 b=S+JgmgnHbH90N1HKUqeQ8Ew6otkHcSonG1aR/anE8nDB8d+/JSrnIw0cAhBEC8BVq/
 kMjmMdEUwb5hPNJKX8x3iXHlplNGC4CvUuOTaleLTBpTGngbrTgMIAMbs8IP2qW4Jkck
 GKec9aQBiT1xpE8kX7CaZ0Ibp85vzRvpkobBvQtWrAJ67WdZZFDEfHXKI1AtuPIPuSoc
 CnKdgAOmn8VuruQPAtWpv1ZAEBz3Asako335glZHIoToRXkTcUp04EMNF9D8xb9dcdvc
 HQxzZUB1mTXJXYeP0z7UZ6bGTRdykeNYwaIKxJiO0bjqGDFbRu71FXnZs8jeusysVsPJ
 X0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFPfuv+YOm+k4DkSctX34qa+OTvzsdZXK2vjFfw1Tm0=;
 b=F1rP8EeuBqaoMvUBI1+u8o0U5ND2XCnR4Ih6OaTJXw21xJZL5OhNzbwSIMUu3vWfHL
 hE+fl/MhDvYJU036qEi5HFODiVrmKrPrnDAnaBdwXF7hxd34GRD6xusEyvPKQoayjwMO
 x8IRLPORomPEsnJ1d0FKqqGgVBkoJU6+rG47qRj0gDKJ9d0wXMz8DM9evf0S1a5lBsTH
 wkAwlGvd47nzUfsP+1rvoob8sIx1GejTGlBzSoB+vZxgBtG7omLMIl8UluiRuh0v0xBQ
 1PcATIBs3Px5uPrsoluPua5pMvW2tntzjT1OOkdRlKzxsopIPVkLQPushOsy9ksJgvo3
 FxKQ==
X-Gm-Message-State: AOAM533otHAzFBf8UMqouGMj/mN42XAfgZX3dt4WqLTaiNlKuTujg48N
 D5QZQi9CLJn1DIGR2MPfJuu5IE69nqVQ9Cmk1/k=
X-Google-Smtp-Source: ABdhPJy7opFJLI5d73Hqpi8Cv4/3I+seAygBh3QYLYVMuD5pEdzAuf6uvBUmy2PBrlAtB7jJvHh88gZ9YwZuW7j1DH0=
X-Received: by 2002:a05:6402:888:: with SMTP id
 e8mr11730080edy.51.1614669155407; 
 Mon, 01 Mar 2021 23:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-30-jslaby@suse.cz>
In-Reply-To: <20210302062214.29627-30-jslaby@suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 1 Mar 2021 23:12:24 -0800
Message-ID: <CAMo8BfL0Frrd6A=j+LXmExAkcKRLBm5a_3rM1hyz+W6p9i91xQ@mail.gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH 30/44] tty: xtensa/iss,
	don't reassign to tty->port
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
> We already do tty_port_link_device in rs_init, so we don't need to
> reassign a port to tty->port. It would be too late in tty::ops::open
> anyway.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/platforms/iss/console.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
