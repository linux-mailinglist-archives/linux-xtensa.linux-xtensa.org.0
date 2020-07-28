Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 482772304FB
	for <lists+linux-xtensa@lfdr.de>; Tue, 28 Jul 2020 10:10:00 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id BF22F586D;
	Tue, 28 Jul 2020 07:53:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 259A05865
 for <linux-xtensa@linux-xtensa.org>; Tue, 28 Jul 2020 07:53:20 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id lx9so190703pjb.2
 for <linux-xtensa@linux-xtensa.org>; Tue, 28 Jul 2020 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mO4UW6jhce2IwLYWJIjyNoNVa+Gr5PBQ2rV1LkhhIeA=;
 b=bNG6JL/O5TVQki3sHfHEOfTczEIMUXR0OLqZGWSVnVXN0YvSLXQj4R1CZin1hIrLmj
 rDRSSHKktD8YAK18dQ3Ix7Lo07yJ8erIxBxxxxqVLyUXKDeyjbkBvyU6KTuEXDNL+VQr
 1QQzuFpqB0CYmf+5pX3A4eJDz9R/FeezQPycBuGnXY4EFLSYZVijwWE1t6E2M5B99qAH
 FniHRX5RxN1gZw65OKCdqnG/UzIrS3ICQ278hYR6IoGyzyd6ykow+PajTtCN7ldzFD83
 Hcz6o03i9dPHjv0yz+B7ucVCSupfsp/DKM7XkQQq14g4beE60uqTFBLLU79wWmkWweg4
 xE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mO4UW6jhce2IwLYWJIjyNoNVa+Gr5PBQ2rV1LkhhIeA=;
 b=mlXzO0mN79+/jmfvHaB3FTTOF1xVpW5uLT+fZu7B16A+I5uIVRhM+w8iWHarYaLkoE
 y6cLQWw/BlFOHe5G8OPZU+pi6gXhowBTln4rWk8JMOHfpKgReiJ6tY2hO05Y+aJP6aPC
 cbrlEQWTDT0AQFtesQmXHzWIeaeCZFNad2qBLBPlfGv3W2bmoHxrmnN89LDSRVnhQEqk
 tvX8BJuW3HbabRw1t8JYa20yzpcNpVgAgI9kHq+wQCM5Sl4b+R8sTq5xChC+Q0GpgF3k
 DX08kMnMyh60Xm3TQstzzzNny55wrD9XY4wj1gZ/pkNpTtaateuN/UjY9Vo22YqhE2kb
 IWlA==
X-Gm-Message-State: AOAM533Ib/861bMDZTTjfo4H4cml1R2GjrzR1CuVmsoqmN3mbkHfyx7O
 8lIxzNSUzx7GoEiMTUxy0QrlrDNO1S4sKk77EZU=
X-Google-Smtp-Source: ABdhPJwl2tr9ClL3asn7D0daWCLxpbWcicGBHl3RglmUadciWpYNtKvtb4F0xzOXS215QqSA9z2se3QNEhc8iGYlMEA=
X-Received: by 2002:a17:90a:8918:: with SMTP id
 u24mr3082134pjn.7.1595923796912; 
 Tue, 28 Jul 2020 01:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-4-rppt@kernel.org>
In-Reply-To: <20200728051153.1590-4-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Jul 2020 01:09:45 -0700
Message-ID: <CAMo8Bf+VKHmAm1GV=0D9Um2mpsxjnwp9WrAJq_eKW1MK+_8r6g@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-Xtensa] [PATCH 03/15] arm,
	xtensa: simplify initialization of high memory pages
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

On Mon, Jul 27, 2020 at 10:12 PM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> The function free_highpages() in both arm and xtensa essentially open-code
> for_each_free_mem_range() loop to detect high memory pages that were not
> reserved and that should be initialized and passed to the buddy allocator.
>
> Replace open-coded implementation of for_each_free_mem_range() with usage
> of memblock API to simplify the code.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/arm/mm/init.c    | 48 +++++++------------------------------
>  arch/xtensa/mm/init.c | 55 ++++++++-----------------------------------
>  2 files changed, 18 insertions(+), 85 deletions(-)

For the xtensa part:
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
