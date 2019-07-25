Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 77D75742B3
	for <lists+linux-xtensa@lfdr.de>; Thu, 25 Jul 2019 02:50:39 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 7B55264BC;
	Thu, 25 Jul 2019 00:46:08 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by linux-xtensa.org (Postfix) with ESMTPS id CCBAC64B8
 for <linux-xtensa@linux-xtensa.org>; Thu, 25 Jul 2019 00:46:05 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id s19so33221710lfb.9
 for <linux-xtensa@linux-xtensa.org>; Wed, 24 Jul 2019 17:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mCd7vGjPKVt9fXDd0rS7L2SXnPX/wqltrVI5UWXsS40=;
 b=ZLHWza0snOAbw3v0S+yxjGrQ2FRsKxYAnKKmguNO1s1i2gn6D2O2Q0Nz6VJAs4Efme
 W/VdiLntOlDHhorIf3tvmVUPhyWhSZFUM/t9e7qgoO+rLivp39H+MwAU5FUJ5N32KUr3
 LyMfKjfd4G+glN/wzdyp3NdUAlSW4kzU5rpjDLF7WUFfudsa/PAoPySk6pZeXRz3GzjU
 P80nZPC0/qvuzNvjAFjLcFPZerBhaDXEUUhrNjefbxcXL+CK4L2O5Y9Vfo2LjKA1Bh1y
 +Ksu5iLRJZgio85x5dKyqQ610581eR8/sZTz1wopUCqpugzjYt73bYiagD6XPhlJBxrj
 ePNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mCd7vGjPKVt9fXDd0rS7L2SXnPX/wqltrVI5UWXsS40=;
 b=pb7h/7EtotWkSlKO2m635BsJQymGC5Z0tdMHnYQkRNfIEwDbjccYNFswEYuXHCJakR
 1xoZrRiVOdnlkythiPk+5IBqysJXk2P7IAv9Bn0hsbvU8FZ1l/Rx0UDYiuLaZ66aB+A/
 iE1nDQjbfjvzKql8D7ElvadSxxzBRp4Dj0SMKRFi1TeObziJ8yeR8mbld0ypChSKlF+9
 3FfDjmG0B0ftoeesz5Q9dAyJ8GR2s68Zd34UO0T3U7mHobRluV8zrCnlZIYJ4jqo8twA
 MfWXqDv/96wPXlpYAFJkNTSiPty9YVpD0MP1WiGmaiuwK5QC87ZixbuMYCBWxVneUwjs
 W+0A==
X-Gm-Message-State: APjAAAUBaeLSrUhQX6dmCSXPagjPrhDRYLDXxI2u9ZjLknK2539UkD0l
 9659fOT0MFqUoe1IhkWk+BLcwUrDUK0=
X-Google-Smtp-Source: APXvYqzSm893L0oehWLZI2wa2M+v062+va0jZ+6/9iuAVd+12h+6zRrXnsYN86WfdO7qXcv/EJUaqg==
X-Received: by 2002:a19:a83:: with SMTP id 125mr18636295lfk.150.1564015834189; 
 Wed, 24 Jul 2019 17:50:34 -0700 (PDT)
Received: from octofox.lan1 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net.
 [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id q1sm8816748ljb.87.2019.07.24.17.50.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 17:50:33 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Wed, 24 Jul 2019 17:50:02 -0700
Message-Id: <20190725005002.5008-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix build for cores with coprocessors
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

Assembly entry/return abstraction change didn't add asmmacro.h include
statement to coprocessor.S, resulting in references to undefined macros
abi_entry and abi_ret on cores that define XTENSA_HAVE_COPROCESSORS.
Fix that by including asm/asmmacro.h from the coprocessor.S.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/kernel/coprocessor.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/kernel/coprocessor.S b/arch/xtensa/kernel/coprocessor.S
index 60c220020054..80828b95a51f 100644
--- a/arch/xtensa/kernel/coprocessor.S
+++ b/arch/xtensa/kernel/coprocessor.S
@@ -14,6 +14,7 @@
 
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
+#include <asm/asmmacro.h>
 #include <asm/processor.h>
 #include <asm/coprocessor.h>
 #include <asm/thread_info.h>
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
