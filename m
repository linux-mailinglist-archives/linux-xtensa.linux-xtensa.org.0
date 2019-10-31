Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 55751EBB3E
	for <lists+linux-xtensa@lfdr.de>; Fri,  1 Nov 2019 00:53:38 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 13B4E262D;
	Thu, 31 Oct 2019 23:45:39 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by linux-xtensa.org (Postfix) with ESMTPS id EAA9B262B
 for <linux-xtensa@linux-xtensa.org>; Thu, 31 Oct 2019 23:45:37 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id d12so3180125ybn.7
 for <linux-xtensa@linux-xtensa.org>; Thu, 31 Oct 2019 16:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=weOep7QbhhMIsYdxQRKJ8+nv/8zQa0JFjqB8TwZWoY8=;
 b=D9aIllI7hFIsfCuRKTFsQcF3xsNV3SgoomsKmKQl3Gjri/7DfxajKyekQ1BtC2B9pu
 y6bu9bjMvl2dS40sUDSYaMkCHZ2m6kViJW0FreEy7HtcBN3FXZqk8gyTgchRRzpj9jRu
 iyuI+6IO5ah+4liv6N98sMC2oMgVrpUIBz4pjKs6u43JvAEeL3SZ62q9Hl7ncUFc+ASB
 sMApvN2P4fKWTFX4yQ6N2tetyPvzNpS62lRROBz/GAqNk8FG0yBcrXxwxrROA4w5F3TB
 6vQwJrvx7D1zmKdgv7L9SkV330GV/KYz5awruvBaXffBo12DIbNC5c23ox2Tbfy2KpX0
 WCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weOep7QbhhMIsYdxQRKJ8+nv/8zQa0JFjqB8TwZWoY8=;
 b=jh4MntN0EabRLHRimX5p77/MS2y4Kr1TnoIxcuF8Z/Fn070HslsMP4qfy4DTGHIq5k
 96uLtxoeoyuEyBs4cM2IzB/5fcbLFCbIEMF2UVdzPqZgTz47I4kGwkKixfb/VDsa0BKQ
 MFbN8He+tbAMqzrCv15ZqdS4AEJHKjal/LiGq+wfYnEeqCWC7saFjL0TBTkQcmegzsK0
 W6dvLjumMOON8RZ5l+zwqH2rXyL5iXmVPKut7pBmp5S5fOpzl/vmYKCcE8IfvCwZT6BI
 yDuZjFhyG8hLDLpvNzjtnNlpc415FVtsnqFThuMydKXXU8BuFgsYy/aXbWL5jI38aodM
 Gvqg==
X-Gm-Message-State: APjAAAVcTpHH6S8RfupYq0wAtSjKY6vfG345J6f0/YbkZKyHQ+VVBkiL
 /pPcpwAOTuwcv9cVJepgkV/F0VjEQ0mbwn0VhF8=
X-Google-Smtp-Source: APXvYqypfjJu4r7culRVyMiOPZuqnFxGEh6zGa2YOinxU0mfrc0j/TrL7U2GJ1fjtalb55uXooeb1ykmH1iybKpDmho=
X-Received: by 2002:a25:d604:: with SMTP id n4mr6907776ybg.466.1572566015038; 
 Thu, 31 Oct 2019 16:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191015212526.1775-1-jcmvbkbc@gmail.com>
 <20191029120451.GA23463@lst.de>
In-Reply-To: <20191029120451.GA23463@lst.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 31 Oct 2019 16:53:23 -0700
Message-ID: <CAMo8Bf+-nQbfjnCh=BDco8XUjbBsjjDe8BD3iq10ehG1iTWNmw@mail.gmail.com>
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

Hi Christoph,

On Tue, Oct 29, 2019 at 5:04 AM Christoph Hellwig <hch@lst.de> wrote:
> Can you give this branch:
>     git://git.infradead.org/users/hch/misc.git xtensa-generic-dma
> gitweb:
>     http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/xtensa-generic-dma
> a try?

it doesn't break in any obvious way, but mmapping ALSA streams doesn't work.
From a glance it seems that I need to implement arch_setup_dma_ops for xtensa
to make it work, does that sound right?

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
