Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE344890F
	for <lists+linux-xtensa@lfdr.de>; Mon, 17 Jun 2019 18:34:45 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id E7880644E;
	Mon, 17 Jun 2019 16:31:33 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 032A9644A
 for <linux-xtensa@linux-xtensa.org>; Mon, 17 Jun 2019 16:31:31 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id k125so5332868ywe.5
 for <linux-xtensa@linux-xtensa.org>; Mon, 17 Jun 2019 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CEK5GNX+bpuZoHRuSIOctjT4p8HV7L7yjo7PKrt7yMM=;
 b=LdgzdUvhXoujW3ZWbkm/kXvsk1qk43c26d0kJcUSENWLRDMOPQDQU/wSA7S/rXbuE0
 uIBdXqu41j1eWF1RnIP41nvBBJMw9KMOxCEOEYkzYsUffj+xurBfqo6FCRWaWpf1UlO0
 8dUmGxd3Gz6cTk5B4+Nh2ukxD1LG7z2baJFebhFkV8LRCc3TFhLkvZGUo/g28Q8Jjsbd
 8U0yrkYb55ySqHXZtzGalTtXQjFsWahA6RpenEFrZ1s3SUukOZMpYnue4mWgqhtjdQJb
 rxfMJ0mkXpCY9gVdjsmVVeEFBfAWkx+hDUt3C3P0jEqX0F66qapjuzg0sbn0K+2ufHy3
 kLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CEK5GNX+bpuZoHRuSIOctjT4p8HV7L7yjo7PKrt7yMM=;
 b=fSnaUhZlv8RBB1o8U5FUj6LGc+B8nIxD5f9q6p2H1vbrcIy7hvb57rRDhRGKZHrfnZ
 Jiy0OTPVa1N62v/wocaF1tA9NRHGc9GljD58yI5q2AzszOfpzJbPUPUWrpMAX6rvgsOA
 qbwPCW6cNEQX80xqHnG9/GV8wb9ZuZiyeHSkp/l+7bBPZd4TbYcA7MVef22+m1vFsh66
 1t1Ov6fM0XrwR14ZGGcnARuqTSsl5Rl7j6PVcqowgIwJx0jUyKc8j5VSQTf6QrlbUFbQ
 LfI9XDQGcBzwcplaTfhojyuv3NrEKgkkI7ceHRm3SA57gXzOptmUbzx9EnmcPsOTGG9u
 AKoQ==
X-Gm-Message-State: APjAAAVv9ncnYCrFPS8XpVVD9qkCmwz4boFw18pJQiWb8+JKPZVQvhhK
 tmDkZOvHXcAt2DWf81mJu26sp4fNjTNInq27Z+Y=
X-Google-Smtp-Source: APXvYqzBeJroxdFku0ZxAcZgl9tc8mc6sC9mL3HZZZMtnEuibKjB+aB56FKg3LDiUTOZt4g+RC/rTOiUNe4tYcKNOVA=
X-Received: by 2002:a81:204:: with SMTP id 4mr14725817ywc.107.1560789280508;
 Mon, 17 Jun 2019 09:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <1560694321-31380-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1560694321-31380-1-git-send-email-linux@roeck-us.net>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 17 Jun 2019 09:34:28 -0700
Message-ID: <CAMo8BfJMUOmF_Py1wtWCKHG=S=ckrq0-K8DFHFmaDr22BUU6QA@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa/PCI: Remove unused variable
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

On Sun, Jun 16, 2019 at 7:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> gcc reports:
>
> arch/xtensa/kernel/pci.c:40:32: warning:
>         'pci_ctrl_tail' defined but not used
>
> which is indeed the case.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/xtensa/kernel/pci.c | 1 -
>  1 file changed, 1 deletion(-)

Applied to my xtensa tree.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
