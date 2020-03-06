Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3256617B520
	for <lists+linux-xtensa@lfdr.de>; Fri,  6 Mar 2020 04:52:02 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 18794423C;
	Fri,  6 Mar 2020 03:40:09 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by linux-xtensa.org (Postfix) with ESMTPS id 97CBC2628
 for <linux-xtensa@linux-xtensa.org>; Fri,  6 Mar 2020 03:40:07 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id b8so295844plx.4
 for <linux-xtensa@linux-xtensa.org>; Thu, 05 Mar 2020 19:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YxeRd5XSIaeUn43WQGWARqLK4HMbMbnVMcjMJ4XSsnw=;
 b=gmBhp/L7BDY/KIDGcsA5IUH4AKoGs7FiudYdVkUZ9SrjCsB/Jn65dvVZjmUNE0tvWK
 qTyMXCXzAvfs+DGO7eUm9TfPQXJG07PREvIjqxwQbI6N21BT+EedDccEjmPjj6/e/LMy
 7LsC0AVgLlz6nbpaCipyK3uJ+y7os8hbAsppUAmCcqSHq6niYa5bU1JlwqHj0/WcqYVU
 BqBI+wlWqf8OFTLozxSaTdUE4/3OWQYqlXLp8T4+cP0UO4UvTs5vClX5YmQ8tdG8c9Bh
 zfoNeC5+9oLdUg9jpKLo2XzHT2joFINadCvl5xMv2etdP2EJ5lRPjxhRn2HPJdhpIhqO
 aG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxeRd5XSIaeUn43WQGWARqLK4HMbMbnVMcjMJ4XSsnw=;
 b=kMGG9lDf7QI20lltmHm6cw7W/d78mRLY0Hlo/rQX6ySiFXPXSD3zktha8mjVDURS7d
 rqx4A2hxAMM0Z5J6G29FFhObaFz3dqnM2GfogC2mLwdISlj7IeM3itI4JKzviizGzGkU
 0Jfx6nU3lAr3P4yZMINpvb82umTWDNq/oLP8n/CBEJ/QX/evffBSyY9mjs3kcCuYBjL5
 WP41Pybi6j6d0ypjc9QwnV8IUQj6Oe/pXLtROA7c0xEa34qdCat7E489sg9VFTFQuUIJ
 mLRmLudRTrE2lNeTf/R1FEIIyimQN8j+Q3Z9FuIASCjpkZFB7U77cG7V8Tg8T1EvJQRu
 yPrQ==
X-Gm-Message-State: ANhLgQ1JPs/gCfw7fJJjIxCb1sk2QF94JuxDT4nNMUynbl/4N+6mn4+3
 arisPpV4ltHHiW+V7K8HjmXl20hdeSOGF/pb34U=
X-Google-Smtp-Source: ADFU+vsk6T8YHyZOAYZRVVXtFu/9fcXXSHpkYd/+s4B/kNr5GmjxOhe2MbmEAaPL36K8wWtY0rArZApyNMdAo/xzfGU=
X-Received: by 2002:a17:90a:d205:: with SMTP id
 o5mr1473884pju.46.1583466718940; 
 Thu, 05 Mar 2020 19:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20200305045328.11298-1-jcmvbkbc@gmail.com>
 <CAGSvup_1CbtFO2tTiW7UJGaKYC4q0u7=Qt_RFUsGL4iS9wuoUg@mail.gmail.com>
In-Reply-To: <CAGSvup_1CbtFO2tTiW7UJGaKYC4q0u7=Qt_RFUsGL4iS9wuoUg@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 5 Mar 2020 19:51:44 -0800
Message-ID: <CAMo8BfL7zZoSM+1fDinSDmT7yzY0BWGs9hycgncv36qx5SNMbA@mail.gmail.com>
To: "augustine.sterling@gmail.com" <augustine.sterling@gmail.com>
Cc: Eric Tsai <erictsai@cadence.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Binutils <binutils@sourceware.org>
Subject: Re: [Linux-Xtensa] [PATCH] bfd: xtensa: fix PR ld/25630
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

On Thu, Mar 5, 2020 at 9:36 AM augustine.sterling@gmail.com
<augustine.sterling@gmail.com> wrote:
>
> On Wed, Mar 4, 2020 at 8:53 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> >
> > bfd/
> > 2020-03-05  Max Filippov  <jcmvbkbc@gmail.com>
> >
> >         * elf32-xtensa.c (shrink_dynamic_reloc_sections): Shrink dynamic
> >         relocation sections for any removed reference to a dynamic symbol.
>
> Looks good. Thanks for the fix.

Thanks. Applied to master.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
