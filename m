Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id F10C634ACE0
	for <lists+linux-xtensa@lfdr.de>; Fri, 26 Mar 2021 17:52:51 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id CA4D6348C;
	Fri, 26 Mar 2021 16:28:11 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by linux-xtensa.org (Postfix) with ESMTPS id C4AC52621
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 16:28:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e7so7031163edu.10
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cDbl67tvF8OovMe6VinvfdUCa6x5BHz6kSSiYldWfJk=;
 b=Qbs0yBiRKtLJ2KCXp+J5GjFs4U7GpBFybUduP+k8nrWQYJgbtVExVU4UwQR4b8omfK
 IhQtGNsPwO5LMmxMomfTaoid94NJ48p0lr1aamzf8/ZKeFpZ1gozChEU1I1LnbfV8hP4
 q+MArBckr3rjae6N8Io62zJ1K6quOqC+kwsDboStUB5TCtsuaZOg+vBI5Sh2FQbZ+e2G
 E54wiErhTqoQfRBfjBdh9xg3qicNLT0hQfdZifnzg8nZYoFxkDcmgIpdQSB8VEF8tfM5
 wUfvWNap/TrQ5ZCUz5nguKaNP2x+voyxKym/BW3wv+6Jd1nscxtX8VHc9xPjP+YIomdn
 Gltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cDbl67tvF8OovMe6VinvfdUCa6x5BHz6kSSiYldWfJk=;
 b=lk6mPoIlg4y8Fkg5Xq1eIeLRj4hd/5beEn4upLTSDSCk/vCgqw2JDS36kLvFmMV+ij
 6Yb3VcAax1ii7XjG9uGKoHzlC3XSO6d3fWzrH0sLxZyCWRvlp3RsrDwY18cmTeejZUaT
 +Uy/fnFyL4rSy5PANR0JL8SK/Fc0FqNKUe8fZ7trimvT81KyZ4fWU81ofnsJqE27cNJ+
 yjKN/O63zVGhUoE5WKdCdzwysNhqMGESeAuT9PZNiakFl2AtkBvcjFUIwytEgEVTXLxg
 K0JpF2hqJrEnykNxO7rrq4oy4wi0qr3cIHPuANnSrT0qgm2OomKZkjHu6bF0fv34dmPM
 27pw==
X-Gm-Message-State: AOAM533cGPwqSaDQN6VfxzVSlcfm8BH4R0s27IWB6Jvk+XUW5XhX4dTZ
 85kAS6qnj9MecZPgqlx8nE7VrE6czoMZquBlWKU=
X-Google-Smtp-Source: ABdhPJxG5L4xR1xkmSPVaNGmo7Cuk/Ev2JHNRDjqvio+PhFTxUUSX39pjPdtuUkWh8A714ubgmde0lHlDX6qUzKtj0s=
X-Received: by 2002:a05:6402:2552:: with SMTP id
 l18mr15875581edb.71.1616777566087; 
 Fri, 26 Mar 2021 09:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210325040832.26018-1-unixbhaskar@gmail.com>
In-Reply-To: <20210325040832.26018-1-unixbhaskar@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 26 Mar 2021 09:52:34 -0700
Message-ID: <CAMo8BfJarLtN1mU3MMSeRik17k13MAFK8fP+E2SHkcHdLnLfUg@mail.gmail.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: Couple of typo fixes
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

On Wed, Mar 24, 2021 at 9:09 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> s/contans/contains/
> s/desination/destination/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  arch/xtensa/kernel/head.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to my xtensa tree.


--
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
