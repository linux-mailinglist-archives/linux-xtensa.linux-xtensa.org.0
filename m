Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 567511EECC6
	for <lists+linux-xtensa@lfdr.de>; Thu,  4 Jun 2020 23:05:02 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 63D2D33BC;
	Thu,  4 Jun 2020 20:50:17 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by linux-xtensa.org (Postfix) with ESMTPS id BEC5C2625
 for <linux-xtensa@linux-xtensa.org>; Thu,  4 Jun 2020 20:50:14 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id h185so3842342pfg.2
 for <linux-xtensa@linux-xtensa.org>; Thu, 04 Jun 2020 14:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XBJYShmotA42AknxFeQiFnGD/xpeL/Yx/og7zLDcGJo=;
 b=Ri//yKDogM1FWaC5oVlNoFqQQIK88pfC2P4WxvEFwQlrBvsCnkt+wmpF8Ah2eGPj9/
 tp1AnwjJuO+2G1/9DNf9cbZGYRpm573AUjUmSmfyRpJaLxF/JMzmv9RyzQhuUM0zqOkk
 EeeKsDVaOBcCl+6KN/tWmFVF9NuVMFvIuMtRF7Ykl7WUv/h4xlmiBDFqN7WjZzEwym/W
 NFg7PI7w+RMyGPB3+HENdHUkD7lJG15RId6uv38UZNLKOPvoVm/aWXn8lin5XzsucIBJ
 i16xqpLaJrg3JEUhnTCd6n3+Y38SmZ2OdsGJSyO6jlQIfhQJ4SaAQ4AcsTg6MFfFOwrZ
 a0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XBJYShmotA42AknxFeQiFnGD/xpeL/Yx/og7zLDcGJo=;
 b=ENqmwqiSuKEsiNI1duM/cq69app/0hfyS0wpuF3yiFAIiDn6FNFfyxB+GfYRHmPXiR
 6PC+VOpREfEQDZo42Q42yh1VO/yrQHUDwCeRSF9882sBMtInTdDj/CBQnUQiKEJwpQx6
 xkQ1b1H0QLYGdqgm/Qv1Gx5hxJQ1dJInjA8+HzhaYXu417d7UUL1gXEqf5EGhOE+4B4V
 qzxtP2TUq02LLZHY6UVEZ4zl5ndG7mn4ph0PV3VUWfjIXkZoDNTMAVjwv9P6TyqAxQoK
 DlnKtawywnYeYBktfP71z+6L6uz+6KLiTEfILyei8Cth2oSfYytXyeq+HrKZvYKbtJR7
 yj2Q==
X-Gm-Message-State: AOAM531l8mHZrdAL7QpsRTn7OJiviHQTwpS7SVmPrAS8KUh25n+LJmkl
 AQncMY9ySD66bXtdyAwMix4c2DdN
X-Google-Smtp-Source: ABdhPJww9n3nybtlnzGlA+3h/lkb5gZcNQthVIr5O11KQjwdZ2fnx/BkZfwWk/1TJXzvVKJ1CVv1vQ==
X-Received: by 2002:a63:da11:: with SMTP id c17mr6084254pgh.71.1591304697750; 
 Thu, 04 Jun 2020 14:04:57 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id ev20sm6604078pjb.8.2020.06.04.14.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 14:04:57 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Thu,  4 Jun 2020 14:04:43 -0700
Message-Id: <20200604210443.16961-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix __sync_fetch_and_{and,
	or}_4 declarations
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

