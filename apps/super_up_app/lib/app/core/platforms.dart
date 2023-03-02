// Copyright 2023, the hatemragab project author.
// All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart';

enum VOs { ios, android, macOs, windows, web, linux, fuchsia }

abstract class VPlatformsX {
  static bool isWeb = kIsWeb;

  static bool get isMobile =>
      isWeb ? false : io.Platform.isAndroid || io.Platform.isIOS;

  static bool get isAndroid => isWeb ? false : io.Platform.isAndroid;

  static bool get isIOS => isWeb ? false : io.Platform.isIOS;

  static bool get isMacOs => isWeb ? false : io.Platform.isMacOS;

  static bool get isDarwin => isWeb ? false : isMacOs || isIOS;

  static String get currentPlatform {
    return currentOs.name;
  }

  static VOs get currentOs {
    if (isWeb) {
      return VOs.web;
    }
    if (isAndroid) {
      return VOs.android;
    }
    if (isIOS) {
      return VOs.ios;
    }
    if (isLinux) {
      return VOs.linux;
    }
    if (isWindows) {
      return VOs.windows;
    }
    if (isMacOs) {
      return VOs.macOs;
    }
    return VOs.fuchsia;
  }

  static VOs get osInWeb {
    if (!isWeb) {
      return currentOs;
    }
    final userAgent = window.navigator.userAgent.toString().toLowerCase();
    if (_isIosInWeb) {
      return VOs.ios;
    }
    if (userAgent.contains("android")) {
      return VOs.android;
    }
    if (userAgent.contains("windows")) {
      return VOs.windows;
    }
    if (userAgent.contains("macintosh")) {
      return VOs.macOs;
    }
    return VOs.linux;
  }

  static bool get isWindows => isWeb ? false : io.Platform.isWindows;

  static bool get isDeskTop => isWindows || isLinux || isMacOs;

  static bool get isLinux => isWeb ? false : io.Platform.isLinux;

  // User-agent: iphone chrome
  // Mozilla/5.0 (----iPhone-----; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1
  // User-agent: mac chrome
  // Mozilla/5.0 ( ----Macintosh----; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36
  // User-agent: android chrome
  // Mozilla/5.0 (Linux; -----Android---- 13; sdk_gphone64_arm64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36
  // User-agent: windows chrome
  // Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.70
  static bool get isWebRunOnMobile {
    if (!isWeb) {
      return false;
    }
    final userAgent = window.navigator.userAgent.toString().toLowerCase();
    return (userAgent.contains("android")) || _isIosInWeb;
  }

  static bool get _isIosInWeb {
    final userAgent = window.navigator.userAgent.toString().toLowerCase();
    return userAgent.contains("iphone") || userAgent.contains("ipad");
  }
}
