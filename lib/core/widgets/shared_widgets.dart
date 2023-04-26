import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

enum LottieWidgetType { loading, error }

class LottieWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final LottieWidgetType? lottieWidgetType;
  final String _asset;

  const LottieWidget({
    this.width,
    this.height,
    this.lottieWidgetType,
    super.key,
  }) : _asset = 'assets/lottie/search.json';

  const LottieWidget.loading({
    super.key,
    this.width,
    this.height,
  })  : lottieWidgetType = LottieWidgetType.loading,
        _asset = 'assets/lottie/search.json';

  const LottieWidget.error({
    super.key,
    this.width,
    this.height,
  })  : lottieWidgetType = LottieWidgetType.error,
        _asset = 'assets/lottie/error.json';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Lottie.asset(
        _asset,
        height: height ?? screenHeight * 0.2,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
