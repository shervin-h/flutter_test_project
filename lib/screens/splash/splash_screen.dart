import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/widgets/custom_clipper.dart';
import 'package:flutter_test_project/core/widgets/shared_widgets.dart';
import 'package:flutter_test_project/features/feature_auth/presentation/screens/login_screen.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashBloc>(context).add(SplashStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final themeData = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/samim_logo.png',
                width: screenWidth * 0.3,
                fit: BoxFit.fitWidth,
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'پروژ تستی',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 150),
                ),
              ],

              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            Expanded(
              child: BlocConsumer<SplashBloc, SplashState>(
                builder: (context, state) {
                  if (state is SplashErrorState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LottieWidget.error(height: screenHeight * 0.1),
                          const SizedBox(height: 16),
                          Text(
                            state.errorMessage,
                            style: themeData.textTheme.bodyLarge!.copyWith(
                              color: themeData.colorScheme.error,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<SplashBloc>(context).add(SplashStartedEvent());
                            },
                            child: const Icon(CupertinoIcons.refresh),
                          )
                        ],
                      ),
                    );
                  }
                  return LottieWidget.man(height: screenHeight * 0.2);
                },
                listener: (context, state) {
                  if (state is SplashCompletedState) {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () async {
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                      },
                    );
                  }
                },
              ),
            ),
            RotatedBox(
              quarterTurns: 2,
              child: ClipPath(
                clipper: CurveClipper5(),
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.1,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Column(
                      children: [
                        SizedBox(height:  1/5 * (screenHeight * 0.1) ),
                        Shimmer.fromColors(
                          baseColor: Colors.white.withOpacity(0.4),
                          highlightColor: Colors.white,
                          child: Text(
                            'by Shervin Hassanzadeh',
                            style: themeData.textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
