Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 05DF617F086
	for <lists+linux-xtensa@lfdr.de>; Tue, 10 Mar 2020 07:35:01 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 3FBC66506;
	Tue, 10 Mar 2020 06:23:00 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 8762364FB
 for <linux-xtensa@linux-xtensa.org>; Tue, 10 Mar 2020 06:22:58 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id o21so9449pjs.0
 for <linux-xtensa@linux-xtensa.org>; Mon, 09 Mar 2020 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bGWhlBnTQCg9+tiKpri2VWMC+y1op1Nt19f6ZhKfJYA=;
 b=GxSAYlGCXeh43hPNRDPHqDFdspD0YDrMVU2NIgVXwKJtapFOATDRQ0R/nqQw40fTkj
 kzOfk+wx9BggRwzKU2SV/YqTWl3N/qtAkkN6wQq2nYhfSFe1LexX03KojL5sq+K3qTcx
 TM4O9JbkAmtoSm4y/XVnxB0EKhMfe7GKpBF5eOAs1vtVQz7f4sYcXzfxGzTyIoRtyDdu
 hWP1XBNVU1Fvu7I+szxaociVb8JpEpGno/Lb+rzkuSnsJP7EZMk77NcYSwJTgPJyV7pO
 6v9U/sDvQ9ecbJytSGvwnAkCmfiUPpTLkCuOoUNh5WJbG6ThoXm13ilfqcX2ViDOsEH6
 EZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bGWhlBnTQCg9+tiKpri2VWMC+y1op1Nt19f6ZhKfJYA=;
 b=BnKuiJhqxwd/dOwzNx6OT6R+msDD9Rs+RrX+aJbBqhk0/5n9aFCuBifAbzfPReHWQO
 tkH0RY+U1lUwQP4Su0LZ8y2X1zpBp2KjTxq0yfPUe8yBCq6/W3DdQjFDxPdPThvEePxv
 qAfq6TKZZQb/EQkTUpcjtM3aKYBJ1x02k6akeGpO4u+CjK5F65NuTrXANWQkifgHFqsl
 tEWV7Q8vECzQ9qUpCsQ5t2DR5OOKd1fJnnMDjELfdrWeAecMUe7UxJGvJQwRAlPhOHuE
 awDDHTHkUuedXuRE14XbJh3vmQnxoqSxyojj4A/B5BFET+EEfnAvlV9Deme2voxGOQPi
 AeUw==
X-Gm-Message-State: ANhLgQ0ILRO90YphGWE2V4AYnNQa9MEUI5q/GJxY51qM9zRq0UjM3g98
 l23k1tslKWiWzyQEZ7/nqFaaX/fENgQVS5Dz7UM=
X-Google-Smtp-Source: ADFU+vsh2DTPbuDRsemIdTyt+pljDxJrkb9G1oGyBBc2JnwQGWDQ48zTeNg0Ii3dC/Nrzr0jhM5tkg05/xZyknk2mk8=
X-Received: by 2002:a17:902:8647:: with SMTP id
 y7mr19292031plt.224.1583822097536; 
 Mon, 09 Mar 2020 23:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200310045925.25396-1-masahiroy@kernel.org>
In-Reply-To: <20200310045925.25396-1-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 9 Mar 2020 23:34:46 -0700
Message-ID: <CAMo8BfLLacwcBOhZfkuRziPOYbRzUHRf+BjVo_tV1r6xJZ7+4Q@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: remove meaningless export
	ccflags-y
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

On Mon, Mar 9, 2020 at 10:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> arch/xtensa/boot/Makefile does not define ccflags-y at all.
>
> Please do not export ccflags-y because it is meant to be effective
> only in the current Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/xtensa/boot/Makefile | 1 -
>  1 file changed, 1 deletion(-)

Thanks! Applied to my xtensa tree.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
