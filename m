Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6A47B37FE24
	for <lists+linux-xtensa@lfdr.de>; Thu, 13 May 2021 21:32:18 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id CB9A6706F;
	Thu, 13 May 2021 19:06:01 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by linux-xtensa.org (Postfix) with ESMTPS id 97A94706D
 for <linux-xtensa@linux-xtensa.org>; Thu, 13 May 2021 19:05:58 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id j14so87298ejy.1
 for <linux-xtensa@linux-xtensa.org>; Thu, 13 May 2021 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+PFEMK3YaHztEuLX/0qHNhPRBEmn2XvXgUGBhkca4xE=;
 b=K25CsnCq077r/r4B1m2yh81D9qgKhQYnf99ghLEffSrrY380rLAFfdixlvEpKlaY5j
 oWn0+BYK8RcQPQiQ/TEgcdTJUspxoafxOK2/prjgh5vpSgzu0pabQYjUdMMHdfoe2QwX
 anfuESWtWPR+nGAI1F2edxjQpghAyY0r7KS6OKQD3Ez4jY6bFBHyzQmP6LJBV+TscYi8
 I64AsH/yHsdcDnFOHIZaE1PRR5sMlZDFr4j/VIPwYLNM8qSH7fpsyQzuzXgowY9pYTLv
 UqYwvySdodmLWy4JyoPMkmYEGtjasdEmyo8z6dKbp7DWWea2GlSM1B+CVHvxBwToisXx
 XP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+PFEMK3YaHztEuLX/0qHNhPRBEmn2XvXgUGBhkca4xE=;
 b=VWzYBNnVGzTtqfuMjHGt50xlNmHZJ9QEB3shfYkvZeyvg8q4SU2vEsmaDq6swi0Gha
 /T3LiMKAkFCebX0PoDgzJfdPBb1ulvK4qFlSZXQlL03IlyKtrzrCJrh0h49Os/0VnHUX
 YoGfvgS9Ossv51BXj7P3uFFJGqwyiABNYTPzwN9adIblO8BKAhvUximQzEYbzzjtBzLM
 ktZi8JC5QL59KGEwpOgz9SvdjCI54BEwLE6uj7NcF3hE9Bya0v+EzgIo2hmHYo0koVoZ
 H6z8aFOWeqm1u47z5eqELK80yb2dkL/VXedLjGa2K1efQpXB2y24ZKwlou46bzx5kCVg
 jlDA==
X-Gm-Message-State: AOAM5339jpqqCGwRMRIpjhfX7nfY9CDovlTC+VuFD/de/mb502AjSs95
 xiV7ewb8tQfx9MmhVbXSGBUX08u5cIyOiAdl080v0rXtDl3/0A==
X-Google-Smtp-Source: ABdhPJxfxbrOoBqYhgwMN1FHd94U/QcMTZqsbypSB9DP59c8nitHkqyv7qIslc0RVVZ1JUKtd5OUx2KRWGCZ6L17hxU=
X-Received: by 2002:a17:906:90d6:: with SMTP id
 v22mr1608070ejw.98.1620934333317; 
 Thu, 13 May 2021 12:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <1620904043-71858-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1620904043-71858-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 13 May 2021 12:32:02 -0700
Message-ID: <CAMo8BfLAsoADU_9G9ZB4PRbw7b98vkRzXpgiB12RkXx1g5aGqA@mail.gmail.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: Fix duplicate included
	linux/unaligned/generic.h
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

Hi Jiapeng,

On Thu, May 13, 2021 at 4:07 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Clean up the following includecheck warning:
>
> ./arch/xtensa/include/asm/unaligned.h: linux/unaligned/generic.h is
> included more than once.
>
> No functional change.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  arch/xtensa/include/asm/unaligned.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

There's a patch series from Arnd Bergman that reworks unaligned
access posted here:
https://lore.kernel.org/lkml/20210507220813.365382-14-arnd@kernel.org/
resulting in removal of this file. I don't think it's worth doing this cleanup
in the meantime.

--
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
