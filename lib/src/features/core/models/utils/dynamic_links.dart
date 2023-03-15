import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:luckyman_app/src/features/core/screens/reservation_details_screen.dart';

class DynamicLinkProvider {
  Future<String> createDynamicLink() async {
    const String url = "https://com.example.luckyman";

    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(url),
      uriPrefix: "https://luckyman.page.link",
      androidParameters: const AndroidParameters(
          packageName: "com.example.luckyman", minimumVersion: 0),
    );

    final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
      dynamicLinkParams,
      shortLinkType: ShortDynamicLinkType.unguessable,
    );
    final String generatedDynamicLink = dynamicLink.shortUrl.toString();
    return generatedDynamicLink;
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink;

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Get.to(() => BusTicketScreen());
    }
  }

  // void initDynamicLink() async {
  //   final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

  //   if (instanceLink != null) {
  //     final Uri refLink = instanceLink.link;
  //     String newDynamicLink = await createDynamicLink();
  //     if (refLink.data!.uri.toString() == newDynamicLink)  {
  //       
  //     }
  //   }
  // }
}