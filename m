Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 73E7134AF5C
	for <lists+linux-xtensa@lfdr.de>; Fri, 26 Mar 2021 20:31:58 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 32D1E52C9;
	Fri, 26 Mar 2021 19:07:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by linux-xtensa.org (Postfix) with ESMTPS id 275F54264
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 19:07:16 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f10so5274759pgl.9
 for <linux-xtensa@linux-xtensa.org>; Fri, 26 Mar 2021 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5y4wrxyxaQbz2q52vNwehIEYnHf9nDITQlvj4U6GzGU=;
 b=KNeFUcGH6ynyK/I5cDYOwaA7AFBqlhTHFC/F6YAVNrY1ctngEm6TyxY4RfczcdmL1D
 BqCGN2BWY+Wj8G9dZbyMjX5X5nc221ASn7OC7xD1FCuO66r8BJ0XacL8hSpT47vU+thN
 5RtG+L2mI426nSsSE6mumL/B979em8FBaQf1bG7CbLkNBcCaVS11OZx0q+LSC8Dxb9SH
 ordZe6AmQnh8YYDED7ugAF6puzcoEa9wvH0PgydBSRKMcuvzFJsOeifpdBcgbZzhWLxn
 6xknOrAr+HMgflZaBmngy3kxnJaT7uUoUjLAtxfUDYJUg+4ShxEntMEgCrpui8ZXkcj2
 4t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5y4wrxyxaQbz2q52vNwehIEYnHf9nDITQlvj4U6GzGU=;
 b=rfHy/Gov6ZnkgoIHJ3pifpWt+J+QvaDyZVP7MmJgd3GUVAO1TeWx8uhYLnsmEdEhVb
 llRYYchCn0kmiiBq4j6xWczzQwzBcYoaHOxSEb07nnrORT3oSnTZGSeprlB5te28jdLB
 ecb1a4oBg0GI2hM1AYNdHo0ZTfPn4PNhYvZbYVe7DBKt6jhzYulnZxsGihbqD+7TBm+i
 tWZS01I2UNp1xuumCKrjRXKdCW7/1HPBM8lRcMJqev9ujpaxhMd+DjRygx4kbe8gnrVO
 fdzXXNBYMu8XfDwagCrNkHRfltVPBgI/oepYVHLwzRVkMHmAkkxsWE+lgzXK7nmdFHdL
 qP3Q==
X-Gm-Message-State: AOAM533Zw0Z+/zP+0fl9LjUTg/71J4kGdLhsV33anX0HsqKXwKncomlS
 ZTVV2U/EdQCGY+XJY/oko574UD1q7mM=
X-Google-Smtp-Source: ABdhPJxQU5pDeMpZPb16W8XI/PtKmWycv3J/AOTFb84Yme1HRFGiuykBtcdBea8vw2M7vel/hCfZ6A==
X-Received: by 2002:aa7:9521:0:b029:1f1:b27f:1a43 with SMTP id
 c1-20020aa795210000b02901f1b27f1a43mr14388370pfp.4.1616787114363; 
 Fri, 26 Mar 2021 12:31:54 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id q10sm9086789pgs.44.2021.03.26.12.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 12:31:53 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 26 Mar 2021 12:31:41 -0700
Message-Id: <20210326193143.21016-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 0/2] xtensa: add GDBIO implementation to
	semihosting interface
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

this series adds GDBIO implementation to the semihosting interface and
makes it a configuration time choice. GDBIO interface is useful for
development hardware platforms that don't offer any peripherals and only
accessible via JTAG. xtensa kernel built for ISS may be run on such
platforms using GDBIO implementation of the semihosting interface.

Max Filippov (2):
  xtensa: ISS: split simcall implementation from semihosting interface
  xtensa: ISS: add GDBIO implementation to semihosting interface

 arch/xtensa/Kconfig                           |  22 ++++
 .../iss/include/platform/simcall-gdbio.h      |  34 ++++++
 .../iss/include/platform/simcall-iss.h        |  73 ++++++++++++
 .../platforms/iss/include/platform/simcall.h  | 104 +++++++-----------
 4 files changed, 166 insertions(+), 67 deletions(-)
 create mode 100644 arch/xtensa/platforms/iss/include/platform/simcall-gdbio.h
 create mode 100644 arch/xtensa/platforms/iss/include/platform/simcall-iss.h

-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
