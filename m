Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C9FD02DD698
	for <lists+linux-xtensa@lfdr.de>; Thu, 17 Dec 2020 18:52:34 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E2C9064BE;
	Thu, 17 Dec 2020 17:31:01 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by linux-xtensa.org (Postfix) with ESMTPS id 113ED6488
 for <linux-xtensa@linux-xtensa.org>; Thu, 17 Dec 2020 17:31:01 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id w1so34485161ejf.11
 for <linux-xtensa@linux-xtensa.org>; Thu, 17 Dec 2020 09:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8qe4fPlW4MKxXKIVn9ySHT8yT8yRaN3t1O0dtrhKYy0=;
 b=PKG/lkYghDlxKIVy+OMwZ+UUf14Ku2S3sj1eC0X01Oya8jXLN22eb7o64Odk6B6jFx
 O2VTxkCyoWkl1CLZWqL48R27lPb7PBxN0za9bAcABoV3LrhkWbyFfmThuQATCKGHyH5K
 //51FoTKa3dz99UiMuNiV2xDziZ52JcQebUzKHYu62Cx793YqUtWmEsKI2UJ+hickko8
 v1m94YvOdMRofYi0K/H0jBOJHbSbYlSTvJ0nAGqZWme9pT9V7a22TN99KQpgd4Sm7UkW
 Ms7x5aoffENfZ2SPetVLjR9BwdvbPZcc7z9S5DmnzEbu16eNoeKVFkqKoVqjp9xGWGM8
 nzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8qe4fPlW4MKxXKIVn9ySHT8yT8yRaN3t1O0dtrhKYy0=;
 b=PQsZV3LN3Esufr26z6MZQxWg0dEGs4L4ChHwRvKUpLsNl0J6pVY0H8Ko+HyZV/SuTS
 07j2X6WTYms5QNWQoqIB0gqI2Bn2A0VD4tpere8XLtFGODdtCLaI8xJ069jzhZj7YoNs
 s9IfgPU//eDpELqORLWgqbigZOUlb646Acungy10a3jb9J/aMGk7uOSk4Gijahz0f2Xr
 rOYQvc4hLVJE/mIdy3qu6TYCugexKZ0PyvsiH4UlhsQFWfDI1nr/B2t6gh2N+/9WU7UU
 EQEUquqY4eDkNiQxYZy70zbB5UCsE2YQj6hnWoN1YkZzFBjBReRuMpCZYQd/N9y5PypA
 AhmA==
X-Gm-Message-State: AOAM532RI8J6Mp7eK63oZqZGm5E6sr6VVRzCvqVD5iGRgjOtfDsUriU/
 JPY26+v/92UsYYwzinUbqGhVQ5XbAsOHsRm23jU=
X-Google-Smtp-Source: ABdhPJwMKSZ+KqlrwpMSngtpDvSY6fbWPcTMBpqokyWhZ274iZwTREtjVcLgvzXhdPBxicpAYekkW5NqkLeq0/muTNE=
X-Received: by 2002:a17:906:40d3:: with SMTP id
 a19mr175451ejk.98.1608227552264; 
 Thu, 17 Dec 2020 09:52:32 -0800 (PST)
MIME-Version: 1.0
References: <20201217172427.58009-1-colin.king@canonical.com>
In-Reply-To: <20201217172427.58009-1-colin.king@canonical.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 17 Dec 2020 09:52:21 -0800
Message-ID: <CAMo8Bf+Q3BQjjc2N=ykZy7KJ4-CYY+qpDFZmJFe1_wuxAsL2cQ@mail.gmail.com>
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix spelling mistake in Kconfig
	"wont" -> "won't"
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

On Thu, Dec 17, 2020 at 9:24 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the Kconfig help text. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/xtensa/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks. Applied to my xtensa tree.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
