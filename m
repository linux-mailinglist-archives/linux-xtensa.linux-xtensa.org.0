Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 257671B5220
	for <lists+linux-xtensa@lfdr.de>; Thu, 23 Apr 2020 03:49:48 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7DE1E64B3;
	Thu, 23 Apr 2020 01:36:25 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by linux-xtensa.org (Postfix) with ESMTPS id B90C764B0
 for <linux-xtensa@linux-xtensa.org>; Thu, 23 Apr 2020 01:36:23 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id z6so1692004plk.10
 for <linux-xtensa@linux-xtensa.org>; Wed, 22 Apr 2020 18:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cfmlLl5M9OXmbYwYQ7Q2sjOK4KUbW0e4RO6P4Wnmbls=;
 b=mcG1BpXyHY/uR6t66M+BGO0k62K+it0XO76pmrletqJOPzOFr4S4kaQUo6Nb1mM8qI
 Gr5pdBHMoy3Rvkb8mZZup89Rmb0BXSmyw4VyJrVX/omYd4o/7S2HhlWFtja7UtDR3i+n
 R1XZ6tLeKlt9eha22OMFdXrKt/0m2/Jr+c2LjkNC91WfBfkZo7bBtXdgY5iRjzi7PAm2
 cW6pT+ZL7IpvFoynLsopZ8wvRMqWBccw5wFSukUEXA1wOsVsFsYkLXJ4+r3MJ/5fUI+3
 QdNKC2QBWn9AajS06E74XRZ6MmHOUbvJorzWFQjDh4ik426NuwzzNqFfryUH3M1xmDAt
 xong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cfmlLl5M9OXmbYwYQ7Q2sjOK4KUbW0e4RO6P4Wnmbls=;
 b=tgf9ialTLfEWC0wOPGCFqg6cZEmkpfFv7bMgVYFvC9hlXkkzpKUXnHswV7yFB4txdx
 A3/le1JYLwixqcUOv/x1fM60u5m/lRemu5yH4vnEPWxbVQ3zqAoCrIERcszLyw+iPh+b
 3/1+Tda7ztX7AxFKB5UIsRBj1COZxl+YQCX3ihPuxCB+JJjSXqBrP+/H8S0tlkkd4Q7U
 /uNDdPUhs9iDV57faj2qV8ekEZxMB2+dFWRrm6qKN9BdywfHcEH03SJ86mh0NDuhhSpT
 DUldDysu7f5hT2c4g5chf6V6ElAtzLkhjP4KcrmaYiCXVgOafvyg+GlIcuW/9iZ3jCQg
 fYXA==
X-Gm-Message-State: AGi0PuYvH+8Syh6w7Aohzr3JiSMgLZUVBfN2Roidx8srH7YGiyTHz1xP
 lCOCdqxkeWEFxrGWUTfHaCbBZ5KT4/5eonkYhoc=
X-Google-Smtp-Source: APiQypJZsQt2cTAWyDW+dbqUDLRpMjp6bc1XkFZtt3MfTTImYr+gImTkZiGJq9eByFzMrd344gd+5tO1mJs320Ml7GU=
X-Received: by 2002:a17:902:44d:: with SMTP id
 71mr1603926ple.123.1587606583615; 
 Wed, 22 Apr 2020 18:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200421101309.19304-1-jcmvbkbc@gmail.com>
 <CAGSvup8qG+co1WsMnd+Wnph4HsrehJ4ig0Sx8nOHfA61A1viug@mail.gmail.com>
In-Reply-To: <CAGSvup8qG+co1WsMnd+Wnph4HsrehJ4ig0Sx8nOHfA61A1viug@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 22 Apr 2020 18:49:32 -0700
Message-ID: <CAMo8BfJtybGYDsE0iw3BDUZX=0eiE=9Q3xCrjde+Xrx8cwBgpw@mail.gmail.com>
To: "augustine.sterling@gmail.com" <augustine.sterling@gmail.com>
Cc: Eric Tsai <erictsai@cadence.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, Binutils <binutils@sourceware.org>
Subject: Re: [Linux-Xtensa] [PATCH] xtensa: fix PR ld/25861
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

On Wed, Apr 22, 2020 at 5:15 PM augustine.sterling@gmail.com
<augustine.sterling@gmail.com> wrote:
> On Tue, Apr 21, 2020 at 3:13 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > 2020-04-21  Max Filippov  <jcmvbkbc@gmail.com>
> > bfd/
> >         * bfd-in2.h: Regenerated.
> >         * elf32-xtensa.c (elf_howto_table): New entries for
> >         R_XTENSA_PDIFF{8,16,32} and R_XTENSA_NDIFF{8,16,32}.
> >         (elf_xtensa_reloc_type_lookup, elf_xtensa_do_reloc)
> >         (relax_section): Add cases for R_XTENSA_PDIFF{8,16,32} and
> >         R_XTENSA_NDIFF{8,16,32}.
> >         * libbfd.h (bfd_reloc_code_real_names): Add names for
> >         BFD_RELOC_XTENSA_PDIFF{8,16,32} and
> >         BFD_RELOC_XTENSA_NDIFF{8,16,32}.
> >         * reloc.c: Add documentation for BFD_RELOC_XTENSA_PDIFF{8,16,32}
> >         and BFD_RELOC_XTENSA_NDIFF{8,16,32}.
> >
> > binutils/
> >         * readelf.c (is_none_reloc): Recognize
> >         BFD_RELOC_XTENSA_PDIFF{8,16,32} and
> >         BFD_RELOC_XTENSA_NDIFF{8,16,32}.
> >
> > gas/
> >         * config/tc-xtensa.c (md_apply_fix): Replace
> >         BFD_RELOC_XTENSA_DIFF{8,16,32} generation with
> >         BFD_RELOC_XTENSA_PDIFF{8,16,32} and
> >         BFD_RELOC_XTENSA_NDIFF{8,16,32} generation.
> >         * testsuite/gas/xtensa/loc.d: Replace BFD_RELOC_XTENSA_DIFF16
> >         with BFD_RELOC_XTENSA_PDIFF16 in the expected output.
> >
> > include/
> >         * elf/xtensa.h (elf_xtensa_reloc_type): New entries for
> >         R_XTENSA_PDIFF{8,16,32} and R_XTENSA_NDIFF{8,16,32}.
> >
> > ld/
> >         * testsuite/ld-xtensa/relax-loc.d: New test definition.
> >         * testsuite/ld-xtensa/relax-loc.s: New test source.
> >         * testsuite/ld-xtensa/xtensa.exp (relax-loc): New test.
>
> This is ok.

Thanks, applied to master.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
