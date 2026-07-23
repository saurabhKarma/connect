// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Mitra';

  @override
  String get tagline => 'Stronger Together';

  @override
  String get enterNumberToLogin => 'Enter number to login';

  @override
  String get login => 'Login';

  @override
  String get invalidMobile => 'Enter a valid 10-digit mobile number';

  @override
  String get verifyOtpTitle => 'Verify OTP';

  @override
  String otpSentTo(String phone) {
    return 'We\'ve sent an OTP on $phone';
  }

  @override
  String get edit => 'Edit';

  @override
  String get enterOtp => 'Enter the OTP';

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String resendOtpIn(String seconds) {
    return 'Resend OTP in $seconds';
  }

  @override
  String get verify => 'Verify';

  @override
  String get secureAndPrivate => 'Secure & Private';

  @override
  String get otpConfidential =>
      'Your OTP is confidential. Don\'t share it with anyone';

  @override
  String get secureCommunication => 'Secure Communication';

  @override
  String get builtForBusiness => 'Built For Business';

  @override
  String get yourDataProtected => 'Your Data Is Protected';

  @override
  String get byContinuing => 'By continuing, you agree to our';

  @override
  String get termsOfService => 'Terms of service';

  @override
  String get and => 'and';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get home => 'Home';

  @override
  String get broadcast => 'Broadcast';

  @override
  String get selectContacts => 'Select Contacts';

  @override
  String get searchByNameNumber => 'Search by name & number';

  @override
  String get newContact => 'New Contact';

  @override
  String get addNewContact => 'Add New Contact';

  @override
  String get nameLabel => 'Name';

  @override
  String get fullName => 'Full Name';

  @override
  String get phoneNumberLabel => 'Phone Number';

  @override
  String get phoneNumberHint => 'Phone number';

  @override
  String get add => 'Add';

  @override
  String get noBroadcastYet => 'No Broadcast Started Yet';

  @override
  String get startBroadcast => 'Start Broadcast';

  @override
  String get broadcastName => 'Broadcast Name';

  @override
  String get details => 'Details';

  @override
  String get contactPermission => 'Contact Permission';

  @override
  String get contactPermissionDesc =>
      'Contact permission to allow sharing the broadcast';

  @override
  String get notificationPermission => 'Notification Permission';

  @override
  String get notificationPermissionDesc =>
      'Allow notification for getting instant updates';

  @override
  String get appLock => 'App Lock';

  @override
  String get appLockDesc => 'Use MFA to secure your app access';

  @override
  String get appLockUnavailable =>
      'No screen lock or biometrics set up on this device';

  @override
  String get permissionSettingsHint =>
      'You can change this permission from the app settings.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get cancel => 'Cancel';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get helpFeedback => 'Help & Feedback';

  @override
  String get shareInvite => 'Share & Invite';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get logout => 'Logout';

  @override
  String get sendMessage => 'Send Message';

  @override
  String get delete => 'Delete';

  @override
  String get editName => 'Edit Name';

  @override
  String get addMember => 'Add Member';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get unlock => 'Unlock';

  @override
  String get appLocked => 'Mitra is locked';

  @override
  String get appLockedMessage =>
      'Unlock with your fingerprint, face, or device passcode to continue.';

  @override
  String get somethingWentWrong => 'Something went wrong. Please try again.';
}
