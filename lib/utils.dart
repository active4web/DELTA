
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void openLink({
    @required String url,
  }) => _launchURL(url);

  static Future openEmail({
    @required String toEmail,
     String subject,
     String body,
  }) async {
    final url =
        'mailto:$toEmail';
    _launchURL(url);
  }

  static Future openPhoneCall({@required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';
    _launchURL(url);
  }

  static Future openSMS({@required String phoneNumber}) async {
    final url = 'sms:$phoneNumber';
    _launchURL(url);
  }

  static void _launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}