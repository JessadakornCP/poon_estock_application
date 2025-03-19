import 'package:url_launcher/url_launcher.dart';

class AppUtility {
  static Future openLinkMap({
    required lat,
    required lng,
    double? zoom,
  }) async {
    final Uri urlLinkMap = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$lat%2c$lng");

    if (await canLaunchUrl(urlLinkMap)) {
      await launchUrl(
        urlLinkMap,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw "ไม่สามารถเปิด Google Map ได้";
    }
  }

  static Future openUrl(String uri) async {
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(
        Uri.parse(uri),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw "ไม่สามารถเปิด Link ได้";
    }
  }
}
