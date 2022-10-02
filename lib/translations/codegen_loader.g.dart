// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "getyourGroceries": "احصل علي مشترياتك",
  "withNectar": "مع نكتر",
  "login": "تسجيل الدخول",
  "continueWithGoogle": "تسجيل الدخول باستخدام جوجل",
  "continueWithFacebook": "تسجيل الدخول باستخدام الفيس بوك",
  "newinNectar?": "جديد مع نكتر؟",
  "createAccount": "انشاء حساب",
  "en": "ع",
  "ar": "En",
    "hintEmail": "ادخل البريد الالكتروني",
    "hintPassword": "ادخل الرقم السري",
    "signout": "تسجيل الخروج"
};
static const Map<String,dynamic> en = {
  "getyourGroceries": "Get your Groceries",
  "withNectar": "with Nectar",
  "login": "Login",
  "continueWithGoogle": "Continue with Google",
  "continueWithFacebook": "Continue with Facebook",
  "newinNectar?": "New in Nectar ?",
  "createAccount": "Create Account",
  "en": "En",
  "ar": "ع",
"hintEmail": "Email*",
  "hintPassword": "Password*",
  "signout": "Signout"

};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
