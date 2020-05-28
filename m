Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id E1BB31E5337
	for <lists+linux-xtensa@lfdr.de>; Thu, 28 May 2020 03:43:45 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id A8D96643C;
	Thu, 28 May 2020 01:29:16 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 748615877
 for <linux-xtensa@linux-xtensa.org>; Thu, 28 May 2020 01:29:14 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s69so2367473pjb.4
 for <linux-xtensa@linux-xtensa.org>; Wed, 27 May 2020 18:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2U8UTwGAxk64h+amzFuvXrtcFOEcXjy1XXR081U0VOs=;
 b=Rs/kIL17GhCLRn/G5HyymnXSptf9ytPCMCflIev7niZ2WPm3Lqq9NSy/ppG7lU9gLn
 SP7IpfG20GWdr30CGyxqWfGxOz/KgyDdqwUOBx4mS35wulP0O+jEg2h1Ays3FnV10Dcx
 ckpzUQfoJJGRNOL6Zb0OdAkZQbwgoWEzFCygswhcyoDcJdF8iJf8PWsYL1BWBP/OH7Ay
 g29spXEpE0jjrKpjJhPvlb69JG+/Dj9pMzIVBMt1cBPBXoEWPNymHig5wo8vmYwo/03z
 Q9IXQAcW8/Lp2wYFwFmVQsSvqfHpoycswMQuCpKfyEYqH4RmAzfTZhb94nSBG33kgcIH
 Ek7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2U8UTwGAxk64h+amzFuvXrtcFOEcXjy1XXR081U0VOs=;
 b=H0/y98gt56eVHPtbWW4NFlcl4ula3fvhk5e70A8b7V0KmJDSWZpzeNMitmlCxwXWZg
 lOR8qOjtPBmb872U1jmvXvz2lAcCAYodnHyewYywhUY44iKOYC2/Ypumsxh2WzQxibO6
 14JzuREZKA0PM2vP4S43RINjj9nMEykAZLeQ4K/T1ZA0k2fYbGpgp1lgkRkSNRJ4kgSt
 UZTr+TH/t18ZSkmfSPDdXMdBGLcKSEiKyAzvzI9pc1hjAJ+NHBXsSJgYNb6waEmi6W4T
 a+CGEkJCO/k0/sJtBGaqegJsnRlOhqNJV1LyDgcuSVAaZV2q8eh0ocK8+R6c9nCG81AQ
 dI+Q==
X-Gm-Message-State: AOAM533SzU2X85i1vvox0oQ/B1bRharkLEFXTqGRwLi/xRXx1UWbtZJS
 A3ZvRJvc2Z1BPckP68S4z/pDIFpuAabVU94fsIo=
X-Google-Smtp-Source: ABdhPJx/riEI05Fca4/bkWEtQk6+hrvc91pS+SN79IpJA81uouDX/SzhQD8uc5NSnD22wiWD7YNkybZ/SPtSAqtFDVw=
X-Received: by 2002:a17:90a:bf08:: with SMTP id
 c8mr1238190pjs.13.1590630221620; 
 Wed, 27 May 2020 18:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200526184337.19874-1-jcmvbkbc@gmail.com>
 <CAGSvup9Z4zHyym6eT4NPLxTK3kC_SMCGg4PbK0c=w3Z-6KN01g@mail.gmail.com>
In-Reply-To: <CAGSvup9Z4zHyym6eT4NPLxTK3kC_SMCGg4PbK0c=w3Z-6KN01g@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 27 May 2020 18:43:30 -0700
Message-ID: <CAMo8BfKyutsPwZ5PRQN-J-_yFwz1pYxFkbRuT=9iuPpcPkVRWA@mail.gmail.com>
To: "augustine.sterling@gmail.com" <augustine.sterling@gmail.com>
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, GCC Patches <gcc-patches@gcc.gnu.org>
Subject: Re: [Linux-Xtensa] [PATCH] gcc: xtensa: delegitimize UNSPEC_PLT
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

On Wed, May 27, 2020 at 4:35 PM augustine.sterling@gmail.com
<augustine.sterling@gmail.com> wrote:
>
> On Tue, May 26, 2020 at 11:43 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> >
> > This fixes 'non-delegitimized UNSPEC 3 found in variable location' notes
> > issued when building libraries which interferes with running tests.
> >
> > 2020-05-24  Max Filippov  <jcmvbkbc@gmail.com>
> > gcc/
> >         * config/xtensa/xtensa.c (xtensa_delegitimize_address): New
> >         function.
> >         (TARGET_DELEGITIMIZE_ADDRESS): New macro.
>
> This is OK.

Thanks, applied to master.

-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
