Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 763B910A477
	for <lists+linux-xtensa@lfdr.de>; Tue, 26 Nov 2019 20:27:44 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id F01C064BB;
	Tue, 26 Nov 2019 19:18:56 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 01F3564AA
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 Nov 2019 19:18:55 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s10so8591749plp.2
 for <linux-xtensa@linux-xtensa.org>; Tue, 26 Nov 2019 11:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YI4V2WssMRGVmL6esY08NHkJnNChKgI+Jb5umi12BtQ=;
 b=Qw05GjQOCTE0y6fF9w8dxZSi7PjeRJZGmubHGiYE6lEqhTc/TsMEQM/741ndwxuKxz
 RABNCdCMij6yPr8XiG8GCR6YgOR4GTepgetwvuUsq2MLfAK9Ix6kY2sYQawoY1UDdPpS
 WCEH1wUWZkJJGp6+hVeqJV/nSY/iD/a66JRIVe22/wJibBe+gqvjEXb1AOW/0iYRCuwL
 nnldZFDhH7fUblMqIDyz9eGLQ4Y7gC6VOfRHpBZp14QWxHnYwrD3md9Fdc1vrQzmRncb
 p+MrY4Hk8h2ij3N9VLdjYv2qhzA9m++8itAjRuQwVHDPj2JaaXR10cbbD7ZEkKeKojLq
 Bu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YI4V2WssMRGVmL6esY08NHkJnNChKgI+Jb5umi12BtQ=;
 b=mJXg8Tg6oEx6+ewo/R6WPuKWfsQr3o2Q/J5ta0bO9PdB5PoXqITDfJeZCLIhfZA+RE
 F2jUWm+t+Ro/8nuEtAxCyXWsWFRXD/PDNnswzRH8RXxBnIq3ERc6WY712zoh9NrvdJ4D
 DoGhpC5teBpSPsQbPyg6D4eriGhv7IJocGdk53PdzGCSYk83GFI3rW84SdgV/D9TDB/p
 3ojHxbJGgjBDks36jOuf0DmI69jbHTo33myStxRdZNhtPArFTHJIH/hZrIcnsCz8tE7q
 bcrS1mCdmdzL+SOz5jryP/QltqepH1ERt6T27c2+UrYk+6hC3j+l03OCUDmHYDtZMeSO
 JUMA==
X-Gm-Message-State: APjAAAUphhmXHPShgpWudZaeETp72ZnTqxpXelBRMzQbDxNQOQ3HjJ2s
 S54goRJC0Cfu8EhgCsjdsvI+KpvKP3CDNRG0ybk=
X-Google-Smtp-Source: APXvYqxI0Hok6P5KawDA82lDpXYTcv4tCtUo+n70KHsCLSunjJ7EE9Wj9J+r5Ee2OnAv9XxMa+II+yHQ2pgcRk1/QF8=
X-Received: by 2002:a17:90a:bf81:: with SMTP id
 d1mr887094pjs.125.1574796459529; 
 Tue, 26 Nov 2019 11:27:39 -0800 (PST)
MIME-Version: 1.0
References: <8736eaxxdg.fsf@x220.int.ebiederm.org>
In-Reply-To: <8736eaxxdg.fsf@x220.int.ebiederm.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 26 Nov 2019 11:27:29 -0800
Message-ID: <CAMo8BfK-Ua70sZe8JBHz3KK7+WjP1MvBa=jTK=-HrOHuAuDnHg@mail.gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] new uses of SYSCTL_SYSCALL
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

Hi Eric,

On Tue, Nov 26, 2019 at 11:15 AM Eric W. Biederman
<ebiederm@xmission.com> wrote:
> Doing a test merge against linux-next I see that in the
> tree git://github.com/jcmvbkbc/linux-xtensa.git#xtensa-for-next
> a new defconfig is added:
>
> arch/xtensa/configs/xip_kc705_defconfig
>
> That defconfig adds CONFIG_SYSCTL_SYSCALL.
>
> Is xtensa actually using this system call?  So far I have not seen any
> other users and I am serously proposing to remove it.

I'm sure that this config symbol was inherited from some other config
that I used as a base for the xip_kc705_defconfig. I didn't enable it
intentionally. I'll drop it from the config and fix up the patch that
introduced it.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
