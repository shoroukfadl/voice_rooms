import 'package:roomly/core/language/locales.dart';

extension AppStrings on AppLocalizations {
  String get appName => tr('appName');
  String get welcomeTagline => tr('welcomeTagline');
  String get getStarted => tr('getStarted');
  String get loginTitle => tr('loginTitle');
  String get loginSubtitle => tr('loginSubtitle');
  String get mobileNumber => tr('mobileNumber');
  String get sendCode => tr('sendCode');
  String get verifyTitle => tr('verifyTitle');
  String codeSentTo(String phone) => tr('codeSentTo', {'phone': '$phone'});
  String get verify => tr('verify');
  String resendIn(String time) => tr('resendIn', {'time': '$time'});
  String get yourName => tr('yourName');
  String get yourPreferredLanguage => tr('yourPreferredLanguage');
  String get languageArabic => tr('languageArabic');
  String get languageEnglish => tr('languageEnglish');
  String get finish => tr('finish');
  String get chats => tr('chats');
  String get searchChats => tr('searchChats');
  String get yesterday => tr('yesterday');
  String get online => tr('online');
  String get typeMessage => tr('typeMessage');
  String get translate => tr('translate');
  String get summarize => tr('summarize');
  String get correct => tr('correct');
  String translatedFrom(String language) =>
      tr('translatedFrom', {'language': '$language'});
  String get suggestion => tr('suggestion');
  String get profile => tr('profile');
  String get editProfile => tr('editProfile');
  String get name => tr('name');
  String get about => tr('about');
  String get preferredLanguage => tr('preferredLanguage');
  String get autoTranslate => tr('autoTranslate');
  String get notifications => tr('notifications');
  String notifNewMessageFrom(String name) =>
      tr('notifNewMessageFrom', {'name': '$name'});
  String get notifSummaryReady => tr('notifSummaryReady');
  String notifSummaryReadyBody(String chatName) =>
      tr('notifSummaryReadyBody', {'chatName': '$chatName'});
  String notifRepliedToPhoto(String name) =>
      tr('notifRepliedToPhoto', {'name': '$name'});
  String get notifSystemUpdate => tr('notifSystemUpdate');
  String get notifBetterTranslation => tr('notifBetterTranslation');
  String get settings => tr('settings');
  String get account => tr('account');
  String get appLanguage => tr('appLanguage');
  String get darkMode => tr('darkMode');
  String get correctBeforeSending => tr('correctBeforeSending');
  String get privacy => tr('privacy');
  String get logOut => tr('logOut');
  String get newGroup => tr('newGroup');
  String get groupName => tr('groupName');
  String get contacts => tr('contacts');
  String createGroup(int count) => tr('createGroup', {'count': '$count'});
  String get search => tr('search');
  String get filterAll => tr('filterAll');
  String get filterPeople => tr('filterPeople');
  String get filterMedia => tr('filterMedia');
  String get sectionMessages => tr('sectionMessages');
  String get conversationSummary => tr('conversationSummary');
  String summarySubtitle(String chatName, int count) =>
      '$chatName · ${messagesCount(count)}';
  String get keyPoints => tr('keyPoints');
  String get actionItems => tr('actionItems');
  String get copy => tr('copy');
  String get share => tr('share');
  String get regenerate => tr('regenerate');
  String get calls => tr('calls');
  String get deleteAccount => tr('deleteAccount');
  String get lightMode => tr('lightMode');
  String get system => tr('system');
  String get general => tr('general');
  String messagesCount(int count) => plural('messagesCount', count);
}