QnVpbGRpbmcgeHRlbnNhIGtlcm5lbCB3aXRoIGdjYy0xMCBwcm9kdWNlcyB0aGUgZm9sbG93aW5n
IHdhcm5pbmdzOgogIGFyY2gveHRlbnNhL2tlcm5lbC94dGVuc2Ffa3N5bXMuYzo5MDoxNTogd2Fy
bmluZzogY29uZmxpY3RpbmcgdHlwZXMKICAgIGZvciBidWlsdC1pbiBmdW5jdGlvbiDigJhfX3N5
bmNfZmV0Y2hfYW5kX2FuZF804oCZOwogICAgZXhwZWN0ZWQg4oCYdW5zaWduZWQgaW50KHZvbGF0
aWxlIHZvaWQgKiwgdW5zaWduZWQgaW50KeKAmQogICAgWy1XYnVpbHRpbi1kZWNsYXJhdGlvbi1t
aXNtYXRjaF0KICBhcmNoL3h0ZW5zYS9rZXJuZWwveHRlbnNhX2tzeW1zLmM6OTY6MTU6IHdhcm5p
bmc6IGNvbmZsaWN0aW5nIHR5cGVzCiAgICBmb3IgYnVpbHQtaW4gZnVuY3Rpb24g4oCYX19zeW5j
X2ZldGNoX2FuZF9vcl804oCZOwogICAgZXhwZWN0ZWQg4oCYdW5zaWduZWQgaW50KHZvbGF0aWxl
IHZvaWQgKiwgdW5zaWduZWQgaW50KeKAmQogICAgWy1XYnVpbHRpbi1kZWNsYXJhdGlvbi1taXNt
YXRjaF0KCkZpeCBkZWNsYXJhdGlvbnMgb2YgdGhlc2UgZnVuY3Rpb25zIHRvIGF2b2lkIHRoZSB3
YXJuaW5nLgoKU2lnbmVkLW9mZi1ieTogTWF4IEZpbGlwcG92IDxqY212YmtiY0BnbWFpbC5jb20+
Ci0tLQogYXJjaC94dGVuc2Eva2VybmVsL3h0ZW5zYV9rc3ltcy5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveHRlbnNhL2tlcm5lbC94dGVuc2Ffa3N5bXMuYyBiL2FyY2gveHRlbnNhL2tlcm5lbC94dGVu
c2Ffa3N5bXMuYwppbmRleCA0MDkyNTU1ODI4YjEuLjI0Y2Y2OTcyZWFjZSAxMDA2NDQKLS0tIGEv
YXJjaC94dGVuc2Eva2VybmVsL3h0ZW5zYV9rc3ltcy5jCisrKyBiL2FyY2gveHRlbnNhL2tlcm5l
bC94dGVuc2Ffa3N5bXMuYwpAQCAtODcsMTMgKzg3LDEzIEBAIHZvaWQgX194dGVuc2FfbGliZ2Nj
X3dpbmRvd19zcGlsbCh2b2lkKQogfQogRVhQT1JUX1NZTUJPTChfX3h0ZW5zYV9saWJnY2Nfd2lu
ZG93X3NwaWxsKTsKIAotdW5zaWduZWQgbG9uZyBfX3N5bmNfZmV0Y2hfYW5kX2FuZF80KHVuc2ln
bmVkIGxvbmcgKnAsIHVuc2lnbmVkIGxvbmcgdikKK3Vuc2lnbmVkIGludCBfX3N5bmNfZmV0Y2hf
YW5kX2FuZF80KHZvbGF0aWxlIHZvaWQgKnAsIHVuc2lnbmVkIGludCB2KQogewogCUJVRygpOwog
fQogRVhQT1JUX1NZTUJPTChfX3N5bmNfZmV0Y2hfYW5kX2FuZF80KTsKIAotdW5zaWduZWQgbG9u
ZyBfX3N5bmNfZmV0Y2hfYW5kX29yXzQodW5zaWduZWQgbG9uZyAqcCwgdW5zaWduZWQgbG9uZyB2
KQordW5zaWduZWQgaW50IF9fc3luY19mZXRjaF9hbmRfb3JfNCh2b2xhdGlsZSB2b2lkICpwLCB1
bnNpZ25lZCBpbnQgdikKIHsKIAlCVUcoKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgteHRlbnNhIG1haWxpbmcgbGlz
dApsaW51eC14dGVuc2FAbGludXgteHRlbnNhLm9yZwpodHRwOi8vbGlzdHMubGludXgteHRlbnNh
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXh0ZW5zYQo=
