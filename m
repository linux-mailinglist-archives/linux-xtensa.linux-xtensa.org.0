Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 612FB3EAFB6
	for <lists+linux-xtensa@lfdr.de>; Fri, 13 Aug 2021 07:37:50 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 83C3965E6;
	Fri, 13 Aug 2021 05:08:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by linux-xtensa.org (Postfix) with ESMTPS id 5051765E4
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Aug 2021 05:08:16 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id v2so3235913edq.10
 for <linux-xtensa@linux-xtensa.org>; Thu, 12 Aug 2021 22:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=suCL3YjNMQtPKfchSOwl+0iVVLdItZKK5YO5Elt5gzk=;
 b=V2IzV5wVWW4PnkBRNTdsopX/EN275oF7xJoSfShS+A+HQSV3OLa5Ao8iZRH2PG3Ql0
 r1anD56lxiruOvse43iSGyFJ89UKdzZGk+Bi742mY/FniDILLejY2uTsjKDAYbr1TiO/
 SWh3lUgqR7CPZ32qRt+nRWBE8ADij6T5gg6G7Uy2TurX8oih7D/B/VC3gh1lqvWyH9Eu
 fTkexNcmI1ZP2EbWI2ihVFFyJahXspLANbDlB6j0ir5WTUsNPV3e7BcgxVK5naqBOigd
 JOKYpxkfFc+oAL13GHPQnMSYKGDpcT0ALaDO93KSpoBupEPzO4g2aJr9bW+iDFaUf0um
 j0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suCL3YjNMQtPKfchSOwl+0iVVLdItZKK5YO5Elt5gzk=;
 b=uE/hniZ+HJ1BtDalxfvRoaBWiUnH8Sf8G/Z+zq09SiSHAMdkw6y/ALmRagx6Y6zXNv
 siCCipwzK0GqNj5UYx5jHmVrLw5RM3sONRD5XGukynNxOE7dfJakU7YPIo5L9+Am5LTK
 Gz2+i91OQgqE3Imt1Tb4H72GMQgi/nRCtyCUay8g2Bd1igam8yvnw+ipaZUD/87PVM2A
 okkm8LgBLeIEw3l32AuH+td2qh2uetcB0XB1fjpHgCIhRgnN6Fi4/w3bhTMkoxI1v2Dc
 viLTAD2y5+oqi755cgbRmGPcvCemhczizwvbDrwgZFooay/CwkR09tDQlSgAvcrSlhG2
 Cp4A==
X-Gm-Message-State: AOAM530xHMQOth0Xm0lp7TKVe3U2PtegXWjDmE4yl7aWp6a5FPCliLdB
 V8lCABqHWrAwPbAUIvP97KVWVBLKEbhii/A1x/U=
X-Google-Smtp-Source: ABdhPJwb3oq+7vDZvlVLZdbZGxduYUGJhdL9mgmIQyKqz21mL1JsvAenurz17ab15RXLl5j7hXIaWhHO3cdDfvW5yeI=
X-Received: by 2002:a05:6402:10d9:: with SMTP id
 p25mr851140edu.51.1628833063070; 
 Thu, 12 Aug 2021 22:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210811163731.186125-1-masahiroy@kernel.org>
 <20210811163731.186125-3-masahiroy@kernel.org>
In-Reply-To: <20210811163731.186125-3-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 12 Aug 2021 22:37:31 -0700
Message-ID: <CAMo8BfKh=bh_Hfo=dZT6urNPBkXVJ_kNXu=a7ZdtwR1RMOV7qw@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 3/4] xtensa: build platform directories
	unconditionally
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

On Wed, Aug 11, 2021 at 9:38 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> All of arch/xtensa/platforms/*/ have Makefile. You do not need to
> check the presence of Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/xtensa/Makefile | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Thanks, applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
