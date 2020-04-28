Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DA3B91BBD32
	for <lists+linux-xtensa@lfdr.de>; Tue, 28 Apr 2020 14:13:05 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 5AFF36594;
	Tue, 28 Apr 2020 11:59:32 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by linux-xtensa.org (Postfix) with ESMTPS id D69916592
 for <linux-xtensa@linux-xtensa.org>; Tue, 28 Apr 2020 11:59:29 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id h11so8277135plr.11
 for <linux-xtensa@linux-xtensa.org>; Tue, 28 Apr 2020 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+YQulQ3VEtLpwQYfi4fwEdqqCR0jB2tCqeY4J29VrA=;
 b=DZXm803m2ZpHGvE+dXAYmY+kQBE/AZej6ckfPgh84qTRJNXoXYjuxmBydh4tq507Pp
 6XDfx20/tUErkIpsoASmGuvGJ9xGqSZ9/iTVvLIUt9rsFuyWBX21Pvk8srsNwArygbAj
 REK4OdUJGNY4Rlkgn+ELQL7uBoptr1eMm3sKhpEzyruxhQF5FktTG6KajHFfDZxiRWpl
 1F2nBAY5tFOS6D8uwgcbRrKLrZydB1LuOg0OFftnxtwlmwt2VTdcyRoj7uE5dPt8/DNX
 MT0RiKkrIu/VAXXJBl4wXM+W9GZYKE8brtahHrNRwCTxPpgWjlugxUJvpxzCYNettRGQ
 LsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+YQulQ3VEtLpwQYfi4fwEdqqCR0jB2tCqeY4J29VrA=;
 b=nGTcnz5k0DgUdBCJ0s0+HjM+etRU/44K3jV1+55JeGqn75XDANpRlWs95OwD7mUuL8
 nBjrbLMWdbRErBue7zwdW1U+6LfH0rJ1kvncRwPLO+YVjfDC49T2c5GN74BQOkc2HkZd
 drD6FRPXyWp+1qyE3QkOAlSkfVbjTmbo3NrF+Vv5d9zcISKApO2klv0pYtX2XKBnU736
 xeHtaEpNwewLUZD7r4tfNCsM7FXbyODKUDp4gBdjRRcLRTxF+lElp6yCikGOiqK0t+fd
 p2uscgh2Lyc7va7zjKEIFMlQKOxSO/xKfgMg6Nm80yNwBVICh668jEfd4NQuBlvD53UB
 qGlg==
X-Gm-Message-State: AGi0PuZHuAeV5bMvKEhPvcLYlYRZ2Z0AnH+WDo1dMoqnYXrn6/cLVYH9
 b++Hu1C1DhpTOi+JGzLVLRQ=
X-Google-Smtp-Source: APiQypJtkm+j9b8hOY8VC91x31iz+qR7vK1OCcm2JTNUNEuepL/3IZnYHKwx+hag0xOWh6d3DEiDTA==
X-Received: by 2002:a17:90a:2004:: with SMTP id
 n4mr4823520pjc.190.1588075980409; 
 Tue, 28 Apr 2020 05:13:00 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:63f0:6080:6302:8919:92eb])
 by smtp.gmail.com with ESMTPSA id g27sm13182351pgn.52.2020.04.28.05.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 05:12:59 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: binutils@sourceware.org
Date: Tue, 28 Apr 2020 05:12:50 -0700
Message-Id: <20200428121250.32141-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 Eric Tsai <erictsai@cadence.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org
Subject: [Linux-Xtensa] [PATCH] xtensa: gas: support optional immediate
	simcall parameter
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

Starting with RH.0 release Xtensa ISA adds immediate parameter to
simcall opcode. For assembly source compatibility treat "simcall"
instruction without parameter as "simcall 0" when parameter is required.

2020-04-28  Max Filippov  <jcmvbkbc@gmail.com>
gas/
	* config/tc-xtensa.c (XTENSA_MARCH_EARLIEST): Define macro as 0
	if it's not defined.
	(microarch_earliest): New static variable.
	(xg_translate_idioms): Translate "simcall" to "simcall 0" when
	simcall opcode has mandatory parameter.
	(xg_init_global_config): Initialize microarch_earliest.
---
 gas/config/tc-xtensa.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
index ee75c13548ff..14a5a2a9497e 100644
--- a/gas/config/tc-xtensa.c
+++ b/gas/config/tc-xtensa.c
@@ -35,6 +35,10 @@
 #define XSHAL_ABI 0
 #endif
 
+#ifndef XTENSA_MARCH_EARLIEST
+#define XTENSA_MARCH_EARLIEST 0
+#endif
+
 #ifndef uint32
 #define uint32 unsigned int
 #endif
@@ -74,6 +78,8 @@ const char FLT_CHARS[] = "rRsSfFdDxXpP";
 bfd_boolean density_supported;
 bfd_boolean absolute_literals_supported;
 
+static unsigned microarch_earliest;
+
 static vliw_insn cur_vinsn;
 
 unsigned xtensa_num_pipe_stages;
@@ -2502,6 +2508,18 @@ xg_translate_idioms (char **popname, int *pnum_args, char **arg_strings)
       return 0;
     }
 
+  /* Without an operand, this is given a default immediate operand of 0.  */
+  if ((strcmp (opname, "simcall") == 0 && microarch_earliest >= 280000))
+    {
+      if (*pnum_args == 0)
+	{
+	  arg_strings[0] = (char *) xmalloc (2);
+	  strcpy (arg_strings[0], "0");
+	  *pnum_args = 1;
+	}
+      return 0;
+    }
+
   if (strcmp (opname, "bbsi.l") == 0)
     {
       if (xg_check_num_args (pnum_args, 3, opname, arg_strings))
@@ -5236,6 +5254,8 @@ xg_init_global_config (void)
 
   directive_state[directive_density] = XCHAL_HAVE_DENSITY;
   directive_state[directive_absolute_literals] = XSHAL_USE_ABSOLUTE_LITERALS;
+
+  microarch_earliest = XTENSA_MARCH_EARLIEST;
 }
 
 void
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
