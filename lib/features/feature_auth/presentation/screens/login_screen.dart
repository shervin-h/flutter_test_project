import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/config/app_settings/app_settings_cubit.dart';
import 'package:flutter_test_project/core/utils/password_validation_helper.dart';
import 'package:flutter_test_project/core/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/core/widgets/shared_widgets.dart';
import 'package:flutter_test_project/features/feature_auth/data/repositories/user_repository_impl.dart';
import 'package:flutter_test_project/features/feature_auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_test_project/features/feature_countries/presentation/screens/countries_screen.dart';
import '../../../../core/widgets/custom_clipper.dart';
import '../../../../core/widgets/custom_snackbars.dart';
import '../bloc/login_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();

  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return LoginWidget(formKey: _formKey, emailController: _emailController, passController: _passController, loginUser: _loginUser);
            } else {
              return LoginTabletWidget(formKey: _formKey, emailController: _emailController, passController: _passController, loginUser: _loginUser);
            }
          },
        ),
      ),
    );
  }



  void _loginUser(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressedEvent(
          _emailController.text.trim(),
          _passController.text.trim()
        )
      );
    }
  }
}


class LoginWidget extends StatelessWidget {
  const LoginWidget({
    required this.formKey,
    required this.emailController,
    required this.passController,
    required this.loginUser,
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passController;
  final void Function(BuildContext) loginUser;

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final ThemeData themeData = Theme.of(context);

    final localization = AppLocalizations.of(context)!;

    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 8,
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginErrorState) {
                  return LottieWidget.noPermission(height: screenHeight * 0.2);
                }
                return LottieWidget.success(height: screenHeight * 0.2);
              },
            ),
          ),
          RotatedBox(
            quarterTurns: 2,
            child: ClipPath(
              clipper: CurveClipper3(),
              child: RotatedBox(
                quarterTurns: 2,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topCenter,
                  width: screenWidth,
                  height: screenHeight * 0.6,
                  color: Colors.cyan,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Theme(
                      data: themeData.copyWith(errorColor: Colors.white),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.1),

                            CustomTextFormField(
                              validator: (value) {
                                if (value != null && !EmailValidator.validate(value.trim())) {
                                  return localization.emailErrMessage;
                                }
                                return null;
                              },
                              controller: emailController,
                              hintText: localization.email,
                              keyboardType: TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 16),

                            CustomTextFormField(
                              validator: (value) {
                                if (value != null && value.trim().length < 8 && !isPasswordValid(value.trim(), 8)) {
                                  return localization.passErrMessage;
                                }
                                return null;
                              },
                              controller: passController,
                              hintText: localization.password,
                              obscureText: true,
                            ),

                            const SizedBox(height: 32),

                            BlocConsumer<LoginBloc, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoadingState) {
                                  return Container(
                                    width: screenWidth * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: ElevatedButton(
                                      onPressed: null,
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(16),
                                      ),
                                      child: Center(
                                        child: CupertinoActivityIndicator(
                                          color: themeData.colorScheme.onPrimary,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (state is LoginCompletedState) {
                                  return Container(
                                    width: screenWidth * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: ElevatedButton(
                                      onPressed: null,
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                        elevation: MaterialStateProperty.all<double>(16),
                                      ),
                                      child: Text(localization.loginSuccessful),
                                    ),
                                  );
                                } else if (state is LoginErrorState) {
                                  return Container(
                                    width: screenWidth * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        loginUser(context);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(themeData.colorScheme.error),
                                        elevation: MaterialStateProperty.all<double>(16),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(localization.tryAgain, style: themeData.textTheme.button!.copyWith(color: themeData.colorScheme.onError),),
                                          const SizedBox(width: 8),
                                          Icon(CupertinoIcons.refresh, color: themeData.colorScheme.onError,),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width: screenWidth * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        loginUser(context);
                                      },
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(16),
                                      ),
                                      child: Text(localization.login),
                                    ),
                                  );
                                }
                              },
                              listener: (context, state) {
                                if (state is LoginCompletedState) {
                                  Navigator.of(context).pushReplacementNamed(CountriesScreen.routeName);
                                }
                                if (state is LoginErrorState) {
                                  showCustomErrorSnackBar(context, state.errorMessage);
                                }
                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginTabletWidget extends StatelessWidget {
  const LoginTabletWidget({
    required this.formKey,
    required this.emailController,
    required this.passController,
    required this.loginUser,
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passController;
  final void Function(BuildContext) loginUser;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final ThemeData themeData = Theme.of(context);

    final localization = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(4.0),
            // color: Colors.red,
            height: screenHeight,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Theme(
                data: themeData.copyWith(errorColor: Colors.white),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.1),

                      CustomTextFormField(
                        validator: (value) {
                          if (value != null && !EmailValidator.validate(value.trim())) {
                            return localization.emailErrMessage;
                          }
                          return null;
                        },
                        controller: emailController,
                        hintText: localization.email,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 16),

                      CustomTextFormField(
                        validator: (value) {
                          if (value != null && value.trim().length < 8 && !isPasswordValid(value.trim(), 8)) {
                            return localization.passErrMessage;
                          }
                          return null;
                        },
                        controller: passController,
                        hintText: localization.password,
                        obscureText: true,
                      ),

                      const SizedBox(height: 32),

                      BlocConsumer<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return Container(
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(16),
                                ),
                                child: Center(
                                  child: CupertinoActivityIndicator(
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            );
                          } else if (state is LoginCompletedState) {
                            return Container(
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                  elevation: MaterialStateProperty.all<double>(16),
                                ),
                                child: Text(localization.loginSuccessful),
                              ),
                            );
                          } else if (state is LoginErrorState) {
                            return Container(
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  loginUser(context);
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(themeData.colorScheme.error),
                                  elevation: MaterialStateProperty.all<double>(16),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(localization.tryAgain, style: themeData.textTheme.button!.copyWith(color: themeData.colorScheme.onError),),
                                    const SizedBox(width: 8),
                                    Icon(CupertinoIcons.refresh, color: themeData.colorScheme.onError,),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  loginUser(context);
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(16),
                                ),
                                child: Text(localization.login),
                              ),
                            );
                          }
                        },
                        listener: (context, state) {
                          if (state is LoginCompletedState) {
                            Navigator.of(context).pushReplacementNamed(CountriesScreen.routeName);
                          }
                          if (state is LoginErrorState) {
                            showCustomErrorSnackBar(context, state.errorMessage);
                          }
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: 1,
            child: ClipPath(
              clipper: CurveClipper3(),
              child: RotatedBox(
                quarterTurns: 3,
                child: Container(
                  height: screenHeight,
                  width: screenWidth * 0.5,
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.primary,
                  ),
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginErrorState) {
                        return LottieWidget.noPermission(height: screenHeight * 0.4);
                      }
                      return LottieWidget.success(height: screenHeight * 0.4);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

