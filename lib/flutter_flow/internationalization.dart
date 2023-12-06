import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // autho
  {
    '0tkcngfh': {
      'ar': ' دخول',
      'en': 'Login',
    },
    'exftc4vd': {
      'ar': 'بريدك الإلكتروني',
      'en': 'Your E-mail',
    },
    'ker18uf2': {
      'ar': 'Option 1',
      'en': '',
    },
    'u2q4pf8z': {
      'ar': 'كلمة المرور',
      'en': 'password',
    },
    'nwdiqnyj': {
      'ar': 'Option 1',
      'en': '',
    },
    'jzcp9h8d': {
      'ar': 'دخول',
      'en': 'entrance',
    },
    'gnctmx39': {
      'ar': 'نسيت كلمة المرور؟',
      'en': 'Forgot your password?',
    },
    'ku0gvh1o': {
      'ar': 'أو يمكنك استخدام حساب جوجل للدخول:',
      'en': 'Or you can use your google account to login',
    },
    '44g5wd33': {
      'ar': 'حساب جديد',
      'en': 'subscription',
    },
    'ytmlp3im': {
      'ar': 'بريدك الإلكتروني',
      'en': 'Your E-mail',
    },
    'z8dypz5a': {
      'ar': 'كلمة المرور',
      'en': 'password',
    },
    'qjr2h75e': {
      'ar': 'أكد كلمة المرور',
      'en': 'Confirm the password',
    },
    'mxs17g76': {
      'ar': 'أنشئ حسابك',
      'en': 'Create your account',
    },
    'onejcoy6': {
      'ar': 'أو استخدم حساب جوجل للاشتراك',
      'en': 'Or use your Google account to sign up',
    },
    'pcs71b95': {
      'ar': 'اذهب',
      'en': '',
    },
    'f407i3mt': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // ForgotPassword
  {
    'ksntvjex': {
      'ar': 'Back',
      'en': 'back',
    },
    'jrnyx6r4': {
      'ar': 'نسيت كلمة المرور؟',
      'en': 'Forgot your password?',
    },
    'b3sdg8mm': {
      'ar':
          'سنرسل لك إيميل يحتوي رابط لإعادة ضبط كلمة مرورك .. أدخل إيميلك الخاص بهذا الحساب بالأسفل',
      'en':
          'We will send you an email containing a link to reset your password .. Enter your email for this account below',
    },
    '8171moao': {
      'ar': 'بريدك الإلكتروني...',
      'en': 'Your E-mail...',
    },
    'zd4e1fnt': {
      'ar': 'بريدك الإلكتروني...',
      'en': 'Your E-mail...',
    },
    'tp16nh8s': {
      'ar': 'أرسل الرابط',
      'en': 'send the link',
    },
    '4kuu8dp0': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // profile
  {
    '3q0ucj1k': {
      'ar': 'ملفك الشخصي',
      'en': 'personal file',
    },
    '067skqg0': {
      'ar': 'بطاقة المشرف الدراسي:',
      'en': '',
    },
    'y7japl5q': {
      'ar': 'مشرف دراسي',
      'en': '',
    },
    'msua7vj6': {
      'ar': 'إعدادات الحساب',
      'en': 'account settings',
    },
    '5hcxf8f6': {
      'ar': 'تغيير كلمة المرور',
      'en': 'change password',
    },
    'xpx9oyfs': {
      'ar': 'تعديل بياناتك الشخصية',
      'en': 'Modify your personal data',
    },
    'o5e1rmid': {
      'ar': 'اذهب للقناة العامة',
      'en': 'Go to the telegram channel',
    },
    '63xgkmg1': {
      'ar': 'اذهب للقناة العامة',
      'en': 'Go to the telegram channel',
    },
    'vmkhz21f': {
      'ar': 'اذهب للمجموعة التفاعلية',
      'en': 'Go to the telegram channel',
    },
  },
  // lessonContentCopy1
  {
    'fg69f524': {
      'ar': 'المقررات',
      'en': '',
    },
    'gr51sy0m': {
      'ar': 'Label here...',
      'en': '',
    },
    'o8f6mre5': {
      'ar': 'audio',
      'en': '',
    },
    'm3944me8': {
      'ar': 'ملاحظات',
      'en': 'Posts',
    },
    's41n6u6x': {
      'ar': 'التدريبات',
      'en': 'Activity',
    },
    'frjynyr1': {
      'ar': 'المرفقات',
      'en': 'Followers',
    },
    'yzvogjcb': {
      'ar': '01 باب الطهارة',
      'en': '',
    },
    'iew931d5': {
      'ar': '45Min',
      'en': '',
    },
    'cn3dbhev': {
      'ar': 'الشيخ هشام فؤاد',
      'en': '',
    },
    'a3s3qvh6': {
      'ar': 'مناقشة',
      'en': '',
    },
    'croe4t9v': {
      'ar': 'قريبا...',
      'en': '',
    },
    '3j5mc38w': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // phone
  {
    'pj08y0ea': {
      'ar': 'Phone Sign In',
      'en': 'Phone Sign In',
    },
    'k3nt6gu4': {
      'ar': 'Type in your phone number below to register.',
      'en': 'Type in your phone number below to register.',
    },
    'hmhsy0p8': {
      'ar': 'Your Phone Number',
      'en': 'Your phone number',
    },
    'a4fvx5v5': {
      'ar': 'Please enter a valid number...',
      'en': 'Please enter a valid number...',
    },
    'fifumram': {
      'ar': 'Sign In with Phone',
      'en': 'Sign In with Phone',
    },
    'pp68jt2w': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // templet
  {
    'f799mmzg': {
      'ar': 'Home',
      'en': '',
    },
  },
  // coursesMainP
  {
    'osiako55': {
      'ar': 'مقرراتك',
      'en': '',
    },
    'himgxmna': {
      'ar': 'المقررات',
      'en': '',
    },
    '4yqyp1ua': {
      'ar': 'Label here...',
      'en': '',
    },
    'mczki72c': {
      'ar': 'Label here...',
      'en': '',
    },
    'iwuia2eo': {
      'ar': 'Home',
      'en': '',
    },
  },
  // home
  {
    '5jn91lg2': {
      'ar': 'Home',
      'en': '',
    },
  },
  // profilecom
  {
    'v7hcxpo4': {
      'ar': 'أكمل بياناتك الشخصية',
      'en': 'Complete your personal information',
    },
    'qwpocsnv': {
      'ar': 'Your full name',
      'en': 'Your full name',
    },
    'g9igp0cf': {
      'ar': 'اسمك الرباعي كما في البطاقة الشخصية',
      'en': 'Your full name as on the identity card',
    },
    '0h3khrj0': {
      'ar': 'اسمك كما تريد أن يظهر في الموقع',
      'en': 'Your name as you want it to appear on the site',
    },
    'lvlk34et': {
      'ar': 'اسمك كما سيعرض في الموقع',
      'en': 'Your name will also be displayed on the site',
    },
    'mgdoc3fd': {
      'ar': 'ذكر',
      'en': 'male',
    },
    '0e6axanz': {
      'ar': 'أنثى',
      'en': 'feminine',
    },
    'kw1bh5zd': {
      'ar': 'تاريخ ميلادك',
      'en': 'Date of birth',
    },
    '7mh62afm': {
      'ar': 'المحافظة',
      'en': 'Governorate',
    },
    '9uupkenh': {
      'ar': 'محافظتك',
      'en': 'your province',
    },
    'j1dw6028': {
      'ar': 'المدينة',
      'en': 'City',
    },
    '855c5g7f': {
      'ar': 'مدينتك',
      'en': 'your city',
    },
    'rccgwnou': {
      'ar': 'رقم الهاتف',
      'en': 'phone number',
    },
    'bw30njfw': {
      'ar': 'أدخل رقم هاتف صحيح لنتواصل معك',
      'en': 'Enter a valid phone number so we can contact you',
    },
    'ush8cpkq': {
      'ar': 'المدرسة',
      'en': 'the school',
    },
    '5q8qcupu': {
      'ar': 'الجامعة',
      'en': 'the university',
    },
    '9byc9fcs': {
      'ar': 'الدراسات العليا',
      'en': 'Graduate Studies',
    },
    'itd2nmyw': {
      'ar': 'المرحلة التعليمية',
      'en': 'educational level',
    },
    'cagbxidm': {
      'ar': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'muvs7cih': {
      'ar': 'مدرستك/جامعتك',
      'en': 'Your school/university',
    },
    'xiugu2x2': {
      'ar': 'اسم المدرسة أو الجامعة',
      'en': 'The name of the school or university',
    },
    'ix8oqo54': {
      'ar': 'الوظيفة',
      'en': 'Function',
    },
    'lmoflppu': {
      'ar': 'لا أعمل  إن كنت لا تعمل',
      'en': 'I don\'t work if you don\'t work',
    },
    '8woqghds': {
      'ar': 'أعزب',
      'en': 'bachelor',
    },
    'hnuqmn0j': {
      'ar': 'متزوج',
      'en': 'married',
    },
    'vfo3cgq4': {
      'ar': '0',
      'en': '0',
    },
    '17mwuvxt': {
      'ar': '1',
      'en': '1',
    },
    'at8227ae': {
      'ar': '2',
      'en': '2',
    },
    '80avjnss': {
      'ar': '3',
      'en': '3',
    },
    'tsi7qspv': {
      'ar': '4',
      'en': '4',
    },
    'fted8xym': {
      'ar': '5',
      'en': '5',
    },
    'aauhervs': {
      'ar': '6',
      'en': '6',
    },
    '1vi12prh': {
      'ar': '7',
      'en': '7',
    },
    '4gjkedkw': {
      'ar': '8',
      'en': '8',
    },
    'r2d78vuj': {
      'ar': '9',
      'en': '9',
    },
    '0q8pe8km': {
      'ar': '10',
      'en': '10',
    },
    '9gldkvby': {
      'ar': '11',
      'en': '11',
    },
    'nwjeyr4a': {
      'ar': '12',
      'en': '12',
    },
    '78g85my0': {
      'ar': '13',
      'en': '13',
    },
    'tcps35ir': {
      'ar': '14',
      'en': '14',
    },
    '9cfown2c': {
      'ar': '15',
      'en': '15',
    },
    'em1h6zm1': {
      'ar': '16',
      'en': '16',
    },
    '36x5jdj8': {
      'ar': '17',
      'en': '17',
    },
    '6slhx129': {
      'ar': '18',
      'en': '18',
    },
    'a2eg1q96': {
      'ar': '19',
      'en': '19',
    },
    'll6y4c0z': {
      'ar': '20',
      'en': '20',
    },
    'sfgchhv1': {
      'ar': '21',
      'en': '21',
    },
    'j1f886wk': {
      'ar': '22',
      'en': '22',
    },
    'grqiog00': {
      'ar': '23',
      'en': '23',
    },
    'nmx9fneo': {
      'ar': '24',
      'en': '24',
    },
    'cmy9ub2s': {
      'ar': '25',
      'en': '25',
    },
    'a2lxbrtg': {
      'ar': '26',
      'en': '26',
    },
    '86tmczda': {
      'ar': '27',
      'en': '27',
    },
    'erf4oimq': {
      'ar': '28',
      'en': '28',
    },
    'd8mdxpju': {
      'ar': '29',
      'en': '29',
    },
    'irgmas7s': {
      'ar': '30',
      'en': '30',
    },
    'r9sect5y': {
      'ar': 'ما تستحضره من القرآن',
      'en': 'What you conjure up from the Qur\'an',
    },
    'nq3l8ibc': {
      'ar': 'Search for an item...',
      'en': 'Search for an item...',
    },
    '1stytt58': {
      'ar': 'من رشحك',
      'en': 'Who nominated you?',
    },
    'ubpomo3j': {
      'ar': 'من رشحك للأكاديمية',
      'en': 'Who nominated you for the academy?',
    },
    'mfilvl2g': {
      'ar': 'معرف التليجرام',
      'en': 'Telegram ID',
    },
    '814qvihe': {
      'ar': 'أدخل معرف التليجرام الخاص بك',
      'en': 'Enter your Telegram ID',
    },
    '9c43t7fd': {
      'ar': 'حفظ',
      'en': 'save',
    },
    'zpt7m85s': {
      'ar': 'Field is required',
      'en': '',
    },
    '89edr0eq': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '85tm0xij': {
      'ar': 'Field is required',
      'en': '',
    },
    '7c2chhyl': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vqph4u96': {
      'ar': 'Field is required',
      'en': '',
    },
    '7b23mjtq': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qeq5tqi5': {
      'ar': 'Field is required',
      'en': '',
    },
    'mku0nfsp': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'rwp7uxb9': {
      'ar': 'Field is required',
      'en': '',
    },
    'a915ln5x': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0jqguqxd': {
      'ar': 'Field is required',
      'en': '',
    },
    'vxrdfxgo': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'h6phxbbw': {
      'ar': 'Field is required',
      'en': '',
    },
    '0odbfkdk': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'auj7vbul': {
      'ar': 'Field is required',
      'en': '',
    },
    'nh55pt13': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qql5b32m': {
      'ar': 'Field is required',
      'en': '',
    },
    'u95vn9wq': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // admin
  {
    '629m9ynp': {
      'ar': 'المستخدمون',
      'en': '',
    },
    'v3xtx0br': {
      'ar': 'المقررات',
      'en': '',
    },
    'au6eabfb': {
      'ar': 'إعدادات',
      'en': '',
    },
    '4zbw4h3v': {
      'ar': 'دفعات',
      'en': '',
    },
    'vu0bacgg': {
      'ar': 'المستخدمين',
      'en': '',
    },
    '760akqzt': {
      'ar': 'المستخدمين',
      'en': '',
    },
    'x0c7olsc': {
      'ar': 'Option 1',
      'en': '',
    },
    'wilf67oi': {
      'ar': 'Please select...',
      'en': '',
    },
    'go780svz': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'hw98brb2': {
      'ar': 'Home',
      'en': '',
    },
  },
  // supadmin
  {
    '7838i6we': {
      'ar': 'المستخدمون',
      'en': '',
    },
    'o47shd8x': {
      'ar': 'الدرجات',
      'en': '',
    },
    'coc3jj48': {
      'ar': 'قرآن',
      'en': '',
    },
    'j9u3nmwr': {
      'ar': '???????',
      'en': '',
    },
    't18zwr75': {
      'ar': 'Home',
      'en': '',
    },
  },
  // mentor
  {
    'b6lxnl3i': {
      'ar': 'Write something...',
      'en': '',
    },
    '6l1kf5kt': {
      'ar': 'إرسال',
      'en': '',
    },
    'olftj6ao': {
      'ar': 'Home',
      'en': '',
    },
  },
  // admincourses
  {
    'yjggrao1': {
      'ar': 'إضافة مقرر جديد',
      'en': '',
    },
    'fen21vrw': {
      'ar': 'Home',
      'en': '',
    },
  },
  // courseContent
  {
    'xvpj48zs': {
      'ar': 'المقررات',
      'en': '',
    },
    'r7h5h8wh': {
      'ar': 'الدروس',
      'en': 'Posts',
    },
    't4rn0ee6': {
      'ar': 'التدريبات',
      'en': 'Activity',
    },
    'rtk1fs2i': {
      'ar': 'المرفقات',
      'en': 'Followers',
    },
    'fnf1fc50': {
      'ar': 'نظرة عامة',
      'en': '',
    },
    '8dfw5opq': {
      'ar': 'Home',
      'en': '',
    },
  },
  // adminUsesrs
  {
    'ztvf9d4h': {
      'ar': 'الكلمة المفتاحية',
      'en': '',
    },
    'yinuubti': {
      'ar': 'عمر',
      'en': '',
    },
    'rnq67qsf': {
      'ar': 'علي',
      'en': '',
    },
    'ibpb95rt': {
      'ar': 'mentor',
      'en': '',
    },
    'pf12oghq': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'zoaxgyuf': {
      'ar': 'Label here...',
      'en': '',
    },
    'uimbm3xp': {
      'ar': 'Home',
      'en': '',
    },
  },
  // adminSupj
  {
    'l6f4ktny': {
      'ar': 'المقررات',
      'en': '',
    },
    'iegu9365': {
      'ar': 'Label here...',
      'en': '',
    },
    'd0qt9zff': {
      'ar': 'Label here...',
      'en': '',
    },
    'gn69rz11': {
      'ar': 'حفظ',
      'en': '',
    },
    'xixkpqf5': {
      'ar': 'الدروس',
      'en': 'Posts',
    },
    'umdwqedv': {
      'ar': 'إضافة درس',
      'en': '',
    },
    '72rbs0tm': {
      'ar': 'التدريبات',
      'en': 'Activity',
    },
    'fvdvt0vt': {
      'ar': 'إضافة تدريب',
      'en': '',
    },
    '1dy15lj7': {
      'ar': 'المرفقات',
      'en': 'Followers',
    },
    'fxvujbck': {
      'ar': 'اسم الملف',
      'en': '',
    },
    '0mkl5u13': {
      'ar': 'اسم الملف',
      'en': '',
    },
    'hrsc1yrh': {
      'ar': 'نوع الملف',
      'en': '',
    },
    'jwxb6u82': {
      'ar': 'نوع الملف',
      'en': '',
    },
    '6jawh0sk': {
      'ar': 'إضافة',
      'en': '',
    },
    'htv1tvo7': {
      'ar': 'نظرة عامة',
      'en': '',
    },
    'xlik10am': {
      'ar': 'Home',
      'en': '',
    },
  },
  // usersReports
  {
    '63dzf8pu': {
      'ar': 'عودة',
      'en': '',
    },
    'igtg7ss2': {
      'ar': 'عام',
      'en': '',
    },
    'ft9wbvm6': {
      'ar': '0%',
      'en': '',
    },
    '07d3w0th': {
      'ar': 'الاختبارات',
      'en': '',
    },
    'bayyg5ym': {
      'ar': '0%',
      'en': '',
    },
    'u6izaew9': {
      'ar': 'الاختبارات',
      'en': '',
    },
    '669l87et': {
      'ar': '0%',
      'en': '',
    },
    '2gi4514t': {
      'ar': 'التدريبات',
      'en': '',
    },
    'hj06mch2': {
      'ar': '0%',
      'en': '',
    },
    '4r0ldpyl': {
      'ar': 'الحضور',
      'en': '',
    },
    'xi7gzj3j': {
      'ar': '0%',
      'en': '',
    },
    '59bmmas1': {
      'ar': 'القرآن',
      'en': '',
    },
    '32u5qlo3': {
      'ar': '0%',
      'en': '',
    },
    'dxvm4q7f': {
      'ar': 'الاختبارات',
      'en': '',
    },
    'zkn9tcus': {
      'ar': '0%',
      'en': '',
    },
    'svbotqzw': {
      'ar': 'Button',
      'en': '',
    },
    '787i78sj': {
      'ar': '0%',
      'en': '',
    },
    'ho7ylym6': {
      'ar': 'التدريبات',
      'en': '',
    },
    'lv3vlrbm': {
      'ar': '0%',
      'en': '',
    },
    'm3thpohs': {
      'ar': 'الحضور',
      'en': '',
    },
    'e3vnrrtd': {
      'ar': '0%',
      'en': '',
    },
    'dvueqyjz': {
      'ar': 'القرآن',
      'en': '',
    },
    'fgjqlnww': {
      'ar': 'الاختبارات',
      'en': '',
    },
    '3w6fssc9': {
      'ar': '0%',
      'en': '',
    },
    '1f2u2tks': {
      'ar': 'التدريبات',
      'en': '',
    },
    '74yya3tn': {
      'ar': '0%',
      'en': '',
    },
    'p4wc6wm8': {
      'ar': 'الحضور/السماع',
      'en': '',
    },
    'hp7e4msv': {
      'ar': 'القرآن',
      'en': '',
    },
    'cjl6y3mp': {
      'ar': 'Home',
      'en': '',
    },
  },
  // adminSupjTest
  {
    '9ohkdx6w': {
      'ar': 'عودة :',
      'en': '',
    },
    'yvxjujcm': {
      'ar': 'اسم الاختبار',
      'en': '',
    },
    'nzkmokae': {
      'ar': 'الوقت/دقائق',
      'en': '',
    },
    'sw3y15s4': {
      'ar': 'المحاولات',
      'en': '',
    },
    'wbd19o85': {
      'ar': 'الترتيب',
      'en': '',
    },
    'p5qph9hc': {
      'ar': 'نهائي؟',
      'en': '',
    },
    'fd5e8spb': {
      'ar': 'إضافة سؤال',
      'en': '',
    },
    '5j57ipa6': {
      'ar': 'Home',
      'en': '',
    },
  },
  // graduation
  {
    '066bomf5': {
      'ar': 'Home',
      'en': '',
    },
  },
  // supadminUsersCopy4
  {
    '9dxwegoi': {
      'ar': 'Label here...',
      'en': '',
    },
    'qpmpqen0': {
      'ar': 'إعادة',
      'en': '',
    },
    'ed4t66m8': {
      'ar': '+ 10',
      'en': '',
    },
    'qf934bhy': {
      'ar': '-10',
      'en': '',
    },
    'suwu7sxt': {
      'ar': 'Home',
      'en': '',
    },
  },
  // adminCohorts
  {
    'np1xq5l9': {
      'ar': 'إضافة دفعة',
      'en': '',
    },
    'ugbr7iwt': {
      'ar': 'Home',
      'en': '',
    },
  },
  // mentorAdmin
  {
    'xkqq9ren': {
      'ar': 'Write something...',
      'en': '',
    },
    'koftasqh': {
      'ar': 'إرسال',
      'en': '',
    },
    '5m2fhcw9': {
      'ar': 'Home',
      'en': '',
    },
  },
  // cohortsPage
  {
    'g7kys2xv': {
      'ar': 'Label here...',
      'en': '',
    },
    'n4jhsjjd': {
      'ar': 'طلاب الدفعة',
      'en': '',
    },
    'tth14oox': {
      'ar': 'Label here...',
      'en': '',
    },
    'k6b9onwq': {
      'ar': 'حذف',
      'en': '',
    },
    'gwk69eqk': {
      'ar': 'الطلاب المحتملون',
      'en': '',
    },
    '4db7qahm': {
      'ar': 'Label here...',
      'en': '',
    },
    'd3vey4hq': {
      'ar': 'Home',
      'en': '',
    },
  },
  // privacyAndPolicy
  {
    'c8ii3k96': {
      'ar':
          'بعد أن وصلتنا الكثير من طلبات الالتحاق بالدراسة في الأكاديمية:\n📌 نعلن عن إعادة فتح التسجيل استثنائيًا لفترة محدودة:\n📖أكاديمية العلوم الإسلامية📖\n⭐️تفتح لك آفاق التعلم  على أيدي نخبة من المتخصصين في العلوم الشرعية\n⭐️مدة الدراسة عامان ينتهي الطالب فيها من فرض العين، وهو ما لا يسع المسلم جهله\n⭐️يتأسس الطالب فيها في جميع العلوم الشرعية\nكالفقه والعقيدة والنحو والصرف وأصول الفقه ومصطلح الحديث وعلوم القرآن والتجويد\n🎁 البرنامج مجاني\n⚡️وأهم ما يميز الدراسة في الأكاديمية⚡️\n▪️البث المباشر لجميع المحاضرات، ليتمكن الطالب من التفاعل مع المحاضر لئلا تكون المحاضرة مجرد تلقين 🎦\n▪️نظام الإشراف الدراسي بحيث يوجد لكل طالبٍ مشرفٌ يتابع حضوره، ويجيب على إشكالاته🛂\n▪️التدريبات الدورية على كل محاضرة ليتمكن الطالب من تثبيت المعلومات📝\n▪️الاهتمام بالجانب التربوي والعملي لكيلا  يكون (العلم) مجردًا عن العمل 🫀\n📝رابط قناة التمهيدية يظهر لك بعد ملء الاستمارة، لذا تأكد من التحاقك بالقناة بعد التسجيل\n\nرابط التسجيل:\nhttps://islamicacad-114.web.app/\n\nبادر بالانضمام الآن.\n🍃 شاركونا الأجر ودلوا أخوانكم على هذا الخير',
      'en': '',
    },
    'sulwsa7q': {
      'ar': 'Home',
      'en': '',
    },
  },
  // supadminGrades
  {
    'buxhh9id': {
      'ar': 'Search users...',
      'en': '',
    },
    'yjdkq3qw': {
      'ar': 'Please select...',
      'en': '',
    },
    'nqsld8sb': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'rxkvw1c8': {
      'ar': 'User Information',
      'en': '',
    },
    'efi029p3': {
      'ar': 'المجموع العام',
      'en': '',
    },
    '8623d4z3': {
      'ar': 'الاختبارات',
      'en': '',
    },
    '6wxr2uzz': {
      'ar': 'التدريبات',
      'en': '',
    },
    'f9apkamk': {
      'ar': 'الحضور',
      'en': '',
    },
    'jf6mvh6z': {
      'ar': 'القرآن',
      'en': '',
    },
    'l8tsv289': {
      'ar': '100',
      'en': '',
    },
    'cofoem6d': {
      'ar': '100',
      'en': '',
    },
    '2tat3nca': {
      'ar': '100',
      'en': '',
    },
    'ztn5qrix': {
      'ar': '100',
      'en': '',
    },
    'vbu2j86q': {
      'ar': '100',
      'en': '',
    },
    'nodtbyvi': {
      'ar': '100',
      'en': '',
    },
    'egr7eejv': {
      'ar': '100',
      'en': '',
    },
    'ebiu3zwk': {
      'ar': '100',
      'en': '',
    },
    'd2tcmjpv': {
      'ar': '100',
      'en': '',
    },
    'hgryojz3': {
      'ar': '100',
      'en': '',
    },
    'nawyz78n': {
      'ar': 'Home',
      'en': '',
    },
  },
  // supadminGrading
  {
    'zsufkoex': {
      'ar': 'Home',
      'en': '',
    },
  },
  // supadminquran
  {
    'zifkvlse': {
      'ar': 'الفصل الدراسي',
      'en': '',
    },
    'ffs1b4ph': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'qtzbqjcx': {
      'ar': 'الكلمة المفتاحية',
      'en': '',
    },
    '3hnjok87': {
      'ar': 'Label here...',
      'en': '',
    },
    '7a72nucs': {
      'ar': 'Home',
      'en': '',
    },
  },
  // testContent
  {
    'xkpzpi1w': {
      'ar': 'خروج وتسليم',
      'en': '',
    },
    'xqhpjcuq': {
      'ar': 'عودة',
      'en': '',
    },
    'arj0o93c': {
      'ar': 'إعادة الاختبار',
      'en': '',
    },
    'ixjgo1s8': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // adminCopy
  {
    'ccd1tvzs': {
      'ar': 'المستخدمون',
      'en': '',
    },
    'ngmuhrj3': {
      'ar': 'المقررات',
      'en': '',
    },
    'aw0znc7b': {
      'ar': 'إعدادات',
      'en': '',
    },
    '2vuljdde': {
      'ar': 'دفعات',
      'en': '',
    },
    '2uegcej5': {
      'ar': 'المستخدمين',
      'en': '',
    },
    'n8ny56bu': {
      'ar': 'المستخدمين',
      'en': '',
    },
    'mntkjyez': {
      'ar': 'Option 1',
      'en': '',
    },
    'za2is2um': {
      'ar': 'Please select...',
      'en': '',
    },
    'nsem8xfz': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'etimzbrh': {
      'ar': 'Home',
      'en': '',
    },
  },
  // adminCopyCopy
  {
    'qlc51a8p': {
      'ar': 'Home',
      'en': '',
    },
  },
  // adminUsesrsCopy
  {
    'nvvh3h26': {
      'ar': 'ملف كامل',
      'en': '',
    },
    'l61l9pvc': {
      'ar': 'تم الفحص',
      'en': '',
    },
    'yz0ua2sh': {
      'ar': 'حساب حقيقي',
      'en': '',
    },
    'fmnneew4': {
      'ar': 'كل الطلاب',
      'en': '',
    },
    'ca9c2hvb': {
      'ar': 'الكلمة المفتاحية',
      'en': '',
    },
    'ejcsicha': {
      'ar': 'عمر',
      'en': '',
    },
    '8msnwaur': {
      'ar': 'علي',
      'en': '',
    },
    'tl87i484': {
      'ar': 'mentor',
      'en': '',
    },
    'd45ttaq7': {
      'ar': 'Search for an item...',
      'en': '',
    },
    '2pj24z37': {
      'ar': 'Label here...',
      'en': '',
    },
    'fxshae4p': {
      'ar': 'Home',
      'en': '',
    },
  },
  // profileCopy
  {
    'ysbxmdv3': {
      'ar': 'ملفك الشخصي',
      'en': 'personal file',
    },
    'c0j7kc3z': {
      'ar': 'بطاقة المشرف الدراسي:',
      'en': '',
    },
    'aup1h5xa': {
      'ar': 'مشرف دراسي',
      'en': '',
    },
    'w0hxe60r': {
      'ar': 'إعدادات الحساب',
      'en': 'account settings',
    },
    '78vzxu7j': {
      'ar': 'تغيير كلمة المرور',
      'en': 'change password',
    },
    '7ikdmbdo': {
      'ar': 'تعديل بياناتك الشخصية',
      'en': 'Modify your personal data',
    },
    '2s3xa0eu': {
      'ar': 'اذهب للقناة العامة',
      'en': 'Go to the telegram channel',
    },
    's62nhxdw': {
      'ar': 'اذهب للقناة العامة',
      'en': 'Go to the telegram channel',
    },
    'gzw5j170': {
      'ar': 'اذهب للمجموعة التفاعلية',
      'en': 'Go to the telegram channel',
    },
    'xnbtou1z': {
      'ar': 'تحميل بيانات الطلاب',
      'en': 'Go to the telegram channel',
    },
  },
  // courseContentCopy
  {
    '37r4wpcv': {
      'ar': 'المقررات',
      'en': '',
    },
    'g58fgouz': {
      'ar': 'الدروس',
      'en': 'Posts',
    },
    '04zzf67g': {
      'ar': 'التدريبات',
      'en': 'Activity',
    },
    'z4tzg7fl': {
      'ar': 'المرفقات',
      'en': 'Followers',
    },
    'ad4shwt6': {
      'ar': 'نظرة عامة',
      'en': '',
    },
    '0wi7n7vr': {
      'ar': 'Home',
      'en': '',
    },
  },
  // lessonContentCopy
  {
    'x3xewqf8': {
      'ar': 'المقررات',
      'en': '',
    },
    '33kzr7ek': {
      'ar': 'Label here...',
      'en': '',
    },
    '32nqrtr6': {
      'ar': 'audio',
      'en': '',
    },
    '82vph9tm': {
      'ar': 'ملاحظات',
      'en': 'Posts',
    },
    'nsifsdro': {
      'ar': 'التدريبات',
      'en': 'Activity',
    },
    'hv1eg4r8': {
      'ar': 'المرفقات',
      'en': 'Followers',
    },
    'm4mmxe9h': {
      'ar': '01 باب الطهارة',
      'en': '',
    },
    'pqyb3rus': {
      'ar': '45Min',
      'en': '',
    },
    'mn1u7agr': {
      'ar': 'الشيخ هشام فؤاد',
      'en': '',
    },
    's9bmi2i1': {
      'ar': 'مناقشة',
      'en': '',
    },
    'bg5senim': {
      'ar': 'قريبا...',
      'en': '',
    },
    'fhkwmlgf': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // supadminGradesCopy
  {
    'e3702kfj': {
      'ar': 'Search users...',
      'en': '',
    },
    'cklmadth': {
      'ar': 'محدث',
      'en': '',
    },
    'hm6qy9d0': {
      'ar': 'User Information',
      'en': '',
    },
    '2yi8wqqb': {
      'ar': 'Please select...',
      'en': '',
    },
    '2p4rp3e6': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'f04hnanl': {
      'ar': 'Home',
      'en': '',
    },
  },
  // reportMaker
  {
    '2fyylp6u': {
      'ar': 'Home',
      'en': '',
    },
  },
  // supadminUsers
  {
    'ex3ljpf2': {
      'ar': '1',
      'en': '',
    },
    'ui6y85m9': {
      'ar': '1',
      'en': '',
    },
    's8w4jqss': {
      'ar': '1',
      'en': '',
    },
    '2yipmiih': {
      'ar':
          'اكتب @ في محرك البحث لإظهر الجميع\nكما يمكنك البحث عن الطلبة بالاسم أو الإيميل أو رقم الهاتف وسيظهر لك كل النتائج القريبة من كلمة البحث',
      'en': '',
    },
    'ee7e2ius': {
      'ar': 'الكلمة المفتاحية',
      'en': '',
    },
    '8amvycag': {
      'ar': 'Label here...',
      'en': '',
    },
    'gu07cjrb': {
      'ar': 'Home',
      'en': '',
    },
  },
  // supadminUsersCopy2
  {
    'grhhc7p7': {
      'ar': 'Label here...',
      'en': '',
    },
    '5jbbr16t': {
      'ar': '+ 10',
      'en': '',
    },
    'uhcmwkd8': {
      'ar': '-10',
      'en': '',
    },
    'gkk6vin1': {
      'ar': 'Home',
      'en': '',
    },
  },
  // cohortsPageCopy
  {
    '3mpxmc6x': {
      'ar': 'Label here...',
      'en': '',
    },
    'yp5ge4u4': {
      'ar': 'طلاب الدفعة',
      'en': '',
    },
    'bt6w79zx': {
      'ar': 'Label here...',
      'en': '',
    },
    'iyj9uksi': {
      'ar': 'الطلاب المحتملون',
      'en': '',
    },
    'celg8axf': {
      'ar': 'Label here...',
      'en': '',
    },
    'hypz8cmq': {
      'ar': 'Home',
      'en': '',
    },
  },
  // supadminUsersCopy3
  {
    'a1fd7wlh': {
      'ar': 'Label here...',
      'en': '',
    },
    '5qxi655i': {
      'ar': 'إعادة',
      'en': '',
    },
    'cp17d8ww': {
      'ar': '+ 10',
      'en': '',
    },
    '0qypyvmv': {
      'ar': '-10',
      'en': '',
    },
    'y2w8h04r': {
      'ar': 'Home',
      'en': '',
    },
  },
  // homePage
  {
    'rnbw1whm': {
      'ar': 'Home',
      'en': '',
    },
  },
  // lessonContent
  {
    'qeu7s3q7': {
      'ar': 'المقررات',
      'en': '',
    },
    'ouurzm85': {
      'ar': 'عودة',
      'en': '',
    },
    '22g8w5pl': {
      'ar': 'Label here...',
      'en': '',
    },
    'tdk406pt': {
      'ar': 'audio',
      'en': '',
    },
    '4yn25ip6': {
      'ar': 'ملاحظات',
      'en': 'Posts',
    },
    'jt9wpj3d': {
      'ar': 'التدريبات',
      'en': 'Activity',
    },
    'uz19pspv': {
      'ar': 'المرفقات',
      'en': 'Followers',
    },
    'mbjhe1ia': {
      'ar': '01 باب الطهارة',
      'en': '',
    },
    '93azk43n': {
      'ar': '45Min',
      'en': '',
    },
    'm8e1pg7y': {
      'ar': 'الشيخ هشام فؤاد',
      'en': '',
    },
    'avvhdkqb': {
      'ar': 'مناقشة',
      'en': '',
    },
    'c5pentji': {
      'ar': 'قريبا...',
      'en': '',
    },
    'jhytwwxc': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // lessonContentCopy0
  {
    'imqndd7c': {
      'ar': 'المقررات',
      'en': '',
    },
    'aw6vkjip': {
      'ar': 'Label here...',
      'en': '',
    },
    'vd2nloli': {
      'ar': 'audio',
      'en': '',
    },
    'ui44w5i4': {
      'ar': 'ملاحظات',
      'en': 'Posts',
    },
    'nyla17z6': {
      'ar': 'التدريبات',
      'en': 'Activity',
    },
    'ju3tzknt': {
      'ar': 'المرفقات',
      'en': 'Followers',
    },
    'afw7cnq8': {
      'ar': '01 باب الطهارة',
      'en': '',
    },
    '66z7evzr': {
      'ar': '45Min',
      'en': '',
    },
    'j689yvx7': {
      'ar': 'الشيخ هشام فؤاد',
      'en': '',
    },
    'we9nay0g': {
      'ar': 'مناقشة',
      'en': '',
    },
    'lm81kkm4': {
      'ar': 'قريبا...',
      'en': '',
    },
    '00xanlxe': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // testContentCopy
  {
    'cvuoit85': {
      'ar': 'خروج وتسليم',
      'en': '',
    },
    'flqtqb8j': {
      'ar': 'عودة',
      'en': '',
    },
    'jvts5wln': {
      'ar': 'إعادة الاختبار',
      'en': '',
    },
    '5ptfjk7i': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // nav0
  {
    'esw15m16': {
      'ar': 'القائمة',
      'en': 'Menu',
    },
    'a3sx8jjy': {
      'ar': 'الرئيسية',
      'en': 'Main',
    },
    '1hseigfn': {
      'ar': 'المقررات',
      'en': 'courses',
    },
    'q3lxl1sw': {
      'ar': 'التقييمات',
      'en': 'Grades',
    },
    'lakv1u0t': {
      'ar': 'الملف الشخصي',
      'en': 'Profile Page',
    },
    'pt9321zl': {
      'ar': 'المشرف الدراسي',
      'en': ' Supervisor',
    },
    'hg3tv3bt': {
      'ar': 'إدارة',
      'en': 'Exit',
    },
    'szgiu4ha': {
      'ar': 'إدارة الإشراف',
      'en': 'Exit',
    },
    '25t3ycic': {
      'ar': 'خروج',
      'en': 'Exit',
    },
    'ykmaj08e': {
      'ar': '2023-12-01/1:00AM',
      'en': '',
    },
  },
  // headerCopy
  {
    '9fbxvm5j': {
      'ar': '1',
      'en': '',
    },
  },
  // topbar
  {
    '59gnxwgb': {
      'ar': '1',
      'en': '',
    },
  },
  // profilecomp
  {
    'qkxpxjf0': {
      'ar':
          'تنبيه\nهناك بيانات شخصية ناقصة\nنرجو استكمالها حتى تتمكن من التنقل في الموقع',
      'en': '',
    },
    '07c9b4rm': {
      'ar': 'استكمل الملف',
      'en': '',
    },
  },
  // usersData
  {
    'e0qt9s4z': {
      'ar': 'البيانات الشخصية',
      'en': '',
    },
    'bmygnn6g': {
      'ar': 'ذكر',
      'en': 'male',
    },
    'a4n9weht': {
      'ar': 'أنثى',
      'en': 'feminine',
    },
    'u60w71s0': {
      'ar': 'أعزب',
      'en': 'bachelor',
    },
    'bs9vraq4': {
      'ar': 'متزوج',
      'en': 'married',
    },
    '0yoaw6lo': {
      'ar': 'تاريخ ميلادك',
      'en': 'Date of birth',
    },
    '6oap9n69': {
      'ar': 'المرحلة الدراسية',
      'en': '',
    },
    'jj4rskdb': {
      'ar': 'المدرسة',
      'en': 'the school',
    },
    'fju229jc': {
      'ar': 'الجامعة',
      'en': 'the university',
    },
    'zxcepqfc': {
      'ar': 'الدراسات العليا',
      'en': 'Graduate Studies',
    },
    '9vmww30l': {
      'ar': 'المرحلة التعليمية',
      'en': 'educational level',
    },
    '9k9lpkah': {
      'ar': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'jmzi99bd': {
      'ar': 'ما تستحضره من القرآن',
      'en': '',
    },
    'r0y1c5hw': {
      'ar': '0',
      'en': '0',
    },
    'cmm5dfbc': {
      'ar': '1',
      'en': '1',
    },
    'ia20hs9l': {
      'ar': '2',
      'en': '2',
    },
    '2ylqe83r': {
      'ar': '3',
      'en': '3',
    },
    'qsfbzam4': {
      'ar': '4',
      'en': '4',
    },
    'nl18dnlj': {
      'ar': '5',
      'en': '5',
    },
    '33hbyji5': {
      'ar': '6',
      'en': '6',
    },
    'l817m35x': {
      'ar': '7',
      'en': '7',
    },
    'fq77q4hb': {
      'ar': '8',
      'en': '8',
    },
    '7uj2704b': {
      'ar': '9',
      'en': '9',
    },
    '0dswsnfo': {
      'ar': '10',
      'en': '10',
    },
    '2crwc0j7': {
      'ar': '11',
      'en': '11',
    },
    '8eybycgp': {
      'ar': '12',
      'en': '12',
    },
    '6a16f69k': {
      'ar': '13',
      'en': '13',
    },
    '10ofinxh': {
      'ar': '14',
      'en': '14',
    },
    'ocsq2wgw': {
      'ar': '15',
      'en': '15',
    },
    'omqvto49': {
      'ar': '16',
      'en': '16',
    },
    'pcrxzi77': {
      'ar': '17',
      'en': '17',
    },
    'hr1bquie': {
      'ar': '18',
      'en': '18',
    },
    'p4kkoz3b': {
      'ar': '19',
      'en': '19',
    },
    'pah7be86': {
      'ar': '20',
      'en': '20',
    },
    'wyfqkfqq': {
      'ar': '21',
      'en': '21',
    },
    'h17v3f68': {
      'ar': '22',
      'en': '22',
    },
    'gr181y9f': {
      'ar': '23',
      'en': '23',
    },
    'x88wvtol': {
      'ar': '24',
      'en': '24',
    },
    'wvb5fy0o': {
      'ar': '25',
      'en': '25',
    },
    '05vlmy61': {
      'ar': '26',
      'en': '26',
    },
    '7od4w68j': {
      'ar': '27',
      'en': '27',
    },
    '6fjr2dey': {
      'ar': '28',
      'en': '28',
    },
    'by6nqmij': {
      'ar': '29',
      'en': '29',
    },
    'o3pjxlvl': {
      'ar': '30',
      'en': '30',
    },
    '5n7jwpcz': {
      'ar': 'ما تستحضره من القرآن',
      'en': 'What you conjure up from the Qur\'an',
    },
    '6hbkma8l': {
      'ar': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'ol4gnn1g': {
      'ar': 'اسم المستخدك',
      'en': '',
    },
    'z0gx5rbv': {
      'ar': 'الاسم كما في البطاقة',
      'en': '',
    },
    'p3g98a0c': {
      'ar': 'رقم الهاتف',
      'en': '',
    },
    'iwth4dko': {
      'ar': 'المحافظة',
      'en': '',
    },
    's5anf7aj': {
      'ar': 'المدينة',
      'en': '',
    },
    'xw3lmkr9': {
      'ar': 'الوظيفة',
      'en': '',
    },
    'd6rhla5y': {
      'ar': 'من رشحك للأكاديمية',
      'en': '',
    },
    'uukko0u6': {
      'ar': 'معرف التليجرام الخاص بك',
      'en': '',
    },
    'mxeqvrug': {
      'ar': 'confirm',
      'en': '',
    },
  },
  // categ
  {
    'pog9nik6': {
      'ar': 'Facility Name Here',
      'en': '',
    },
    'uv1nvrsx': {
      'ar': 'Facility Type',
      'en': '',
    },
    'z8st0mkm': {
      'ar': 'Past Inspections ',
      'en': '',
    },
    'pf3afjom': {
      'ar': '24',
      'en': '',
    },
  },
  // mentors
  {
    'n5xoxblm': {
      'ar': 'عمر',
      'en': '',
    },
    'eu06fjbk': {
      'ar': 'علي',
      'en': '',
    },
    'fabigh00': {
      'ar': 'mentor',
      'en': '',
    },
    'pdukbd7b': {
      'ar': 'Search for an item...',
      'en': '',
    },
  },
  // searcher
  {
    '2x2401f7': {
      'ar': 'النوع',
      'en': '',
    },
    '6xg34esm': {
      'ar': 'ذكر',
      'en': '',
    },
    'czpr78ko': {
      'ar': 'أنثى',
      'en': '',
    },
    'o2ait97l': {
      'ar': 'بحث عن',
      'en': '',
    },
    'srpay2x0': {
      'ar': 'Label here...',
      'en': '',
    },
    '2kw4z0lb': {
      'ar': 'المشرف',
      'en': '',
    },
    'rt54pij8': {
      'ar': 'Option 1',
      'en': '',
    },
    'utsrmxyu': {
      'ar': 'Search for an item...',
      'en': '',
    },
  },
  // addCateg
  {
    'uxjzjhtp': {
      'ar': 'إضافة مقرر جديد',
      'en': '',
    },
    'msm2qyqn': {
      'ar': 'الاسم',
      'en': '',
    },
    '96094ff7': {
      'ar': 'الاسم',
      'en': '',
    },
    '38hrt5w3': {
      'ar': 'الوصف',
      'en': '',
    },
    'hokx0t5p': {
      'ar': 'الوصف',
      'en': '',
    },
    'utlup2d7': {
      'ar': 'المستوى الأعلى',
      'en': '',
    },
    '195d74c3': {
      'ar': '0',
      'en': '',
    },
    'l2dt31hb': {
      'ar': '5',
      'en': '',
    },
    '9wpdnmpe': {
      'ar': '10',
      'en': '',
    },
    'es43npmc': {
      'ar': '15',
      'en': '',
    },
    'p0s0ul63': {
      'ar': '20',
      'en': '',
    },
    '1thh5xms': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'uvfskngv': {
      'ar': 'أضف  دفعة',
      'en': '',
    },
    'ctskw8li': {
      'ar': '0',
      'en': '',
    },
    'lwi1ratf': {
      'ar': '5',
      'en': '',
    },
    'pwxq4xgs': {
      'ar': '10',
      'en': '',
    },
    'r8zci5nd': {
      'ar': '15',
      'en': '',
    },
    'h0ft4ce5': {
      'ar': '20',
      'en': '',
    },
    'lm7jmh7i': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'a4n9chfs': {
      'ar': 'إضافة',
      'en': '',
    },
    'c14talvx': {
      'ar': 'إضافة مقرر جديد',
      'en': '',
    },
    'att07f3l': {
      'ar': 'الاسم',
      'en': '',
    },
    'c8xoape7': {
      'ar': 'الاسم',
      'en': '',
    },
    'ut6xwwrz': {
      'ar': 'الوصف',
      'en': '',
    },
    'ix4ukzbe': {
      'ar': 'الوصف',
      'en': '',
    },
    '3bdpx168': {
      'ar': 'المستوى الأعلى',
      'en': '',
    },
    '98t81jy5': {
      'ar': '0',
      'en': '',
    },
    '8dniyrx6': {
      'ar': '5',
      'en': '',
    },
    'v9wmxaw1': {
      'ar': '10',
      'en': '',
    },
    's6y8svo2': {
      'ar': '15',
      'en': '',
    },
    'aiydhagx': {
      'ar': '20',
      'en': '',
    },
    '6gwn3fbx': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'offi38pq': {
      'ar': 'أضف  دفعة',
      'en': '',
    },
    'ee2hqm5j': {
      'ar': '0',
      'en': '',
    },
    'd70sl18u': {
      'ar': '5',
      'en': '',
    },
    'site0nmp': {
      'ar': '10',
      'en': '',
    },
    'a4ynof1i': {
      'ar': '15',
      'en': '',
    },
    '7vbo164m': {
      'ar': '20',
      'en': '',
    },
    '5ewsmhnt': {
      'ar': 'Search for an item...',
      'en': '',
    },
    '3i8g78n4': {
      'ar': 'إضافة',
      'en': '',
    },
  },
  // addSup
  {
    '7thew4iq': {
      'ar': 'إضافة مادة جديدة',
      'en': '',
    },
    'u06ts047': {
      'ar': 'الاسم',
      'en': '',
    },
    'v59pfwd8': {
      'ar': 'الاسم',
      'en': '',
    },
    'knnrftfw': {
      'ar': 'الوصف',
      'en': '',
    },
    'ly208f69': {
      'ar': 'الوصف',
      'en': '',
    },
    'cjnw3329': {
      'ar': 'المعلم',
      'en': '',
    },
    'via37azl': {
      'ar': 'المعلم',
      'en': '',
    },
    '01sgawum': {
      'ar': 'أضف دفعة',
      'en': '',
    },
    '83jndebt': {
      'ar': '0',
      'en': '',
    },
    'kduuqnwy': {
      'ar': '5',
      'en': '',
    },
    'fbbkgkxn': {
      'ar': '10',
      'en': '',
    },
    'j2y8yffe': {
      'ar': '15',
      'en': '',
    },
    'wvki6gcy': {
      'ar': '20',
      'en': '',
    },
    'oz57eu6z': {
      'ar': 'Search for an item...',
      'en': '',
    },
    '83uvv36m': {
      'ar': 'إضافة',
      'en': '',
    },
    'xmqu4rzm': {
      'ar': 'إضافة مادة جديدة',
      'en': '',
    },
    'a4edgg73': {
      'ar': 'الاسم',
      'en': '',
    },
    'wywj2imz': {
      'ar': 'الاسم',
      'en': '',
    },
    'n1zkxdhy': {
      'ar': 'الوصف',
      'en': '',
    },
    'lpvt1rn9': {
      'ar': 'الوصف',
      'en': '',
    },
    'c2dgg790': {
      'ar': 'المعلم',
      'en': '',
    },
    'qb018wnr': {
      'ar': 'المعلم',
      'en': '',
    },
    'fz7qm9mo': {
      'ar': 'أضف دفعة',
      'en': '',
    },
    'zn3t7qy8': {
      'ar': '0',
      'en': '',
    },
    'hgjc9hsg': {
      'ar': '5',
      'en': '',
    },
    '9jsvmjdg': {
      'ar': '10',
      'en': '',
    },
    'tipaagng': {
      'ar': '15',
      'en': '',
    },
    'oag8nylk': {
      'ar': '20',
      'en': '',
    },
    'farc4dm0': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'tkemlyr6': {
      'ar': 'إضافة',
      'en': '',
    },
  },
  // question
  {
    'waaaxdrr': {
      'ar': 'Option 1',
      'en': '',
    },
    'xexytma0': {
      'ar': 'ghf',
      'en': '',
    },
    'j5y0jaiu': {
      'ar': 'sdfg',
      'en': '',
    },
    'bf83n77l': {
      'ar': 'dsfg',
      'en': '',
    },
  },
  // answers
  {
    'f8b8blol': {
      'ar': 'Option 1',
      'en': '',
    },
    'vdn8r623': {
      'ar': 'اختر الإجابة الصيحة',
      'en': '',
    },
    'vvgygmig': {
      'ar': 'Search for an item...',
      'en': '',
    },
  },
  // options
  {
    '755kk7ha': {
      'ar': 'Option 1',
      'en': '',
    },
    'yki6e92l': {
      'ar': 'ghf',
      'en': '',
    },
    '4gxezvcl': {
      'ar': 'sdfg',
      'en': '',
    },
    's4mw4prf': {
      'ar': 'dsfg',
      'en': '',
    },
  },
  // report
  {
    '5w0jcdwg': {
      'ar': 'Options',
      'en': '',
    },
    'kl63jr4v': {
      'ar': 'Replace Widget',
      'en': '',
    },
    'lf7adv0c': {
      'ar': 'Wrap Widget',
      'en': '',
    },
    '1r8t2rml': {
      'ar': 'Copy Widget Code',
      'en': '',
    },
    'ky4b3pcg': {
      'ar': 'Save as Theme Style',
      'en': '',
    },
  },
  // addActiti
  {
    'eon1p79a': {
      'ar': 'إضافة مادة جديدة',
      'en': '',
    },
    'xmg0rj9l': {
      'ar': 'الاسم',
      'en': '',
    },
    'n1pmq6vd': {
      'ar': 'الاسم',
      'en': '',
    },
    'dy54lrvw': {
      'ar': 'الرابط',
      'en': '',
    },
    'w8hyc7r0': {
      'ar': 'الرابط',
      'en': '',
    },
    '4vmflrde': {
      'ar': 'الوصف',
      'en': '',
    },
    '9fs6nw88': {
      'ar': 'الوصف',
      'en': '',
    },
    '5pt8mdg2': {
      'ar': 'ترتيب الدرس',
      'en': '',
    },
    'swdrpddm': {
      'ar': 'ترتيب الدرس',
      'en': '',
    },
    'tfw48j3b': {
      'ar': 'إضافة',
      'en': '',
    },
    'pw1pu8s9': {
      'ar': 'إضافة مادة جديدة',
      'en': '',
    },
    'yct6sdef': {
      'ar': 'الاسم',
      'en': '',
    },
    '4i2zktqz': {
      'ar': 'الاسم',
      'en': '',
    },
    'a9lug22k': {
      'ar': 'الرابط',
      'en': '',
    },
    'w2os8j89': {
      'ar': 'الرابط',
      'en': '',
    },
    'jexo6cb9': {
      'ar': 'الوصف',
      'en': '',
    },
    '4d4eapks': {
      'ar': 'الوصف',
      'en': '',
    },
    '32lqjz14': {
      'ar': 'ترتيب الدرس',
      'en': '',
    },
    'hnzmhrfz': {
      'ar': 'ترتيب الدرس',
      'en': '',
    },
    '81pcdp5i': {
      'ar': 'إضافة',
      'en': '',
    },
  },
  // settings
  {
    'fpcxp5mr': {
      'ar': 'الاشتراكات',
      'en': '',
    },
    'nm7vv6k9': {
      'ar': 'فتح أو قفل الاشتراكات',
      'en': '',
    },
  },
  // lessonOrder
  {
    'x0025nu7': {
      'ar': 'رقم ترتيب الدرس',
      'en': '',
    },
  },
  // lessonName
  {
    'cyn65jhp': {
      'ar': 'اسم  الدرس',
      'en': '',
    },
  },
  // lessonDecrip
  {
    'xrprzwjm': {
      'ar': 'وصف الدرس',
      'en': '',
    },
  },
  // lessonYoutube
  {
    '4zb1z8t1': {
      'ar': 'youtube',
      'en': '',
    },
  },
  // lessonTime
  {
    'b4gfg2x7': {
      'ar': 'وقت الدرس بالدقائق',
      'en': '',
    },
  },
  // QandA
  {
    'js2raet2': {
      'ar': 'الترتيب',
      'en': '',
    },
    '5c93crrz': {
      'ar': 'نص السؤال',
      'en': '',
    },
  },
  // Qoptions
  {
    '8yv5oy6l': {
      'ar': 'نص الاختيار',
      'en': '',
    },
  },
  // QbankAnswer
  {
    'x1q9e0nv': {
      'ar': 'Option 1',
      'en': '',
    },
  },
  // QbankAnswerCopy
  {
    'gjzv5iec': {
      'ar': 'Option 1',
      'en': '',
    },
  },
  // cohorts
  {
    'eo7qrn89': {
      'ar': 'Label here...',
      'en': '',
    },
    'rnpc8mhc': {
      'ar': 'إزالة',
      'en': '',
    },
    '9tc7c3i6': {
      'ar': 'إضافة',
      'en': '',
    },
    '1nev101p': {
      'ar': 'طلاب الدفعة',
      'en': '',
    },
    'qj3ptqfv': {
      'ar': 'Label here...',
      'en': '',
    },
    '0t0phdxf': {
      'ar': 'الطلاب المحتملون',
      'en': '',
    },
    'aifjdlld': {
      'ar': 'Label here...',
      'en': '',
    },
  },
  // quranGrade
  {
    'aj7xh27z': {
      'ar': 'الدرجة...',
      'en': '',
    },
  },
  // quranupdate
  {
    'nchzusuy': {
      'ar': 'Label here...',
      'en': '',
    },
  },
  // quranCreate
  {
    '1mn40xvq': {
      'ar': 'Label here...',
      'en': '',
    },
  },
  // QbankAnswerCopy2
  {
    '8rjhz99a': {
      'ar': 'Option 1',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'i81p3qm5': {
      'ar': '',
      'en': '',
    },
    'lo98i0yj': {
      'ar': '',
      'en': '',
    },
    '03nzooe7': {
      'ar': 'plz',
      'en': 'plz',
    },
    'yc3qtg24': {
      'ar': 'plz',
      'en': '',
    },
    'kjram0io': {
      'ar': '',
      'en': '',
    },
    '2h1d4vkl': {
      'ar': '',
      'en': '',
    },
    'jkj06vbi': {
      'ar': '',
      'en': '',
    },
    'ooxq7bxi': {
      'ar': '',
      'en': '',
    },
    '0x8iyolw': {
      'ar': '',
      'en': '',
    },
    'fdx7kn87': {
      'ar': '',
      'en': '',
    },
    '3wqbzeec': {
      'ar': '',
      'en': '',
    },
    'wu4j2fj5': {
      'ar': '',
      'en': '',
    },
    'tvgz020j': {
      'ar': '',
      'en': '',
    },
    'wjxyxesq': {
      'ar': '',
      'en': '',
    },
    'g2ef90fq': {
      'ar': '',
      'en': '',
    },
    '880ykn3y': {
      'ar': '',
      'en': '',
    },
    'z6g0ay73': {
      'ar': '',
      'en': '',
    },
    'my53ifch': {
      'ar': '',
      'en': '',
    },
    'clkdhxv5': {
      'ar': '',
      'en': '',
    },
    'ioj6su3t': {
      'ar': '',
      'en': '',
    },
    '6s2t0c5o': {
      'ar': '',
      'en': '',
    },
    'plm82jb4': {
      'ar': '',
      'en': '',
    },
    '53ixqle7': {
      'ar': '',
      'en': '',
    },
    'zng8qiqr': {
      'ar': '',
      'en': '',
    },
    '4qc6ftkt': {
      'ar': '',
      'en': '',
    },
    'ja56bm4e': {
      'ar': '',
      'en': '',
    },
    '9c96ysj8': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
