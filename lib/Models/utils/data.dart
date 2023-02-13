import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

void main() {
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

  print(createDynamicLink());
}
