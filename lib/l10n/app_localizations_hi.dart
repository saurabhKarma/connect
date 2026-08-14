// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Connect';

  @override
  String get tagline => 'Connect से जुड़ाव बनाएँ';

  @override
  String get connections => 'कनेक्शन';

  @override
  String get noConnectionsYet => 'अभी तक कोई कनेक्शन नहीं';

  @override
  String get couldNotLoadChats => 'चैट लोड नहीं हो सकीं';

  @override
  String get retry => 'पुनः प्रयास करें';

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
  String get broadcastListsLoadError => 'ब्रॉडकास्ट सूचियाँ लोड नहीं हो सकीं';

  @override
  String get noBroadcastListsYet => 'अभी तक कोई ब्रॉडकास्ट सूची नहीं';

  @override
  String get tapPlusToCreate => 'बनाने के लिए + दबाएँ';

  @override
  String recipientsCount(int count) {
    return '$count प्राप्तकर्ता';
  }

  @override
  String get nameThisList => 'इस सूची का नाम दें';

  @override
  String listNameHintExample(int count) {
    return 'जैसे नियमित ($count संपर्क)';
  }

  @override
  String get create => 'बनाएँ';

  @override
  String get couldNotCreateList => 'सूची नहीं बन सकी।';

  @override
  String get broadcastListSubtitle => 'ब्रॉडकास्ट सूची';

  @override
  String get manageRecipients => 'प्राप्तकर्ता प्रबंधित करें';

  @override
  String get renameList => 'सूची का नाम बदलें';

  @override
  String get deleteList => 'सूची हटाएँ';

  @override
  String get save => 'सहेजें';

  @override
  String get couldNotRenameList => 'नाम नहीं बदला जा सका।';

  @override
  String deleteListConfirm(String name) {
    return '\"$name\" हटाएँ? इससे सूची और उसका इतिहास हट जाएगा। पहले भेजे गए संदेश प्राप्तकर्ताओं के पास बने रहेंगे।';
  }

  @override
  String get couldNotDeleteList => 'सूची नहीं हटाई जा सकी।';

  @override
  String get couldNotLoadMessages => 'संदेश लोड नहीं हो सके';

  @override
  String get sendFirstBroadcast => 'अपना पहला ब्रॉडकास्ट भेजें';

  @override
  String get couldNotSendBroadcast => 'ब्रॉडकास्ट नहीं भेजा जा सका।';

  @override
  String get recipients => 'प्राप्तकर्ता';

  @override
  String get couldNotLoadRecipients => 'प्राप्तकर्ता लोड नहीं हो सके';

  @override
  String get noRecipientsYet => 'अभी तक कोई प्राप्तकर्ता नहीं';

  @override
  String get tapAddToInclude => 'संपर्क जोड़ने के लिए जोड़ें दबाएँ';

  @override
  String get notOnApp => 'ऐप पर नहीं';

  @override
  String get removeRecipient => 'प्राप्तकर्ता हटाएँ';

  @override
  String get remove => 'हटाएँ';

  @override
  String removeRecipientConfirm(String name) {
    return '$name को इस सूची से हटाएँ?';
  }

  @override
  String get couldNotAddRecipients => 'प्राप्तकर्ता नहीं जोड़े जा सके।';

  @override
  String get couldNotRemoveRecipient => 'प्राप्तकर्ता नहीं हटाया जा सका।';

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
  String get appLocked => 'Connect लॉक है';

  @override
  String get appLockedMessage =>
      'जारी रखने के लिए फ़िंगरप्रिंट, चेहरे या डिवाइस पासकोड से अनलॉक करें।';

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';
}
