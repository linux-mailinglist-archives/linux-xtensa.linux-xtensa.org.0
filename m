Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6CE234CD4
	for <lists+linux-xtensa@lfdr.de>; Fri, 31 Jul 2020 23:20:15 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 4C83164A3;
	Fri, 31 Jul 2020 21:03:29 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by linux-xtensa.org (Postfix) with ESMTPS id 67B2564A1
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jul 2020 21:03:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id m22so16661335pgv.9
 for <linux-xtensa@linux-xtensa.org>; Fri, 31 Jul 2020 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2m8bxGCf+gpIPT9ul2HDHjNGeJCBm38FKDdWisVHgKI=;
 b=l5Earp68wcfJil4yyIni/DwT8pjkau0mElKuIw8rHR0DoIEBDXb06cnyTb0Yb3BvYT
 hJIU6w3yGx2SgUYizL0sTaUDvbKcMfARYDIOimjJYGFS+Zwhi1eyM/MDSXLBL2X72vDK
 ZyNxE+Y42Bk0LGLGn/xTDoUyYy5wR9QC0FlqAjB2616RnUNRjTs4wPQ5E+xxu4JtFLvE
 m9/Ut3Pt5UZK5dfxk3vDLrYLqYMhInXbpxHYrGiapI2MVPeOgh2r5oYQ4B0VC1/8ZHHv
 8t2jf6pTfIQKeDirT41isCr+pTNamOnKVQJmbVL7roOaXTeUcJKEqLQe3Syo5REPj50Q
 Pw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2m8bxGCf+gpIPT9ul2HDHjNGeJCBm38FKDdWisVHgKI=;
 b=iKmWWnOiO+X3PfkhFQwbTx7QyvGafAbtFViH74MLBEVadDC+bObpGHcqOrLWpF7QxG
 pCQrc1k4BlLXrrVRxLqFgz2CYcQ3UT6/G1vkBfgNkN8HQI8UYvpZGzdBbL9AfVxW4gWf
 wm5i8Y1yM8stRuJJTiBlXV43yaKbEQJZ63/yqUHFf/ASoQU6EDt+FYSAppSOU59tlo9E
 21HXohZFMz7JLGDPvFQmGEUQqrpaEUxkSGuUGCk09E0sT0eApoVkoBZoyGqlo7/7MDMD
 TqROUT9En9cAHY8UJ5dSHn52ubBtWLmqaoIPG5m7iNGwi2+uUxA6B1InyVhpToGNXlqR
 3b2Q==
X-Gm-Message-State: AOAM530YT/2P2z6TRwQGxbKdwUzNTsDGVQPJB5RZk1rvtRJ4CXU24Xc5
 ocUam1YjhOeyEYtzRw4tNtinccsk
X-Google-Smtp-Source: ABdhPJztbF7d7FxQwrIjj1SdW8MB0sElEnBNafOSNFVht7V8dcXYE8tZmv6k/D4EYLNo49zSBAnGHQ==
X-Received: by 2002:a62:1ccb:: with SMTP id c194mr5377357pfc.277.1596230411764; 
 Fri, 31 Jul 2020 14:20:11 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id s22sm5687449pfh.16.2020.07.31.14.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 14:20:11 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Fri, 31 Jul 2020 14:19:52 -0700
Message-Id: <20200731211952.26802-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH] xtensa: fix xtensa_pmu_setup prototype
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

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3IgaW4gY29uZmlndXJhdGlvbnMgd2l0aApDT05G
SUdfWFRFTlNBX1ZBUklBTlRfSEFWRV9QRVJGX0VWRU5UUz15OgoKICBhcmNoL3h0ZW5zYS9rZXJu
ZWwvcGVyZl9ldmVudC5jOjQyMDoyOTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZgogIOKA
mGNwdWhwX3NldHVwX3N0YXRl4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZQoKQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IDI1YTc3YjU1ZTc0YyAoInh0ZW5zYS9wZXJm
OiBDb252ZXJ0IHRoZSBob3RwbHVnIG5vdGlmaWVyIHRvIHN0YXRlIG1hY2hpbmUgY2FsbGJhY2tz
IikKU2lnbmVkLW9mZi1ieTogTWF4IEZpbGlwcG92IDxqY212YmtiY0BnbWFpbC5jb20+Ci0tLQog
YXJjaC94dGVuc2Eva2VybmVsL3BlcmZfZXZlbnQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveHRlbnNhL2tl
cm5lbC9wZXJmX2V2ZW50LmMgYi9hcmNoL3h0ZW5zYS9rZXJuZWwvcGVyZl9ldmVudC5jCmluZGV4
IDk5ZmNkNjNjZTU5Ny4uYTBkMDVjODU5OGQwIDEwMDY0NAotLS0gYS9hcmNoL3h0ZW5zYS9rZXJu
ZWwvcGVyZl9ldmVudC5jCisrKyBiL2FyY2gveHRlbnNhL2tlcm5lbC9wZXJmX2V2ZW50LmMKQEAg
LTM5OSw3ICszOTksNyBAQCBzdGF0aWMgc3RydWN0IHBtdSB4dGVuc2FfcG11ID0gewogCS5yZWFk
ID0geHRlbnNhX3BtdV9yZWFkLAogfTsKIAotc3RhdGljIGludCB4dGVuc2FfcG11X3NldHVwKGlu
dCBjcHUpCitzdGF0aWMgaW50IHh0ZW5zYV9wbXVfc2V0dXAodW5zaWduZWQgaW50IGNwdSkKIHsK
IAl1bnNpZ25lZCBpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXh0ZW5zYSBtYWlsaW5nIGxpc3QKbGludXgteHRlbnNh
QGxpbnV4LXh0ZW5zYS5vcmcKaHR0cDovL2xpc3RzLmxpbnV4LXh0ZW5zYS5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC14dGVuc2EK
