Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 09AC77439A
	for <lists+linux-xtensa@lfdr.de>; Thu, 25 Jul 2019 05:04:33 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 0D98E64CF;
	Thu, 25 Jul 2019 03:00:02 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 by linux-xtensa.org (Postfix) with ESMTPS id A691A64C1
 for <linux-xtensa@linux-xtensa.org>; Thu, 25 Jul 2019 03:00:00 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id l124so18792924ywd.0
 for <linux-xtensa@linux-xtensa.org>; Wed, 24 Jul 2019 20:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nrbk7bQLskXts/zN28tmN3yp8oUVQIhnquHI+u1+rrU=;
 b=P2FV77oa65p+uZuWlQRKhCU+fsKjGfcfvFEmoKLqa5om2N7vSy9QKvqy13EdjCOFsb
 wd/+JuIsqBO2sarMfxgkzGx1upakvFLfYNtbutK8plfj2/7ik3D7z+BHmVI65H36YFY2
 Qu+ZhwwkZq2nCOoIqSFSRpJW1Y0o1+qkep75SeTDA7tnHl6VFTEBy/FO5IGUaP+hXl73
 oS4+HM4o9kGYjbUPmZppvpXvGNQd9WS9jWvuxStpLHoZuB6Z3xpL8nkzM0BcBdmSSyN6
 EqOfM38IoiG7xH/q+8RDJ4CNw3LhQ2OoFArHpQg88IlCaJ//Tx4Kv+qu2vmMcJweWjvW
 nq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nrbk7bQLskXts/zN28tmN3yp8oUVQIhnquHI+u1+rrU=;
 b=ZJKZCE/aOBXlKx7witHvNWbokGwpEkRlcGt46+cZRWpg/BgP0RieCsjoAsx9DtvuTN
 BjEyR9mIrNPj5L7jEXGTDyxtztmrjwwkeBbpEkMBb2UFk6N7TT6hAQO9vE/CHdJZyZ0T
 EQIgvIwWpjhMj35pWzgqaB+jY5D9bthM8qn4waLmohGdFO0UVWg2KAnosBM9YrZtd6iz
 df/3vsCXB8kimwxXV5FFG66DTijE9oOesEE2JMc0cgvHO/ptLPQAUmlYR7fkF//6RDsw
 AJK2kslMvh/UcZp1P+ms57YdbTxscdttM+Ff5q/eU8gQjxhT2uAxPiD7CLCumkG5tIbH
 lHIg==
X-Gm-Message-State: APjAAAUu2uAE/eyAnJI2tv0qVyq8iDj+qmwcxM7XhjLBOqqULBbk45F9
 9DfHZU70jGw6B2TIZOI2EInyyB2O/jP+2oRD/Ws=
X-Google-Smtp-Source: APXvYqzpy8AKgUa7JslgdCRM5mJYzjaH3LwuEiZjPk1f4K1Ck/sKn1S+vC0IwuBx7SSJAURffMLJOX4C3MzZ+DX6hEw=
X-Received: by 2002:a81:6d07:: with SMTP id i7mr54324963ywc.112.1564023870299; 
 Wed, 24 Jul 2019 20:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <1563977432-8376-1-git-send-email-rppt@linux.ibm.com>
In-Reply-To: <1563977432-8376-1-git-send-email-rppt@linux.ibm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 24 Jul 2019 20:04:18 -0700
Message-ID: <CAMo8Bf+d39UKeUHLcjBcT40Zwr4j9BY7uKaS23vn+nyyVZCMhw@mail.gmail.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: remove free_initrd_mem
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

On Wed, Jul 24, 2019 at 7:11 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> The xtensa free_initrd_mem() verifies that initrd is mapped and then
> frees its memory using free_reserved_area().
>
> The initrd is considered mapped when its memory was successfully reserved
> with mem_reserve().
>
> Resetting initrd_start to 0 in case of mem_reserve() failure allows to
> switch to generic free_initrd_mem() implementation.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/xtensa/kernel/setup.c |  9 +++------
>  arch/xtensa/mm/init.c      | 10 ----------
>  2 files changed, 3 insertions(+), 16 deletions(-)

Thanks, applied to my xtensa tree.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
