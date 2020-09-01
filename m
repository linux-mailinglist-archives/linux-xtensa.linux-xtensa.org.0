Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 9589C259DB7
	for <lists+linux-xtensa@lfdr.de>; Tue,  1 Sep 2020 19:55:37 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3B56E583C;
	Tue,  1 Sep 2020 17:37:42 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 5037752C0
 for <linux-xtensa@linux-xtensa.org>; Tue,  1 Sep 2020 17:37:40 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id z22so2921712ejl.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 01 Sep 2020 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gLkbCiqA9XZngBe8XklWV8DgNnzi9W/HkU22nUaTiU0=;
 b=IeqW9SyidN9PGIgoVv6wrgJX1HewRYZ3jByPsTmZwtTlT+u57KD7RoLHufJB5G/Xb4
 89ailtYOG9WQJIxjOr3eDzvcWF7VXPzVJSpFUjpxi2MKBJM/AC40TnIL+thNMehlcqtl
 RYaEYmU+/S/uB8YQgVLX0lUu0+N7/pqlH2CBPCaP4xQOxisi/FsjK2K/cZj/cSFpXr03
 ekBfJydjGf0pWo0/dHyh9G412rA4V1FBPXHn+Wb16wF+QG2oPGzGtGkIm3ohMdzdKrpk
 HuH58K43iNpnVc+DzZlFDLPUPLw70uB+kMkKMG58tvCgerQLYoBT8dsZoHcAthjM4iNA
 D91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gLkbCiqA9XZngBe8XklWV8DgNnzi9W/HkU22nUaTiU0=;
 b=bjsLoo9GIi5xgDE99ujtJTCfSaroXzBRUwiMPA/7fZWV6u6DR4+wQBLCO0aLne0sKj
 Mc1QFL1aLHUsahDXBLgYDHUfrWywHf2ASA4qUiADjGFrX0dhD4HtlJhYj1P29fw5heKn
 MLqRwq+xyuyobtEpQBGn0HIAYbgrFOIw4PHqijHa+EE/s+bUzcPqMSnkDoXEpRoroJFR
 ihVgLwhHz9zvOnbjWNqndUFCoddHoQgPAgD3ZY23gtrC51LxFWmTVf7jTuALyZuEoFo3
 VsvigbNc0/kOvkbxpQPhhhtDCsvpmgAjGpErYF2x2y01jWsQu5WqbRlaHIQRPHFGSVt4
 8eMA==
X-Gm-Message-State: AOAM533CxWDYrfPAxr7ZzsExTgKAXLXO1CHl9N2BcU6IQyrK50wSFo17
 QhmjNwx3IPK3pX3YA+9I3vn/Vcpu+oHpvWQLZrA=
X-Google-Smtp-Source: ABdhPJxTpsiS7Vd02sSXMWqlz5hGzG68IcsXhf5FTDWokmy6rP+D38c2bMAT+YMUQyxDr+hpkujkpd6oOdmWovKCbFQ=
X-Received: by 2002:a17:907:94c3:: with SMTP id
 dn3mr2553847ejc.186.1598982933931; 
 Tue, 01 Sep 2020 10:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200901141539.1757549-1-npiggin@gmail.com>
 <20200901141539.1757549-24-npiggin@gmail.com>
In-Reply-To: <20200901141539.1757549-24-npiggin@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 1 Sep 2020 10:55:22 -0700
Message-ID: <CAMo8BfJAnJsWB-OpZxSMzNF0+3eiVzXChTNrJP10j3XaGUwX7g@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Arnd Bergmann <arnd@arndb.de>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [Linux-Xtensa] [PATCH v3 23/23] xtensa: use
	asm-generic/mmu_context.h for no-op implementations
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

On Tue, Sep 1, 2020 at 7:17 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>
> Please ack or nack if you object to this being mered via
> Arnd's tree.
>
>  arch/xtensa/include/asm/mmu_context.h   | 11 +++--------
>  arch/xtensa/include/asm/nommu_context.h | 26 +------------------------
>  2 files changed, 4 insertions(+), 33 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
