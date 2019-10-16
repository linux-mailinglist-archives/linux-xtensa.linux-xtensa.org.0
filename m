Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A22B3D89FD
	for <lists+linux-xtensa@lfdr.de>; Wed, 16 Oct 2019 09:40:58 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E17DA646C;
	Wed, 16 Oct 2019 07:33:31 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by linux-xtensa.org (Postfix) with ESMTPS id F3A82645F
 for <linux-xtensa@linux-xtensa.org>; Wed, 16 Oct 2019 07:33:30 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id 206so7488674ybc.8
 for <linux-xtensa@linux-xtensa.org>; Wed, 16 Oct 2019 00:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DrfvktYJgAyHta/Fz913K8rareDdtUbK//eXrFywXHc=;
 b=Rx7dicTGbigHVFli33Z0CCDjnpeCZSVCs8WSkbB0h9qQ9s3NUhpJmYM1+CskI4USTO
 U8lEW6L/BvXQ3hliCs1oMJxRlt8oYNtn8Zlb3tXcBhwlm7E9dQgdutJHonBKZ6tp8rUR
 zyZB2MKVFN3H3fiGcXpxl54HXEJpjTcml8wzFj6g4AtR21H/k1HKGbLKG8+THhhONegW
 XWvbyaZ+3Y/yvnNCXQFfUiltiaFsb59NapoZlTmDZ3y0ejKXkAPYtze17pT7nZjEX4OJ
 5MY8JsigNfkZLBCuebrCtVwxYD0KLKQWD24PQjDPIICGFiP7xfiY4rBGct6d7906CSK/
 tbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DrfvktYJgAyHta/Fz913K8rareDdtUbK//eXrFywXHc=;
 b=B1Lgm4oEbQwTsLuc1H6cyUkdhjwRdgFSTycO+IXKKckYF2/bHFufAm8cR5rKbfXiGo
 7EygcRYDze6reMXIHa0g75jYnN8SxuLB5QNsrJiiNSma8A8/UiegErEjlby+bkUc2/Pk
 v0W7zIXXqc6hcGNkCVpLWSvevDgmXPnH6U5O5NpiridmKdJH04Z1tSoH3ZQaqv4asl0n
 UtYvGHqSahDHMdBensthuNqXKGW+TS6hkoWN5pYX4fgHvHlu7cBUU+nj4J1UE1A0EgfF
 p4VJUEmzzCwpRUT6GIgQVmm5U/w3MUWvp4FBFsDpjAYF5aAcoytiJeF+/EKZ6e1v68Mb
 7qEg==
X-Gm-Message-State: APjAAAW1B1ghRdR2zz2cPDEsvPEUBUnENUuzrX1U2Zgng5U/my/VRJv/
 UuJ2LsTID23SrxnDhHG0+qs+MnHItvK/UvtZdlg=
X-Google-Smtp-Source: APXvYqycJt2YiaXwNjBOltfUHwxfdgZ2fpnSS5NnUnC+6uOaN53bFDpsPUaRNgTPEVTBEloZi/YepjgE6HpyhrRkP4g=
X-Received: by 2002:a5b:4c5:: with SMTP id u5mr14131584ybp.25.1571211656797;
 Wed, 16 Oct 2019 00:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191015212526.1775-1-jcmvbkbc@gmail.com>
 <20191016070827.GA23051@lst.de>
In-Reply-To: <20191016070827.GA23051@lst.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 16 Oct 2019 00:40:45 -0700
Message-ID: <CAMo8BfLz5R=nXb3Ycw-xs9qfxHjBiKS2--mS3pr7=7rgwBeO_Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>
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

Hi Christoph,

On Wed, Oct 16, 2019 at 12:08 AM Christoph Hellwig <hch@lst.de> wrote:
> On Tue, Oct 15, 2019 at 02:25:26PM -0700, Max Filippov wrote:
> > Add trivial implementation for arch_dma_coherent_to_pfn.
> > This change enables communication with PCI ALSA devices through mmapped
> > buffers.
>
> This looks fine, although I'd much rather convert xtensa to the
> generic DMA remap / uncached segment support.

Thanks for the review.

> Do you want this fix for 5.4?  If so please queue it up ASAP so that
> I can do the proper thing for 5.5.  If you don't need it that urgent
> I'd rather go straight to the generic code.

There's no rush, I'll keep my version privately and will switch to the
generic version once it's available.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
