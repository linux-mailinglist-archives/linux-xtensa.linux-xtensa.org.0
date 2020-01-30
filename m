Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DE66314E63C
	for <lists+linux-xtensa@lfdr.de>; Fri, 31 Jan 2020 00:58:05 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8AEC86546;
	Thu, 30 Jan 2020 23:47:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 38A5A6518
 for <linux-xtensa@linux-xtensa.org>; Thu, 30 Jan 2020 23:47:17 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n7so2343802pfn.0
 for <linux-xtensa@linux-xtensa.org>; Thu, 30 Jan 2020 15:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bkEoSxiIFSIBmIjDJvwmwkDr10wCmUtM3ogvmSTNOOM=;
 b=Pbguk1VuKmMl8wfCRQpGeW4W+cBH2CF5Vhhdr902Zc3g2Rz1BP99zMAQCrH8hpXIOU
 JKiC13/sE5vdMdmhwLXNNATDIQS9qRv7VPTwY67yoEgtLxbBOed0go+Z/Nve6nYRAivJ
 XiPaMAiLz5mvPRgUC/aaTEIxt+thPN2/5pjaOW6H9yInzyJ2h7jasvXnZgTtmydNu4+n
 RmsB7U1Tgbos5+Zy71zDtuv16WVvCuzxMCfOAwo0YYNmB/sH+89cD4iz6LGQZl5bUdY2
 ih06b1SfkvKWZ2oVO0ZGp/q2ph64R64gr7/TrHpkY5JTQXVdcmRr7OoIli9md4twB5Su
 EVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bkEoSxiIFSIBmIjDJvwmwkDr10wCmUtM3ogvmSTNOOM=;
 b=tjref5aB/aieVwRQ8124xRG/GMSMUmjfxHBt2P/yGztcLn+3ROoxshvXAZaVyh7DcD
 RPVUTKLO+2SHcWVAPuA+RDzeCLms+cZIL3y6UIqBQIjArwtYbe96dvvq68f/HYWRP+zD
 5hG7R59QqhPyyMkd8ks92yxIamx/+Lm15OolNa+Y5LOHA/+mLBnc1c5iusxmh6V5lyBM
 prrAecp1K7sLidykPIOnFjeOVkMHIc6j6tOQbpwXInfcyMrr94flgNibuzSvBDBEt+R3
 W5alrsstLL3TomGkQ4ilbjUD7L8UCHSwvQGxvc572WAB/ZpZM3bnl8kFodlgzI5qSU1J
 essw==
X-Gm-Message-State: APjAAAW0cDYw4RrxNxkbGIg/NI+4ixz04dMiH/YW+uWdfxg5BLH9ACiV
 YlLP/xmaKMIrw74CvJtDxYIxF7v+QOBwpn7uGQA=
X-Google-Smtp-Source: APXvYqzixJ7GEdILtQGm5ko/4d0slKWLyxlOw1tHWdlu1yS2Pq+DANtjshTj5j/hy/mTVP89HWl6HEKm7y9NdPDWacA=
X-Received: by 2002:a63:1d5f:: with SMTP id d31mr7432066pgm.159.1580428682829; 
 Thu, 30 Jan 2020 15:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20200130192129.2677-1-krzk@kernel.org>
In-Reply-To: <20200130192129.2677-1-krzk@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 30 Jan 2020 15:57:51 -0800
Message-ID: <CAMo8BfJiC1O18+9AXCwPk-+AMd7c5Jc-xUZv17tfcD-zstPNFQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: configs: Cleanup old Kconfig IO
	scheduler options
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

On Thu, Jan 30, 2020 at 11:21 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> CONFIG_IOSCHED_DEADLINE and CONFIG_IOSCHED_CFQ are gone since
> commit f382fb0bcef4 ("block: remove legacy IO schedulers").
>
> The IOSCHED_DEADLINE was replaced by MQ_IOSCHED_DEADLINE and it will be
> now enabled by default (along with MQ_IOSCHED_KYBER).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/xtensa/configs/audio_kc705_defconfig   | 2 --
>  arch/xtensa/configs/cadence_csp_defconfig   | 2 --
>  arch/xtensa/configs/generic_kc705_defconfig | 2 --
>  arch/xtensa/configs/iss_defconfig           | 2 --
>  arch/xtensa/configs/nommu_kc705_defconfig   | 2 --
>  arch/xtensa/configs/smp_lx200_defconfig     | 2 --
>  6 files changed, 12 deletions(-)

Thanks, applied to my xtensa tree.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
