Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 16F8B1A8FBE
	for <lists+linux-xtensa@lfdr.de>; Wed, 15 Apr 2020 02:34:49 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6D98E6494;
	Wed, 15 Apr 2020 00:21:41 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 7EFDA2625
 for <linux-xtensa@linux-xtensa.org>; Wed, 15 Apr 2020 00:21:39 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u65so750837pfb.4
 for <linux-xtensa@linux-xtensa.org>; Tue, 14 Apr 2020 17:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N8PLrffRHRZmaBeRdVVnG8g26VgGndQrTpxZAgW6KJw=;
 b=GBmQ2qWT1cIuTkbLqewUNV8sjQ7jfUgPOM3uHgldjnaq53bPCiNt7ZKxuTfvhCTGwQ
 DupBmCeOKenjO8vdjhESzN7Ysa6M9lr5GSO/P4hQrXF+lyqwcbVfde6MUyXyc66XS7xL
 DWvmrsZHUp4gR5yO27FvICCeIbjYVJWDS5gfe60VMaHDVGy11Ofyp9dfUmcd8WViPKOU
 Xwiz+JDsM/aA3ajPGzpLRMGt5VVofVh0qJfU26r/QDQ6DUNw1NHgVbFWcekXHvgxOW3T
 v0O3h/dJFBswQg4lWQTmgCw1e6JauHTPG1XelAbulT+RTP7Hz2Q/Xqaeggqqz+cPFTDl
 NDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N8PLrffRHRZmaBeRdVVnG8g26VgGndQrTpxZAgW6KJw=;
 b=nNk02ruUlPjQu5/ARjod3t+Ic8OTQkZ7fN3y5nx3pGpui7vEB40YhUhwykKc0pB41q
 IkWP8gXkPAYlT3hz3gvjrJHtV85a240WQjW3Tzf4V2bNRJFMg+Ushz61pskoat+H5P2c
 GXudAsAtnmuiXfBou1tuOnLmxq0bTeHjOQr/2sF2S5YiwlCu87W6BwCwGkMhWtp1ZCSd
 VvUPvOdwRUYK2rUlkWQ4AfwAkczL6cZx3bFyXuxWIfzjssbBTksct0P/KLm2mfF1lUMQ
 PKopPBYp40UXscAkGYqcEtiK3C/nhQc94uvs9vQyblzsUik1t1Dlaibb8YhcK0SB65L6
 7zYg==
X-Gm-Message-State: AGi0PubemkZVYbA34cV7uB/7DdVlQ3lI6w2Ir3eTSR7D+MhRyg1Mi1yu
 UjiZ5rNaNv53SyZnQYucFCjDP3omK07OzHJYk5s=
X-Google-Smtp-Source: APiQypIe/MCxxh3WPWXPC8px1FM9mi9wrtbSb80Ws+eVJfnHPKHScmVbRK6ZIehHXXWbYxJOhR15Fjrn1aRKx0rj+S8=
X-Received: by 2002:a62:2684:: with SMTP id
 m126mr24253731pfm.153.1586910885510; 
 Tue, 14 Apr 2020 17:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200413233901.2417-1-jcmvbkbc@gmail.com>
 <CAGSvup-epJRkcx9MdHGb_rnE8u87zB-PXE8rW8+GG_-hi2xkAw@mail.gmail.com>
In-Reply-To: <CAGSvup-epJRkcx9MdHGb_rnE8u87zB-PXE8rW8+GG_-hi2xkAw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Apr 2020 17:34:34 -0700
Message-ID: <CAMo8Bf+buKVE0gW-8xpFXJHH9oyZUgZXNRSYC5PceZMNutsZNg@mail.gmail.com>
To: "augustine.sterling@gmail.com" <augustine.sterling@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, GCC Patches <gcc-patches@gcc.gnu.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix PR target/94584
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

On Tue, Apr 14, 2020 at 4:40 PM augustine.sterling@gmail.com
<augustine.sterling@gmail.com> wrote:
>
> On Mon, Apr 13, 2020 at 4:39 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > 2020-04-13  Max Filippov  <jcmvbkbc@gmail.com>
> > gcc/
> >         * config/xtensa/xtensa.md (zero_extendhisi2, zero_extendqisi2)
> >         (extendhisi2_internal): Add %v1 before the load instructions.
> >
> > gcc/testsuite/
> >         * gcc.target/xtensa/pr94584.c: New test.
>
> Approved. Surprised this hasn't been caught before.

Thanks. Applied to master. I'll apply it later to gcc-8 and gcc-9 branches.
I believe that we don't have use cases in linux that rely on memw associated
with volatile memory access, so it's nice to have non-linux user with different
requirements.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
