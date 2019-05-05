Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C5A5B14261
	for <lists+linux-xtensa@lfdr.de>; Sun,  5 May 2019 23:03:36 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 66FC86503;
	Sun,  5 May 2019 21:01:55 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 97AEC64BF
 for <linux-xtensa@linux-xtensa.org>; Sun,  5 May 2019 21:01:53 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id 186so72612ywo.4
 for <linux-xtensa@linux-xtensa.org>; Sun, 05 May 2019 14:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2i9rhgHVD3T5C3K8UrnXJUJ8Rly5bf0VzKWGLX59PZg=;
 b=CrvxaBk7vzuPZEKLDFiEgWDKIkVGFhdfJ51HoZ7QORDN4aRY4Hox6Fw1WwitV0KDFg
 RJVOROe2evSVq3Bpq/rTFiUlWUZC1OS+93Cb0QJ/Lq4p44h71mCb2AcmrFnfh1Z1Tzmu
 t/FXUStePogf01KqO4L9CrZZY38HpNMBvty5xBo+NyV1zbQDT4dkfva+FmtkYB1Fuugj
 JvnLOGopX/1QZAQSoinSwi9L7VQrH2UX7jIl+tqIz3mr//aTJaicjjv0/U5fhR8svyi2
 XZH6+unG/9MYvQhEVOB2Gquq983BM5cOyoaq4WF/M4Kbe89KRCLJP8CZu24RASwQdLkG
 wGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2i9rhgHVD3T5C3K8UrnXJUJ8Rly5bf0VzKWGLX59PZg=;
 b=ibg8aquh9V4ypTaFA0FsYJTGIP/ujE0Ns2WEjkY0bHQa1iYvDPChTE2JGQK9dp8Y/Q
 u8mMpk4aUKQUkMsfCDn17Rq+wsCeIG6xMdxnkgmGE7+yebeVlQyny3hIgiGWtjPpqP5I
 1jbNL8vKvQQ8pvyzo5xzksyL+o0Gp86P4Vx1pZsoBWImW1cDSQrOPzyckWFgv7SFX0eF
 IW11WOlfezjxYD1/j8QXicFlgqodDv/7yMCBQSmmeS3sNKHLJhNpuTwI7WlKMt3TEZUZ
 vseGrfFRizkYwzoF2aNFy79+0bUZYymcOnN8B2TmpdxTxYWuDBaBWxp6gDNDFiUO8pOz
 0rqw==
X-Gm-Message-State: APjAAAXocQV6Uizma/sxJhGsSMdHb5buCyyw6ByeHqvjB8pkFvPKfRO4
 XCoBvGTdU/t/rw5YCAMXZ08lp5BDztlQV+zF8lA=
X-Google-Smtp-Source: APXvYqzQybpu7CttSZm+gPxEKEDJMbCoeJ1H45LZuverr/B34C5v2EQX+MktRJwK2vb0QWaPCFOK2fN26yArfeYH0Hc=
X-Received: by 2002:a25:ef01:: with SMTP id g1mr16036793ybd.399.1557090213672; 
 Sun, 05 May 2019 14:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <1557066367-4783-1-git-send-email-cgxu519@gmail.com>
In-Reply-To: <1557066367-4783-1-git-send-email-cgxu519@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 5 May 2019 14:03:22 -0700
Message-ID: <CAMo8Bf+VdXXvKd5+NrTqWgUNTwiXWKJ8svuQMiFeTp52j5sK5Q@mail.gmail.com>
To: Chengguang Xu <cgxu519@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 1/2] xtensa: fix incorrect fd close in
	error case of simdisk_setup()
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

On Sun, May 5, 2019 at 7:26 AM Chengguang Xu <cgxu519@gmail.com> wrote:
>
> dev->fd is opened in attach operation, so should not
> close dev->fd in error case of simdisk_setup().
>
> Signed-off-by: Chengguang Xu <cgxu519@gmail.com>
> ---
>  arch/xtensa/platforms/iss/simdisk.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
