import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/user/user.dart';
import 'package:myapp/pages/admin/ad_homepage/ad_home_page_menu.dart';
import 'package:myapp/pages/home_page/constants.dart';
import 'package:myapp/pages/home_page/homepage_menu.dart';
import 'package:myapp/pages/signup/signtype.dart';
import 'package:myapp/until/validator_util.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConveUntact LoginPage',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.pink.shade100,
        accentColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          button: TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          headline1: TextStyle(fontFamily: 'Quicksand'),
          headline2: TextStyle(fontFamily: 'Quicksand'),
          headline4: TextStyle(fontFamily: 'Quicksand'),
          headline5: TextStyle(fontFamily: 'NotoSans'),
          headline6: TextStyle(fontFamily: 'NotoSans'),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
          subtitle2: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      // navigatorObservers: [TransitionRouteObserver()],
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  final _formKey = GlobalKey<FormState>();
  final UserController user = Get.put(UserController());
  final UnitController unit = Get.put(UnitController());
  final _username = TextEditingController();
  final _password = TextEditingController();

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      await user.findByEmail(data.name.trim());
      await unit.findByEmail(data.name.trim());
      if (user.principal.value.uid != null) {
        Get.to(() => HomePage());
      } else if (unit.principal.value.uid != null) {
        Get.to(() => ADHomePage());
      } else {
        Get.snackbar("????????? ??????", "????????? ??????");
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) async {
      await user.findByEmail(name);
      if (user.principal.value.uid == null) {
        return '???????????? ?????? ???????????????.';
      }
      return null;
    });
  }

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.appName,
      titleTag: Constants.titleTag,
      navigateBackAfterRecovery: true,
      // hideProvidersTitle: false,
      // loginAfterSignUp: false,
      // hideForgotPasswordButton: true,
      // hideSignUpButton: true,
      // disableCustomPageTransformer: true,
      messages: LoginMessages(
        userHint: '?????????(?????????)',
        passwordHint: '????????????',
        confirmPasswordHint: '???????????? ??????',
        loginButton: '?????????',
        signupButton: '????????????',
        forgotPasswordButton: '???????????? ????????????????',
        recoverPasswordButton: '????????? ??????',
        goBackButton: '????????????',
        confirmPasswordError: '??????????????? ???????????? ????????????.',
        recoverPasswordIntro: '???????????? ???????????? PASSWORD??? ????????????.',
        recoverPasswordDescription: '?????? ????????? ????????? ???????????? ??????????????? ???????????? ????????? ????????????.',
        recoverPasswordSuccess: '?????? ???????????? ??????????????? ????????? ??? ??? ?????? ????????? ???????????????.',
        flushbarTitleError: 'Error!',
        flushbarTitleSuccess: 'Succes!',
        providersTitle: 'login with',
      ),

      //validation check
      userValidator: validateEmail(),
      passwordValidator: validatePassword(),

      onLogin: (loginData) {
        print('Login info');
        print('email: ${loginData.name}');
        print('Password: ${loginData.password}');
        if (loginData.name == 'admin@gmail.com') {
          Get.to(ADHomePage());
        } else {
          Get.to(HomePage());
          return _loginUser(loginData);
        }
      },
      onSignup: (loginData) {
        Get.to(() => SignType(), arguments: {
          "email": loginData.name.trim(),
          "password": loginData.password.trim(),
        });
      },
      onSubmitAnimationCompleted: () {
        Get.to(ADHomePage());
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      showDebugButtons: false,
    );
  }
}
