Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB1B228A5E
	for <lists+linux-xtensa@lfdr.de>; Tue, 21 Jul 2020 23:10:34 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8BF7E5816;
	Tue, 21 Jul 2020 20:54:09 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by linux-xtensa.org (Postfix) with ESMTPS id DF0CA5801
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 20:54:07 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 1so40370pfn.9
 for <linux-xtensa@linux-xtensa.org>; Tue, 21 Jul 2020 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZhFDYa4FfOvvUM9wrXOQAjhc4Tt6wbIOg27vSWas00o=;
 b=r4drilcsOVRuoawrOpfhw+dymjFUEvUJ8LUrnZdDYtwr4SUrvK1TOXNWu2AexT/Meh
 uDWLtU6Do3cnH41/8Uo9sOh+kN0BKt68ziFJ0/S5OUoIoMatggCbTlbf2Pi04mWnZ7p5
 4Jo1rs/LcGOzKFLAIFAg5As8aYZatAvppuO4sgZAjURrnsuT8BR3JdG3URMdy/rgyUkp
 8Opjs5SX/eadOJhi466+ANacMI7Q4BNFuT6apL8uVaSLfHOdGLvuuzOwmMYCUyxtfz67
 SKprIW4A9lLUkLHJtDMB8LKNZEcN6RC/dMDUvNs6CEH4/CIyCBtOH3jxyYUnTTRr1aJv
 9Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhFDYa4FfOvvUM9wrXOQAjhc4Tt6wbIOg27vSWas00o=;
 b=E/Q1urqgOubbGaPhYoCTgBWIy9B3pCt3a0WIguguqLkqLSQrEugm3+FnFofSYIY/Fi
 xJqfwUfZqwyR5X5zjLhMNaPBsvFeu7OMnQV8VnKw+TtF8tp7AjknfFl8Fbb+zfxlsXy3
 Mf5Rqoq2bS9GAIGqY/kU0d2aqTIdwn4WQR9YlclIjvKZiNAkNbldy1L/obtS62G49KW5
 jra2/nJfwSbEChMmaS3TdxE6HgcjCMNe/Kh8rI7L3WUDXw1Sc5/rzvwDnPxMFS4n9UD9
 vAciaEo2fgar6ARENkn5h7+V71AX+KJDvlqeKj+MqMsp5FHSxQOoxlJEZJvri2Xb9BFq
 ZEFg==
X-Gm-Message-State: AOAM530yEbEf+ewfIKHUwv55+92foS7prJlUBdaYDSj+JTLmocuZEL/a
 R+9i8XkK7y4tB1my/IwukLx47L3kgRwm9n08OKY=
X-Google-Smtp-Source: ABdhPJwoWRbs5GZLbVtYueLHOUh103u+TTXn30QPO7TztEYzA+lP7eK9C1X4VZur6jmAkEvULmrS9QZgaydLUbsPVTc=
X-Received: by 2002:a62:3645:: with SMTP id d66mr26786035pfa.275.1595365830665; 
 Tue, 21 Jul 2020 14:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200721210044.15458-1-rdunlap@infradead.org>
In-Reply-To: <20200721210044.15458-1-rdunlap@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 21 Jul 2020 14:10:19 -0700
Message-ID: <CAMo8Bf+Pnkwu59vhwz21K_qoMHn+44AW3YUmO53dZ5nROaDdzA@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: initialize_mmu.h: fix a
	duplicated word
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

On Tue, Jul 21, 2020 at 2:00 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Change "The the" to "For the".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/xtensa/include/asm/initialize_mmu.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thank you! Applied to my xtensa tree.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
