Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5662034ACEC
	for <lists+linux-xtensa@lfdr.de>; Fri, 26 Mar 2021 17:56:11 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 93C2E349D;
	Fri, 26 Mar 2021 16:31:31 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by linux-xtensa.org (Postfix) with ESMTPS id E0D282629
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 16:31:29 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id x21so7085754eds.4
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bCYUHEJOOmAYGk1u0DJXlBrrHde9W54rxGamO+7985Q=;
 b=HDrGqW6dLSVa8fiG+befjHX77BN+C2c40r3vBuGfH7daUarEnQFO3rLCwf6ufadDS8
 y2dxq3h1ka6Y1YOFuK/ISSnioapWJhjES5XO3YS8JGR/CJcaBNznr1hX++rMJyQpeLr0
 w551pfbWKacC0BLsIZqCyJZaLSepEVbxXEN06+tRAW2ovYNj3xtWtvrN1w7gyjLUrGmg
 uszYR+zDWnMF5gu7RqDWQBxuGdCbML/bLlfGI6lftZ5Tn50hAeOVfrPVskQKtUyzjrC0
 SwG0c664JBu8PDzFTFVBIzwl306jL2pGji2hVkjgvTYiMYf84Gpp75+mMaVRo91UWD3Z
 zitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bCYUHEJOOmAYGk1u0DJXlBrrHde9W54rxGamO+7985Q=;
 b=WXBMMx7ri2RpnzO753JWW+yKffsvkQ4PI56u2JgRVNeC5xR5p9ZAqcrcMYpNIRxU7S
 apApAuXNOJvX7rTQdD1dP6/U7O4BiGWQNkgGZ0seAB7Ba44aIl66yUiu1h8AYveQCT5D
 jbMdko4Bco4se/ifP3fR+/l+QVt8Npg5vGF7N59Lywl/mbxrg7DFv0jTSKkls0VG7gjZ
 a3PsVrYLmN1q4oXK1Yztmxb4Sfoqs6sNo810nS/qrqnrOGERu7qZ75rrAShX6Ss+pyOz
 5K9MndOYed6RutDvB0gz7lH2H0ybAPQW+GgReE8ZLSN826m+xQDbxs1vpfAHf2zn5bWB
 Gbyw==
X-Gm-Message-State: AOAM533aLFOdp7n1lHKmaWeZKLSWNhDVXDsJwkWoai8cXvEH2/CB0o7w
 Tsn0Xs/E7TB3YpfdEAPxdua38G7ND0+UHVvZ5OQ=
X-Google-Smtp-Source: ABdhPJzHoc1Mn8WK2QJ07wL/A3pZkPV+pPANFtEm9eqfe7IddcVdMgszY0WNzNDlt8vUr6dE2+NV03oC7FcBVx+sndY=
X-Received: by 2002:a05:6402:26d3:: with SMTP id
 x19mr4248449edd.349.1616777768362; 
 Fri, 26 Mar 2021 09:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210326012739.18038-1-unixbhaskar@gmail.com>
In-Reply-To: <20210326012739.18038-1-unixbhaskar@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 26 Mar 2021 09:55:57 -0700
Message-ID: <CAMo8BfKFa7cuogeA4uNV+i-iudEwk+SnL+HGm+iK8POSZEi4nA@mail.gmail.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] platforms/iss/simcall.h: Change
	compitible to compatible
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

On Thu, Mar 25, 2021 at 6:29 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
>
> s/compitible/compatible/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  arch/xtensa/platforms/iss/include/platform/simcall.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my xtensa tree with minor adjustment of the subject line.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
