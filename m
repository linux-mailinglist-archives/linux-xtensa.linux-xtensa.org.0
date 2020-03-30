Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 37803198568
	for <lists+linux-xtensa@lfdr.de>; Mon, 30 Mar 2020 22:33:55 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2EB0952BA;
	Mon, 30 Mar 2020 20:21:15 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 17DDE33BC
 for <linux-xtensa@linux-xtensa.org>; Mon, 30 Mar 2020 20:21:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 23so9198178pfj.1
 for <linux-xtensa@linux-xtensa.org>; Mon, 30 Mar 2020 13:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAka+afRnaX/ZKYZXYNGXTAgpgy0/w8V+P2H1maC28M=;
 b=OAYuBRztVNI6QkMYDgfMScWINgazrjd7nqaQt1VP4/JIezme1Azu4u6KQCd8q2ooBC
 evqIq1WXLUGY104DtbqXII7QGPctmwATPb7ajGGATjHT5PjASxYbzoKcrih4RIVqGTbc
 lEN4wKNu0C1GxCxdBMYMvucJuPYZualHOTRes/emNr05WtUV03zRGdUVRTbF9GCFGpX8
 iFuoyxH4Sw68EYD0DqXNzVSpOzYAXiHGmGJltHrVL4xHELR5XA6lgdr65/X/25VBHpxo
 WCKx4j0nrmzr3kG8nlTGfOOEBVbbtproDCJMLtdYFE7zVaj9IxhNR0kbRe9DINxnbotU
 KxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAka+afRnaX/ZKYZXYNGXTAgpgy0/w8V+P2H1maC28M=;
 b=Emj3m9jxHWfYRy9GzIWlREX26/DIk3qU8Kx3q+7fK8FMxaFUgk4F0Hpowq6Rn35Lm/
 YDJ6KevMItwYbfRYvgZoOowQFXN/oFTWlmDnGgf6AR+RkPgvX0FYY/kwH3/4cYb2sSI4
 YEzlzmjrES3fMHc1mXK8B1YoW4zSoqXtDYQJK22wRlTsI9O7wOzNykoKJWoE9bk1dujV
 18h4HL0Toqn7ug2zG4XYGDzI/iJEvGdtyrT3kwgvX8GxI7k537FGNBwJKb2ZquXmnrCO
 Pm7tZQOCT9lHX3uAf8wFiEAdVdeXJEIjyCF6QaikTOC9qatCBiOmFr34XZ9vmyui/mYN
 w+Hg==
X-Gm-Message-State: ANhLgQ2svlNrcT4d3NzQ5/ZqAKRI4XgiU3RP5kOPoNZLrFU1pYqebBsa
 d7TUBgJB4X9pV4t7CLXTp9zudYFc3nG1xjJclDU=
X-Google-Smtp-Source: ADFU+vu2tg8gJ7kLYAl7nWMJb48d7OIqT5mNfZrMCzL0YQvOscWqjzviXMI3DhHC75s9EINUwjGWrIXeu6A6naCSwFY=
X-Received: by 2002:a63:9d0c:: with SMTP id i12mr14358603pgd.378.1585600431631; 
 Mon, 30 Mar 2020 13:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200330045436.12645-1-xianfengting221@163.com>
In-Reply-To: <20200330045436.12645-1-xianfengting221@163.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 30 Mar 2020 13:33:40 -0700
Message-ID: <CAMo8BfLQuKHsqM5yb0N6cfquCoXR17rnkt+TXG01Fkz-Po1pqw@mail.gmail.com>
To: Hu Haowen <xianfengting221@163.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] arch/xtensa: correct an ungrammatical
	word
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

On Sun, Mar 29, 2020 at 9:55 PM Hu Haowen <xianfengting221@163.com> wrote:
>
> The word "Dont" is not grammatical. Maybe it means "Don't".
>
> Signed-off-by: Hu Haowen <xianfengting221@163.com>
> ---
>  arch/xtensa/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my xtensa tree with a slightly modified subject
line/description.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
