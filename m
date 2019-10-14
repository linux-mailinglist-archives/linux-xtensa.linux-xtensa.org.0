Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 20518D5C90
	for <lists+linux-xtensa@lfdr.de>; Mon, 14 Oct 2019 09:41:21 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id D916764E0;
	Mon, 14 Oct 2019 07:33:57 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 85A0864D4
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 07:33:55 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id n11so5800655ywn.6
 for <linux-xtensa@linux-xtensa.org>; Mon, 14 Oct 2019 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sEN7o3yuO56xvPDuUwKgUiAGNAgWvdh9IYFyMwir9eg=;
 b=ULg0x+kVwo2eT+iIl7xEqgOGbAzw68nEs+Tf1EX6WbkwD6JZiL1PJq9RZFvkDJEthU
 ocfdC+Pu3HU8yKboyYft824CwBNxjIEzx8zyCCvt9khKX2P3rnlv1B/RrEDuwgE/1mG/
 dO9bqvuIwHg7kYFJ6cR8Rxh98z5xxnACgBkXR6UU0aSIjsvAx7CLSTrvS1W1Yc6B2hbM
 xVKkvAsHm4h5LvwOcL7O3xZNwPSbX/1EH8Ha7BFbRmH59L7FLoc17rAHr/p/fi2/0aQd
 XhR8EuPvAa5rR0cGHGbuZEBAsY6jzipW6b/VsB7pAItTeOGbyHWLGnGRGwAir0skqH6K
 QqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sEN7o3yuO56xvPDuUwKgUiAGNAgWvdh9IYFyMwir9eg=;
 b=JYb3UnVj2tYwNN7iILa/sbHEAcNkK903bK1DviwcDey3YOJ+MgTUCVFEnIsjFbCDNv
 caZo4fLs7vneXb0My6guHrESJU/OCZG7zS0WFsodjti5yNY7Ttn+a77rU01B0qFdHYmY
 +oaAe8ujg/Nh8TIghun88Vxjm+OQ6TDht0xJaqtce9eiFa+TTS9Z+CNDC9i+PfqrgOvM
 M/s4wIoVUX5HIRW0DwfgoLfD0zhv2CyyazHl6/jcbH/WzYInOA1XCI85fTrXhadS+WzN
 YQfoofPyTLi6LivHXCJvBdgQed5vyQ6O/08WMW4+jU1y7B7kwEU3xMR+KVFQdDDI+g5+
 eQ+w==
X-Gm-Message-State: APjAAAVlQOq5AM6z3arX8ivyHSTeMRpIshi78aQARfAkeLj+VivuH7w5
 fTRLPthF/c4BQbvnWl0l/BBLBcdt0s0vHvPCj24=
X-Google-Smtp-Source: APXvYqw4VB+FAxVRs0lcX+ZIr7P8ykk483BJkOe9a1ta9sipUpx8Dmb1cwz7VKpxf94e6Vopzx6wAvxttFQCwsQ1L0I=
X-Received: by 2002:a81:254d:: with SMTP id l74mr12130385ywl.409.1571038877410; 
 Mon, 14 Oct 2019 00:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-26-keescook@chromium.org>
In-Reply-To: <20191011000609.29728-26-keescook@chromium.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 14 Oct 2019 00:41:06 -0700
Message-ID: <CAMo8BfKexMmMusB3XOeaMOZHdU4ccz+PMGA=Jy+KQhgD8H_8UQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Borislav Petkov <bp@alien8.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-Xtensa] [PATCH v2 25/29] xtensa: Move EXCEPTION_TABLE to
	RO_DATA segment
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

On Thu, Oct 10, 2019 at 5:16 PM Kees Cook <keescook@chromium.org> wrote:
>
> Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/xtensa/kernel/vmlinux.lds.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
