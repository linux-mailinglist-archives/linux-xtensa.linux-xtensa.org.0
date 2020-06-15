Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id B2FE51F94D0
	for <lists+linux-xtensa@lfdr.de>; Mon, 15 Jun 2020 12:44:28 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 433566434;
	Mon, 15 Jun 2020 10:29:22 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by linux-xtensa.org (Postfix) with ESMTPS id 774965825
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 10:29:20 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l63so5196464pge.12
 for <linux-xtensa@linux-xtensa.org>; Mon, 15 Jun 2020 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dh/AVG1wChYFnadSw5Xg9WQCUy6cAJ8hx9o8yjjsf+g=;
 b=XvwsdX3VrAgMCcFfc7OODik+QvAqiDD5yOlsFyFJNKMv8WICI7zfw2X//NeIaFRj0P
 R1DKFqzdAr2w5z7sNCOAteRNrcKIiuLbydHFNGmciw9gWHqRtp6wTRGCAJYnjaYsOXKa
 9pj8pBXPtwLVexVMudzTah3r6vdyt7a1fiq54BnRPB3uSR+MkEbz0dWalsUrAlc/4cNw
 jK8AdhxplUgRT7onMuaGv20D51hhn68yGk3HuNX9HnmTwPxvGm3RgZ6tgPTkgRVrogPT
 U79+oWMKHOurLK6vxhPDcd3FdHShToQBICUZMqq5688saAvBUSyv5XcpEXlvT5C4WYiF
 FL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dh/AVG1wChYFnadSw5Xg9WQCUy6cAJ8hx9o8yjjsf+g=;
 b=ZGi4GxftvpXWozs2m7aZZxadj+AUxUqWQB6O9W+NvDsuz32Xah8W51843BM79Q73TU
 zoMDyG0qaCc+riWOcXiZRXNaM+Rs3d12LD0gr1/3hPtZi4DT07w9Th7/gZ2qB0rj/2Vi
 xEwZi84Tuui8RnItwQlb7emQPndA4NxtQyzTxD3SdraaJBX/qtRR8zGVMw+QleyVrDkh
 RiBIQOTsdgLj6eKM6UbhIK5GDFybqw0GiTMiv7aQ5dco1B4QhGDdVihgTNDiPpRewY1I
 dBwUSjGaErx9NsL+ZfiJ7pY+Fi5k8miKskkU4nHMyPcDyU6x64fCAaOOT4ns4PnqTprt
 0IiQ==
X-Gm-Message-State: AOAM532L7tjbPPKSGMAlrEETPZJp/DMXW7jPGHlncvrkQHnq6emAMD5I
 RqSJMIeAlgjQ0WhCF4I6Xjc=
X-Google-Smtp-Source: ABdhPJxk/LLScDxDfE8VbiH1cMElXtJR4Sh2K7NWxtpJ8+kY2OYT9P6YwNsWvYJfQpWkFmpKmpC6lw==
X-Received: by 2002:a62:e503:: with SMTP id n3mr21335534pff.197.1592217865328; 
 Mon, 15 Jun 2020 03:44:25 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:7571:e536:944d:12bc])
 by smtp.gmail.com with ESMTPSA id q65sm13974474pfc.155.2020.06.15.03.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 03:44:24 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: gcc-patches@gcc.gnu.org
Date: Mon, 15 Jun 2020 03:44:06 -0700
Message-Id: <20200615104407.28521-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200615104407.28521-1-jcmvbkbc@gmail.com>
References: <20200615104407.28521-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Sterling Augustine <augustine.sterling@gmail.com>,
 linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH 1/2] gcc: xtensa: make register elimination
	data static
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

Remove ABI reference from the ELIMINABLE_REGS to avoid static data
initialization dependency on xtensa core configuration.

2020-06-15  Max Filippov  <jcmvbkbc@gmail.com>
gcc/
	* config/xtensa/xtensa.c (xtensa_can_eliminate): New function.
	(TARGET_CAN_ELIMINATE): New macro.
	* config/xtensa/xtensa.h
	(XTENSA_WINDOWED_HARD_FRAME_POINTER_REGNUM)
	(XTENSA_CALL0_HARD_FRAME_POINTER_REGNUM): New macros.
	(HARD_FRAME_POINTER_REGNUM): Define using
	XTENSA_*_HARD_FRAME_POINTER_REGNUM.
	(ELIMINABLE_REGS): Replace lines with HARD_FRAME_POINTER_REGNUM
	by lines with XTENSA_WINDOWED_HARD_FRAME_POINTER_REGNUM and
	XTENSA_CALL0_HARD_FRAME_POINTER_REGNUM.
---
 gcc/config/xtensa/xtensa.c | 16 ++++++++++++++++
 gcc/config/xtensa/xtensa.h | 26 ++++++++++++++++++--------
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
index 550c9cdfd892..e3afb70cdf04 100644
--- a/gcc/config/xtensa/xtensa.c
+++ b/gcc/config/xtensa/xtensa.c
@@ -183,6 +183,8 @@ static unsigned int xtensa_hard_regno_nregs (unsigned int, machine_mode);
 static bool xtensa_hard_regno_mode_ok (unsigned int, machine_mode);
 static bool xtensa_modes_tieable_p (machine_mode, machine_mode);
 static HOST_WIDE_INT xtensa_constant_alignment (const_tree, HOST_WIDE_INT);
