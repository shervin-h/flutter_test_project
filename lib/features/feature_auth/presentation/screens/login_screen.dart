import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/core/widgets/custom_app_bar.dart';
import 'package:flutter_test_project/features/feature_auth/presentation/widgets/login_screens.dart';
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

