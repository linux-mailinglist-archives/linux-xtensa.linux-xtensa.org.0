Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAB02A190F
	for <lists+linux-xtensa@lfdr.de>; Sat, 31 Oct 2020 18:44:32 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7775257E0;
	Sat, 31 Oct 2020 17:24:30 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 6E0AC52DF
 for <linux-xtensa@linux-xtensa.org>; Sat, 31 Oct 2020 17:24:28 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id o9so10883521ejg.1
 for <linux-xtensa@linux-xtensa.org>; Sat, 31 Oct 2020 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BYymDSvAjnOBuTCwmQOuAuneZZmF8XYRT3DXFmwhG4w=;
 b=mRSl30Y8Pokj9fAFTpg3zLdoJuqAmrX8n+L6HmN3ricdjCoTiReRdH0naV5nTRW+4P
 20l4CtJt6JRy7T5NBcDXJm3AakdN/b3LCFW/HdmEQW0IG8Jy3JQs/JdVSIh3YWoxYB2r
 6UOPshRG+RqQt42dcwtKqIOd6+BZb3Y8AgOjsWdNf7yx/+cYCLzZKZdr6Rr0KwRFzmGD
 DpP5zMDDWh31sZK9WdBfaOwwvOzvauUD82pYpuwKuo/GDBF+VDm0QMsF1nvSJZqQlpMP
 uvsUnY6/8pdRRMxS95SrOpqI9AABw2HHAyziNgosxHBz1KG1QzFgL5gKQjhKMAPnfHWu
 OUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BYymDSvAjnOBuTCwmQOuAuneZZmF8XYRT3DXFmwhG4w=;
 b=ioFfrph5jWlg8TmmsEEPEh6JM8Dkli2B29zwF9vXSiswhwQeFhfR2wEt7YuEhKVrrH
 kH4aGuKTU0CaUrjrdr0vLMpmVCEsj5ojCJu7j2+pHGLMy7AVy62McXdv3VdBF02ivpJD
 Kp0I5p9RWYbczazWbaGXaeV70IyfYPH0FOcg2qpa1L08nlygLUgrQGLzOAlPn2YjYVNK
 aabtHDq/A+MQCMfXTYaJAVh0KwVVDczs7cgBnkyI1BGiOAmDQJ4DO1UVDLBsDDRfuT7n
 CoyOZOzSdFsR+va/XjN3GGi9wUkqeiLSIWvNSCb8Hitx4eS7380swwoL3+5M+bv/2k0c
 057A==
X-Gm-Message-State: AOAM530ngpXX9VhzjrwzTn5q1rU07vzUl4+EIwfAh9vIY431CZpPWbQq
 USui8Et7pNF27XDQFJtYp8OcMpfcjCuPIVdKA2w=
X-Google-Smtp-Source: ABdhPJx9LgBeYorWWM5W6EJfNjt/5Nm4S0/qj9lGM8E2yR9DqVwWIarGUhQhnnbwdqew4Clue7XlI/4v2uRuBbAfIlU=
X-Received: by 2002:a17:906:f11a:: with SMTP id
 gv26mr8317551ejb.376.1604166268032; 
 Sat, 31 Oct 2020 10:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201031094345.6984-1-rppt@kernel.org>
 <CAMo8BfLCfpZcQC3oqEvExSqZ+dT2sVDjcXoaO_XKALn4rGjoog@mail.gmail.com>
 <20201031171608.GB14628@kernel.org>
In-Reply-To: <20201031171608.GB14628@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 31 Oct 2020 10:44:16 -0700
Message-ID: <CAMo8BfJ4ai4UHD36JZb2ETiFe9SeqpVQw5tsNLrSF8sUx11ccQ@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Florian Fainelli <f.fainelli@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-Xtensa] [PATCH] ARM,
 xtensa: highmem: avoid clobbering non-page aligned memory
 reservations
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

On Sat, Oct 31, 2020 at 10:16 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Sat, Oct 31, 2020 at 09:37:09AM -0700, Max Filippov wrote:
> > On Sat, Oct 31, 2020 at 2:43 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > Please let me know how do you prefer to take it upstream.
> > > If needed this can go via memblock tree.
> >
> > Going through the memblock tree sounds right to me.
>
> Can I treat this as Ack?

Sure, for the xtensa part:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
