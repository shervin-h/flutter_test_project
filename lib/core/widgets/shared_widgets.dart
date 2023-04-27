import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

enum LottieWidgetType { loading, error, noPermission, success, man }

class LottieWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final LottieWidgetType? lottieWidgetType;
  final String? asset;

  const LottieWidget({
    this.width,
    this.height,
    this.lottieWidgetType,
    this.asset,
    super.key,
  });

  const LottieWidget.loading({
    super.key,
    this.width,
    this.height,
  })  : lottieWidgetType = LottieWidgetType.loading,
        asset = 'assets/lottie/search.json';

  const LottieWidget.error({
    super.key,
    this.width,
    this.height,
  })  : lottieWidgetType = LottieWidgetType.error,
        asset = 'assets/lottie/error.json';

  const LottieWidget.noPermission({
    super.key,
    this.width,
    this.height,
  })  : lottieWidgetType = LottieWidgetType.noPermission,
        asset = 'assets/lottie/no_permission.json';

  const LottieWidget.success({
    super.key,
    this.width,
    this.height,
  })  : lottieWidgetType = LottieWidgetType.success,
        asset = 'assets/lottie/success_nick.json';

  const LottieWidget.man({
    super.key,
    this.width,
    this.height,
  })  : lottieWidgetType = LottieWidgetType.man,
        asset = 'assets/lottie/man.json';

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Lottie.asset(
        asset ?? 'assets/lottie/search.json',
        height: height ?? screenHeight * 0.2,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
