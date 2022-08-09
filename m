Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 04E1D592943
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Aug 2022 08:07:06 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id D09D47F7D;
	Mon, 15 Aug 2022 05:25:18 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by linux-xtensa.org (Postfix) with ESMTPS id 78CA21CCB0
 for <linux-xtensa@linux-xtensa.org>; Tue,  9 Aug 2022 00:54:40 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id d8so3166988qkk.1
 for <linux-xtensa@linux-xtensa.org>; Mon, 08 Aug 2022 18:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zankel-net.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=U1EbaR6kPCEiIPBM9eNKKoEMFcobaMGqJgg92j0iihE=;
 b=MnOspVty1Dkgkk2aFzpdzbNp8lSlF7mBf6Fxgg+4CmEvU4KeA1qe4oOoWJ07dzQEyU
 6Ef6q5VHHcRZq67n4+a/tUG/zQzx4MRzUytM04HW9NPNOzZDhcOlzY1ThH6Lmcde0VK1
 elMYIIFumCXt5CN/V2rOLrz+bkgeHXHxnz8GZ3PUBjs0ZJB5+0+ytdSAEsvEMqU88Qr7
 Po2fUYNuXrp7XR2UDSlfk0hwjk6MrQbK2bo+IMegZ8Gyj8vwt3ER6hSHA85KugSoQhz7
 yRyTo2tfQzZctXMVkqbLIcn4Y6a9UHZYhtYk6YLknaR+41Pd3KILkiul4svm5PcQjZcp
 DnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=U1EbaR6kPCEiIPBM9eNKKoEMFcobaMGqJgg92j0iihE=;
 b=Qk/TpkCENNMuVDB+JW1tT9+F0NFRCfmWdgmp9cgjALiP4nc00y1rggar4CZiLXZqHM
 cwIQZ1TfIuO9zRtCpAe4G7DaAAzjcrDTkmeWMdzQCO1cveqCgP3CHLv+zvYNUWL8VwiG
 i0uQJivhSsGt628Wgu+mUasA5n5fPJqdjiOcQFPWzacQizgEgx4ZWDjUTFGDgkmFUKeM
 ZF8K4JYkPlzvfb466ueudmWPEPN7DvsdnSEOPms4ZBEnzBaHpwi+A+D3kTMBr/Ryhzq/
 lU64hBVhIYyiMv8lOCEf8Jq171iuCeMYtLXKvxIenAtJmwU7xhVRBFQEu5G0L6C9FTsS
 XvOw==
X-Gm-Message-State: ACgBeo1Rdx+ZCEdlsCLC/B0rx7L6ulB1l69Y7riTxWqq/5rhmeI5S01L
 7FpTqXT0JqPyrf+5YZaFaQLJqPbVLlUfzKPDEsSQ54AaYLCDgw==
X-Google-Smtp-Source: AA6agR7mFzXtiTIxXKYUrECNtNGddGm5QCrWlOyBFpRtWvTxWSi25Bf1a93rwJ5sHvqyXop5uIaDkLfmxPAtjV+2nhk=
X-Received: by 2002:a05:620a:f13:b0:6b5:b956:c1f1 with SMTP id
 v19-20020a05620a0f1300b006b5b956c1f1mr16216716qkl.691.1660008972763; Mon, 08
 Aug 2022 18:36:12 -0700 (PDT)
MIME-Version: 1.0
From: Chris Zankel <chris@zankel.net>
Date: Mon, 8 Aug 2022 18:36:02 -0700
Message-ID: <CAP6Y9+81UvTrRfkJLogwvq2gCNYTmsLrYX5SmXCcM6YrpDce+g@mail.gmail.com>
To: linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] Test EMail
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
Content-Type: multipart/mixed; boundary="===============5411756074058937309=="
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

--===============5411756074058937309==
Content-Type: multipart/alternative; boundary="0000000000002559a305e5c4f566"

--0000000000002559a305e5c4f566
Content-Type: text/plain; charset="UTF-8"

Please ignore.

--0000000000002559a305e5c4f566
Content-Type: text/html; charset="UTF-8"

<div dir="auto">Please ignore.</div>

--0000000000002559a305e5c4f566--

--===============5411756074058937309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa

--===============5411756074058937309==--
