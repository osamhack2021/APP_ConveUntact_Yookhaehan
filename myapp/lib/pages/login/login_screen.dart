import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/unit_controller.dart';
import 'package:myapp/controller/user_controller.dart';
import 'package:myapp/domain/user/user.dart';
import 'package:myapp/pages/admin/ad_home_page.dart';
import 'package:myapp/pages/admin/ad_home_page_menu.dart';
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
        Get.to(() => ADHomePageScreen());
      } else {
        Get.snackbar("로그인 시도", "로그인 실패");
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) async {
      await user.findByEmail(name);
      if (user.principal.value.uid == null) {
        return '존재하지 않는 계정입니다.';
      }
      return null;
    });
  }

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.appName,
      logo: 'LOGO',
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      navigateBackAfterRecovery: true,
      // hideProvidersTitle: false,
      // loginAfterSignUp: false,
      // hideForgotPasswordButton: true,
      // hideSignUpButton: true,
      // disableCustomPageTransformer: true,
      messages: LoginMessages(
        userHint: '아이디(이메일)',
        passwordHint: '비밀번호',
        confirmPasswordHint: '비밀번호 확인',
        loginButton: '로그인',
        signupButton: '회원가입',
        forgotPasswordButton: '로그인이 안되시나요?',
        recoverPasswordButton: '이메일 전송',
        goBackButton: '돌아가기',
        confirmPasswordError: '비밀번호가 일치하지 않습니다.',
        recoverPasswordIntro: '아이디를 입력하여 PASSWORD를 찾으세요.',
        recoverPasswordDescription: '해당 계정에 등록된 이메일로 비밀번호를 재설정할 링크를 보냅니다.',
        recoverPasswordSuccess: '해당 이메일로 비밀번호를 재설정 할 수 있는 링크를 보냈습니다.',
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
        return _loginUser(loginData);
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