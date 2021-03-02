Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id AEA2932967A
	for <lists+linux-xtensa@lfdr.de>; Tue,  2 Mar 2021 07:45:29 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 953A1585A;
	Tue,  2 Mar 2021 06:21:36 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by linux-xtensa.org (Postfix) with ESMTPS id 035D45386
 for <linux-xtensa@linux-xtensa.org>; Tue,  2 Mar 2021 06:21:34 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id gt32so21564600ejc.6
 for <linux-xtensa@linux-xtensa.org>; Mon, 01 Mar 2021 22:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJXh5JalEhVse0qJW0VOHI5f4foaNIcMUtcvKKJasfQ=;
 b=dhSf9U6HzpbfvVbH5USxTu/mgglrcDn5nL7ApwwV7YvP12gdja2yCAj05Nii6uqe6c
 0gY3636OGXi+qz8e+PjivQGvRJeYHQKCp+2JNMbAFLez0RZ/9Tie9pFa2uUbr8GFK3RN
 te7kQ5C/TB66UOv2GtIcyTF3RDdXOkeqlSuiu0J5jf5mhNd9STs5VOdZ0E01dAURwBme
 ZLLPbhqfLMkYLuNtE2kV9POrs5lmw0GL//yE3MqOpUBcxwQrHXPwuYUOBzjLBmgA8BRU
 Hff+8oUxBOKJyuIvV//9YR2Qa9hHE4Vu0y6VdCzB7ArLHVTHli2FwRwJgWY6f+O+m0OA
 iCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJXh5JalEhVse0qJW0VOHI5f4foaNIcMUtcvKKJasfQ=;
 b=sZCxpsFKVFX9XXUwKuLcw4r2GK2KQZrPjkHBEscVCAtkY1xnksDrB0AaXpzcCP5Eu0
 HuARQ8qpD6w+aSUA79H4s2or6fc9Id0q81TEn76Yn+kxkAog+yOjG9QqvgcR2qkT2yMw
 XchuGrHO6x0+Pj/qOiqSHjfwPLmJM4LxM5WFK+64aXTWp4PFDuJ1QsRfmMhriBMaGbbO
 H7eivtaHns1LMhb9nfZ0SSEuOmezm1wLik+wm8xUzUGUJAZFLDZibWwNdZxmFjdPaD3l
 t/InQ1F8QT62TZ4CvHLSI/1BppuiurPKUSGEgiFUEP8JC20RvuGKk85sF7Ks2DngJPEF
 fPWw==
X-Gm-Message-State: AOAM531Q9Tv+5p6M/M6TcS8SUt22iNAgxNcrP4f1b9pvB1cso9+myqel
 hGuWmqMX+e4DL+G9wa3Wwr4Eg49tZeh0DgpNRt4=
X-Google-Smtp-Source: ABdhPJyfeSEkJtAZCSPW0OjbWtOEt4hvwGLIUzr5p2cE3aqNEJBS+u2nw7lEEz+QG+Ui2h5wnVka/aNpze7fc4oqspI=
X-Received: by 2002:a17:906:3587:: with SMTP id
 o7mr19621807ejb.443.1614667525431; 
 Mon, 01 Mar 2021 22:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-29-jslaby@suse.cz>
In-Reply-To: <20210302062214.29627-29-jslaby@suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 1 Mar 2021 22:45:14 -0800
Message-ID: <CAMo8BfJoVnSkw_9J9w-is+_0aWbcmE+B_FMUha6Rv=n5+my_zw@mail.gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH 29/44] tty: xtensa/iss,
	drop serial_version & serial_name
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
> There is no need to print the information during module load. Neither to
> print some artificial version. So drop these strings and a print.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/platforms/iss/console.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
