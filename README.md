# flutter-devcontainer
GitHub Codespace - Flutter 개발 환경 자동 생성 파일

본 저장소를 활용하여 Flutter 개발 환경이 모두 설정 되어 있는 GitHub Codespace 를 바로 생성할 수 있습니다.  
Flutter 개발 환경이 설정된 Codespace 를 설정 하려면 아래 절차를 수행합니다.

## 저장소 및 Codespace 생성
- [여기를 클릭하여 본 저장소를 템플릿으로 새 저장소를 생성합니다.](https://github.com/osamhack2021/flutter-devcontainer/generate)
  - **Owner** 를 `osamhack2021` 로 지정하고, **Repository name**은 원하는 저장소 이름을 입력합니다.
- 새로 생성된 저장소에서 Codespace 를 생성 하면 자동으로 Flutter 개발 환경이 구축된 Codespace 가 생성 됩니다.

## Flutter 프로젝트 생성 및 테스트

아래 명령으로 `myapp` 프로젝트를 생성하고, 테스트를 위해 웹 앱 형태로 실행합니다.
```bash
flutter create myapp
cd myapp
flutter run -d web-server --web-hostname=0.0.0.0 
``` 

본 저장소를 활용하여 생성된 Codespace 에는 Android SDK 도 같이 설정되어 있습니다.
별도 추가적인 절차 없이, 아래 명령줄로 Android 앱 APK 파일을 빌드할 수 있습니다.
```bash
flutter build apk
```

Flutter 프로젝트 개발환경 구축, 앱 개발, 빌드 테스트 등에 관한 자세한 사항은, 별도로 전달 받으신 가이드 문서와 [Flutter 공식 문서](https://flutter.dev/)를 참고해 주시기 바랍니다.
