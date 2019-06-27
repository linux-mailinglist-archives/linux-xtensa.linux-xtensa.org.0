Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8174958BBA
	for <lists+linux-xtensa@lfdr.de>; Thu, 27 Jun 2019 22:37:34 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 4C33765D5;
	Thu, 27 Jun 2019 20:34:01 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 2F44665D3
 for <linux-xtensa@linux-xtensa.org>; Thu, 27 Jun 2019 20:33:59 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id j8so2243845ybo.12
 for <linux-xtensa@linux-xtensa.org>; Thu, 27 Jun 2019 13:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9nVOtlju8csIcNRRNwvhU29isQ3Rt4IPNLGyKSCvv90=;
 b=gkX3/j7eA/9Dj6rOAXXvFLWl4m4E+rlkxxmn+g/fKNORNs1hO6b8z1g8OwGu/JGEfn
 buOFuAB4ltgph5dqxxu2zCyygo9C3C1bhWaALqEyy8xYxfRQNeyhuGVEeopJSXCGMNDw
 7f4ld/9jEGn1F3TSYnIdlNypUjmtsk2V/yBzgcGX9htotPephx45YpG5Q5gwIxSbl98V
 kAzDXC8tariAgUcmYO2HvzQ1UKNLmSwHqdK26R++vTbGlUK0NWDBpMG+eTQ07E/8+0QR
 0FNU8m3XuvAkTeL4NCOZkcW06+0L4mrrtFU8dGufBw7VzNqIEFaFMxG0gpmSSNbA+0Ax
 sOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nVOtlju8csIcNRRNwvhU29isQ3Rt4IPNLGyKSCvv90=;
 b=sRQezDej3RyP+9OtdBH9+URslcf4aYD4Cuo4Qu3jA7pCf203nre+Dz0dKqUvcFux1r
 kdSpQhwwhtkIX7bwYw13oo8s2iugUPdK3hdqpyEkG2vxdhzM8bPsWtrcLTgL6T4dLnCL
 sp8G/Jxc+miTE1TZVD/UG9IS+eipnihoG+CcvdJfOp6n2KL+TaiiIzCr71xgF/LmeNsN
 NWJdRLL3yMiXqTnM1Gr7x2DHac2sPP4vpkPFhoElZCohkSscCxTkoUrAt7awdQHN2Br1
 9xDcpBQcoJasJn8w7YKS7cuuL7rCEfeA1u3wHH9YQTjK4O9qjPWqx6LnhanCQJj5dcNh
 2akA==
X-Gm-Message-State: APjAAAWOzLUYPVYzjhHVRvmDJMgj6HJWVrSi//kdpXGcXcFV8XsCpbB8
 VVfUHb6GVRrxvL0jPpP9Vx3NhMApyWtp3NGlEmM=
X-Google-Smtp-Source: APXvYqxnZwKL8uAKFwqU1Al3NryHFgkeA2TGfrZeraalix6k1RfRY5XylEBxf580X2ZkhSDVbbQOmYYNQD9ZdNWnuKc=
X-Received: by 2002:a25:7397:: with SMTP id o145mr218166ybc.329.1561667848946; 
 Thu, 27 Jun 2019 13:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190627070052.8647-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190627070052.8647-1-yamada.masahiro@socionext.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 27 Jun 2019 13:37:17 -0700
Message-ID: <CAMo8BfJe6va+=oB_VWG5F0xWFQv+Qbx5DXdjJbO2XLNh5rs3=g@mail.gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: remove unneeded BITS_PER_LONG
	define
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

Hi Yamada-san,

On Thu, Jun 27, 2019 at 12:01 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Xtensa does not define CONFIG_64BIT. The generic definition in
> include/asm-generic/bitsperlong.h should work.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/xtensa/include/asm/types.h | 8 --------
>  1 file changed, 8 deletions(-)

After this change the file arch/xtensa/include/asm/types.h is effectively
empty, only including uapi/asm/types.h. Maybe it should be dropped
altogether?

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
