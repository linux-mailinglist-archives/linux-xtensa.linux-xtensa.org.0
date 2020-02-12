Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id ACF2915B22E
	for <lists+linux-xtensa@lfdr.de>; Wed, 12 Feb 2020 21:52:39 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 058FC52C1;
	Wed, 12 Feb 2020 20:41:28 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by linux-xtensa.org (Postfix) with ESMTPS id A1EAE524A
 for <linux-xtensa@linux-xtensa.org>; Wed, 12 Feb 2020 20:41:26 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c23so1411323plz.4
 for <linux-xtensa@linux-xtensa.org>; Wed, 12 Feb 2020 12:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ktEu+4lqCDbKO9qnX2sTlUigBje7mt6XvSgw9jTL1Mk=;
 b=uTDlFixc9E3zW4wTk0TrpEQ2A3Yli1behriN27YAL8w35rHbk2z+09sIys8fE4GSiO
 L5jyVxcLE5sYowM0Mkb+TgFO66yvc5H+CjNsF6nlPAmfrH3NwrA4aDcqMslox3XL7AMm
 FdSXPyFcop/k3XTrwwTNEkf5kayQUlnEUq/7/suKwCn92RI0hVjsPXI0+rXxHqVC3NLb
 3xDXT9x7DXMJBdrxZH1KxnezomenMaoz7H4Xe3kv13FwzwM3nYKwN+BA8VB+3dPOKErS
 iuLTXzw8ztaXWV7aW62YauSfz9ya4Txr9pikwo20YqYEBHddQNVuPeNnBjY+2TLeKe1P
 meww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ktEu+4lqCDbKO9qnX2sTlUigBje7mt6XvSgw9jTL1Mk=;
 b=UECvEK3NWfdDYbXZJs8NCcftq9JI7VHoJayPWRLvVD7/lPOAW+Nf0VDTwoXdzOu9/L
 GYiErzRI3+M9noROyzWJUZWyLZHBtqeXar2r2hlD4yPEw/S/dK6OGw8ZgMujcan9UtjU
 zWwp6DjmMF5KHIdnoIWG2Y5dsuDMZRiKvpFaoDJKAmrW4ZHhvtCxY4fh24k+VzwTMpl1
 kjXWgO+dyRAhduHvsyoS6heMn8MjO6maT9PhhNeUJnD15HBmBnEQGmsGGi6Ds9wskn/k
 Osk2XgwT5MmoCSgA/sSBo1HdMwz0SAFm2/iqoHF9mIBvLXTxrREfRMCpsIwdBlVmua7s
 tIoQ==
X-Gm-Message-State: APjAAAXSAs1l53u4mi9MLOB95S1zo5mG/xbUpX0P1BmAsgaRxjjeJH+R
 /Aec7oMiJwun3UAPmHj8GJoqpkFONulcFRW/u2U=
X-Google-Smtp-Source: APXvYqwxpkbf0L8zsRg5l2ML4V17u7r9J3ky+ezHWyvI6+qF3r5FN6i0X2ddHsr1cxJGlD0sr2lEoIiUu0uJATfEkKs=
X-Received: by 2002:a17:90b:f06:: with SMTP id
 br6mr974150pjb.125.1581540756516; 
 Wed, 12 Feb 2020 12:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20200212101947.9534-1-geert+renesas@glider.be>
In-Reply-To: <20200212101947.9534-1-geert+renesas@glider.be>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 12 Feb 2020 12:52:24 -0800
Message-ID: <CAMo8BfK9LFfopJcNUDruFK-G_KqYP=7u9zdpNgZ5OZ_Ty7rO8w@mail.gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: Replace <linux/clk-provider.h>
	by <linux/of_clk.h>
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

On Wed, Feb 12, 2020 at 2:19 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The Xtensa time code is not a clock provider, and just needs to call
> of_clk_init().
>
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/xtensa/kernel/time.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
