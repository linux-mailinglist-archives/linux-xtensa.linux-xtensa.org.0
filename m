Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E47173EAFB2
	for <lists+linux-xtensa@lfdr.de>; Fri, 13 Aug 2021 07:35:48 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 0C3BD65C5;
	Fri, 13 Aug 2021 05:06:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by linux-xtensa.org (Postfix) with ESMTPS id ED6C465B9
 for <linux-xtensa@linux-xtensa.org>; Fri, 13 Aug 2021 05:06:13 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id z20so16231030ejf.5
 for <linux-xtensa@linux-xtensa.org>; Thu, 12 Aug 2021 22:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H66kUza9kjieCXDNO4cIhxNZROsB3ud0hLQkWH6ChG4=;
 b=dLvPb9L6KV6SsH/hl/dmFtyfa1NhSyXTPxtee2A15khhgvnTyVta8C3oV37tKKkXov
 fImKomeXcFk6fOawR6TKC7LkS6RoCiwvf7i6V/ZoVgbF8Qary13DSnazDclavtQ4c8va
 xk31w135Cz8Jc30NVTf4ESlUBb5nc2YF1chEUe0EIaiAMVDTAOBidY015SMhquMxSf2L
 DUeSWjK7b0mtHIb3+P3J5ut9/zzXiB6udOL5hQLODecBlW9IPo8/4r4NFhQw5nAKxgYu
 pSQlC3whcjdZmybohRj1QDfsNvPNVh0+BgJzhF4VzSCyAv/ceNGRzUU89qO2rtIgHfbo
 I41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H66kUza9kjieCXDNO4cIhxNZROsB3ud0hLQkWH6ChG4=;
 b=sbcHAnKtpSRLCDU4Ka/aqv9wiSMHn8c+EE6jioI0jmkwo5AmPlXr0etNlY8m/3Qkph
 lPEVTrmCPnFQHjB+SA0a4jrcrUjNttjaEH0SSJAVKlir1IdQ4z0KiVnFAgS9wDDCR5rQ
 JewrERaELDJPVHMamn++0ByiZcjGoEH95Wv9d9OeMS0mKiaN7Rh/4PRXNmYxmBolWPl6
 5PjQsMC9uqWOcfW72AYn+jczLRds/z7rQsldopfknNx6XqhwG8QbzCSYlTcAUNn7wCar
 8nKxg5f4GDxpfC0oMbe/+M8bTQsNYrBycmpmLRZOwXHZNCoZKITCm4yXCIWU34oLlbep
 rOqQ==
X-Gm-Message-State: AOAM533LyfDuUQR920Gev0q2VYFwgJoYGF/3L6eu2BKJ8BADfY+Q+eZq
 D4y5lKOreCRHlcEp2CiK8lFivY1IC5yfJMmBxWM=
X-Google-Smtp-Source: ABdhPJxwlm8VqxU8r+al4a211nYhABlHXHs0cFTq5iZn1/qZTW1JxMrhW9mXyrKnf3I6/ntNe053+oV77TQDjrGXR2s=
X-Received: by 2002:a17:906:9747:: with SMTP id
 o7mr796798ejy.486.1628832940805; 
 Thu, 12 Aug 2021 22:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210811163731.186125-1-masahiroy@kernel.org>
In-Reply-To: <20210811163731.186125-1-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 12 Aug 2021 22:35:29 -0700
Message-ID: <CAMo8BfJX-2Hnr3JFw-9tUGbeQKN=XV6nFC_0CHUqrii-kSb9DA@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH 1/4] xtensa: remove unneeded exports
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
> These are not used in any of subdirectories.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/xtensa/Makefile | 2 --
>  1 file changed, 2 deletions(-)

Thanks, applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
