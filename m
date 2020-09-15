Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id C448A26A3EE
	for <lists+linux-xtensa@lfdr.de>; Tue, 15 Sep 2020 13:12:40 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 689EF64A0;
	Tue, 15 Sep 2020 10:54:15 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 21FB35801
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Sep 2020 10:54:13 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id q13so4409269ejo.9
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Sep 2020 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B4bOYSHsWHocnYArElpYthybN5SxC006LAFmz/36FHU=;
 b=Z/MAEsVTEnQKv9yb0HSOEZbJscLkrEI2KA6jePSwMg1TwHWUG2zmL/K+AbtjHO6/2o
 aIcnbhckWr6rgCmNGSrXn/T9XMsHZZKm/PsdMekg45hebYJEoEh6DtSQc6AwPL0FexMQ
 QEcy40U+GKpucQlCREx876BJYFzTaICPrYW4syFH6C95NZecWVgDFi7ziO/VvX17lotJ
 DDZY+9PHfKcooxB486MYcbnHky26yYukszeQjs76Kwm/6X3Co9rV5HLW0BzJkHQ4SNlQ
 948TjdNG8+d8rKLvuzJokO+1T8T3AZzYmxIxeK7CMSgHmOVQw0cHLexkCCkg+JNIGJLn
 Ny/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4bOYSHsWHocnYArElpYthybN5SxC006LAFmz/36FHU=;
 b=ODO8+GNZG1UWyZWZ4p4XbCzAqKZOftyhIFcyhFrePydcFgDVCJFMt/36+pD4tXVIer
 nMbblMJXPfw2pjbuuc705hyq1N8CRBKwxQa/3HSwBo8bw/1CpdOSurZf1kQgD6o4KzKz
 mWCNr5DKSDXG+YQamcZ4ODwP5qBQLR4rJ8mT+Bq4nKzp8Oxhdbadmf1TjP/LfoPPbp+y
 MhYl6+MXJndxS3MqxPYAEvy2yE7+s6Ry78O9JiZHHySbq0/BNW9+FZjuPn/XplTYlnUu
 tPaQD8IrJBLHpqkMEIbq+oIZxyVk8EZ/W+YO+DsJaqfOp4kFn/Y2HVnGsA1fwcpPkhN/
 utTA==
X-Gm-Message-State: AOAM530ZixAobS5+4fDZHq69StlemXSyDc6AMp+KKGPCTaMvMih7b365
 TreNTbnko4ewX4FNc/OlDhN3DQFS0/XeLWZLYJE=
X-Google-Smtp-Source: ABdhPJwPU+9ZWIwNO56zgtgygOIdmPreND4z7Ge5DlUnTt0Tfg9IxfvCSMJOXmsXBV/ZabpWxbhtETys6v+wayV6BRQ=
X-Received: by 2002:a17:906:30c5:: with SMTP id
 b5mr19838526ejb.98.1600168356388; 
 Tue, 15 Sep 2020 04:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200912110820.597135-1-keescook@chromium.org>
 <87wo0wpnah.fsf@mpe.ellerman.id.au> <202009141321.366935EF52@keescook>
In-Reply-To: <202009141321.366935EF52@keescook>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 15 Sep 2020 04:12:24 -0700
Message-ID: <CAMo8BfK0Jcmt4EJ1R2d_4Hp9siSRrBsgaNDqCVjcQ0GK8XBGZA@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Subject: Re: [Linux-Xtensa] [PATCH 00/15] selftests/seccomp: Refactor
	change_syscall()
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

On Mon, Sep 14, 2020 at 1:32 PM Kees Cook <keescook@chromium.org> wrote:
> On Mon, Sep 14, 2020 at 10:15:18PM +1000, Michael Ellerman wrote:
> > Kees Cook <keescook@chromium.org> writes:
> However...
>
> >
> > cheers
> >
> >
> > ./seccomp_bpf
> > TAP version 13
> > 1..86
> > # Starting 86 tests from 7 test cases.
> > #  RUN           global.kcmp ...
> > #            OK  global.kcmp
> > ok 1 global.kcmp
> > [...]
> > #  RUN           global.KILL_thread ...
> > TAP version 13
> > 1..86
> > # Starting 86 tests from 7 test cases.
>
> Was this a mis-paste, or has something very very bad happened here in
> global.KILL_one_arg_six finishes?

I observe similar output corruption on xtensa when I redirect test output
into a file or pipe it to 'cat'. When it goes to the terminal it looks normal.

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
