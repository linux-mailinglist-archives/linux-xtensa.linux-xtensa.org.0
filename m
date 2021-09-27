Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0B54041A355
	for <lists+linux-xtensa@lfdr.de>; Tue, 28 Sep 2021 00:51:01 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2582568ED;
	Mon, 27 Sep 2021 22:19:54 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by linux-xtensa.org (Postfix) with ESMTPS id CBEF968E8
 for <linux-xtensa@linux-xtensa.org>; Mon, 27 Sep 2021 22:19:45 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id dj4so75675141edb.5
 for <linux-xtensa@linux-xtensa.org>; Mon, 27 Sep 2021 15:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lbtHxjRemmXiBIhG0GW8nlURXNpwyPs370Xxo7AeQQk=;
 b=YZ2VTmSCUUUwt9GaX+TF009NFPIKAVOBMPTgS3jayY1GsTxjk0eyD6zyo3KSDp2ffd
 15/G6kf8ngNImvfP+WO3GwmQFWGvbVqsojWS5PsZGnhvbMFfwNf8hSswllXfjJWH5bOE
 iuZL52rFsekbaWI4lIXdwtbN7zFzDlTDgpjQpSXSpN15NE9HDPayoVqneLYjbtMi9s4X
 ps/Z9ps2NUVxdYW6SyynTklGHbpuzsS5CawTlfWbAl6o8ozZlHhvGY0lDmYlvpfHfCUs
 GD4OE0hwIQQOcnCDaiwMPQ95SiG9tHFH0M56s31hXESkpNn5z5fJT/O3fmOeyg3xh3Pb
 IunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbtHxjRemmXiBIhG0GW8nlURXNpwyPs370Xxo7AeQQk=;
 b=wFKM76yogN+h3oyJojgMQ5BdySnb07TK6xcHFu3973Ec27wsHQGN2doG1hWD1o5ysP
 SvmJlKy5JmjbkBNw/250L9kZXDHwJ3xgQmeRw9a6jn8px4CPnH2pOlEEhpJsxpVZq58D
 84tRnpAn1wDxSwPSscouAUs4KtE925D/v60sUaXwBWNU5RnJJWWBE9DClB0UMHqGZ5nx
 HLo6KiRpErQ24VTcu1DQIbUWHncs0jNKPcpyEoXimBIeSw0qJPi94o7WFXs4CScK+K7x
 AOi1pOEjX00lLmj28uVyPd/uLnB14rdjpBn4hxGI3JqvTUL+Zv4TJjgIR5jGGM9AMgQ6
 1mBw==
X-Gm-Message-State: AOAM530wf/VcAF0mxBxcKmYL7zEgEiGhRFKdeegrM2uLIOq59ZeKP5SH
 cSJSvELQD9qED+GU+Uos9Tpi7jVARi+3osZIJXY=
X-Google-Smtp-Source: ABdhPJxqWtQBQk+q3MXvQ7lymGiQEolFkglJxXrWFsK3GxDKn2WvP9KOWmJHtaEmST6By7Czy4V78fbFN5iEYd3RzYA=
X-Received: by 2002:aa7:d592:: with SMTP id r18mr3465274edq.172.1632783048036; 
 Mon, 27 Sep 2021 15:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210927220110.1066271-1-mcgrof@kernel.org>
 <20210927220110.1066271-7-mcgrof@kernel.org>
In-Reply-To: <20210927220110.1066271-7-mcgrof@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Sep 2021 15:50:36 -0700
Message-ID: <CAMo8BfLX84HBuVe=FyqWkVU5Ek-aKFk++omnqsmf9wO6fdVpMQ@mail.gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, justin@coraid.com,
 LKML <linux-kernel@vger.kernel.org>, krisman@collabora.com, tim@cyberelk.net,
 drbd-dev@lists.linbit.com, Richard Weinberger <richard@nod.at>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 johannes.berg@intel.com, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, hare@suse.de,
 Jens Axboe <axboe@kernel.dk>, philipp.reisner@linbit.com,
 chris.obbard@collabora.com, Tejun Heo <tj@kernel.org>,
 lars.ellenberg@linbit.com, thehajime@gmail.com, zhuyifei1999@gmail.com
Subject: Re: [Linux-Xtensa] [PATCH v2 06/15] xtensa/platforms/iss/simdisk:
 add error handling support for add_disk()
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

On Mon, Sep 27, 2021 at 3:01 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  arch/xtensa/platforms/iss/simdisk.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
