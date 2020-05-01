Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E4C4D1C1020
	for <lists+linux-xtensa@lfdr.de>; Fri,  1 May 2020 11:02:34 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id CC41A586C;
	Fri,  1 May 2020 08:48:56 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 77D0C586A
 for <linux-xtensa@linux-xtensa.org>; Fri,  1 May 2020 08:48:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q124so4307106pgq.13
 for <linux-xtensa@linux-xtensa.org>; Fri, 01 May 2020 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3Ysbis/inrfbBoA8BHLbvKshdlzgqGs68fIPEsHEVg=;
 b=eP8zzJ0a/Hmxxv5G2MaxHN/LWkzXcKt9XG/Dkv5ekKbIOKKvJns/1BXUiUvN6wBFR1
 ubq6YddXMtvjXmTLTdz2/V79yjXk6Jcz8rG/1h2spbuEE705AGdFp5QJ+sjjfJukGYup
 tqCILrFlD2kfAciwlWW5qH3SyEn4KpUe+4gHFU/LQwQFix0zCmFoB/0ILU4+KHaUKqSr
 6ppcJC24WyNXNI0Jy6GZSjwMK2NWCWmJ06Vp/4ZGELxAfSLtCXCMHRaDuLVwHcF75KTW
 qhDuhgJO4bXNK61Ji7BmtVdVywwIl4sPbL1pdfgXXDxPYSeWCQyZrverPp90pUs70n/1
 /WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3Ysbis/inrfbBoA8BHLbvKshdlzgqGs68fIPEsHEVg=;
 b=MYJGPjaICj/YxodBRMhgOb5ZExGXmU4VDUQBSIEcBlS7wB3YxMLtRES8sJ/FTHnmWg
 DiJ7czm7QBjUTrzqy3AttvZYNgPUTHVu3A26N0KN9zXy1I6MuXWfKkikJm2KPL8QLvnp
 na2e3kPrHeDA3XwKhyRH/xnc2+PxSLvMClT9g4Yr43ULaU896tQZNYDUxmIMhcfU5jAI
 mDB5joILdH520JxbDUJK2Xkb5gakS6znMrKXI5gysiTqD3xof9YYUShgBoDONia5nWBa
 xSZ3FMI93dWwO8bvHlQlIiWPzGBoL00SBBkI9YprOAYVQ359zer5zlFulErzCUm7svXc
 fZvg==
X-Gm-Message-State: AGi0Pubv7Uk2kIXYmv27B7CWhndhZhcAG+rL9LKeiTuGRA/8gXOsz3D8
 vZLXkkugGt+Tcmu8BfSBsaLOTDiszwapYVNcgow=
X-Google-Smtp-Source: APiQypJLo1nGAOOIWllcnXFOKuucbQaa8VZAHPvXQvNynJ2CUHJzn4/TY0TzKEEla2OjP3Wo0iR/lsY0rp2wUCMCZpw=
X-Received: by 2002:a63:d3:: with SMTP id 202mr3124152pga.378.1588323750902;
 Fri, 01 May 2020 02:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200501084634.GH27858@infradead.org>
In-Reply-To: <20200501084634.GH27858@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 May 2020 02:02:19 -0700
Message-ID: <CAMo8Bf+Mvvg_f1-33iQhTqZPVw1civX94KS2mf4uSkcpEVx55Q@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, ira.weiny@intel.com,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] xtensa question,
	was Re: [PATCH V1 00/10] Remove duplicated kmap code
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

Hi Christoph,

On Fri, May 1, 2020 at 1:46 AM Christoph Hellwig <hch@infradead.org> wrote:
> any idea why xtensa uses PAGE_KERNEL_EXEC instead of PAGE_KERNEL
> for kmap_prot?  Mapping all mapped highmem as executable seems rather
> dangerous.

I sure do: to allow instruction cache flushing when writing to high user
pages temporarily mapped with kmap. Instruction cache management
opcodes that operate on virtual addresses would raise an exception if
the address is not executable.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
