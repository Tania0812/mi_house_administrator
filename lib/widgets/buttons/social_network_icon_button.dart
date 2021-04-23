import 'package:flutter/material.dart';

class SocialNetworkIcons extends StatelessWidget {
  const SocialNetworkIcons({
    Key? key,
    this.onPressedGoogle,
    this.onPressedFacebook,
    this.onPressedTwitter,
  }) : super(key: key);

  final VoidCallback? onPressedGoogle;
  final VoidCallback? onPressedFacebook;
  final VoidCallback? onPressedTwitter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset('assets/images/social_icons/google.png', height: 100),
          onPressed: onPressedGoogle,
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Image.asset('assets/images/social_icons/facebook.png', height: 100),
          onPressed: onPressedFacebook,
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Image.asset('assets/images/social_icons/twitter.png', height: 100),
          onPressed: onPressedTwitter,
        ),
      ],
    );
  }
}
