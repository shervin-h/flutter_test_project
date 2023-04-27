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
import 'package:flutter_test_project/features/feature_auth/presentation/widgets/login_screen_widgets.dart';
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
    } else {
      showCustomErrorSnackBar(context, AppLocalizations.of(context)!.validation);
    }
  }
}

