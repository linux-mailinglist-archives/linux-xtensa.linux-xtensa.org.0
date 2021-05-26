Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 82F833922A3
	for <lists+linux-xtensa@lfdr.de>; Thu, 27 May 2021 00:20:57 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 48FFC67B9;
	Wed, 26 May 2021 21:54:13 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by linux-xtensa.org (Postfix) with ESMTPS id B995A678E
 for <linux-xtensa@linux-xtensa.org>; Wed, 26 May 2021 21:54:09 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id lg14so4873121ejb.9
 for <linux-xtensa@linux-xtensa.org>; Wed, 26 May 2021 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iIpBLIMzGRYvskHBSahQGRziaVdJQLwsrKUZiZHBGVk=;
 b=sJxFyrkXldH5SDQNfUiH3m80MZZYTYScL+8UQVlYN92NY+S2dLSv/m5JlEYjjr+Oon
 gUak3e0jxOXERLqev5c149Djka1Hz3R+JLCpc1kXbqUtoBHlCSU3RVUSrAT7xZejuh5L
 CuhIO86R2EYoaMduis1UissveAXkNi32/Q7OJOrtaTdrOErRmS3RsE6Ibp3ZD4zs0Y5p
 8WFIu+E0xyLi0mWugdIm/R3uSzeJIh1F/wxXA9MVg39UU19ZglB0WgQ66V79q6fOEdRn
 6uTNRG2lSuh0tLBMzdYVUUacnAaCADGsUzgOHLyZRs9XvS35PRB0Ua7V+GKLmqi5Ek1v
 gcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIpBLIMzGRYvskHBSahQGRziaVdJQLwsrKUZiZHBGVk=;
 b=BsORhsm6sMzUn+Ma8G55db2jNzZP2B5amQDz99YYeyODtKTW5n0asMgDSz6rew7+ff
 LdTo2suZ3nLYLDKdq0K3BX6hLwUAvSKoTHbeTJSfvihPPRftkZUnXLHGuaB/ziBs/DNm
 zFzzdhqdX133M5TmiHO1QMFK08Okp2VGAJ93LYlRbue+xPMmuRo3TuBfE8hsDXW0qAYP
 /G7PjUwMT3+9YkZrMxpNsgJHqX4oE2ZuBLLqITfg0vVt3L4wZN7uf9VrxKlAFkuBAfUe
 GAMjYAy22QsfJkevvltgYBtpkeM0+SFkqpGpAMkn6y2NpESwo2ORgtkvU0k8fAvGKN0G
 b4Bw==
X-Gm-Message-State: AOAM530eodXpR1dseMcuu/jSCAFGJK6pJ60Ugck6HpwdgzoD2HIb6jNE
 BIKoxrvi4B1kdpV72Q370ymq6L9OgG4n+nx3LqE=
X-Google-Smtp-Source: ABdhPJx2Sn/rqiuYPzYo2n3PVEm7ktU/RhgCvCnZ3syyFNw9yyA2/11QenPl2PtDbZx3f34Ft1v+g5xmanRJlGqiOGQ=
X-Received: by 2002:a17:906:7c9:: with SMTP id m9mr493331ejc.98.1622067651563; 
 Wed, 26 May 2021 15:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210526070337.28130-1-rdunlap@infradead.org>
In-Reply-To: <20210526070337.28130-1-rdunlap@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 26 May 2021 15:20:40 -0700
Message-ID: <CAMo8Bf+2GMnsaxKCKKWHDNDGA9MpyTcKzf9LTLhEXPtT9CBCxg@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix kconfig unmet dependency
	warning for HAVE_FUTEX_CMPXCHG
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

On Wed, May 26, 2021 at 12:03 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> XTENSA should only select HAVE_FUTEX_CMPXCHG when FUTEX is
> set/enabled. This prevents a kconfig warning.
>
> WARNING: unmet direct dependencies detected for HAVE_FUTEX_CMPXCHG
>   Depends on [n]: FUTEX [=n]
>   Selected by [y]:
>   - XTENSA [=y] && !MMU [=n]
>
> Fixes: d951ba21b959 ("xtensa: nommu: select HAVE_FUTEX_CMPXCHG")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my xtensa tree.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
