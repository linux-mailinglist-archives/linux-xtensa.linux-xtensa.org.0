Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A69F61C1080
	for <lists+linux-xtensa@lfdr.de>; Fri,  1 May 2020 11:50:41 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5FC0764A6;
	Fri,  1 May 2020 09:37:03 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 7C82E647D
 for <linux-xtensa@linux-xtensa.org>; Fri,  1 May 2020 09:37:01 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 18so1392161pfv.8
 for <linux-xtensa@linux-xtensa.org>; Fri, 01 May 2020 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LSN/uXLfkt9QeDBMNRjLOHKj5ObcWSm4DpZ/UNYnR+s=;
 b=mRAIwwXYuvw012YcKxlesqHwYppo4C/8KTWbbVLbRqmzEU9DZVsDICONE4NG6JgNKU
 PWBfSkxawaq+lu9QZLv+t60NLjd/A5+M4OD3+GqC4sOE2+LpNzONWIBKHjtKa/YAnrya
 yFboZ7hjvfhktEBDEheqMgu4IWMmLdGy16IuGSAFmTxoDJK8M7jrpTmj/VuQFZXmKi+D
 dIvU/Jy8Ey1PEIfuZfyM+iB6tKdUINzZ7C4ZD9Gj6cKtHsZARCL79TDama4ziN9WYacn
 eBcs3+VYQDTX+AU5IXTUJyV+C1bLPDj+WdYgYnZb8/rHN7JyRNxM7bAAqKFkCaJ0BYLm
 dNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LSN/uXLfkt9QeDBMNRjLOHKj5ObcWSm4DpZ/UNYnR+s=;
 b=D2s9B2zP8K65vCYdB40xXB5zHW6+PcMI62YdYTAIKEHvOFZHP97ibs+NcvwI51UvOm
 bXI9ccNI2+v5JZtn33uhvapDL1DChHWb+j9W5J2Jf13p2uaBruK5lpZ8q6maq4DSC2r9
 rtps0sXKt1fOFhiLU8AIZwwCR+CP758WzUzsc70DvFHeQhG9bfMmKij5YK8lK1cALSZ1
 Q48TInsokmtbUga1Y0OUffQdb/qOfAR2A4wHwGc5r7ZBVyMSMiGIT8j1NYyCOIm57mep
 /comIo4Q5SwyetNDgh17/M8uLT1A/gJA5KY8oxlTkUUQoq5SBPK3JmJJaRdm3o8+smou
 pGFw==
X-Gm-Message-State: AGi0PuaBsjNN09qPbqmfXDaNGRv3p/U3gJBLdUCQoCRRfAW+yUkJOv4v
 ildL89jW5CtzDWcXhxJHQhseCfrPDDaIyUkl9no=
X-Google-Smtp-Source: APiQypLnhT57tLSV4RshVGa2uDo12bLGVyRHB51uzZVNE32LSc2WXh3Vopse607pRrP4bNpqHqj8youmiiYHAiyFXV0=
X-Received: by 2002:a63:b549:: with SMTP id u9mr3346778pgo.159.1588326637995; 
 Fri, 01 May 2020 02:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200501084634.GH27858@infradead.org>
 <CAMo8Bf+Mvvg_f1-33iQhTqZPVw1civX94KS2mf4uSkcpEVx55Q@mail.gmail.com>
 <20200501091933.GA3084@infradead.org>
In-Reply-To: <20200501091933.GA3084@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 May 2020 02:50:27 -0700
Message-ID: <CAMo8BfKYii4=_rQK22x4F4n-59KYY9JHKQ6E3H5iJ-N3J63rwg@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, ira.weiny@intel.com,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] xtensa question,
	was Re: [PATCH V1 00/10] Remove duplicated kmap code
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

On Fri, May 1, 2020 at 2:19 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, May 01, 2020 at 02:02:19AM -0700, Max Filippov wrote:
> > Hi Christoph,
> >
> > On Fri, May 1, 2020 at 1:46 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > any idea why xtensa uses PAGE_KERNEL_EXEC instead of PAGE_KERNEL
> > > for kmap_prot?  Mapping all mapped highmem as executable seems rather
> > > dangerous.
> >
> > I sure do: to allow instruction cache flushing when writing to high user
> > pages temporarily mapped with kmap. Instruction cache management
> > opcodes that operate on virtual addresses would raise an exception if
> > the address is not executable.
>
> Seems like this should use kmap_atomic_prot with PAGE_KERNEL_EXEC just
> for that case.  Which of course didn't exist on xtensa so far, but with
> this series will.

Yeah, except it's the __access_remote_vm that does the kmap and then
calls copy_to_user_page...

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
