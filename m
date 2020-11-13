Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 194C52B1C57
	for <lists+linux-xtensa@lfdr.de>; Fri, 13 Nov 2020 14:51:15 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 9156A64B6;
	Fri, 13 Nov 2020 13:30:46 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by linux-xtensa.org (Postfix) with ESMTPS id BCF0264AF
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Nov 2020 13:30:43 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id s25so13505597ejy.6
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Nov 2020 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vsGn3bem5nMvAjLpbhwxfUdSF/h2bPF70W9wumlMdBw=;
 b=vTj9XGocJsDdmxBbt4qvs70XHcdNB4X0t9XGIS9bRj5oZgDO51fyrmXi2eSkzPyUT/
 yPXNJOHKchrYIh9qAUn4o4XvvgqC0GoNl7cOm1DJc6B6qZhE5wrTGHwjCQAseBp2QyHC
 xOHyRA5qmm/6z5keXX0/3qygnFDCJBZ95sOLbcXHzKchx2NQFVX0IjtjKXahZbGyedNl
 btE8eks/8p4GHVeGdXywzorxmEPS+t8V+KYsSWRZMw8g7uFOiQ4j9CxBBB4qyhRDYqT4
 Jd3WY995w2J6MoJbc1cCqtLEplzJ+x6s5hQaRE6WYlfpzfCxGZ19EtjV6ZJw1uqdp1qL
 D0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vsGn3bem5nMvAjLpbhwxfUdSF/h2bPF70W9wumlMdBw=;
 b=LS3a/XnIyQxjS/87hVaj+6c4G0TfWO74ZNvspmzcuhYy6HC4gqX93AQmX1Sc684rwX
 CvB+I58klGdWkpIPs8W8MQpsE2YYR6MMTQqsNb0GFbLWzjpdb66x1dUx80nV03Yx7dgf
 dB97eUhGASV2tw+fxYmwsFqKHEPcIYnCJ/lINN5ZCIcxHv8pP4/ZMWa9GDpDIqO0xCh6
 A1yEaFxZP/WJVzDFCQaj9IBWkbftUOIuOaETQ5CS2FJPYlWtD3lx4eg7iv+zht8La52r
 fCbyWh/9RH1gj1fd2MuYxCOgRjRTungRETV+w1ldmopqXyxxR+309C6V+3AWysC8eHNg
 MgpA==
X-Gm-Message-State: AOAM532/5pyXUkDmRTTWnkBifNSntKdrGcCUWQtpoR6sQJreI+kkCXc3
 MfZsbEu4FOBCZM2UJz8cciGGWqMMqjvXi5/N/dk=
X-Google-Smtp-Source: ABdhPJzzVV+FAd8BWTU2Ot2l+Gih+TBQaZIdRURXY5UDRKWxoFyTNbwm0NZESZUUZppVU3psiS8BGqd/OnHtJIi4QCY=
X-Received: by 2002:a17:906:16d6:: with SMTP id
 t22mr2136557ejd.376.1605275468961; 
 Fri, 13 Nov 2020 05:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20201113122328.22942-1-jcmvbkbc@gmail.com>
 <87zh3ll6hw.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87zh3ll6hw.fsf@nanos.tec.linutronix.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 13 Nov 2020 05:50:57 -0800
Message-ID: <CAMo8BfKEr-89awEnV072uWR=4fniDRJ0drWmZrtnyvj-mANk0A@mail.gmail.com>
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

Hi Thomas,

On Fri, Nov 13, 2020 at 5:40 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> On Fri, Nov 13 2020 at 04:23, Max Filippov wrote:
> > Fixmap on xtensa grows upwards, i.e. bigger fixmap entry index
> > corresponds to a higher virtual address. This was lost in highmem
> > generalization resulting in the following runtime warnings:
>
> Sorry for not noticing.
>
> > Fix it by adding __ARCH_HAS_POSITIVE_FIXMAP macro and implementing
> > vaddr_in_fixmap and fixmap_pte primitives differently depending on
> > whether it is defined or not.
>
> What's wrong with just doing the obvious and making the fixmap defines
> the other way round?

It becomes really awkward when we get to support high memory with
aliasing data cache: we must think about the actual virtual addresses
assigned to pages and it feels much simpler when it's done this way.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
