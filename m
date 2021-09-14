Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 391A740B5DA
	for <lists+linux-xtensa@lfdr.de>; Tue, 14 Sep 2021 19:24:31 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 153B36E3D;
	Tue, 14 Sep 2021 16:53:54 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by linux-xtensa.org (Postfix) with ESMTPS id 100C86E3A
 for <linux-xtensa@linux-xtensa.org>; Tue, 14 Sep 2021 16:53:52 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id i6so21115293edu.1
 for <linux-xtensa@linux-xtensa.org>; Tue, 14 Sep 2021 10:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EGRPFgoAwi4AvXS75+7qSU93iD+OaTNIU+GyjPC/BlU=;
 b=KE6BCfdmrHnbCw4KivnyDYC3bfsky6Y6SeLsyBAp3AN0b+uaHSJxSnsmrK2YAtF+fi
 DH5INupOzneqTyCVgO2YBr/2un9+mPXGALyPILv8Uf3R8KalHSirt2XsMi6NzpwEOR4S
 OywKlTzRc6rB85nY9vMNmUxUhph62CP+yGaXeuT0j9v1EDJQV8jmUOI/+KGYlCTyKjzh
 Zk9Ls973N2S4pSbkeGrEpAfLVSG7suT7IwK7GjsdpSsrcGwh5OK3rrIJi2JVGuK6Goub
 0e61X+Jjnid7qEMUi+jzoe+LQ7n3yh4oGWgGMWAIFaecAmHQMSmgEHzFYnJuNXvX0fEp
 9tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EGRPFgoAwi4AvXS75+7qSU93iD+OaTNIU+GyjPC/BlU=;
 b=0QeBwS7800wFIotMCwbDSntIUz1t/fIvRHOZKolI3aTeMxeplxG/VyCZuiK5YBM73m
 TJzx2U6/TnlsBblZVNFR0NuhbtRzCiHwVPMA06M332pbG/NR2w00HU7EQKDOWSxYJd7o
 lkSlbb+POoR2HT51Vc3RRvzajJh0qga+C296QtTT9KPHe7VPlQDIaYr90kRKS+hjI9/3
 80d3a41EkWkBlzNoOrbTC49krzDgGMU2D1csdpR4uGIGeHO7pZdMeVkcTHCwGwxW5Txw
 UYz8qv95bkpoRtI8ZqXhkQCEzjccWIbCmBAmNOLmoim3+Ldg6/eoAEr9J9KFOTt9Bbp2
 4V0w==
X-Gm-Message-State: AOAM531iNain1f38aeYlwvrLnkTeiiuZn4Sn0cHckraZ7RBEYkZvXyMU
 qziQjBwNqFjjLOkRgT5jsIk/F0JLtYToi32xGG4=
X-Google-Smtp-Source: ABdhPJyzqoBsNhtNjKYHRSRkd5KA7l/L5E+Z2/ap7lQ7sj/n1gnz/LHDPTXzZ1kKJbUtTq26vq7m88pKBLc8SCMkFdo=
X-Received: by 2002:aa7:db87:: with SMTP id u7mr20535016edt.92.1631640267390; 
 Tue, 14 Sep 2021 10:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210912025235.3514761-1-linux@roeck-us.net>
 <315e4a23990444f585a15d2e23a39b8f@AcuMS.aculab.com>
 <46f59bf8-f243-b65c-07b3-8ecbf7b410fa@roeck-us.net>
 <CAMo8BfLOhr8Gw9RbSM_pVhgokDcBZ3PgwQAG6sCxDBAm_rMy7Q@mail.gmail.com>
 <a34cac4a-dc17-acf0-f24e-69c06217adb6@roeck-us.net>
In-Reply-To: <a34cac4a-dc17-acf0-f24e-69c06217adb6@roeck-us.net>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Sep 2021 10:24:14 -0700
Message-ID: <CAMo8Bf+rFk_CJiUOdQC5yLuMT+y-awgS9MSx0g3-DqLXYEeX7w@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: Increase size of gcc stack frame
	check
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

On Tue, Sep 14, 2021 at 7:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
> I still don't think that those stack limit warnings (now errors)
> will ever get fixed. Which is the point I was trying to make,
> and your observation that the stack frames are really that large
> because of KASAN just makes that argument stronger.
>
> Other than that, it is not my call to make that to do with this
> patch. If you think that it is inappropriate, by all means
> reject it.

I like it, also for the reason that with KASAN enabled
kernel stack size on xtensa is 4 times bigger.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
