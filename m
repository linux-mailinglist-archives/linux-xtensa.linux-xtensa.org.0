Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DFE4A23F87B
	for <lists+linux-xtensa@lfdr.de>; Sat,  8 Aug 2020 20:37:37 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 67A224242;
	Sat,  8 Aug 2020 18:20:34 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by linux-xtensa.org (Postfix) with ESMTPS id 82C143A8A
 for <linux-xtensa@linux-xtensa.org>; Sat,  8 Aug 2020 18:20:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a79so2881572pfa.8
 for <linux-xtensa@linux-xtensa.org>; Sat, 08 Aug 2020 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E2HEcTXnQvxfyOU/9ep7TLdb0ZWR8Mv/2sU679c6wow=;
 b=hreHI/4z4gnMY2MsrUHeUlwsPkiZWg5h72Fy63z5HJTURdX0b/EDfhyL+3V/iECZL0
 8EWb5a1vq2nZkIrjs6zbBVrKHymnm1f3YH9DSPB7jcWuXbgc1eABRjVRr6PulL5u32+Z
 XtKD9YNv4/h+bwVMbFCqtfavMWn5tMZwrYgKpBBjLPlR8Iv3tAAmo4I8W7io6rfZnpJG
 7z1FqihIxrtRPdvmHFnQPpXcvbFOE+KHk5nNmruZeHxP88/0eeTjpTPdT3L/0Q3coDUY
 er+FJi7aOvW2r/DKmWGhUCzMVGuv4Il/ApdihfubGbjPn6DyNKIjqVk2y4PDeFZ1VPlS
 LCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E2HEcTXnQvxfyOU/9ep7TLdb0ZWR8Mv/2sU679c6wow=;
 b=XDAVsG/B3DbHYf4Kda44fVz9LV4a2eYuowbC/xzMAOsTVQARadY9jTmOmJLJ9du3Jw
 nqP6oU/M5wLJ/91mSfcSZEnNjPKPdFWOilfZKiDr3+6qCOZ9j8P8f1GJwxla3iR1+Qta
 4Wd3RPWWSKHO9/7DPhWE+H7S1ZhLpIW3P7xYUns2oz5n+bcLjadzZsnx3aaNvdDksprI
 8alBN81nRHBDh6fDajV5GDgnCBAs3uGjsEeJSJxYLQi++ubI5+UZMGNzpSQh8rLbBSlJ
 Qxb1kgIhWuY+IgPCKNf7IdrJ3CpGpJrCJCIuWtaLtK82uI/Mzo9w6cdXvfbJdDDJu/W8
 cCIg==
X-Gm-Message-State: AOAM530Kmb3W2N6LgWPVll9AdeQV0totsxiHXckCrNd/BgMSlgkaBUoe
 rsq9ghtAM+zI6AMqOE9E0msDYJ20
X-Google-Smtp-Source: ABdhPJz3FrHRgj5GwEumJjVbaMn5fGL88iRBUP3Q9C6cKXPRZ/gU+kCYqJLXbfdmfUDrLxLU24vqtQ==
X-Received: by 2002:a65:58c4:: with SMTP id e4mr15939810pgu.108.1596911853996; 
 Sat, 08 Aug 2020 11:37:33 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id q2sm17066767pff.107.2020.08.08.11.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 11:37:33 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Sat,  8 Aug 2020 11:37:13 -0700
Message-Id: <20200808183713.12425-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Greg Ungerer <gerg@linux-m68k.org>
Subject: [Linux-Xtensa] [PATCH] binfmt_flat: revert "binfmt_flat: don't
	offset the data start"
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

binfmt_flat loader uses the gap between text and data to store data
segment pointers for the libraries. Even in the absence of shared
libraries it stores at least one pointer to the executable's own data
segment. Text and data can go back to back in the flat binary image and
without offsetting data segment last few instructions in the text
segment may get corrupted by the data segment pointer.

Fix it by reverting commit a2357223c50a ("binfmt_flat: don't offset the
data start").

Cc: stable@vger.kernel.org
Fixes: a2357223c50a ("binfmt_flat: don't offset the data start")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 fs/binfmt_flat.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
index f2f9086ebe98..b9c658e0548e 100644
--- a/fs/binfmt_flat.c
+++ b/fs/binfmt_flat.c
@@ -576,7 +576,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 			goto err;
 		}
 
-		len = data_len + extra;
+		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
 		len = PAGE_ALIGN(len);
 		realdatastart = vm_mmap(NULL, 0, len,
 			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
@@ -590,7 +590,9 @@ static int load_flat_file(struct linux_binprm *bprm,
 			vm_munmap(textpos, text_len);
 			goto err;
 		}
-		datapos = ALIGN(realdatastart, FLAT_DATA_ALIGN);
+		datapos = ALIGN(realdatastart +
+				MAX_SHARED_LIBS * sizeof(unsigned long),
+				FLAT_DATA_ALIGN);
 
 		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
 			 data_len + bss_len + stack_len, datapos);
@@ -620,7 +622,7 @@ static int load_flat_file(struct linux_binprm *bprm,
 		memp_size = len;
 	} else {
 
-		len = text_len + data_len + extra;
+		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
 		len = PAGE_ALIGN(len);
 		textpos = vm_mmap(NULL, 0, len,
 			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
@@ -635,7 +637,9 @@ static int load_flat_file(struct linux_binprm *bprm,
 		}
 
 		realdatastart = textpos + ntohl(hdr->data_start);
-		datapos = ALIGN(realdatastart, FLAT_DATA_ALIGN);
+		datapos = ALIGN(realdatastart +
+				MAX_SHARED_LIBS * sizeof(u32),
+				FLAT_DATA_ALIGN);
 
 		reloc = (__be32 __user *)
 			(datapos + (ntohl(hdr->reloc_start) - text_len));
@@ -652,9 +656,8 @@ static int load_flat_file(struct linux_binprm *bprm,
 					 (text_len + full_data
 						  - sizeof(struct flat_hdr)),
 					 0);
-			if (datapos != realdatastart)
-				memmove((void *)datapos, (void *)realdatastart,
-						full_data);
+			memmove((void *) datapos, (void *) realdatastart,
+					full_data);
 #else
 			/*
 			 * This is used on MMU systems mainly for testing.
@@ -710,7 +713,8 @@ static int load_flat_file(struct linux_binprm *bprm,
 		if (IS_ERR_VALUE(result)) {
 			ret = result;
 			pr_err("Unable to read code+data+bss, errno %d\n", ret);
-			vm_munmap(textpos, text_len + data_len + extra);
+			vm_munmap(textpos, text_len + data_len + extra +
+				MAX_SHARED_LIBS * sizeof(u32));
 			goto err;
 		}
 	}
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
