Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 28B79228ED4
	for <lists+linux-xtensa@lfdr.de>; Wed, 22 Jul 2020 05:57:06 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6F7D9348C;
	Wed, 22 Jul 2020 03:40:41 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 2BB65262C
 for <linux-xtensa@linux-xtensa.org>; Wed, 22 Jul 2020 03:40:40 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id m16so305102pls.5
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 20:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ejoo3rO99IZBQPRKW1OTgn8zf/3hAJuMMg27TmWfP+Q=;
 b=VXVhWK8MlscmTy1bvIXvmKuFGU44qSqaAtvdMosv9fuyjE2YXLfjBezi75DjdgNsI6
 WetaYfdjiLVp+vV7tL135FtWDYArPWzyoRuYPS44KnuP8JCwAwZ8nJx6mKdsGcmjFN4O
 UdkHFqQ74wK3M6V2WZi7iKlzKXXXBmyBR8MujScSCmAuBO4CTBw6eJ0+KGgZCpmT/5Eb
 mFzXvIR/so+VjJbj5nVz+DoxYKffQKoBmq/MSu9pHRzD3o3y9BBC4ZmEJy5Lvp1U9l8z
 Q+ShxUIx22H7nCkH3yCHWO8EU+hta5wyCOcUImjBbvx5+r+PSnNMPkk+pwiNClDgM5u6
 Zwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ejoo3rO99IZBQPRKW1OTgn8zf/3hAJuMMg27TmWfP+Q=;
 b=lmKdud/bW0FCVGm84XVSCpTCF4DsczdvnvlLQrkv7wl33XOnmBFrC10IlmOgcuTIAI
 SEpuDRslc6vvUjSW4QhxDI4+TZ1Hdx0L3P1oo/CtcY79YoeL9aErjYNSJiMOyQLBwmwH
 K3Sz2T6q7b2n2w5L22wtCBLgb8XGAUpIK3wXgRb9fX6A8Z4VafF6043vif9wrqscQ9p7
 OIY5js0msasPUxBSTBwHXB6ofr3ojwfVMmA/omMYDBcLP3wbNmw4//bC1/PBKgEBhgX5
 b0pBiXQEVYqJ75u2AY8KghRAIUrEj+5Yjeu8C+bX3BaW1u1W3H4MbLZs2Rik/Y0nuG/y
 npxg==
X-Gm-Message-State: AOAM5307wSfhXY5jKicAEAIMAn7f2B4AkJNEPoWU97YUyX/zPMxD3OvS
 uRCGr3ViRWY5r7H6fU70DhI94IGTcJgFhHuHB08=
X-Google-Smtp-Source: ABdhPJzsrWI6yfXZXfqTDdc6Eemz6SwGqaWtrigchgHMM/oN4Qj11ro+26f0+OFV8IV1aztKYu4E5wJ36htkctlhZ90=
X-Received: by 2002:a17:902:8ecb:: with SMTP id
 x11mr19444104plo.123.1595390223558; 
 Tue, 21 Jul 2020 20:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200722004707.779601-1-masahiroy@kernel.org>
In-Reply-To: <20200722004707.779601-1-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 21 Jul 2020 20:56:52 -0700
Message-ID: <CAMo8BfJv38cPOAOOMGn8R7-CtBy2BCbMRkMAeXNZ=A4YbtTPbw@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: add boot subdirectories build
	artifacts to 'targets'
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

On Tue, Jul 21, 2020 at 5:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Xtensa always rebuilds the following even if nothing in the source code
> has been changed. Passing V=2 shows the reason.
>
>   AS      arch/xtensa/boot/boot-elf/bootstrap.o - due to bootstrap.o not in $(targets)
>   LDS     arch/xtensa/boot/boot-elf/boot.lds - due to boot.lds not in $(targets)
>
> They are built by if_changed(_dep). Add them to 'targets' so .*.cmd files
> are included.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/xtensa/boot/boot-elf/Makefile     | 1 +
>  arch/xtensa/boot/boot-redboot/Makefile | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
