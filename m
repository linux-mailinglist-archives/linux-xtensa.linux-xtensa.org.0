Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 91ADA8BC26
	for <lists+linux-xtensa@lfdr.de>; Tue, 13 Aug 2019 16:54:11 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 49AD2655D;
	Tue, 13 Aug 2019 14:48:59 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by linux-xtensa.org (Postfix) with ESMTPS id B63E26550
 for <linux-xtensa@linux-xtensa.org>; Tue, 13 Aug 2019 14:48:57 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id s142so10102212ybc.6
 for <linux-xtensa@linux-xtensa.org>; Tue, 13 Aug 2019 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1KU9mje70e+6lKi+rMvXi2qXDx/1Q5yRIVbPscoGXPM=;
 b=h2ukMp8EPMkBgpIyyFxOgCduzQ3gQstydJDnvvMifx8yP8rJ2dG9GZ1x/yiAVJ6uu4
 2KGThU8AfrzAQqyCHPSHdZOy8WnmUJ43QM+7a/HL1u1GN9tvmiA9hEiDJBLzZi2luoYK
 yXPNHTf+Z/kJ6n/LGkEJyXFQc9bLFQqmtVL/iZOhnc9rUQbGrsSfz5taksMS3bcEl4cJ
 tJIw0cMVUCyBbd9m6bSdntaaFaQwIxp4+K58HEHnvxaDiyg1z/HLtN5Jz7mtkxhbBc4b
 WsX9fQF/oypxcHm+j66KAgiMfnnyPXXLEIG9oxp5eLgtMCbx7yjM2QjcALIYeb3Xy70E
 c2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1KU9mje70e+6lKi+rMvXi2qXDx/1Q5yRIVbPscoGXPM=;
 b=poDfwh0Gjy8RAIv1Q/lATRzqHP5vmSho87E2xeoqHYVp/51Ze77jZvnw1PS1CQ/BAt
 7k2Uy2AwaX6tLauPBRzJ8MtUHqSD5S4aVEMrC6Y1s0vpt7pHoWY+hJymDevBwtuZCO0h
 T1wdfA1TKnTGOFuVwG9RROgdE1H4tLyXdRB8J9aPpRthEiWLoyRT5GY5cVoGqeoCsFU9
 k3VmwMddQdCShV0ukUFokdbocLde7udI3jUuWJ+tuSFnCnOpMVaPg07eQmBLDYn9OcVl
 V9CF+/BeJJKGL/pvsE3AQdzW7ZmvGoHX5gDUqo7ZZ3y/4ppKf6CWRT6OYA6G0LVNqKYD
 IsuA==
X-Gm-Message-State: APjAAAUA3fStqtI/7mjFyQ3o6Vkyqx9k+cWnLaLmQ7zUqdjEM8kGc0Lx
 1ip417utMoR/hBoX/elsdsz3rRl+UZhvu6ol9X4=
X-Google-Smtp-Source: APXvYqzTiFoZxKA6/w46nHrRRZNZR7l/RR8F8w5xde/qo5FAy4WJMIytp6bjq8QMDOMdBbsqhP3SyXTD8emi1H7HPkk=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr7416427ybp.25.1565708048859;
 Tue, 13 Aug 2019 07:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190812220847.14624-1-jcmvbkbc@gmail.com>
 <20190813124815.D64A520840@mail.kernel.org>
In-Reply-To: <20190813124815.D64A520840@mail.kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 13 Aug 2019 07:53:57 -0700
Message-ID: <CAMo8Bf+AAo0+4yriZv-RpGHchAODJ5y1-jFGvYbJcBx958dkSA@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, stable@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: add missing isync to the
	cpu_reset TLB code
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

Hi Sasha,

On Tue, Aug 13, 2019 at 5:48 AM Sasha Levin <sashal@kernel.org> wrote:
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
>
> The bot has tested the following trees: v5.2.8, v4.19.66, v4.14.138, v4.9.189, v4.4.189.
>
> v5.2.8: Build OK!
> v4.19.66: Build OK!
> v4.14.138: Build OK!
> v4.4.189: Failed to apply! Possible dependencies:
>     4f2056873ff0 ("xtensa: extract common CPU reset code into separate function")
>     bf15f86b343e ("xtensa: initialize MMU before jumping to reset vector")
>     ea951c34ea95 ("xtensa: fix icountlevel setting in cpu_reset")
>
>
> NOTE: The patch will not be queued to stable trees until it is upstream.
>
> How should we proceed with this patch?

It should be applied to stable trees for linux versions 4.10 and newer.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
