Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 247EE1DF15E
	for <lists+linux-xtensa@lfdr.de>; Fri, 22 May 2020 23:42:20 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 6AAA064F0;
	Fri, 22 May 2020 21:27:58 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 792AC648E
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 21:27:56 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n11so5600921pgl.9
 for <linux-xtensa@linux-xtensa.org>; Fri, 22 May 2020 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OiuX+6uU7dplATziC7RpCrG4th92FcbfoR1QRsJspzA=;
 b=S36MNoi9Vry7VUvzuC8akd9HrlW9CvNONK1CvQg7TBeWxwpnNipFYwhP6hQrLnQfoA
 CYrzz2dqjcmPtjcBHtjb0/xG5BGlMdBGvUzpEg+4yLqk9ZXdToZo/VaHkwv2Hd2TKylM
 4Wri/Ogai8IhhgWSY8IPo+p3jXoyYd8tesdZMlGdDrTOjak3nuO5RPVHD2h54/v8lYcf
 TRQB/TYrVALBLE7wz5g0PZqr9nk8+CVzTs5CeTkXd0Sm0Jd5N6to4Rh9ud7V7RJrlauh
 fSveQ6PFrtDmozzQ6PTo9w6lNfpVyQu6cO5lrLO7iMXaPKUlKR0NrzFlhPjWja4qEFzX
 FdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OiuX+6uU7dplATziC7RpCrG4th92FcbfoR1QRsJspzA=;
 b=Tlogz13RmQXBHrQ48XOPELgNZDqc8EhJv2V65ZHbRBbvPs599NhVtoOWyVkNLU0W9R
 MiZtw/uUHJ7rzL4UTKyto1yAdox27oMx4qHMELH8U6gjr9c1o9i/c0UaoVcQttHyJ56W
 AQCO3mxvfBF0JZIfg4AGZ6Q1/RMwteQd4MMp9U93380iFRPwbhjrnVjxCiQhBz/9sKqy
 zTCCSV25jND0XqRyGhOEtIkwqsQf9tFqIqYud+73Xway+U6JiWdQaHHnMdF087ANPFJU
 r36i282+0Ao+iJhbm9XAPn2XlKJftQp63OXPS6BaZOjItSd8c//Fa5YSvoPqdispxmfK
 aD6g==
X-Gm-Message-State: AOAM531lMdzB6h3/ZDNRAUMPR+eZXD0oEEOVI6zj3dw3nrVGqxYVQ++v
 uIzZQ4jlD6zAoKFJIXuQr9WhQFby
X-Google-Smtp-Source: ABdhPJyncLF4FCA7MiLj+vo/jkNd/ZatPEi5dWPqOWL3ATw7UCNgkD4lWnaoI6Lgu1u3K2/xS89hcw==
X-Received: by 2002:a63:3756:: with SMTP id g22mr15416483pgn.304.1590183733064; 
 Fri, 22 May 2020 14:42:13 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:d0d2:96ff:22ac:b8e6])
 by smtp.gmail.com with ESMTPSA id 4sm7625098pff.18.2020.05.22.14.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 14:42:12 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 22 May 2020 14:41:50 -0700
Message-Id: <20200522214153.30163-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH 0/3] xtensa: clean up __user annotations in
	asm/uaccess.h
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

this series adds missing __user annotations to functions in
asm/uaccess.h. It fixes a bunch of sparse warnings for otherwise correct
code.

Max Filippov (3):
  xtensa: add missing __user annotations to __{get,put}_user_check
  xtensa: fix type conversion in __get_user_size
  xtensa: add missing __user annotations to asm/uaccess.h

 arch/xtensa/include/asm/uaccess.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
