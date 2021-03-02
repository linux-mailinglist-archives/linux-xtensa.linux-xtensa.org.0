Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B009A329685
	for <lists+linux-xtensa@lfdr.de>; Tue,  2 Mar 2021 07:49:43 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id F0798585F;
	Tue,  2 Mar 2021 06:25:50 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by linux-xtensa.org (Postfix) with ESMTPS id 7B94B585A
 for <linux-xtensa@linux-xtensa.org>; Tue,  2 Mar 2021 06:25:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id p8so6780475ejb.10
 for <linux-xtensa@linux-xtensa.org>; Mon, 01 Mar 2021 22:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jzxlQzv76Y/61eQ11eH1sQgFZWAUyijap1VZ663IHg0=;
 b=YnKI9LxURIeByYgZ0rjrwV721raQBTcA6esYWukVX6m4O9X6Czv25W8BdKF4nyy/rR
 1W5XUEid2pQbdb74IEAZxv9StTCqClDcmekin1F6IUcZRnLjcwUdPSzubKsXYVElDkLO
 WzYXTLNMFRhqnJc8GO/uJHp7ociRcMBR9bdlxZNWbKW+HoBH8mQkN8DW+O7H0kZsaeCN
 OIfERAvN/xfx/R1bT5LIpye6L/nOjqBk1NvM5YOWCwgiaH9lnga09dXKnITjxzwIog52
 413pzT8nND5Oz9CELnaNWQ8yc66dkBbeNdt2x/R+fa+9MP5eVdjMxRKkqiopfqRiEsYW
 Z0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jzxlQzv76Y/61eQ11eH1sQgFZWAUyijap1VZ663IHg0=;
 b=D3ztdwGiPbWwO4wa16cLAzGY4bcoMA+xUBy8sg3ulxpxJElcgtAzlvYmtqgFjFsPcO
 xHovViJEHHobKkRqod8/Da2Lsatvy3o3GHpuwYgYZcsFKeY6kSciDpmNXdjIg0qz/C2k
 adi4Up7SAIIdaUEtWtxoxw4EbAY0pk1rtYcGPfu3kjX0W4cy+RIQelGDN3UK56edymo2
 iVc8XS1Y0eRq587ncL6FKKd3/HPlLNhbVTEmCjNnq/8JjIVSysKEObJGNhxKdxpGe2Wx
 FYNs9J8LaAW0CUJ5AMd8eGVRXA9MAxMYtb6Wo+20FUoZdd5G1s5tLb7Ys9Uz8/gyVAf4
 /Rvg==
X-Gm-Message-State: AOAM532Mn4MX6RyF1/hmYcldO9v9+9u6OF5SZOoSB/C/eVkbdLi1AMN3
 oUNEBHsDeqdXQzRz97ZDPkyzZB89QSuBVVV0An4=
X-Google-Smtp-Source: ABdhPJwljo+mnsADAPU1Bllfx6aUc5JBmvI3C9sySY2uIgDMMeT8KjuoWwE4NbMv9wDxKqDG84z6knAVtN2ZhlhV2vE=
X-Received: by 2002:a17:906:7797:: with SMTP id
 s23mr8953605ejm.98.1614667779511; 
 Mon, 01 Mar 2021 22:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-31-jslaby@suse.cz>
In-Reply-To: <20210302062214.29627-31-jslaby@suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 1 Mar 2021 22:49:28 -0800
Message-ID: <CAMo8BfK_Y4ifJ2caNYO5bu+BnxyfoUey3hkDGK7=u7GbnUFRRw@mail.gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH 31/44] tty: xtensa/iss,
	remove stale comments
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
> These are likely taken over from amiserial. iss doesn't do anything of
> that.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/platforms/iss/console.c | 18 ------------------
>  1 file changed, 18 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
