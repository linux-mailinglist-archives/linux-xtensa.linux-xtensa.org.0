Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2711E17B9
	for <lists+linux-xtensa@lfdr.de>; Tue, 26 May 2020 00:16:19 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 142626548;
	Mon, 25 May 2020 22:01:54 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by linux-xtensa.org (Postfix) with ESMTPS id D0C176541
 for <linux-xtensa@linux-xtensa.org>; Mon, 25 May 2020 22:01:52 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id n15so391358pjt.4
 for <linux-xtensa@linux-xtensa.org>; Mon, 25 May 2020 15:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSpEFVbG8JUdSrBIflNKicdqqYEQz8d5l9KuD7qZZcM=;
 b=O3y125lYcfZznF8AdnHsBuu/pezAvAh4K/OW3m8ETYoqnVQqxBeNIYO5FvhJmamZKE
 483QrLedr8lgEJr5C7+miL2JM8u5iyi1FB6qb949HD5ZZM5yF+Um7SkUE+82nlHfkRR0
 4R+vASNN8jyTIZGeNmSy+nIz8otmu1TA7pMCiRRUglkZJoSfNSUKcrgZRVZbrPZPq0tZ
 V1KjfzJDc0CmyQ1NyoNwuDTJZXWZwSWKdEoYu6eSRwaqnO7EJwLtzyUH7jCMNvFzjGj1
 AU7RIOb1zFoRY4h2IygAuvvQQkEilsyBHcQrCd2JhGh9Gl6m19tw96kHWe2KJtMR6zJq
 +eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSpEFVbG8JUdSrBIflNKicdqqYEQz8d5l9KuD7qZZcM=;
 b=Cw0KJiulCKL2bqIeBObOxtq7Kja83ESOqqrutMVHJIZsZuhiqYa4taS1WEa4rcukAq
 VLzgoP9ardVZ4wpovV6JT4ExJ6/luJd4ljvdLYWpKG45bkdAWH78BwqNsu4Xjxss/QYf
 lbugqrO/oYhtJkuVCN5RX9T9R9OkFjTpFIRIJlWTNRrOJ35KAvTvHI1ZrxPWza6TtRFl
 Xo1xg6xrrq8O/1q+EynmfWMKtNbgluiyqqJvnnbBCG5IZ3DEgfgoQFQsg2TwcH0jzkTl
 J4gq++IkxhiVCsP/W1NWMOw1/+tRCk/bvs5cr3jp4t2Y1yQr39zKsLEsGylgGPNsh1ld
 34hw==
X-Gm-Message-State: AOAM530CCiSrJkwwfWwumKdU71NsvaUxe87YLfM8X0OLjKakLHI4z7wN
 sAXvpnJaWKPnQQfZF47jZ58ut+BP
X-Google-Smtp-Source: ABdhPJzQ3P0vqWJRY6AQI6xSDmGSBZjsIw41fa3CVPrEXXshOerRfEW4ULTGkJlQo+SAqILMhumhhA==
X-Received: by 2002:a17:90a:bf92:: with SMTP id
 d18mr9741928pjs.120.1590444975572; 
 Mon, 25 May 2020 15:16:15 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id z13sm14160865pfj.153.2020.05.25.15.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 15:16:15 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Mon, 25 May 2020 15:15:56 -0700
Message-Id: <20200525221556.4270-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Subject: [Linux-Xtensa] [PATCH] xtensa: fix flush_icache_user_range in noMMU
	configs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

Zmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgZGVmaW5pdGlvbiBmb3IgeHRlbnNhIGlzIHBsYWNlZCB1
bmRlcgpwcmVwcm9jZXNzb3IgY29uZGl0aW9uIHRoYXQgaXMgbm90IHByb2Nlc3NlZCBpbiBub01N
VSBjb25maWd1cmF0aW9ucywKcmVzdWx0aW5nIGluIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3Jz
OgoKICBmcy9leGVjLmM6MTA2NTozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24KICDigJhmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZeKAmQogIGZzL2JpbmZtdF9mbGF0LmM6
ODU3OjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbgogIOKAmGZsdXNo
X2ljYWNoZV91c2VyX3Jhbmdl4oCZCgpNb3ZlIGRlZmluaXRpb24gb3V0c2lkZSBjb25kaXRpb25h
bCBjb21waWxhdGlvbiBibG9jay4KCkZpeGVzOiAxMzRkOTZkMDVkMzAgKCJ4dGVuc2E6IGltcGxl
bWVudCBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSIpClNpZ25lZC1vZmYtYnk6IE1heCBGaWxpcHBv
diA8amNtdmJrYmNAZ21haWwuY29tPgotLS0KIGFyY2gveHRlbnNhL2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2guaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS9jYWNoZWZsdXNo
LmggYi9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKaW5kZXggNDYwZTY2NmFk
MDc2Li5jZjkwN2U1YmYyZjIgMTAwNjQ0Ci0tLSBhL2FyY2gveHRlbnNhL2luY2x1ZGUvYXNtL2Nh
Y2hlZmx1c2guaAorKysgYi9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKQEAg
LTEwNyw4ICsxMDcsNiBAQCB2b2lkIGZsdXNoX2NhY2hlX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0KiwKICNkZWZpbmUgZmx1c2hfY2FjaGVfcGFnZSAgbG9jYWxfZmx1c2hfY2FjaGVfcGFnZQog
I2VuZGlmCiAKLSNkZWZpbmUgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgZmx1c2hfaWNhY2hlX3Jh
bmdlCi0KICNkZWZpbmUgbG9jYWxfZmx1c2hfY2FjaGVfYWxsKCkJCQkJCQlcCiAJZG8gewkJCQkJ
CQkJXAogCQlfX2ZsdXNoX2ludmFsaWRhdGVfZGNhY2hlX2FsbCgpOwkJCVwKQEAgLTE0Nyw2ICsx
NDUsOCBAQCB2b2lkIGxvY2FsX2ZsdXNoX2NhY2hlX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsCiAKICNlbmRpZgogCisjZGVmaW5lIGZsdXNoX2ljYWNoZV91c2VyX3JhbmdlIGZsdXNo
X2ljYWNoZV9yYW5nZQorCiAvKiBFbnN1cmUgY29uc2lzdGVuY3kgYmV0d2VlbiBkYXRhIGFuZCBp
bnN0cnVjdGlvbiBjYWNoZS4gKi8KICNkZWZpbmUgbG9jYWxfZmx1c2hfaWNhY2hlX3JhbmdlKHN0
YXJ0LCBlbmQpCQkJCVwKIAlkbyB7CQkJCQkJCQlcCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXh0ZW5zYSBtYWlsaW5nIGxp
c3QKbGludXgteHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmcKaHR0cDovL2xpc3RzLmxpbnV4LXh0ZW5z
YS5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC14dGVuc2EK
