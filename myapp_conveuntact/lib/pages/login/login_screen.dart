import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
<<<<<<< HEAD:myapp_conveuntact/lib/pages/login/login_screen.dart
import 'package:myapp/components/constants.dart';
import 'package:myapp/pages/home_page/homepage_menu.dart';
import 'package:myapp/components/id_info.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
=======
import 'package:myapp/pages/home_page/constants.dart';
import 'package:myapp/pages/login/custom_route.dart';
import 'package:myapp/pages/home_page/home_page.dart';
import 'package:myapp/pages/menu/menu_main.dart';
import 'package:myapp/pages/user/users.dart';
import 'package:validators/validators.dart';

void main() => runApp(Loginpage());

class Loginpage extends StatelessWidget {
>>>>>>> GetXblog_jiho:myapp/lib/pages/login/login_screen.dart
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

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.name)) {
        return '존재하지 않는 계정입니다.';
      }
      if (mockUsers[data.name] != data.password) {
        return '비밀번호가 일치하지 않습니다.';
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return '존재하지 않는 계정입니다.';
      }
      return null;
    });
  }

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
          recoverPasswordSuccess: '비밀번호가 성공적으로 변경되었습니다!',
          flushbarTitleError: 'Error!',
          flushbarTitleSuccess: 'Succes!',
          providersTitle: 'login with'),
      theme: LoginTheme(
          //  primaryColor: Colors.teal,
          //   accentColor: Colors.yellow,
          //   errorColor: Colors.deepOrange,
          //   pageColorLight: Colors.indigo.shade300,
          //   pageColorDark: Colors.indigo.shade500,
          //   logoWidth: 0.80,
          //   titleStyle: TextStyle(
          //     color: Colors.greenAccent,
          //     fontFamily: 'Quicksand',
          //     letterSpacing: 4,
          //   ),
          //   // beforeHeroFontSize: 50,
          //   // afterHeroFontSize: 20,
          //   bodyStyle: TextStyle(
          //     fontStyle: FontStyle.italic,
          //     decoration: TextDecoration.underline,
          //   ),
          //   textFieldStyle: TextStyle(
          //     color: Colors.orange,
          //     shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
          //   ),
          //   buttonStyle: TextStyle(
          //     fontWeight: FontWeight.w800,
          //     color: Colors.yellow,
          //   ),
          //   cardTheme: CardTheme(
          //     color: Colors.yellow.shade100,
          //     elevation: 5,
          //     margin: EdgeInsets.only(top: 15),
          //     shape: ContinuousRectangleBorder(
          //         borderRadius: BorderRadius.circular(100.0)),
          //   ),
          //   inputTheme: InputDecorationTheme(
          //     filled: true,
          //     fillColor: Colors.purple.withOpacity(.1),
          //     contentPadding: EdgeInsets.zero,
          //     errorStyle: TextStyle(
          //       backgroundColor: Colors.orange,
          //       color: Colors.white,
          //     ),
          //     labelStyle: TextStyle(fontSize: 12),
          //     enabledBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
          //       borderRadius: inputBorder,
          //     ),
          //     focusedBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
          //       borderRadius: inputBorder,
          //     ),
          //     errorBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: Colors.red.shade700, width: 7),
          //       borderRadius: inputBorder,
          //     ),
          //     focusedErrorBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: Colors.red.shade400, width: 8),
          //       borderRadius: inputBorder,
          //     ),
          //     disabledBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: Colors.grey, width: 5),
          //       borderRadius: inputBorder,
          //     ),
          //   ),
          //   buttonTheme: LoginButtonTheme(
          //     splashColor: Colors.purple,
          //     backgroundColor: Colors.pinkAccent,
          //     highlightColor: Colors.lightGreen,
          //     elevation: 9.0,
          //     highlightElevation: 6.0,
          //     shape: BeveledRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //     // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          //     // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
          //   ),
          ),
      userValidator: (value) {
        if (value!.isEmpty) {
          return "아이디를 입력하세요.";
        } else if (!value.isEmail) {
          return "이메일 형식이 올바르지 않습니다.";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return "비밀번호를 입력하세요.";
        } else if (!isAlphanumeric(value)) {
          return "비밀번호는 영문과 숫자조합만 가능합니다.";
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSubmitAnimationCompleted: () {
        Get.to(HomePage());
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
