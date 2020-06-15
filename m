Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B09A41F94CF
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Jun 2020 12:44:28 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 389B9586C;
	Mon, 15 Jun 2020 10:29:22 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by linux-xtensa.org (Postfix) with ESMTPS id B54395825
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 10:29:19 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id u128so553536pgu.13
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 03:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMEiQCELlUSWEZg8ZnFSQmd9il4ELkUDpOFqD0zDwsQ=;
 b=JKqV8K51iBhm+a92fWX2kpTtOzknr3BtKY8Sho4oFtnLg9hIdihr2HpH6SDVTzti5p
 EeYFN4SQKiSxW0kjxOXhPJDkUWJWnVZyjfgPmq8u6AIL4fAGX5qHlJGwgqap1ew5DkSk
 RpV7O7I06yYAELG/RaZZAzacgTagItUI0R72cVzOFdy6vs0D+xggmnBauWrcj21Lr9hX
 oJzv1kgez1CnaPqV0C+TzDapeVqhVo3rRwAaTHCT4N90+Vu65jYg2UQcLS+GEaybNVoV
 hYkyfkQsBkWHcUvIG1K/Im3rHNBFl54XBQ4KlNmyXKbAlCS5k5X6ctfFbxNTVFiiKIcF
 e2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMEiQCELlUSWEZg8ZnFSQmd9il4ELkUDpOFqD0zDwsQ=;
 b=EUy4iwNmBCkrSazbDqeYgXPDZ1vOpMkJlVg+1SdbBk/Rwk2+Ie2W0eiFIdGv/cr4Yr
 ixQO43qMlvH5fbWn197127SZ/w0ZGpOoBEu/EA+ZJhIPOGjb0PsqcDQeRhvaSrLm7wmc
 GOCgItbctq/fuboAQariVfMWbfYWX9kgbIOy+uFhh/X5CiTQ/WDRRSl/nqUj2Fr/qbee
 F0uUJlUbVaO0V9lgp2wSoWLwKlv7hNHkpqTYFjszfWYxhuXjlEXrN+hqRv6hGrqsJXyr
 2F/TegAxzPZRM33/QYPi8x0Xc/f2onMnTMmlDQMZNeRg5TlntJk4jpFhcucPQsbkH29N
 aC2Q==
X-Gm-Message-State: AOAM533HuZZuqLLTA1As4cQRmArQf2Y30HFWzHk9R+FDRAuzU0lXDmi9
 7IkrhjGswxUDI0XySNLuhxdSYAhN
X-Google-Smtp-Source: ABdhPJwClLRzOatGlB8RgN3e+UtJD/eIS8xq31Zyln7rk96E4HhLLOELUD+ghAsu18llX2fVe1/rQA==
X-Received: by 2002:aa7:9edc:: with SMTP id r28mr21894647pfq.139.1592217864527; 
 Mon, 15 Jun 2020 03:44:24 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id q65sm13974474pfc.155.2020.06.15.03.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 03:44:24 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Mon, 15 Jun 2020 03:44:05 -0700
Message-Id: <20200615104407.28521-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [COMMITTED 0/2] gcc: xtensa: implement -mabi option
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

Hello,

this series implements -mabi option support for xtensa target allowing
to choose between windowed and call0 code generation.

Tested with xtensa-linux-uclibc, both windowed and call0, no new
regression failures. Committed to master.

Max Filippov (2):
  gcc: xtensa: make register elimination data static
  gcc: xtensa: add -mabi option for call0/windowed ABI

 gcc/config/xtensa/elf.h                       |  8 +++--
 gcc/config/xtensa/linux.h                     |  8 +++--
 gcc/config/xtensa/uclinux.h                   |  9 ++++--
 gcc/config/xtensa/xtensa.c                    | 19 ++++++++++++
 gcc/config/xtensa/xtensa.h                    | 29 +++++++++++++------
 gcc/config/xtensa/xtensa.opt                  | 11 +++++++
 gcc/doc/invoke.texi                           | 26 ++++++++++++++++-
 gcc/testsuite/gcc.target/xtensa/mabi-call0.c  | 13 +++++++++
 .../gcc.target/xtensa/mabi-windowed.c         | 13 +++++++++
 libgcc/configure                              | 24 +++++++--------
 libgcc/configure.ac                           | 14 ++++-----
 11 files changed, 137 insertions(+), 37 deletions(-)
 create mode 100644 gcc/testsuite/gcc.target/xtensa/mabi-call0.c
 create mode 100644 gcc/testsuite/gcc.target/xtensa/mabi-windowed.c

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
