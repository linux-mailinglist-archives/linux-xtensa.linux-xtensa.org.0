Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7FCECD05
	for <lists+linux-xtensa@lfdr.de>; Sat,  2 Nov 2019 04:19:02 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 91A25262A;
	Sat,  2 Nov 2019 03:11:01 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-yw1-f46.google.com (mail-yw1-f46.google.com
 [209.85.161.46])
 by linux-xtensa.org (Postfix) with ESMTPS id B3370261F
 for <linux-xtensa@linux-xtensa.org>; Sat,  2 Nov 2019 03:10:59 +0000 (UTC)
Received: by mail-yw1-f46.google.com with SMTP id d5so4627899ywk.9
 for <linux-xtensa@linux-xtensa.org>; Fri, 01 Nov 2019 20:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWouDuNtV+RDhaAG30q6oLZ0sfsZSnJ7v4vmZnTcjfA=;
 b=tXNpvQIThdErkOxKdvwj4upuqkPgYohpmkUu8+ubSCRSDZsgOa6TPjMItnAvpXvUJT
 9i3ap+UQryAGvMqftcy4AaLLA2v7rKcvLnaPATPpIuhp3HCV1rGvKQ84WgLXT+V3FEoZ
 zqrHfE6bPGyyMiGbl8NpOiX5YBBvItB/XRBEaGZT6bXf9Lf9f7u5nvdoAIBU3yrdTt5x
 m0q4KLg2IwXci6N7WMmQhK+Bevor+cz6bbpNhyJiBqIRDz6RR0gDR6UDeo/z7mNzz+B1
 FxTZ6R2SzRx27FVYXtPeDWDuVBvsl8RgBXLZdzSnH/PJT/NX706H9yE84cxwySCrfEOu
 Nq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWouDuNtV+RDhaAG30q6oLZ0sfsZSnJ7v4vmZnTcjfA=;
 b=mJsub30hG0DWSv61QynwYF/wuPzwEN/Eg5UbCt+rOEtHG2yPoLKI6xh+1aJyZDPF4D
 A/uSCYuyKeRaq26zAwC+15Jt9IhZX5IOT2X2oLmHw94RlbIskp6sKBLzFd+Wu1dfkXaJ
 MlCJKLUUmKG8lku6/AsKPg2Mz/EHMUF4yAocv16NzL4zGGbvE70DJ8+SA65Y74yxnBfE
 kMu48t5MmopBcvFvm8W97dgh8GvO3VcAjvmXJStolb4d4IEeaNP+WxsWpTu90iJ/ydia
 TywXTQpMITvBWnqWt04mn/4W6xDKMOYQkdF+tRwDrlclz03Nm72boUJfQaBZzogmC5pc
 PqPQ==
X-Gm-Message-State: APjAAAXyq/RXL74Ls30uYf8hQBlxvVIbjpwBxAzULlHndFfpR/mfFsew
 kPX8vxPkhv/iSEJaUC9vheXhpMPvpbUHEh+tvEs=
X-Google-Smtp-Source: APXvYqz/vTyRv8Cpfcdwo79Mp38OZJMIk2+jn6NdV2t3BSMT5HGMV3seK5LqTkdWhhHRJUcCR4QF5FjPqFgbRY6jRJs=
X-Received: by 2002:a81:5b43:: with SMTP id p64mr11250421ywb.234.1572664739036; 
 Fri, 01 Nov 2019 20:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191101220213.28949-1-hch@lst.de>
In-Reply-To: <20191101220213.28949-1-hch@lst.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 1 Nov 2019 20:18:49 -0700
Message-ID: <CAMo8Bf+ctQN405SLVAHmycFx7uQuUixE_cqm1idAV8ZrPkoZQg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux-foundation.org,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>
Subject: Re: [Linux-Xtensa] switch xtensa over to the generic DMA remap /
	uncached segment code
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

On Fri, Nov 1, 2019 at 3:02 PM Christoph Hellwig <hch@lst.de> wrote:
> this series switches over xtensa to use the generic DMA remap and
> uncached code.  Xtensa is a little special because it uses an uncached
> segment by default, but can still use page table bits for remapping
> highmem.  To facilitate that there is some major refactoring in the
> common DMA code that merges the remapping code into the main direct
> mapping alloc / free routines.

For the whole series:
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
For the xtensa bits:
Tested-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
