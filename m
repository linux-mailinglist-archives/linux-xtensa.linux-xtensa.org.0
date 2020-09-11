Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B0191266948
	for <lists+linux-xtensa@lfdr.de>; Fri, 11 Sep 2020 21:59:14 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 8BF214847;
	Fri, 11 Sep 2020 19:40:56 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 1CDDE2631
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Sep 2020 19:40:52 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c8so11337876edv.5
 for <linux-xtensa@linux-xtensa.org>; Fri, 11 Sep 2020 12:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2fvDataPFDcqtRjmyzwIGz+W24egsQT7RsA21OM+aw=;
 b=HUNvSNOCsAYMaMX6zn28qYgInmlDzu+yDJ7owLavD6xitvNjd6zk8e4l9dv0y3dMK4
 t5cBve4IXwgxailATJEBiqKerVMOGOvTBwH4Eu0y4D5JGUA12kVENN/Rm0bZbVi4PzBf
 /sLSP9NqN6Vr673cNVgytfCc5OePhjFxDZ1JQlTcPh/mjMU8fKpdS/2oYkQUdGW3oQQI
 prbGOOURjVSRMQXivNb/plEk4P5GZ/XXLHTDj/OkZzx5Be8z473wsDRJzopin+MnicXI
 oxv7Nm8BUBDBU3NYUbnJ6qUSxCjSGai+I1olA1qqRQ5C7jTzIjiJ36/tlGp6irXjbj33
 XF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2fvDataPFDcqtRjmyzwIGz+W24egsQT7RsA21OM+aw=;
 b=ESfEnG+4lR50CjENk2gix8HW999KfcoA2YVWOhkNOe+wHNDSM6ychVOC0Yj4+JMzF/
 qk5lASPDhgtNnqmOJkQ24+WxqkjTYKsRFesAyoxt6r8SC+LwOzZftzYytiNEEFGY4tXm
 ZNgz60q4Ox8IEdruVeXLvnx1awg9CLLi+vKurz2Q2/F2hb9u+1lFzXPT8ADEwGrdpNpa
 7JzUc4b7qRi6Lox0MapJm6WjydDFbpcOzEKIgRiscCblaszbeJCLoXdkvISbB7/kUgzJ
 bM9Q9HFV6/RrCQN6B3mT8nvJWRVvlmqUdynPNAM61uj5iXUtXPFQ2eY+1fV+mAeoqlqS
 3ACg==
X-Gm-Message-State: AOAM532bBW5jNaNOkSQsZHawgHNIIl7eykKQauZr/r1eBNQoWw1bMLTB
 Hg6lkPfULJHiPEx7gcEqx3ndS3ienoqG+oZHyXM=
X-Google-Smtp-Source: ABdhPJwTXXgJ/g+/XHWAyZTrQ3F0tE6i12N0C82M8zOxAL/IjsufylXhuRysYAjE1y/YpRKS8qx2oJQIPMSpawJWxJI=
X-Received: by 2002:a50:9355:: with SMTP id n21mr4015157eda.237.1599854348113; 
 Fri, 11 Sep 2020 12:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200719021654.25922-1-jcmvbkbc@gmail.com>
 <202009111229.4A853F0@keescook>
In-Reply-To: <202009111229.4A853F0@keescook>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 11 Sep 2020 12:58:56 -0700
Message-ID: <CAMo8Bf+r3YvWewdHzg=Y4mFspYLA3GrJ04rry90deYsWN_gZRA@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org
Subject: Re: [Linux-Xtensa] [PATCH 0/3] xtensa: add seccomp support
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

On Fri, Sep 11, 2020 at 12:38 PM Kees Cook <keescook@chromium.org> wrote:
> On Sat, Jul 18, 2020 at 07:16:51PM -0700, Max Filippov wrote:
> > Hello,
> >
> > this series adds support for seccomp filter on xtensa and updates
> > selftests/seccomp.
>
> Hi!
>
> Firstly, thanks for adding seccomp support! :) I would, however, ask
> that you CC maintainers on these kinds of changes for feedback. I was
> surprised to find the changes in the seccomp selftests today in Linus's
> tree. I didn't seem to get CCed on this series, even though
> get_maintainers shows this:
>
> $ ./scripts/get_maintainer.pl 0001-selftests-seccomp-add-xtensa-support.mbox
> Kees Cook <keescook@chromium.org> (supporter:SECURE COMPUTING)
> Andy Lutomirski <luto@amacapital.net> (reviewer:SECURE COMPUTING)
> Will Drewry <wad@chromium.org> (reviewer:SECURE COMPUTING)
> Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
> ...

Sorry about that. Looks like I've filtered out too much of the cc: list.
I'll fix my workflow.

> Regardless, I'm still glad to have more arch support! :) I'll send a
> follow-up patch to refactor a bit of the selftest.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
