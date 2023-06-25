import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationStart extends StatelessWidget {
  const LottieAnimationStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Lottie.asset('assets/lottie_images/mobile-illustration.json'),
    );
  }
}


class LottieAnimationCall extends StatelessWidget {
  const LottieAnimationCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Lottie.asset('assets/lottie_images/package-call.json'),
    );
  }
}