+static bool xtensa_can_eliminate (const int from ATTRIBUTE_UNUSED,
+				  const int to);
 static HOST_WIDE_INT xtensa_starting_frame_offset (void);
 static unsigned HOST_WIDE_INT xtensa_asan_shadow_offset (void);
 
@@ -326,6 +328,9 @@ static rtx xtensa_delegitimize_address (rtx);
 #undef TARGET_CONSTANT_ALIGNMENT
 #define TARGET_CONSTANT_ALIGNMENT xtensa_constant_alignment
 
+#undef TARGET_CAN_ELIMINATE
+#define TARGET_CAN_ELIMINATE xtensa_can_eliminate
+
 #undef TARGET_STARTING_FRAME_OFFSET
 #define TARGET_STARTING_FRAME_OFFSET xtensa_starting_frame_offset
 
@@ -4411,6 +4416,17 @@ xtensa_constant_alignment (const_tree exp, HOST_WIDE_INT align)
   return align;
 }
 
+static bool
+xtensa_can_eliminate (const int from ATTRIBUTE_UNUSED, const int to)
+{
+  gcc_assert (from == ARG_POINTER_REGNUM || from == FRAME_POINTER_REGNUM);
+
+  /* If we need a frame pointer, ARG_POINTER_REGNUM and FRAME_POINTER_REGNUM
+     can only eliminate to HARD_FRAME_POINTER_REGNUM.  */
+  return to == HARD_FRAME_POINTER_REGNUM
+    || (!frame_pointer_needed && to == STACK_POINTER_REGNUM);
+}
+
 /* Implement TARGET_STARTING_FRAME_OFFSET.  */
 
 static HOST_WIDE_INT
diff --git a/gcc/config/xtensa/xtensa.h b/gcc/config/xtensa/xtensa.h
index 8e1bcf823e46..fb5aee870dd5 100644
--- a/gcc/config/xtensa/xtensa.h
+++ b/gcc/config/xtensa/xtensa.h
@@ -314,8 +314,13 @@ extern int leaf_function;
 #define STACK_POINTER_REGNUM (GP_REG_FIRST + 1)
 
 /* Base register for access to local variables of the function.  */
-#define HARD_FRAME_POINTER_REGNUM (GP_REG_FIRST + \
-				   (TARGET_WINDOWED_ABI ? 7 : 15))
+#define HARD_FRAME_POINTER_REGNUM \
+  (TARGET_WINDOWED_ABI \
+   ? XTENSA_WINDOWED_HARD_FRAME_POINTER_REGNUM \
+   : XTENSA_CALL0_HARD_FRAME_POINTER_REGNUM)
+
+#define XTENSA_WINDOWED_HARD_FRAME_POINTER_REGNUM (GP_REG_FIRST + 7)
+#define XTENSA_CALL0_HARD_FRAME_POINTER_REGNUM (GP_REG_FIRST + 15)
 
 /* The register number of the frame pointer register, which is used to
    access automatic variables in the stack frame.  For Xtensa, this
@@ -434,12 +439,17 @@ enum reg_class
 			      || (flag_sanitize & SANITIZE_ADDRESS) != 0)
 
 /* The ARG_POINTER and FRAME_POINTER are not real Xtensa registers, so
-   they are eliminated to either the stack pointer or hard frame pointer.  */
-#define ELIMINABLE_REGS							\
-{{ ARG_POINTER_REGNUM,		STACK_POINTER_REGNUM},			\
- { ARG_POINTER_REGNUM,		HARD_FRAME_POINTER_REGNUM},		\
- { FRAME_POINTER_REGNUM,	STACK_POINTER_REGNUM},			\
- { FRAME_POINTER_REGNUM,	HARD_FRAME_POINTER_REGNUM}}
+   they are eliminated to either the stack pointer or hard frame pointer.
+   Since hard frame pointer is different register in windowed and call0
+   ABIs list them both and only allow real HARD_FRAME_POINTER_REGNUM in
+   TARGET_CAN_ELIMINATE.  */
+#define ELIMINABLE_REGS							    \
+{{ ARG_POINTER_REGNUM,		STACK_POINTER_REGNUM},			    \
+ { ARG_POINTER_REGNUM,		XTENSA_WINDOWED_HARD_FRAME_POINTER_REGNUM}, \
+ { ARG_POINTER_REGNUM,		XTENSA_CALL0_HARD_FRAME_POINTER_REGNUM},    \
+ { FRAME_POINTER_REGNUM,	STACK_POINTER_REGNUM},			    \
+ { FRAME_POINTER_REGNUM,	XTENSA_WINDOWED_HARD_FRAME_POINTER_REGNUM}, \
+ { FRAME_POINTER_REGNUM,	XTENSA_CALL0_HARD_FRAME_POINTER_REGNUM}}
 
 /* Specify the initial difference between the specified pair of registers.  */
 #define INITIAL_ELIMINATION_OFFSET(FROM, TO, OFFSET)			\
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
