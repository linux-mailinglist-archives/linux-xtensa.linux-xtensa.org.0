Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8312820E21
	for <lists+linux-xtensa@lfdr.de>; Thu, 16 May 2019 19:41:59 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 75EA36508;
	Thu, 16 May 2019 17:39:55 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 1708B6465
 for <linux-xtensa@linux-xtensa.org>; Thu, 16 May 2019 17:39:55 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id j10so1587720ybh.0
 for <linux-xtensa@linux-xtensa.org>; Thu, 16 May 2019 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=EqTZL0r6DY/5q6ydACax+6Gz3Dbt5eOWkNZvrOKhBes=;
 b=AcWuU/KzE0wmfIjeXrZM1mLabXuchpY0cULtvXjU+P2K/KA4dmqcE1ejIHqL2XsgtH
 7RamOchLQZSxiOAxBlHTnMyp/yabW8CBLUxi7gXbN9mGrJ9EA5Z91WK/ngWrsUT/cNxT
 zqjaA7WWxuTfAdryUFlBtLchQ9SIz1zhoInnzr3E9G2cJAJXX4h/t+fGAPDscmMsbD61
 eVjGqV9D1rwgWzUrnKFoYsGxj90Ezj0YpP/JJJy1hG7U5d+VU25YAgBLs0IGXNVV239S
 6ZtwipnehHIDND1QnJu9rwqFRGDRrQX4IEmULUJMbVSXfAhGx/y/sDRCtLtYhOMK7xB2
 YZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=EqTZL0r6DY/5q6ydACax+6Gz3Dbt5eOWkNZvrOKhBes=;
 b=JFOSNf7kiTTQJ2qC5koOrI/p243ZHgJ4euxOT3GBx+OgHJXi2Gy01BkMNWOi7TdfNh
 6GUwxIjojrgk8foZOqfTdx9rRy+8vnc8doTxLQdISeoGIZqbtDdab4Rt6OKbeeLIsZNw
 f0SDzMZT4iGqeyjowVLvxpWeJrO/tGt7kWFJ38/uYyzuGlIQm8xnNmaZ8LxqtHdDP31z
 lKuVrcqINnazaqP2ZPmYw0V8AnBnUNdBIiGCCWnLLj7R3nWxKDb8PUji3qH5eJpfhIy/
 mbFvZ3+LEhTC+TqWOGbe+zbTqomteNfsTGa8Q8ac8oa3pE23BEy+tl7P6lpmAfrt6/Pj
 +f7Q==
X-Gm-Message-State: APjAAAXe1YkBPTaIZKvAKyWJ4LV57FcBGPfOrh2eSGXmWPi92hzLV5qK
 loZhLwQ3QCRpJNL9fVDu/oa2EhU0fCZFa0j6n58=
X-Google-Smtp-Source: APXvYqySrJe5LrOlmSmg1tcisNunQ7NikqFKRbiPuxLCfxkdHVrG8D6DfS4je3vZIx7ZSQDaBSi8dAyH1BnX/dPkeJ4=
X-Received: by 2002:a25:bb42:: with SMTP id b2mr15201082ybk.405.1558028517708; 
 Thu, 16 May 2019 10:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190514172822.8408-1-jcmvbkbc@gmail.com>
 <mpty337crww.fsf@arm.com>
In-Reply-To: <mpty337crww.fsf@arm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 16 May 2019 10:41:46 -0700
Message-ID: <CAMo8BfJX4qbikWZyBzeZDU5pO71bZAPY9qtQtTFFFKUC48ML9g@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>, gcc-patches@gcc.gnu.org, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 Sterling Augustine <augustine.sterling@gmail.com>, Jeff Law <law@redhat.com>,
 richard.sandiford@arm.com
Subject: Re: [Linux-Xtensa] [PATCH] gcc: move assemble_start_function /
 assemble_end_function to output_mi_thunk
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

On Wed, May 15, 2019 at 2:46 PM Richard Sandiford
<richard.sandiford@arm.com> wrote:
>
> Max Filippov <jcmvbkbc@gmail.com> writes:
> > Let backends call assemble_start_function after they have generated
> > thunk function body so that a constant pool could be output if it is
> > required. This may help backends to avoid implementing custom constant
> > loading code specifically for the MI thunk and reuse existing
> > functionality.
> >
> > gcc/
> > 2019-01-08  Max Filippov  <jcmvbkbc@gmail.com>
> >
> >       * cgraphunit.c (cgraph_node::expand_thunk): Remove
> >       assemble_start_function and assemble_end_function calls.
> >       * config/alpha/alpha.c (alpha_output_mi_thunk_osf): Call
> >       assemble_start_function and assemble_end_function.
> >       * config/arc/arc.c (arc_output_mi_thunk): Likewise.
> >       * config/arm/arm.c (arm_output_mi_thunk): Likewise.
> >       * config/bfin/bfin.c (bfin_output_mi_thunk): Likewise.
> >       * config/c6x/c6x.c (c6x_output_mi_thunk): Likewise.
> >       * config/cris/cris.c (cris_asm_output_mi_thunk): Likewise.
> >       * config/csky/csky.c (csky_output_mi_thunk): Likewise.
> >       * config/epiphany/epiphany.c (epiphany_output_mi_thunk): Likewise.
> >       * config/frv/frv.c (frv_asm_output_mi_thunk): Likewise.
> >       * config/i386/i386.c (x86_output_mi_thunk): Likewise.
> >       * config/ia64/ia64.c (ia64_output_mi_thunk): Likewise.
> >       * config/m68k/m68k.c (m68k_output_mi_thunk): Likewise.
> >       * config/microblaze/microblaze.c (microblaze_asm_output_mi_thunk):
> >       Likewise.
> >       * config/mips/mips.c (mips_output_mi_thunk): Likewise.
> >       * config/mmix/mmix.c (mmix_asm_output_mi_thunk): Likewise.
> >       * config/mn10300/mn10300.c (mn10300_asm_output_mi_thunk): Likewise.
> >       * config/nds32/nds32.c (nds32_asm_output_mi_thunk): Likewise.
> >       * config/nios2/nios2.c (nios2_asm_output_mi_thunk): Likewise.
> >       * config/or1k/or1k.c (or1k_output_mi_thunk): Likewise.
> >       * config/pa/pa.c (pa_asm_output_mi_thunk): Likewise.
> >       * config/riscv/riscv.c (riscv_output_mi_thunk): Likewise.
> >       * config/rs6000/rs6000.c (rs6000_output_mi_thunk): Likewise.
> >       * config/s390/s390.c (s390_output_mi_thunk): Likewise.
> >       * config/sh/sh.c (sh_output_mi_thunk): Likewise.
> >       * config/sparc/sparc.c (sparc_output_mi_thunk): Likewise.
> >       * config/spu/spu.c (spu_output_mi_thunk): Likewise.
> >       * config/stormy16/stormy16.c (xstormy16_asm_output_mi_thunk):
> >       Likewise.
> >       * config/tilegx/tilegx.c (tilegx_output_mi_thunk): Likewise.
> >       * config/tilepro/tilepro.c (tilepro_asm_output_mi_thunk): Likewise.
> >       * config/vax/vax.c (vax_output_mi_thunk): Likewise.
>
> OK, thanks.  The new placement of assemble_start_function after
> shorten_branches certainly makes more conceptual sense than what
> we had before.

Thanks. Applied to trunk.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
