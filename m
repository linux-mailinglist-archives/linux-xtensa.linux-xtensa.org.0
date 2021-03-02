Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA6532968C
	for <lists+linux-xtensa@lfdr.de>; Tue,  2 Mar 2021 07:55:52 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9A89C5861;
	Tue,  2 Mar 2021 06:31:59 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by linux-xtensa.org (Postfix) with ESMTPS id 69B4A585E
 for <linux-xtensa@linux-xtensa.org>; Tue,  2 Mar 2021 06:31:58 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id w9so7707408edt.13
 for <linux-xtensa@linux-xtensa.org>; Mon, 01 Mar 2021 22:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FkQlyQkx4YlaiWtPjbjtcm8QF/fjSftYDKk5kkfUey0=;
 b=PFlj/AbLsGqPbk3apdT1uKeW7cFiUGggPb7txtL2cKFfBRSbsjVq7tDgupMkQPci6d
 /5Dfpsl3vX9oWzTRVuabWzMsmgWHDjBzvWmqsHV8XprenQE/dvM7mFPa/NOnP/ihT08z
 autad4M91CAFPFT68Iz8XNgOS6s2O2A3oxw/r0QeN+S0ZcMsa2fKXWYmyGt/GpxR4AcV
 V1bFbBANndmxqnxiJheuZbykHCfz+OCKdxvdfXdGKsdGVMZojiY0Hnq1djYlXz32jwW3
 AJDi60j6zN59bgJhyp1zd8Ywv73MhRPiWhHcrIMs4mv1hRfAQUP2FnRotdda5+Qekj5u
 8CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkQlyQkx4YlaiWtPjbjtcm8QF/fjSftYDKk5kkfUey0=;
 b=DwnJwVsAOjH9Q3UocuaIggS5o7tDgXSeMqs9URvmxGUYKwZPobspDrCGA6bgBdf9SK
 Ljc7vvddX57XObkXocnpWofOvPlFVuDokIpFgD3QRTkexAe324BILKLQbEJ3ngs2Yudn
 Xu6iQTUDSgtoh/6iLPAQK/0aP2zHutiXwNZZ9qocVI+wdKZKm8PaisrknOqFJEoF0I6R
 FALDlL0LtxubzWXA55S8Hkso3UN1ui8rh8RFsn5FpTIr6dt7CrmNlDVyTATE6WKFkghf
 C2fGFGRBieufEatQKt5qiUjue7m+EPY7rGXDXPL9vPn7uVXziJQ74DQ9ZLTciW4dZw0i
 XE3g==
X-Gm-Message-State: AOAM533rpW+IpCNe02RmyfXTFeOqKtvh3qsftS9kVGy4K++U0hv/PFMb
 b+k8cIf72Dyb3bzp/9WwlPtDtKqkVVTdEComSZI=
X-Google-Smtp-Source: ABdhPJybh6pmK5GtQmq/c3vvZGuCHaTR3ln7l9rsmzuuQ7BXZx12cEyOKZV8gpU8repWmjDUKkUnlpWFKdYgBsD+7XA=
X-Received: by 2002:a50:d987:: with SMTP id w7mr19419656edj.350.1614668149868; 
 Mon, 01 Mar 2021 22:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-33-jslaby@suse.cz>
In-Reply-To: <20210302062214.29627-33-jslaby@suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 1 Mar 2021 22:55:38 -0800
Message-ID: <CAMo8BfJ=-ORUowT4aUrQsYyZC+Kvpa6Xk-v5u7ah_GAkcAVpCA@mail.gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH 33/44] tty: xtensa/iss,
	make rs_init static
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
> To fix the warning:
> warning: no previous prototype for 'rs_init'
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/platforms/iss/console.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
