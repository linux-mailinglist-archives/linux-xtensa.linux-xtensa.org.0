Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2C92A18BD
	for <lists+linux-xtensa@lfdr.de>; Sat, 31 Oct 2020 17:37:27 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7571252A4;
	Sat, 31 Oct 2020 16:17:25 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by linux-xtensa.org (Postfix) with ESMTPS id 63B775299
 for <linux-xtensa@linux-xtensa.org>; Sat, 31 Oct 2020 16:17:23 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a15so1058344edy.1
 for <linux-xtensa@linux-xtensa.org>; Sat, 31 Oct 2020 09:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b+NPfT8JKlCYRXYxFv0mKYw4TjmxjjOYGUynmMasNWs=;
 b=HKQdcZkK6WB/k/MXp+RFjtk9xh8eLggIn1uWnMTWOiVRLI4xoF8bsLANX0ZwmkLvoX
 lZmyyN7u7VCtM1TuI/74ZAVp1dFD4buY864JmFrByJQTMaBTCbAN8In/eYve+Cznzcax
 SrUifVkVu35WMSZEPZEQWm+8hfvsxH0YOpYH5icNL1bkRjQDB5PMcof/5l6yD+wbDK+K
 N959Enhya263RDXN558/FflJNj9/r/mrAXjb4BYKMx8rC/nJCYYcAptmWwe57AM6rpJh
 0CR6hV7rAxOSDiAf9PG20XpUJDWwIJGBdUFpBLgmt+2lYGQ8qyG8Pi6YueZ5QMa5GkHf
 P0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b+NPfT8JKlCYRXYxFv0mKYw4TjmxjjOYGUynmMasNWs=;
 b=PP2vepOLC40nEdriaVr8ixMbByws0TWwfyzoxwFhR4CBatXEOTuJhDIZkRu3eSTdEX
 YJWIuiSky+q9++JDVKtb0L38FiCL2DziBX39yGOtKzwM+V6cZhQ3ljnK9Kbsr2RwOMQs
 mUHsNX2PSNUNqYjFl6+nAiKlu6jCuayxw0PkVUpTJgkvwl+D7qe4QUaJwfph5bAh6R/+
 d+88hOa1tPVtuuOITNtPY2TrlxKv+XoSzJnaPAw1EF8IUcBCWEaDrQGJY7y0r8anb3nj
 62ELgCdDpkVP/CYwqH8+X0qL1HVyHDueX7O/qbvmpbx+2y4Wk7Jf7CFE4jKsbEhP026O
 CV+w==
X-Gm-Message-State: AOAM532TSl9OoWlX0n6+vkcRCqCNYe+GUVuN6IAlP0zl1zg95AC0VfNs
 9CG70Nw+qKKv0Fvj1KRU8qSs3u7r4AqmOQBqbyQ=
X-Google-Smtp-Source: ABdhPJxIpSPjgXyS13YEIZD5ljPoARHrmOI4hcOBu31gcWonS6angIRDwgk/lV0siRgSia/7Tt/dwMY2SaeGyqMMTpg=
X-Received: by 2002:aa7:c704:: with SMTP id i4mr8380910edq.51.1604162241771;
 Sat, 31 Oct 2020 09:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201031094345.6984-1-rppt@kernel.org>
In-Reply-To: <20201031094345.6984-1-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 31 Oct 2020 09:37:09 -0700
Message-ID: <CAMo8BfLCfpZcQC3oqEvExSqZ+dT2sVDjcXoaO_XKALn4rGjoog@mail.gmail.com>
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

On Sat, Oct 31, 2020 at 2:43 AM Mike Rapoport <rppt@kernel.org> wrote:
> Please let me know how do you prefer to take it upstream.
> If needed this can go via memblock tree.

Going through the memblock tree sounds right to me.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
