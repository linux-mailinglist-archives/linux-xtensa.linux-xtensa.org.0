Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 30F2C25835A
	for <lists+linux-xtensa@lfdr.de>; Mon, 31 Aug 2020 23:16:41 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 99EE95386;
	Mon, 31 Aug 2020 20:58:47 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 5525152C3
 for <linux-xtensa@linux-xtensa.org>; Mon, 31 Aug 2020 20:58:45 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id q21so6854613edv.1
 for <linux-xtensa@linux-xtensa.org>; Mon, 31 Aug 2020 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbYgjGq7/pYHTXth4zyEMxxBU5py1CNODLIs5JGYAxw=;
 b=EwWvFAw+VcdngGMSW+L9lC/Bv5OnCoBYZrb6tFycbE8fLBOn1J5Fll0lvjvhd7volD
 kMaqwGswjGtId6BmabVuVoxs6+d+lJKScxE709UN76O3auJGyc/002n3hAZBljR9Mkxs
 61S86y5v8eEtBNFHFh6Mr6I8xvJ63xGxYxqDKZY+ZpXrC2mVHUuqE+96jGL8jIBD5jn8
 pEBU/UWODQlW5k+/hz0E0OjkbXeMTmLbA3ICuZQFadRQlOlPR9hicfy+D0EiaSNbqCOs
 qG+nvqUYbKz1Fmt9HWFYPzrrqkiWdStH6BO9jjPatTrsgKQA3kY8Y327MztV7f7CMfi9
 fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbYgjGq7/pYHTXth4zyEMxxBU5py1CNODLIs5JGYAxw=;
 b=ZvQgAYFxrqK1kOXtFM18S8S2Rx/gf5WCa84trpmpvjLIeWOSzdU7dEtZah5fOXrLaM
 5q7qYGX/8c8ybI4/lL8YGU6wlPOdxYVTYvjSpkNOkdVbPBSgxdsZMJgvCh0Ur80sntZP
 MIbM/aZi7WN/EIVodNefqvO0gfOJpmzckRLuiqUDumDXszRtPOIuTmxBvpV62PcbkwsF
 L1ndL68U9N00lZMo3WPxoWdKBVevKwYSoAaWeDXjQrDBpBMvePyifU2YvET+aXhCrYg6
 TtJqHUYD31Ve7otnlDhBkaN/2BVIHzsfqfI9G0SHPkgdhFmSz+HjGr5ziKGgbcQDehqv
 ffnA==
X-Gm-Message-State: AOAM531+W7aGmErN1JAmXl1BEuE/6RP1wIFSsh4A4dfRtPSXuzzEvx0b
 tUq4/63b9Pvlxib2fut4kwarOwzQyw9zX0gvDtLl9YNY
X-Google-Smtp-Source: ABdhPJzlZVSXpZRaZE941E9LluC3Em729dQ30e1wDFMLmmIIlDxu1QNzqqvIe4IBaH2ZqaWTuHGjsR6kyItPzihvDxg=
X-Received: by 2002:aa7:ce81:: with SMTP id y1mr2833030edv.51.1598908597094;
 Mon, 31 Aug 2020 14:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200831210937.17938-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20200831210937.17938-1-laurent.pinchart@ideasonboard.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 31 Aug 2020 14:16:25 -0700
Message-ID: <CAMo8BfKcroiN40jp2zUAxEk-pTB3nqTVJz0z93JsySQBh7+L2Q@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: uaccess: Add missing __user to
 strncpy_from_user() prototype
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

On Mon, Aug 31, 2020 at 2:10 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> When adding __user annotations in commit 2adf5352a34a, the
> strncpy_from_user() function declaration for the
> CONFIG_GENERIC_STRNCPY_FROM_USER case was missed. Fix it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/xtensa/include/asm/uaccess.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thank you! Applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
