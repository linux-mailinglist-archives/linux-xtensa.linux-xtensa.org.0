Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 81D74F2145
	for <lists+linux-xtensa@lfdr.de>; Wed,  6 Nov 2019 23:00:28 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 2D20357EC;
	Wed,  6 Nov 2019 21:52:19 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 by linux-xtensa.org (Postfix) with ESMTPS id 7B91352E8
 for <linux-xtensa@linux-xtensa.org>; Wed,  6 Nov 2019 21:52:17 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id g77so10152633ywb.10
 for <linux-xtensa@linux-xtensa.org>; Wed, 06 Nov 2019 14:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y3o8l4teeUkfXISUOAxa3pHTPdubgp1E+n1um6h/pcQ=;
 b=i8V+RCk5wjwjk4V7CqTktL4fgprLf7fter8Klj1wmtmhT6ZzFVA3VSByZDeiRYTgbr
 NlRfKzfKPQKlHt1L7m8v9K69wLeeMyt4n+odUwkCO4aQuhVEeGPmOk2ToCCQjZJEz3ty
 q7f39mpXnkWwrudtzI6UwZF67uE+uz4qh1JHieAXKsY4E2jbHoIIeME7Db4X/mkbW11u
 4wclqG9ZAygVS76IsNI2qy0rVnZUL2bnGIait6aCLDmlR+05HUUk8D8XKgy9mMp83IpE
 6mtWGWF1BdaggdI+ErUxNyNos6SuO47L6wA6kpj6+BYOQxb8WBgje8G4owlrnTPZ9Hb7
 ET+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y3o8l4teeUkfXISUOAxa3pHTPdubgp1E+n1um6h/pcQ=;
 b=IAQm1tQy+sSIu9PKOV1NsF+vMjXKFHYRM7J/I0KT3gUml9kKFCVjlsgBo3KNb9FVIf
 XWiu2fnpfOFTIjZbQlPgH+gQddczSIhmsWAF/7zfClwhSKdavIkJS2A3+J/Tom/ypcA2
 GonwLU14YJR8jxW6nMhJUjmSaNoi1n7AAU10U6FtkLs6iQq5YcxbQgnHLIA8KVTK3Ug3
 Q68dj/zertsy924xJx6f9nKS25UpoF33ho0V+kcJSWfKAFgLzJNyaZQ9kMqydE+gcvFx
 W4NjNlZUav9qyt3AayapP1hKDYfb2ZU6TpkOBq/xAnw9whFBIZ/KNiDdW0f420ZHNpG3
 tbWw==
X-Gm-Message-State: APjAAAW6ez1w8zlTbwHnG/NbyQnAnZGQya14UbWwfK3QQa1GtFyxpO3x
 0uX/oYvmlttc3noCkXa/m3a1Jm8ZK5pfb6XrLM8=
X-Google-Smtp-Source: APXvYqwhSW4L/fYgzPgdulTlAxNTbtMgQz8G23pFy0SAB60EVDMdfVK5Ou8MKAf+7aKLxqFrNuCj0bKQuvIBAaVbxig=
X-Received: by 2002:a81:5b43:: with SMTP id p64mr3367068ywb.234.1573077625667; 
 Wed, 06 Nov 2019 14:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20191106181617.1832-1-jcmvbkbc@gmail.com>
 <27720768-9fb7-0382-e1ef-ac9760cdf5cc@arista.com>
In-Reply-To: <27720768-9fb7-0382-e1ef-ac9760cdf5cc@arista.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 6 Nov 2019 14:00:14 -0800
Message-ID: <CAMo8BfLDk_ztsG0eSFgd2+hW9-MqrOKmPn0kSvCeq3uBGXapHg@mail.gmail.com>
To: Dmitry Safonov <dima@arista.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>,
 Petr Mladek <pmladek@suse.com>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: improve stack dumping
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

On Wed, Nov 6, 2019 at 12:51 PM Dmitry Safonov <dima@arista.com> wrote:
> On 11/6/19 6:16 PM, Max Filippov wrote:
> > @@ -512,10 +510,12 @@ void show_stack(struct task_struct *task, unsigned long *sp)
> >       for (i = 0; i < kstack_depth_to_print; i++) {
> >               if (kstack_end(sp))
> >                       break;
> > -             pr_cont(" %08lx", *sp++);
> > +             sprintf(buf + (i % 8) * 9, " %08lx", *sp++);
>
> buf is on the stack, does sprintf() put null-terminator for hex?

It should put null-terminator regardless of the format string.

> >               if (i % 8 == 7)
> > -                     pr_cont("\n");
> > +                     pr_info("%s\n", buf);
> >       }
> > +     if (i % 8)
> > +             pr_info("%s\n", buf);
>
> If the stack trace ends with (i % 8 == 7), you'll double-print the last
> line?

No, I don't think so. 'For' loop condition is checked after i++, so if
loop ends with i % 8 == 7 then its last iteration was done with
i % 8 == 6 and thus the buf haven't been printed.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
