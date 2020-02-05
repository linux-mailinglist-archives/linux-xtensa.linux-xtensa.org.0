Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id DE560152648
	for <lists+linux-xtensa@lfdr.de>; Wed,  5 Feb 2020 07:25:54 +0100 (CET)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 435D55848;
	Wed,  5 Feb 2020 06:14:58 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by linux-xtensa.org (Postfix) with ESMTPS id 8300252AD
 for <linux-xtensa@linux-xtensa.org>; Wed,  5 Feb 2020 06:14:56 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z26so597317lfg.13
 for <linux-xtensa@linux-xtensa.org>; Tue, 04 Feb 2020 22:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G7OQnKnnqYF8NCW7bNNUC6xKqFRAs0xCfylxuALE9EI=;
 b=l+lil5e3CYoPBPHAh9LYx2WD5IHR1xUvLTB/NMWqg3sluA5HmX6HHlsU1sHey9FO1a
 67Znk/IL6L+/kM0n1xAG13JBxk4MxCrRt+gCLisdAP1lUiAahu1NXbAaHIM5BwKZ0jSi
 PyZGHC3+w5+hGCxsOL7eHs3+n82wfuGdE+QegS3m03ZJNinpESbRMgkSZGWSRBUxpcaQ
 ygusxXw9HZBYg4DeBBTs2GdhWsvgWbGa5SJjqH9ZSFvplyez43ZL7hzESzE2CmXP4Ndc
 djpKysAZdHe+gc5l5GrwllUgyFL3Wmt3mKSCby6GSmyV1SvTROo37MoeNg12v98VYQlc
 KKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G7OQnKnnqYF8NCW7bNNUC6xKqFRAs0xCfylxuALE9EI=;
 b=NwNQzfIU3DY5NvMFwERD8GNl6DiFSg6u1QwWzEJjeNxUQoyNxaIRw+VYhda8vWp+H1
 N8/ZMLqKf2g82z1MMKq/iB0+Ll9gDOmlY5aDwdrzke07HZG0VDQye8I6GtJokwUZ110x
 pf09EfwcToMQrk+1fNXKKXtQqcgb1/Ihuk9s8MmV5+Q3szBUmZB3hYDN++ZQJI1vystG
 DHOeBpGlsrc8L1G4+tBdmNuHvLflXGOMmLNFbWud+UJMjWHkCZBdWtZjF9sEYuGM0+Hd
 bzI9iEY8IRyYbL5gBAn/9hSjl5v7PmD6W0txNSZNsk2HfzJQRR3pgPqAYb4wM8n447CT
 FfMQ==
X-Gm-Message-State: APjAAAWzr5CoYFvDfLZKZhoaKjbvBp/PT+crFzJedfT8QqVxvo0ymaWd
 XKAOv02TWhsuliV+BvXrQlbWTkkZESc=
X-Google-Smtp-Source: APXvYqyq/H5V7v0XgFAYU8NlaSGrgxEWxzitVy0s8PldpW99Ra+AErs1iUdbFpjI/8WeY70Kf/ZSLQ==
X-Received: by 2002:a19:48c5:: with SMTP id
 v188mr17226317lfa.100.1580883951239; 
 Tue, 04 Feb 2020 22:25:51 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r26sm11545446lfm.82.2020.02.04.22.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 22:25:50 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  4 Feb 2020 22:25:29 -0800
Message-Id: <20200205062529.7046-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205062529.7046-1-jcmvbkbc@gmail.com>
References: <20200205062529.7046-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v3 3/3] xtensa: reorganize vectors placement
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

Allow vectors to be either merged into the kernel .text or put at a
fixed virtual address independently of XIP option. Drop option that
puts vectors at a fixed offset from the kernel text. Add choice to
Kconfig.
Vectors at fixed virtual address may be useful for XIP-aware MTD support
and for noMMU configurations with available IRAM. Configurations without
VECBASE register must put their vectors at specific locations regardless
of the selected option. All other configurations should happily use
merged vectors.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2->v3:
- rename .handler.text to .exception.text to allow referencing it
  from the .fixup section. This fixes section mismatch build warning
  when CONFIG_FAST_SYSCALL_XTENSA is enabled.

 arch/xtensa/Kconfig                     | 40 ++++++++++++++++++++-----
 arch/xtensa/configs/smp_lx200_defconfig |  1 -
 arch/xtensa/configs/virt_defconfig      |  1 -
 arch/xtensa/include/asm/vectors.h       |  4 +--
 arch/xtensa/kernel/setup.c              |  4 +--
 arch/xtensa/kernel/vmlinux.lds.S        | 21 ++++++++-----
 6 files changed, 51 insertions(+), 20 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 06e6161797fa..133385d13c02 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -572,15 +572,41 @@ config KERNEL_LOAD_ADDRESS
 
 	  If unsure, leave the default value here.
 
