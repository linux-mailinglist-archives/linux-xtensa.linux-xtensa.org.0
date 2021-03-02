Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 55481329689
	for <lists+linux-xtensa@lfdr.de>; Tue,  2 Mar 2021 07:52:18 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 4E4045861;
	Tue,  2 Mar 2021 06:28:25 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by linux-xtensa.org (Postfix) with ESMTPS id 77864585E
 for <linux-xtensa@linux-xtensa.org>; Tue,  2 Mar 2021 06:28:23 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id d13so18797382edp.4
 for <linux-xtensa@linux-xtensa.org>; Mon, 01 Mar 2021 22:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rHHguOtq/SsmoWVv767qiYZjS1EduX+s7NH06dTB/5E=;
 b=RJv/UOK1Rl1s7110nIhpxe4b/ond/IgKPJUtMc5UpBqSdc/g7Yswb1SzFmZs4SD7tI
 igbMnrQiho1HeVqBBnZDspMXblybvDrUY0kgRGYI0BFcKamvexM8kT6hsvPxfolS1GCS
 coW5agR7+ctcm6vKT/3bVHNM0FhJN4zIgAKuzuhQLJ33mqLcUX+B8wza/jRBoUxX5Wfh
 pIoxdl8EnKCLs6mRm+Qft5XvnA6SClzlvqfAAEb5w9NmFyPTiJiwH8KgN2HnBBuuCq/y
 3YFdHzIsYT0FdYPOjPaHw4toWUXjBBVfLTzMCgCTF2m4QInHCv+j88I2zuFNKCQFwPe7
 6sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rHHguOtq/SsmoWVv767qiYZjS1EduX+s7NH06dTB/5E=;
 b=oU8Mp/x2ibUQ3jekBLcvoSxUhR4PBvecuPmeyQc+dmcMgC5XdB4csSPAlW5lbopNOL
 04S2x1ucf2KzC8ZHq6yEQa1xe0tE00iX0OpNVQLWUJHXHr3GpvMsz+rVwSydMDwytEQg
 K/SVAjv7RUPC4G3qElafswIAMf3znw48ItINt6pNoYofhgzihgjTLgAJ33QPmmwFlpWE
 b3HwcZfp9lQQRohliC+txYXsgfY2a3mDs7ilI8wpmvatOpgJi2qiNyvmtxwqUq7Zj5NQ
 Tve35rwoeD0djGrkGUX/oy702ED0aCtgcchbhS+FPB5Yfz9gziuDmWR0E9dZhm7NiYyS
 Od1g==
X-Gm-Message-State: AOAM533/Bapwcyp5y94lKXDeJJY5U0GV76ItLk1CNhzhDRa2FG9MsFpW
 4Ky8HzVnAAKAcGDCfUvjR4hXrGUZ07hyprMrR1Ol8l9M
X-Google-Smtp-Source: ABdhPJzobTXq9iCvVESEdOAEuL6o/ZubpkKJZsWksmzJX34L0rWX2fSOlYOmfHgZ2Aqv1W8s49fkXRvKk98Gtiba5NU=
X-Received: by 2002:aa7:dd55:: with SMTP id o21mr32367edw.237.1614667934608;
 Mon, 01 Mar 2021 22:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-32-jslaby@suse.cz>
In-Reply-To: <20210302062214.29627-32-jslaby@suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 1 Mar 2021 22:52:03 -0800
Message-ID: <CAMo8BfJeXxTatB74+4PLed9KZaoRgDgekHdvpWKsfFW-povZWw@mail.gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH 32/44] tty: xtensa/iss,
	setup the timer statically
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
> Use DEFINE_TIMER and avoid runtime initialization of the serial_timer.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/platforms/iss/console.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
