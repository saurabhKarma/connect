// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'मित्र';

  @override
  String get tagline => 'साथ में मज़बूत';

  @override
  String get enterNumberToLogin => 'लॉगिन के लिए नंबर दर्ज करें';

  @override
  String get login => 'लॉगिन';

  @override
  String get invalidMobile => 'मान्य 10 अंकों का मोबाइल नंबर दर्ज करें';

  @override
  String get verifyOtpTitle => 'OTP सत्यापित करें';

  @override
  String otpSentTo(String phone) {
    return 'हमने $phone पर OTP भेजा है';
  }

  @override
  String get edit => 'बदलें';

  @override
  String get enterOtp => 'OTP दर्ज करें';

  @override
  String get resendOtp => 'OTP दोबारा भेजें';

  @override
  String resendOtpIn(String seconds) {
    return '$seconds में OTP दोबारा भेजें';
  }

  @override
  String get verify => 'सत्यापित करें';

  @override
  String get secureAndPrivate => 'सुरक्षित और निजी';

  @override
  String get otpConfidential =>
      'आपका OTP गोपनीय है। इसे किसी के साथ साझा न करें';

  @override
  String get secureCommunication => 'सुरक्षित संचार';

  @override
  String get builtForBusiness => 'व्यवसाय के लिए';

  @override
  String get yourDataProtected => 'आपका डेटा सुरक्षित है';

  @override
  String get byContinuing => 'जारी रखते हुए, आप हमारी';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get and => 'और';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get language => 'भाषा';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get home => 'होम';

  @override
  String get broadcast => 'ब्रॉडकास्ट';

  @override
  String get selectContacts => 'संपर्क चुनें';

  @override
  String get searchByNameNumber => 'नाम या नंबर से खोजें';

  @override
  String get newContact => 'नया संपर्क';

  @override
  String get addNewContact => 'नया संपर्क जोड़ें';

  @override
  String get nameLabel => 'नाम';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get phoneNumberLabel => 'फ़ोन नंबर';

  @override
  String get phoneNumberHint => 'फ़ोन नंबर';

  @override
  String get add => 'जोड़ें';

  @override
  String get noBroadcastYet => 'अभी तक कोई ब्रॉडकास्ट शुरू नहीं हुआ';

  @override
  String get startBroadcast => 'ब्रॉडकास्ट शुरू करें';

  @override
  String get broadcastName => 'ब्रॉडकास्ट का नाम';

  @override
  String get details => 'विवरण';

  @override
  String get contactPermission => 'संपर्क अनुमति';

  @override
  String get contactPermissionDesc =>
      'ब्रॉडकास्ट साझा करने के लिए संपर्क अनुमति';

  @override
  String get notificationPermission => 'सूचना अनुमति';

  @override
  String get notificationPermissionDesc =>
      'त्वरित अपडेट पाने के लिए सूचनाएँ चालू करें';

  @override
  String get appLock => 'ऐप लॉक';

  @override
  String get appLockDesc => 'अपने ऐप को सुरक्षित करने के लिए MFA का उपयोग करें';

  @override
  String get appLockUnavailable =>
      'इस डिवाइस पर कोई स्क्रीन लॉक या बायोमेट्रिक्स सेट नहीं है';

  @override
  String get permissionSettingsHint =>
      'आप यह अनुमति ऐप सेटिंग्स से बदल सकते हैं।';

  @override
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get darkTheme => 'डार्क थीम';

  @override
  String get helpFeedback => 'सहायता और फ़ीडबैक';

  @override
  String get shareInvite => 'साझा करें और आमंत्रित करें';

  @override
  String get changeLanguage => 'भाषा बदलें';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get sendMessage => 'संदेश भेजें';

  @override
  String get delete => 'हटाएं';

  @override
  String get editName => 'नाम बदलें';

  @override
  String get addMember => 'सदस्य जोड़ें';

  @override
  String get camera => 'कैमरा';

  @override
  String get gallery => 'गैलरी';

  @override
  String get unlock => 'अनलॉक करें';

  @override
  String get appLocked => 'मित्र लॉक है';

  @override
  String get appLockedMessage =>
      'जारी रखने के लिए फ़िंगरप्रिंट, चेहरे या डिवाइस पासकोड से अनलॉक करें।';

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';
}
