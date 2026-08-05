class EndPoints {
  EndPoints._();

  static const String BASE_URL = 'http://192.168.1.7:8080';

  static String mediaUrl(String url) => url.startsWith('http') ? url : BASE_URL + url;

  static const String _api = '$BASE_URL/api/v1';

  static const String OTP_REQUEST = '$_api/auth/otp/request';
  static const String OTP_VERIFY = '$_api/auth/otp/verify';
  static const String REFRESH_TOKEN = '$_api/auth/token/refresh';
  static const String LOGOUT = '$_api/auth/logout';
  static const String LOGOUT_ALL = '$_api/auth/logout-all';
  static const String ME = '$_api/auth/me';

  // Account / profile (GET + PATCH on the same path)
  static const String USERS_ME = '$_api/users/me';
  static const String USER_AVATAR = '$_api/users/me/avatar';
  static const String PROFILE = USERS_ME;
  static const String PREFERENCES = '$_api/users/me/preferences';
  static const String DEVICES = '$_api/users/me/devices';
  static const String DELETE_ACCOUNT = USERS_ME;

  static const String PLANS = '$_api/subscription/plans';
  static const String SUBSCRIPTION = '$_api/subscription';
  static const String SUBSCRIBE = '$_api/subscription/subscribe';
  static const String SUBSCRIPTION_VERIFY = '$_api/subscription/verify';
  static const String SUBSCRIPTION_CANCEL = '$_api/subscription/cancel';
  static const String SUBSCRIPTION_DEV_ACTIVATE = '$_api/subscription/dev/activate';

  static const String SHOP = '$_api/shop';
  static String publicShop(String code) => '$_api/shops/$code';

  static const String SHOP_CUSTOMERS = '$_api/shop/customers';
  static const String SHOP_CUSTOMERS_COUNT = '$_api/shop/customers/count';
  static String shopCustomer(String memberId) => '$_api/shop/customers/$memberId';

  static const String SEGMENTS = '$_api/shop/segments';
  static String segment(String id) => '$_api/shop/segments/$id';
  static String segmentMembers(String id) => '$_api/shop/segments/$id/members';
  static String segmentMembersByPhone(String id) => '$_api/shop/segments/$id/members/by-phone';

  static const String BROADCASTS = '$_api/broadcasts';
  static String broadcast(String id) => '$_api/broadcasts/$id';

  // 1:1 chat (WhatsApp-style)
  static const String CONVERSATIONS = '$_api/conversations';
  static const String CONVERSATIONS_UNREAD = '$_api/conversations/unread-count';
  static String startChatWith(String userId) => '$_api/conversations/with/$userId/messages';
  static String conversationMessages(String cid) => '$_api/conversations/$cid/messages';
  static String conversationMessage(String cid, String mid) => '$_api/conversations/$cid/messages/$mid';
  static String conversationRead(String cid) => '$_api/conversations/$cid/read';
  static String conversationBlock(String cid) => '$_api/conversations/$cid/block';
  static String conversationUnblock(String cid) => '$_api/conversations/$cid/unblock';

  // Contacts: which phones already have a Mitra account (drives chat/broadcast + invite)
  static const String CONTACTS_LOOKUP = '$_api/shop/customers/lookup';

  static const String MY_SUBSCRIPTIONS = '$_api/lists';
  static String subscribe(String shopCode) => '$_api/lists/$shopCode/subscribe';
  static String unsubscribe(String shopCode) => '$_api/lists/$shopCode/unsubscribe';
  static String mute(String shopCode) => '$_api/lists/$shopCode/mute';
  static String unmute(String shopCode) => '$_api/lists/$shopCode/unmute';

  static const String MEDIA_UPLOAD = '$_api/media';

  static const String ANALYTICS_SUMMARY = '$_api/shop/analytics/summary';
}
