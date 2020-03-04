Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 293DB178895
	for <lists+linux-xtensa@lfdr.de>; Wed,  4 Mar 2020 03:42:08 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id D7ADB655E;
	Wed,  4 Mar 2020 02:30:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by linux-xtensa.org (Postfix) with ESMTPS id 653406556
 for <linux-xtensa@linux-xtensa.org>; Wed,  4 Mar 2020 02:30:17 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id s8so235013pjq.0
 for <linux-xtensa@linux-xtensa.org>; Tue, 03 Mar 2020 18:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0gnzUT6IfMkAevkPG6epW/0WW8fFX/S7HOzubTrdA+s=;
 b=nVFh8gi7N77XyRa+b63fYk+I0vUvemTDtUd5kSi2V/DAsh0HIkXMm2G7QPnEknsEuU
 AewvPoJmlX3zPpdVnF4UNBM8bDjV10nYjpEasiLm92k/I15EiIPdpx2mhwfGesyJL4hh
 iTSJpf28PySMw9AyfGfppFxfEGhZ7DTFC7OqvLogUEuPKs2GLHFTKw7/thmBLWxZIPXA
 hb7PfokEpMBXDZoPkg4qxFo35/LDVDwXJP6jwLFha8GyuFZOQLim2pdfTlvadRePhDWY
 U6ZKW8gzvamzf86U3vO8jmVHyZzvMzaajP+qu8FdDSQdj/QRHzGayCRDY7Fzl6o625fp
 +C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0gnzUT6IfMkAevkPG6epW/0WW8fFX/S7HOzubTrdA+s=;
 b=khKjVijt4T2VmmdVupH5V5vmmgdI8FxKx2GTAJWzh7BoQcLrLfpKlhuwhesRHZ/O+L
 6jKshla+XsjVvPbTsUm49Kg3pwjI13BJX0stVQNtdoBhO78oxuGNFzySvf/WjDznmDlw
 Hx0rD6ISk69dLBdyBuMgPoffKzQ4VSufsqeDlZY+FUFaBJ6Dhbk/ZFCim82rNyUL8YB2
 av5jBcxigMzfX8iS830YIBo+s/Zan9viLcrLSHIDKFfzJxDaZhr4RA1bMlkSKOwoYHDd
 0cQzthhpLUaP+mvFa/cC4eWV4YZXTs6ID5F5KcHC06+gGNxBBd4rYfIXB2TzX/+DosVd
 lXKg==
X-Gm-Message-State: ANhLgQ2bdLFP59BKloPEXvJAEyIyGVnIHx2fcLFQbBdgiQE6FAyBQZmp
 SAEFK591pU3UX8+GvfecvRiSnYuSBpdzp4a7tzs=
X-Google-Smtp-Source: ADFU+vvsJSXksvOHwF2Z5jx7XbZeF5IkgdGQtpqkIcGOMQXX3UZJiunOWG6yBfioCy+TibzaTkQ9lN+XnNK7gz4UjNQ=
X-Received: by 2002:a17:90a:d205:: with SMTP id o5mr699361pju.46.1583289725111; 
 Tue, 03 Mar 2020 18:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20200304004112.3848-1-afzal.mohd.ma@gmail.com>
In-Reply-To: <20200304004112.3848-1-afzal.mohd.ma@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 3 Mar 2020 18:41:53 -0800
Message-ID: <CAMo8BfLxQ_zmTSPS1En7BxCXORKh3wBK2KnKoUBDFVgOufuEGQ@mail.gmail.com>
To: afzal mohammed <afzal.mohd.ma@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-Xtensa] [PATCH v3] xtensa: replace setup_irq() by
	request_irq()
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

On Tue, Mar 3, 2020 at 4:41 PM afzal mohammed <afzal.mohd.ma@gmail.com> wrote:
>
> request_irq() is preferred over setup_irq(). Invocations of setup_irq()
> occur after memory allocators are ready.
>
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
>
> Hence replace setup_irq() by request_irq().
>
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
>
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
> ---
> Hi Max Filippov,
>
> i believe you are the maintainer of xtensa, if you are okay w/ this change,
> please consider taking it thr' your tree, else please let me know.

Sure. Applied to my xtensa tree.

--
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
