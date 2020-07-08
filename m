Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8B936218128
	for <lists+linux-xtensa@lfdr.de>; Wed,  8 Jul 2020 09:26:27 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id DD1842D7F;
	Wed,  8 Jul 2020 07:10:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by linux-xtensa.org (Postfix) with ESMTPS id B55B92621
 for <linux-xtensa@linux-xtensa.org>; Wed,  8 Jul 2020 07:10:30 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e18so21242414pgn.7
 for <linux-xtensa@linux-xtensa.org>; Wed, 08 Jul 2020 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pKFUgFUqW5gpKv/bMbAh9j1l3R9X9P0qKmhMZ59xEwQ=;
 b=utMXir49D0P9akytQzu1StGbltgpgfN9ZuZBKD6fgZgD44VQTaNsGnhXcWFm+cGs/0
 nLMiGFHj0bFHrWS3IfMivAIsfnWj7DOvzD5wLAeDWygtxU3KVV/sKMxvuRp9f/NxM1Uy
 v4QeHIDA8EstrT57e413u0CMg12c77PUAoD5EWFyA/k2fTm1p86t0F55VabnwnVIXHuX
 OEMNtUgOZCNV3jhL1NnbK+30VCEotUhb6gPBcc3DpBYHBMeqNH+ashBDXhQRyF40GMnw
 XrWp9DO69UcVvLyPI7Q1R13c9hciBo11yes84IMUDj1ehnt41VneVHag6hRmzTnv7Y56
 jz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pKFUgFUqW5gpKv/bMbAh9j1l3R9X9P0qKmhMZ59xEwQ=;
 b=LhFkxWeViBL8kem1h28sqrhbLUw95WGNGHyiMtoNq4juQ/rLfQIJx4SvgVoLEOigsV
 vtfsOw6meh/oLEZLWnswl9XURFCmEr/ujOXyA8aaZvNK0ny/VRu6lxaYYbrsSqMAalsG
 Qyl0JztSOlhV9P6XAC3Fga4xpdeZ5dobzRuIoVuIuClRGN3cyDL7FKMoOA1Zphkp6Sjb
 wZh86sp57xlR6cqnRop6F4kjHA8/8gSxscZR9wQiimaaGHGKpitWT0SKm4aAdcuulGOY
 bMviIjeRSRkc58z+58WaA6xxwx5nBE5oyvZfiJ8Chwdz8UUe/gwftBaW957kaxtv6pqy
 ++DA==
X-Gm-Message-State: AOAM532k/oU5KmULynCMPOaEDYMzHl9aQV2z9IHzEOvmeFLE96bjDIqg
 8Z74bfn6XhLBzMytO8iX3h+qXR5x8Wk7G+1agRY=
X-Google-Smtp-Source: ABdhPJwHuFHFrEqatHcREKGCAo7pP2ZEllY6EBfxvZHdqxG5bxutXfNX+a5k34Ll+QndpGLNkB+RiIpzBpAVp7akwDA=
X-Received: by 2002:a62:cfc1:: with SMTP id
 b184mr15025586pfg.153.1594193183635; 
 Wed, 08 Jul 2020 00:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200708062023.7986-1-vulab@iscas.ac.cn>
In-Reply-To: <20200708062023.7986-1-vulab@iscas.ac.cn>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 8 Jul 2020 00:26:12 -0700
Message-ID: <CAMo8BfJ5jCXmenR6Hnsw4QffYFLRQh7-ZrKp8OuZVu7mwKT2Ng@mail.gmail.com>
To: Xu Wang <vulab@iscas.ac.cn>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, alexander.shishkin@linux.intel.com,
 Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org, jolsa@redhat.com
Subject: Re: [Linux-Xtensa] [PATCH] kernel: perf_event: use
 for_each_set_bit() to simplify the code
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

On Tue, Jul 7, 2020 at 11:59 PM Xu Wang <vulab@iscas.ac.cn> wrote:
>
> Using for_each_set_bit() to simplify the code.
>
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  arch/xtensa/kernel/perf_event.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Thanks! Applied to my xtensa tree with a slightly edited commit message.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
