Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 804EC41F7F0
	for <lists+linux-xtensa@lfdr.de>; Sat,  2 Oct 2021 00:59:42 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9DFF852A6;
	Fri,  1 Oct 2021 22:28:26 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by linux-xtensa.org (Postfix) with ESMTPS id 86FB368B3
 for <linux-xtensa@linux-xtensa.org>; Fri,  1 Oct 2021 22:28:13 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b8so5408008edk.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 01 Oct 2021 15:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YA12nK83s/TNYLDvQwUFF9PY5FM7hou6RsLv5OdhbxM=;
 b=bm/wO19DYmJWBUdZP9xxncVfqB6iNgJZredpzXZSB21J2YFKEaJzMrEl+hBmitM96x
 8594UGy041h6SjDS5W8vXYue3MYSoXxiimvB5F6taMnVfvAWT/0e28ehG20FStAaJT/e
 ZYgL0jSmxOGW1QTivg8FLAS/E+hFNf3c4W94P3nlXvkvf/A5w1Ul4j+E7KGLz6O8qdbR
 jlLkyaLVPA4KtiFkxK2c5Czuyg4JSdJ9/LBgY1E+jCBYZ2RFZ6syqkr9xYRFoI8i6yYJ
 95D8qpQXN8kGF0VROtIkgpqWt2/wf0x/bFlGsfH2+w7Ru2kkfwvxRlGusb7UKSIWD4nZ
 0h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YA12nK83s/TNYLDvQwUFF9PY5FM7hou6RsLv5OdhbxM=;
 b=TJJUxswSPBYRzzHsvmlCXszmLrhYxB3BaGKs+iOeCvBAG+jB6WE4TVDA6mskTKOULm
 p29hj9L4NNPwym0Efa6psIbwGJuSYNUFHWovuKemNSc5ZZlzMng4CEfmwCJe8nWIJyLq
 7fT7KrM1wLAvp2Z0eNPlMJV+8u2GYRxkia0LOwFvPzG6IiuG/Zj9y6E9vajaYM914v8N
 OYjzq0+KsZCkZf8EDp/E17ciYzR/VP7704RkF4M7HDKWrpEJjzUt8dBo2stqt/IR3DOD
 Mp1sLac422NWpnfKNvs9VwPN1maeEwzSWdQejLULo5GxyOeSiJEIYPRfSlFBsrK5tsQZ
 a0cg==
X-Gm-Message-State: AOAM532PWgU7MhS/OWIYPdLd4yuydw+Du4TCgsRRjO5OklmC/GM9vfhG
 46E+TtTHs6vfgNhKW2u1GGU0wYOImzffQJJ5I6s=
X-Google-Smtp-Source: ABdhPJwWpDj5kHygwCCXM/715fS54f0YYUA5tYC9om9/vZhii3Qu5fpOpoaBBnG6byRP+Sm5G02E3QFHQIArOY0rCmw=
X-Received: by 2002:a17:906:3157:: with SMTP id
 e23mr683027eje.29.1633129163457; 
 Fri, 01 Oct 2021 15:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211001213228.1735079-1-kuba@kernel.org>
 <20211001213228.1735079-2-kuba@kernel.org>
In-Reply-To: <20211001213228.1735079-2-kuba@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 Oct 2021 15:59:12 -0700
Message-ID: <CAMo8BfJja6c+Pppygk7kkuoALJqEcKZAkjpinO5Y7SRj9c1vow@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, netdev <netdev@vger.kernel.org>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-Xtensa] [PATCH net-next 01/11] arch: use
	eth_hw_addr_set()
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

On Fri, Oct 1, 2021 at 2:32 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
> of VLANs...") introduced a rbtree for faster Ethernet address look
> up. To maintain netdev->dev_addr in this tree we need to make all
> the writes to it got through appropriate helpers.
>
> Convert misc arch drivers from memcpy(... ETH_ADDR) to eth_hw_addr_set():
>
>   @@
>   expression dev, np;
>   @@
>   - memcpy(dev->dev_addr, np, ETH_ALEN)
>   + eth_hw_addr_set(dev, np)
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> --
> CC: Geert Uytterhoeven <geert@linux-m68k.org>
> CC: linux-m68k@lists.linux-m68k.org
> CC: Chris Zankel <chris@zankel.net>
> CC: Max Filippov <jcmvbkbc@gmail.com>
> CC: linux-xtensa@linux-xtensa.org
> ---
>  arch/m68k/emu/nfeth.c               | 2 +-
>  arch/xtensa/platforms/iss/network.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