-config VECTORS_OFFSET
-	hex "Kernel vectors offset"
-	default 0x00003000
-	depends on !XIP_KERNEL
+choice
+	prompt "Relocatable vectors location"
+	default XTENSA_VECTORS_IN_TEXT
 	help
-	  This is the offset of the kernel image from the relocatable vectors
-	  base.
+	  Choose whether relocatable vectors are merged into the kernel .text
+	  or placed separately at runtime. This option does not affect
+	  configurations without VECBASE register where vectors are always
+	  placed at their hardware-defined locations.
 
-	  If unsure, leave the default value here.
+config XTENSA_VECTORS_IN_TEXT
+	bool "Merge relocatable vectors into kernel text"
+	depends on !MTD_XIP
+	help
+	  This option puts relocatable vectors into the kernel .text section
+	  with proper alignment.
+	  This is a safe choice for most configurations.
+
+config XTENSA_VECTORS_SEPARATE
+	bool "Put relocatable vectors at fixed address"
+	help
+	  This option puts relocatable vectors at specific virtual address.
+	  Vectors are merged with the .init data in the kernel image and
+	  are copied into their designated location during kernel startup.
+	  Use it to put vectors into IRAM or out of FLASH on kernels with
+	  XIP-aware MTD support.
+
+endchoice
+
+config VECTORS_ADDR
+	hex "Kernel vectors virtual address"
+	default 0x00000000
+	depends on XTENSA_VECTORS_SEPARATE
+	help
+	  This is the virtual address of the (relocatable) vectors base.
+	  It must be within KSEG if MMU is used.
 
 config XIP_DATA_ADDR
 	hex "XIP kernel data virtual address"
diff --git a/arch/xtensa/configs/smp_lx200_defconfig b/arch/xtensa/configs/smp_lx200_defconfig
index 8b3bc92a079c..4f1c7998b030 100644
--- a/arch/xtensa/configs/smp_lx200_defconfig
+++ b/arch/xtensa/configs/smp_lx200_defconfig
@@ -30,7 +30,6 @@ CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 # CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX is not set
 # CONFIG_PCI is not set
-CONFIG_VECTORS_OFFSET=0x00002000
 CONFIG_XTENSA_PLATFORM_XTFPGA=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon=uart8250,mmio32native,0xfd050020,115200n8 console=ttyS0,115200n8 ip=dhcp root=/dev/nfs rw debug memmap=96M@0"
diff --git a/arch/xtensa/configs/virt_defconfig b/arch/xtensa/configs/virt_defconfig
index 4fddd8512350..6d1387dfa96f 100644
--- a/arch/xtensa/configs/virt_defconfig
+++ b/arch/xtensa/configs/virt_defconfig
@@ -19,7 +19,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_PERF_EVENTS=y
 CONFIG_XTENSA_VARIANT_DC233C=y
 CONFIG_XTENSA_UNALIGNED_USER=y
-CONFIG_VECTORS_OFFSET=0x00002000
 CONFIG_XTENSA_KSEG_512M=y
 CONFIG_HIGHMEM=y
 CONFIG_CMDLINE_BOOL=y
diff --git a/arch/xtensa/include/asm/vectors.h b/arch/xtensa/include/asm/vectors.h
index 140f30762cf9..704286c35640 100644
--- a/arch/xtensa/include/asm/vectors.h
+++ b/arch/xtensa/include/asm/vectors.h
@@ -34,8 +34,8 @@
 #endif
 
 #define RESET_VECTOR1_VADDR		(XCHAL_RESET_VECTOR1_VADDR)
