Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id D8B7B2FCFA
	for <lists+linux-xtensa@lfdr.de>; Thu, 30 May 2019 16:13:35 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 678C552E8;
	Thu, 30 May 2019 14:11:01 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 0B7D652CB
 for <linux-xtensa@linux-xtensa.org>; Thu, 30 May 2019 14:11:00 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id x187so2204532ybc.11
 for <linux-xtensa@linux-xtensa.org>; Thu, 30 May 2019 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FYJPRskixwn1nFPNV2wbt36LZ1ahlZ4OUxU9DsdvakQ=;
 b=rA9bA+qWjeYMvUekVTww//KlxVzlp/lmiBQ0SfyqIX/VLdFSNCXP38de2h9355NuVD
 ny4cdDMmCaTNXv4aonL8PkiCqH69daWrUkkJm5XRDO5GccDjB+Ds5PLeq2BMpcK6e3FZ
 ilBB7du8Z8YVnievNdukT1liMNkKtDYx5+XnrASMQxnNmFuiEC4GQU8kPOF+EJ5eT7no
 p2Sabns5mZbI+9LEbz2/Rhluk186KFEmcQGlwyEGjlargIb+o3xxL8hNDhjWrZmJYD/q
 8/hVXe3tZEmERQo+Vo7v5+n1DoDopc7KEFssE6GtYrbCLVfG6qtKnNKus79azZlOBwxB
 mzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FYJPRskixwn1nFPNV2wbt36LZ1ahlZ4OUxU9DsdvakQ=;
 b=c5ZqpQk6+Ga04xiw4AggdKhqG6OT2IaTRF7NUZu2UijDHw017/88i1Pl3khdHZYowE
 gLNQc+HNAhwDltUeOeFQ/kJ0E4+DeXTlAbwLWic79rEDXrkmehw+dXvqidEY1XRD8a2G
 KjQGAm5ZmYnk7wNLauc1IGjZh98Qze3GjTUGd5V/HdtEqdjkN87CA1mGXFq+unI0ujD4
 1FG4qJ8QeaYw6sVdPemM41A1/hkY2yv/WA2MQbSDe5gKFiKVzjejuEb/e35svhuiQ7au
 JeRh+/7RE1u5lQdKBpZd9Hur1mT263uoLowK9tytSYlDw1t4/qYo/5iBLSBWVSBGZIPq
 ROMw==
X-Gm-Message-State: APjAAAUUI91fy1tk63bt7PcGmT5FGHEP6q5Me9T5TLmf8kwjpWtfgFYR
 u9SBNGZPDvfMqpUjqId1ekl7kAIp72gcQVjUoJw=
X-Google-Smtp-Source: APXvYqyCsM/g4pEb9OIeM3Fv7ATI5xHJ5TOzuLvLBOO1HxB0g0rtYiBAKsDnN69WyJUMfi7ULBCsKNHW5D9Ad1zt6Mo=
X-Received: by 2002:a25:1f42:: with SMTP id f63mr1589876ybf.25.1559225611715; 
 Thu, 30 May 2019 07:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <1559220098-9955-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1559220098-9955-1-git-send-email-linux@roeck-us.net>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 30 May 2019 07:13:20 -0700
Message-ID: <CAMo8Bf+m-a5YEubQMxuZuF0_-hZCop2F-+nomd7ELjz8SQToXg@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: Fix section mismatch between
	memblock_reserve and mem_reserve
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

Hi Guenter,

On Thu, May 30, 2019 at 5:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Since commit 9012d011660ea5cf2 ("compiler: allow all arches to enable
> CONFIG_OPTIMIZE_INLINING"), xtensa:tinyconfig fails to build with section
> mismatch errors.
>
> WARNING: vmlinux.o(.text.unlikely+0x68): Section mismatch in reference
>         from the function ___pa()
>         to the function .meminit.text:memblock_reserve()
> WARNING: vmlinux.o(.text.unlikely+0x74): Section mismatch in reference
>         from the function mem_reserve()
>         to the function .meminit.text:memblock_reserve()
> FATAL: modpost: Section mismatches detected.
>
> This was not seen prior to the above mentioned commit because mem_reserve()
> was always inlined.
>
> Mark mem_reserve(() as __init_memblock to have it reside in the same
> section as memblock_reserve().
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/xtensa/kernel/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thank you for this fix! Applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
