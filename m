Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B6BFF40A70D
	for <lists+linux-xtensa@lfdr.de>; Tue, 14 Sep 2021 09:05:13 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5A57D6E08;
	Tue, 14 Sep 2021 06:34:37 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by linux-xtensa.org (Postfix) with ESMTPS id 4B54B6E04
 for <linux-xtensa@linux-xtensa.org>; Tue, 14 Sep 2021 06:34:33 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ho42so26564081ejc.9
 for <linux-xtensa@linux-xtensa.org>; Tue, 14 Sep 2021 00:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2/VApyJZoRqB7L/N6VX+qLKsuRTi0j0Ev7mIRjfSzk=;
 b=IemX1JxGW12b/l8eossorB4QY091xodevGLbTavaDgizjgxnuUyf/hunquBOn2xbr3
 HZMMGQVAS1gBFy9qMLnbclwWPfNwCH1uKE0+JBJkIz70jkjNjq/B4BqjupE8y50kG8QS
 02OoJYwW8RHILm9bXFAHwFXgKLBJNEnJ9qM5DnoTOCzFX8QC4PFQfnHYzHbQSRcSANbK
 PI9Zfm+8xhispKdYwn1NpURo2Vcl6kYiXgkIHWX9Djr8AGf1Ze8NCun97cqDPI0sbMzd
 aFXOW4D2zaykbvTiEyvHJBJfIgo8Ah9XjdWS/jf2DwLJBnAB9dlCS5uz8q9RYhAGqRik
 kfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2/VApyJZoRqB7L/N6VX+qLKsuRTi0j0Ev7mIRjfSzk=;
 b=XnGwiGyPr9R5cuf0xDyZ7vQzcGShWlDX7JDoY7P+cAJFFV6/qPxUGFwwbTqBVDPvEu
 UJW6OralMZrv2t/mOqkcPXKXQ4IqO1agmeUKDkgZp/Z8bHM13r4anFZgQFt2H1V/DIFd
 EVBoHRsm46VjLBfu/zC/pPeEE12h3LsnKkhhkt+H0Lgax5OaS6ipPGx5PI8xaRkMCJbI
 UcyDcUmgosMThWxqUE9HF2VUL9Qh+JK3z3qKOAHQ0dCEO+V+2kUk+EBwS360SPGrFX25
 IYYhPP7hJrTUTSe6En8V8ndlD3hlWFSyxXW2trcCogFmrYAi8DHE4qH+eIpy/kb2BcLW
 mkvg==
X-Gm-Message-State: AOAM531XIV7oD6ZlM/MKl7al+IcLmoEnxgf3ZGv6E1NQW/YTJffRte8v
 hfwZcW8+LuS+gBnHceSjUr/trNMWHrCDWRscmK8=
X-Google-Smtp-Source: ABdhPJxaEPRWvCIK9AkYNuVoiK5RN68ymDm6C1UbwFr+PQNZ/GUvsrSOyDSIyEbP1n7Hb1vYqyZXGCxGI88xCl3vsI4=
X-Received: by 2002:a17:906:4dc1:: with SMTP id
 f1mr17398909ejw.288.1631603107570; 
 Tue, 14 Sep 2021 00:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210912025235.3514761-1-linux@roeck-us.net>
 <315e4a23990444f585a15d2e23a39b8f@AcuMS.aculab.com>
 <46f59bf8-f243-b65c-07b3-8ecbf7b410fa@roeck-us.net>
In-Reply-To: <46f59bf8-f243-b65c-07b3-8ecbf7b410fa@roeck-us.net>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Sep 2021 00:04:56 -0700
Message-ID: <CAMo8BfLOhr8Gw9RbSM_pVhgokDcBZ3PgwQAG6sCxDBAm_rMy7Q@mail.gmail.com>
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

On Mon, Sep 13, 2021 at 9:11 AM Guenter Roeck <linux@roeck-us.net> wrote:
> The functions I checked typically have pretty large local data
> (like, more than 700-800 bytes). The errors are only observed
> with xtensa:allmodconfig test builds. While it may be arguable
> if those functions really need that much data on the stack, it
> is unreasonable to assume that all those errors (again, more
> than 50) are ever going to get fixed, especially since the errors
> are only seen with xtensa and not with any other architecture

That's not what I observe. If I build allmodconfig on v5.15-rc1
for arm with gcc-8.3 I get 69 of them.

> (including parisc; setting a stack limit of 1024 works just fine
> with that architecture, at least with gcc 11.x). So the realistic

This comparison is a bit biased because allmodconfig on xtensa
enables KASAN which is not supported by the parisc. Disabling
KASAN roughly halves the size of stack frames for a few
instances that I've checked.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