-#ifdef CONFIG_VECTORS_OFFSET
-#define VECBASE_VADDR			(KERNELOFFSET - CONFIG_VECTORS_OFFSET)
+#ifdef CONFIG_VECTORS_ADDR
+#define VECBASE_VADDR			(CONFIG_VECTORS_ADDR)
 #else
 #define VECBASE_VADDR			_vecbase
 #endif
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index fefbdce1db99..1e9b9e7d9583 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -349,7 +349,7 @@ void __init setup_arch(char **cmdline_p)
 	mem_reserve(__pa(_xip_start), __pa(_xip_end));
 #endif
 
-#ifdef CONFIG_VECTORS_OFFSET
+#ifdef CONFIG_VECTORS_ADDR
 	mem_reserve(__pa(&_WindowVectors_text_start),
 		    __pa(&_WindowVectors_text_end));
 
@@ -388,7 +388,7 @@ void __init setup_arch(char **cmdline_p)
 		    __pa(&_Level6InterruptVector_text_end));
 #endif
 
-#endif /* CONFIG_VECTORS_OFFSET */
+#endif /* CONFIG_VECTORS_ADDR */
 
 #ifdef CONFIG_SMP
 	mem_reserve(__pa(&_SecondaryResetVector_text_start),
diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index d9e547810b6c..d23a6e38f062 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -47,9 +47,15 @@ jiffies = jiffies_64;
 	LONG(sym ## _end);			\
 	LONG(LOADADDR(section))
 
+#if !defined(CONFIG_VECTORS_ADDR) && XCHAL_HAVE_VECBASE
+#define MERGED_VECTORS 1
+#else
+#define MERGED_VECTORS 0
+#endif
+
 /*
- * Macro to define a section for a vector. When CONFIG_VECTORS_OFFSET is
- * defined code for every vector is located with other init data. At startup
+ * Macro to define a section for a vector. When MERGED_VECTORS is 0
+ * code for every vector is located with other init data. At startup
  * time head.S copies code for every vector to its final position according
  * to description recorded in the corresponding RELOCATE_ENTRY.
  */
@@ -84,7 +90,7 @@ SECTIONS
     /* The HEAD_TEXT section must be the first section! */
     HEAD_TEXT
 
-#ifndef CONFIG_VECTORS_OFFSET
+#if MERGED_VECTORS
     . = ALIGN(PAGE_SIZE);
     _vecbase = .;
 
@@ -159,7 +165,7 @@ SECTIONS
     . = ALIGN(16);
     __boot_reloc_table_start = ABSOLUTE(.);
 
-#ifdef CONFIG_VECTORS_OFFSET
+#if !MERGED_VECTORS
     RELOCATE_ENTRY(_WindowVectors_text,
 		   .WindowVectors.text);
 #if XCHAL_EXCM_LEVEL >= 2
@@ -220,7 +226,7 @@ SECTIONS
 #undef LAST
 #define LAST	.dummy
 
-#ifdef CONFIG_VECTORS_OFFSET
+#if !MERGED_VECTORS
   /* The vectors are relocated to the real position at startup time */
 
   SECTION_VECTOR4 (_WindowVectors_text,
@@ -299,7 +305,7 @@ SECTIONS
 #define LAST .SecondaryResetVector.text
 
 #endif
-#ifdef CONFIG_VECTORS_OFFSET
+#if !MERGED_VECTORS
   SECTION_VECTOR4 (_exception_text,
 		  .exception.text,
 		  ,
@@ -310,6 +316,7 @@ SECTIONS
 #endif
   . = (LOADADDR(LAST) + SIZEOF(LAST) + 3) & ~ 3;
 
+  .dummy1 : AT(ADDR(.dummy1)) { LONG(0) }
   . = ALIGN(PAGE_SIZE);
 
 #ifndef CONFIG_XIP_KERNEL
@@ -327,7 +334,7 @@ SECTIONS
 
 #undef LOAD_OFFSET
 #define LOAD_OFFSET \
-  (CONFIG_XIP_DATA_ADDR - (LOADADDR(.dummy) + SIZEOF(.dummy) + 3) & ~ 3)
+  (CONFIG_XIP_DATA_ADDR - (LOADADDR(.dummy1) + SIZEOF(.dummy1) + 3) & ~ 3)
 
   _xip_data_start = .;
   _sdata = .;
-- 
2.20.1

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
