Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 1530E40C144
	for <lists+linux-xtensa@lfdr.de>; Wed, 15 Sep 2021 10:10:47 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B03D26D2A;
	Wed, 15 Sep 2021 07:40:08 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by linux-xtensa.org (Postfix) with ESMTPS id AB56B6CDC
 for <linux-xtensa@linux-xtensa.org>; Wed, 15 Sep 2021 07:40:05 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id hx25so4292442ejc.6
 for <linux-xtensa@linux-xtensa.org>; Wed, 15 Sep 2021 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AVFyY2V27y/UeArEwcODznJwknUl0TaYdAnTamBxHAw=;
 b=koAf1/HE5zAgwbf9qStT7LXz8vxwVFIBcA+b43uHnMKR8OxWOtIrdUCrWc4cUTBsqq
 Bt8cfVOBzIsLlZtILynLGbJLAb6OCqwUGGQh6D/vj0F6AAmkeWUmapF2Sl3SK8pROkzQ
 iph4GCjiPgqNxBetgFB8izA1B9VI9HCrPHqUw8xOW+lxA+EklwhaVn9l22V+f9L7htnJ
 FFqkvnSIsGdyuNNAhbxIDcGZaRbg2x8jHFCabFrrXEn4ZxQKFnURIeVsIBT/W1mjiq20
 h/b4KZho//fRjyvXTuTDM9tthvqrUoVAuzITEUzB77AEgzdssYB+ZVDULwhTihlDSl+z
 ROGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AVFyY2V27y/UeArEwcODznJwknUl0TaYdAnTamBxHAw=;
 b=QWCAWzB4Cj7K8sLgey8SLiJw85PCAcuelRtGHOuOmO0eQeqrKVwDUs5oU+63rUsygy
 G/gWdZheGR9hR2cB9ugpgWWg7d3uFV6o+t+QCVYhZkELpe72gLNHkoM3aM9txvBy6aDf
 /JQwWQO8Tl1Ni51yQP8HWA397KAQMnr5BML2uAvCzBnlvoR6tDA9URETZ2rJG1fT/UvJ
 CREya/mEJ8mbB5Dklt7EXI/Tk9SG+LIsRiHPRBsan+xmk9yBXgBVxDoyTbCp34cIsYgL
 QAkU30vW9kKPSaYbiLwwCM8bjmcLy+MHHT2o7fcRWCyrnsTWRH9v7yoa01dRtJaQWWfY
 Y/lA==
X-Gm-Message-State: AOAM532CBokmpEtuo7wluAI3ZeXt8Qzch7oDxoE7YSl58ZJWTIV6Was0
 MlnIWcegaiWsv/hKRWpnLbTMXgvof+1tS9lrt3U=
X-Google-Smtp-Source: ABdhPJwcmv6EgSdHJnibcbLmqURiWSWrF2pUoqr/JXaT8CAFUkSiBYz/TDLqlzgGEehjVnqwzZsHZ5InM4Y3GGUNsQk=
X-Received: by 2002:a17:906:7208:: with SMTP id
 m8mr23644303ejk.82.1631693442497; 
 Wed, 15 Sep 2021 01:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210914091134.17426-1-jslaby@suse.cz>
 <20210914091415.17918-1-jslaby@suse.cz>
 <20210914091415.17918-5-jslaby@suse.cz>
In-Reply-To: <20210914091415.17918-5-jslaby@suse.cz>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 15 Sep 2021 01:10:31 -0700
Message-ID: <CAMo8BfKasYTwB935oxvuJjpv_yBhkxbo8P3nzxaq1_1QgZHUBw@mail.gmail.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-um@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-serial@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Jeff Dike <jdike@addtoit.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: Re: [Linux-Xtensa] [PATCH 12/16] tty: arch/,
	stop using tty_flip_buffer_push
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

On Tue, Sep 14, 2021 at 2:14 AM Jiri Slaby <jslaby@suse.cz> wrote:
>
> Since commit a9c3f68f3cd8d (tty: Fix low_latency BUG) in 2014,
> tty_flip_buffer_push() is only a wrapper to tty_schedule_flip(). We are
> going to remove the former, so call the latter directly in arch/.
>
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-xtensa@linux-xtensa.org
> ---

>  arch/xtensa/platforms/iss/console.c | 2 +-

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
