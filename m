Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id CDE7C2B2080
	for <lists+linux-xtensa@lfdr.de>; Fri, 13 Nov 2020 17:34:33 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 618E357EA;
	Fri, 13 Nov 2020 16:14:06 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by linux-xtensa.org (Postfix) with ESMTPS id C43C752D8
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Nov 2020 16:14:03 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id f23so14383881ejk.2
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Nov 2020 08:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XcyskGQX7sfCcXJ2/MS6gOYcHl6ogix2mC7AwPR/oSQ=;
 b=JH+ohS03bkb6TlASfCOFQ/pRdt7Xm2mVZXl4Wjj5zCI+4CFILklt0uQw0QyUxMoVgB
 vDFk1T6fJIdyzwu/EYlTyBfXgLUdLbiVje+I+rkT0pu0GuOticyHvnuWuRLFwlfRICra
 BVltv7QhGkaOBlcsD8OOZ/i6z3pSEsE9NC+vg4o07pbdesEUJkSFfZM/73Sn9+6rMlrO
 yOFpwh1Gy3W+FTRLTAhg3cHzu+t/XmoyOqfmUn4gBUglBmoF6c4b3dmsDMZu5yP67nBT
 x0hN1H/K935KjGdx0FqjN7TS5ReF24rXviAJTEUZwE1KXO7UtA0UAinlWTiYPvC8AAjr
 5Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XcyskGQX7sfCcXJ2/MS6gOYcHl6ogix2mC7AwPR/oSQ=;
 b=CYZC+Dt26cty5toWCClOnAQwGKuYScwPKaaFMtHnAy0bt9l0kOhv3jh2EEJnP4FVVk
 z64cFsgWHubF9oEccL0VBuJ2izkUXv0UYB6ZXN5RzSSakXtZse8yddEoEFKfEPJy1Kca
 vNns0V0FOy6LOIsc6WJxMDthE5eCHwt8PkyiD5pmEtkPHbkJ6+jiQabkw/9Oy4eXcCTM
 mUBf71RA9AJ8FB/rNMy+dxJ2Wwjw9d2Q618//eK7B34PwGBcpZxxPwRerpYtX6Qsq4UW
 sjQ13uL7J2G9U602dfKE0j2YUQr8wGlUqPP8/rywbTLtHnquo0kc+NtFbGHWf4wpRgR9
 OXzQ==
X-Gm-Message-State: AOAM530pTnyYfrWu5ULIZuhQVHbbPBPcXAU8nQF4m+cACTH/N69ivaIa
 +R3OXROkyb2RHBnhdgBYOFyDZhue065MI7KXVKA=
X-Google-Smtp-Source: ABdhPJxBUUtKkL2Qa4b2tRWQOgZnPW+SQJaMEOmf37rIFSt3XRdV/fhW8Nz78hdcSNcSI7E8/nyIMd5s0bkotGQQq7U=
X-Received: by 2002:a17:906:16d6:: with SMTP id
 t22mr2903596ejd.376.1605285264596; 
 Fri, 13 Nov 2020 08:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20201113122328.22942-1-jcmvbkbc@gmail.com>
 <87zh3ll6hw.fsf@nanos.tec.linutronix.de>
 <CAMo8BfKEr-89awEnV072uWR=4fniDRJ0drWmZrtnyvj-mANk0A@mail.gmail.com>
 <87sg9dl3xk.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87sg9dl3xk.fsf@nanos.tec.linutronix.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 13 Nov 2020 08:34:12 -0800
Message-ID: <CAMo8Bf+2kGmg_SvJz8R=qXgPWbYWmf-PSeG71xKe5AB2LeyZ4Q@mail.gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH] highmem: fix highmem for xtensa
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

On Fri, Nov 13, 2020 at 6:36 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> On Fri, Nov 13 2020 at 05:50, Max Filippov wrote:
> > On Fri, Nov 13, 2020 at 5:40 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >> What's wrong with just doing the obvious and making the fixmap defines
> >> the other way round?
> >
> > It becomes really awkward when we get to support high memory with
> > aliasing data cache: we must think about the actual virtual addresses
> > assigned to pages and it feels much simpler when it's done this way.
>
> Feeling are not really a technical argument. Is there any functional
> difference which matters?

arch_kmap_local_map_idx must produce index based on type and
pfn that will be translated to virtual address with the same color this
page would've had if it was in the low memory. With positive fixmap
the formula is: (type * (number of cache colors)) + (color of the pfn).
With negative fixmap there must be additional +1 and -1 in it.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
