Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 94DD1ECA91
	for <lists+linux-xtensa@lfdr.de>; Fri,  1 Nov 2019 22:57:25 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 58E24584D;
	Fri,  1 Nov 2019 21:49:25 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 2CCE85822
 for <linux-xtensa@linux-xtensa.org>; Fri,  1 Nov 2019 21:49:24 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id a83so2743533ywe.11
 for <linux-xtensa@linux-xtensa.org>; Fri, 01 Nov 2019 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=auiBrR/6M32XMbZjOkvz/wIYQc/PlZ2hGBEc+5gwTLQ=;
 b=TS8dSF6SxcyXKuTTnnwO5du/OtfXjghml432WtStE9Z774IcdwwIVBINbIBonXeBpB
 DCoBP/jMXZcDHXCEPSFt8a/KY9xspngGusWIUGcxXGHsD9VPP+SZdZUW+5KvdoqZkLXc
 cLM2mFxh5AnzFlGeZnsZSEluOiZfHRJgn0MJF7LmWO7kodbGZz5IeOGlIkj3o64TS1Xt
 HeKczGTxpfFVibzrBZfyeHA0Fn0IbFtisNdeHCLWoqVM7/mhs2s4zkKf5E1+83XAAemp
 ih7Xk1iAv6zB+oYrliLzcv1PJWm9EMo8we58JP0zl3qxeXOGyNKIQVeqWitwDbxT5kiR
 4Klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=auiBrR/6M32XMbZjOkvz/wIYQc/PlZ2hGBEc+5gwTLQ=;
 b=kHxSvonC2MrtI4sOvWju6/OcuTaC0TvlyqeN/zog6ueHgO/UmRyzJKsbAC4T2UT1b6
 LkvJmeZuPVkajrGLYRQRJCS3AKcTTnZvsv3jB6ywiz/op59aVV6v+VhQ2POK7rmbUFtv
 JRscPP7nxArLwjKFeCn5taJ2wTrUOluGkbOC+S2VxHVDIKv01DZr3PSxcTf3OShJdES4
 ysFmu8hU9uP5cgYIRPcg/ZAkR+XCqLQ8bcJvt8ewq2QXR+gDkDPp9nlC50ZiPsZ4udQ3
 xgNlUvih0aPd2Imd1+5Dh6b1Dn86VaemUQlL4AkOoenyvBIAOVLKnuEhf03+sS/l55yH
 f1mg==
X-Gm-Message-State: APjAAAVLjVT/M2mySwcbhorXTE31XMrmAEQ/kMtMvRMIOsMst5mfpOKQ
 jLQLq0+jVoi0Cxf+N2xhi12aMCbicxju6QoS40A=
X-Google-Smtp-Source: APXvYqwgJ3KRNH29+BRrIcUhhNKG/sv+cs77pLmOVw3+TQZ1j34KhoP4nKYqOGJPq6Pp1l/VWPFJ4q3Uy47PvGLRvAw=
X-Received: by 2002:a81:2603:: with SMTP id m3mr10045586ywm.107.1572645443197; 
 Fri, 01 Nov 2019 14:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191015212526.1775-1-jcmvbkbc@gmail.com>
 <20191029120451.GA23463@lst.de>
 <CAMo8Bf+-nQbfjnCh=BDco8XUjbBsjjDe8BD3iq10ehG1iTWNmw@mail.gmail.com>
 <20191101164223.GA14763@lst.de>
 <CAMo8BfKH+CsGyOTo5J18b9=5BvfYRwaZcCOYftP+385QN-nk9w@mail.gmail.com>
 <20191101211232.GA22387@lst.de>
In-Reply-To: <20191101211232.GA22387@lst.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 Nov 2019 14:57:12 -0700
Message-ID: <CAMo8Bf+wFLyG-xBvHdG14X4m48fL5oJ0whn64MS3m0xejgdWmw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: implement
	arch_dma_coherent_to_pfn
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

On Fri, Nov 1, 2019 at 2:12 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Nov 01, 2019 at 01:51:18PM -0700, Max Filippov wrote:
> > That didn't change any visible behavior.
> > I see that dma_can_mmap still expects dev->dma_coherent
> > to be set.
>
> Or if DMA_DIRECT_MMAP is set.  Which doesn't exist, as I renamed it to
> DMA_NONCOHERENT_MMAP everywhere else.  Try again with the just repushed
> tree.

Works as expected now.
Tested-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
