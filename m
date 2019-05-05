Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBAD14262
	for <lists+linux-xtensa@lfdr.de>; Sun,  5 May 2019 23:04:06 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 803A96503;
	Sun,  5 May 2019 21:02:25 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 by linux-xtensa.org (Postfix) with ESMTPS id B1CF364BF
 for <linux-xtensa@linux-xtensa.org>; Sun,  5 May 2019 21:02:24 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id q11so8923601ywb.0
 for <linux-xtensa@linux-xtensa.org>; Sun, 05 May 2019 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OC9S5nxsiFAZqqpRBxbTCsDMwuClA3NcvUZEP8LG46U=;
 b=gFtHPBW89W2hzDgjJ79WfKxPsyVDKNdytzUW2Hy+GBQO1TOGbU4lNjoo8n0dKLMWIZ
 l1cR+snA63iM1fqu+0ytXt0XjFTJtT257KbrLuvtqjv65h2rqEN+SumsNpOCTEPcUvP4
 cA06DVq96OWSAMwkdo5EuufYpkqaebHmUDk9h3Ylq9VXJPeWPi2UrCYkyhrqWwb0O5MS
 v1xv+brC/C1rzkm55yhBQ1yRDxByD/6jVG7A1Umfc/Yd2IwhHuIcRGEOD+0wOnaSvkRb
 j+We8dhUIXaOG/MGXFnRtim0zUOcNxIUQ8xNFaCWP9QhUvPviykIvrqtvteaWCTE7nDT
 Yxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OC9S5nxsiFAZqqpRBxbTCsDMwuClA3NcvUZEP8LG46U=;
 b=s405J6+2Ioc5zH1ok4nnzPMs4Z7dK3wl9Wgtw21djWp6JvAak5ZRgUjKhrESg+8xLS
 7jfWlvzwQFdlkQe0PAjgNn96MLEzr8sZUlkHzpW4X5l5RcEONUWdws6v6hmlTYWjnfb2
 TWUxlopFALzfR3mFSKKV9WUISDTPPAAmwcq092y9Pl+vWbbyL0pNzf5aZK3pTKS5Cb1l
 KD2t7QY+n9WZEkBEvGqzFDQEm1pyh8MVxyH4fH3Mtk8PRXyIcGy4Pch7QG5lK/30tHlQ
 knSilQfwU19pTRYOcUKO/g0qc82ZTkYI2qS20yvJSHFZRb/rIxkNBB6Ehr28/kww538e
 kwwQ==
X-Gm-Message-State: APjAAAWJHvaz5smYKAO2rM05ug+R9GAT3gokmpa04JOW767nSE6sJXon
 Y8MChB9NDfpILS4U7T99yDVb8/14paXKSeO36kc=
X-Google-Smtp-Source: APXvYqxQnn0QEZmIpEyFHtAlxlqnT7COf48RkSBlp72T+72bYftY6ZoqCUTyPr35HX6sQQRKjawPN7TyqpvwHdunKb4=
X-Received: by 2002:a25:308b:: with SMTP id
 w133mr13951185ybw.405.1557090244948; 
 Sun, 05 May 2019 14:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <1557066367-4783-1-git-send-email-cgxu519@gmail.com>
 <1557066367-4783-2-git-send-email-cgxu519@gmail.com>
In-Reply-To: <1557066367-4783-2-git-send-email-cgxu519@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 5 May 2019 14:03:53 -0700
Message-ID: <CAMo8BfK5fyE58cQYK30HJypYiU9r8f0TAys-87f9VfQe-+mYsg@mail.gmail.com>
To: Chengguang Xu <cgxu519@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 2/2] xtensa: set proper error code for
	simdisk_setup()
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

On Sun, May 5, 2019 at 7:26 AM Chengguang Xu <cgxu519@gmail.com> wrote:
>
> Change error code to -ENOMEM from -EIO because
> the error is related to memory allocating.
>
> Signed-off-by: Chengguang Xu <cgxu519@gmail.com>
> ---
>  arch/xtensa/platforms/iss/simdisk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
