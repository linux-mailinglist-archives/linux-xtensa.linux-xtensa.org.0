Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E94EA83D0B
	for <lists+linux-xtensa@lfdr.de>; Tue,  6 Aug 2019 23:55:42 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id B90606468;
	Tue,  6 Aug 2019 21:50:44 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by linux-xtensa.org (Postfix) with ESMTPS id CCA4A58B7
 for <linux-xtensa@linux-xtensa.org>; Tue,  6 Aug 2019 21:50:42 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id j6so1031706ybm.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 06 Aug 2019 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k+AWtp//iZQHBUSYNSKib/pmDOCkaOgoiXvpRJP7gmA=;
 b=tVu/AVxPuKr2O9yi66GUMZ0XXx4MnVzRGiRb5hTa+JT7ywAQfE41BLvGoUUMIyghG8
 SZ5XiFa529n7Okj5ezJgKeksYJiR2YLmFzz1SxrI7LtG8se1O+RwTMhODC4QE8K+ZYx5
 JBcR2ucDj+u/vRCXz0HKWyQ9s3QM6rS5U9Oca6MJmamX1aP7SY3Dli5qL6VEasaerW+u
 +wpk7a5Mc/GzmW6VS1nPI2XFJ7WxW8qWuDUabl0ZP+W31PbcppyijXI6/E6QIf+i4J1H
 Nm/SYfASp5hYQHFAaMZdipAZyocGfVwf0FOVfmOCJuVwPTp2NHWKM5+3EjVAwTxBTj9/
 H4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k+AWtp//iZQHBUSYNSKib/pmDOCkaOgoiXvpRJP7gmA=;
 b=YslmKn/sj2Y4otv4y1gg2wbvNyvhqyeAPC67dOCQRXY6CZctqIx1fW+yjTSQ5GPrC2
 PRE9NA3A4tZ2xYHvyWXgT5r3RIPezz1uUfhDGyodrW6mCVmjnBLGBaRTMk80rHIpHmkM
 MVMNSLd/0ZOL/roj8XMEiBLAZLTZ7LIsycxHYPrBlOfrdvSxJT3oHFgu0uIO3YLL/3N7
 uyCtFlmPZJBjEBtaWNxj9z28uVjyGg+z7znzE3Q3YKZLp7iEUrceOv2ZJXxY/k3e+g19
 xECKx3CasRlAyFDYS76EXSD0KbkLH2MUTgLpn5wytpP/zziggiMbBDNVk7JPWn2Wesuk
 pS/A==
X-Gm-Message-State: APjAAAXFWjkeKU9B9F5xFa54uphzwg461HjBbQsTI5qfvZD//yFlCawv
 Eaydo+6t6fOcmV/1DPeDlOj/8Ow/+U7WGoLDsxM=
X-Google-Smtp-Source: APXvYqyzY27IzFJgojA2HdRgeqD+9agkpOGxxQswUtP53SFdrOWfXL20fObGcfS/l1k/+lQ8mZ6T/nAWZqzVrK+oCHs=
X-Received: by 2002:a25:6602:: with SMTP id a2mr4085214ybc.119.1565128539683; 
 Tue, 06 Aug 2019 14:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190806213319.19203-1-sashal@kernel.org>
 <20190806213319.19203-7-sashal@kernel.org>
In-Reply-To: <20190806213319.19203-7-sashal@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 6 Aug 2019 14:55:29 -0700
Message-ID: <CAMo8BfJZ1aQoyjpfUE-WT=OpW7EvNC+vu878BPqON0u7E5Ujiw@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH AUTOSEL 5.2 07/59] xtensa: fix build for
	cores with coprocessors
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

Hello,

On Tue, Aug 6, 2019 at 2:33 PM Sasha Levin <sashal@kernel.org> wrote:
> From: Max Filippov <jcmvbkbc@gmail.com>
>
> [ Upstream commit e3cacb73e626d885b8cf24103fed0ae26518e3c4 ]
>
> Assembly entry/return abstraction change didn't add asmmacro.h include
> statement to coprocessor.S, resulting in references to undefined macros
> abi_entry and abi_ret on cores that define XTENSA_HAVE_COPROCESSORS.
> Fix that by including asm/asmmacro.h from the coprocessor.S.
>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/xtensa/kernel/coprocessor.S | 1 +
>  1 file changed, 1 insertion(+)

This fix is only relevant to 5.3, as it fixes a bug introduced in 5.3-rc1.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
