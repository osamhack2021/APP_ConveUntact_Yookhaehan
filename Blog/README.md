# Flutter-GetX-Firesotre-Blog

##### 각 기능별 개발 시 테스팅 해가며 개발할 수 있게  [빈 메소드 만들기  >  뷰에 씌우기 >  기능구현] 순서로 개발
##### Bold & Italic => Branch

## Index

1. 프로젝트 세팅
    1. 프로젝트 생성 후 디렉토리 생성(각 모듈별) - 이 프로젝트에서는 SKIP
    2. pubspec.yaml 세팅 - 이 프로젝트에서는 SKIP
    3. GetX Project Setting (AppBinding 생성, MaterialApp->GetMaterialApp) - 이 프로젝트에서는 SKIP
    4. Firebase 세팅 [참고 문서 - 플러터 공식문서](https://firebase.google.com/docs/flutter/setup?hl=ko&platform=ios "플러터 공식문서")
       1. Firebase Console Project 생성
       2. Firebase Auth Email 활성화
       3. Firestore 생성
       4. ***Firebase Product 추가 후 Android, IOS GoogleService-Info 파일 추가 - GoogleService File Git Ignore(자기거 붙여넣기 하시면 됩니다.)***
       5. ***Firebase 초기화하기***
       
       

2. 기능별 구현 - User
    1. ***Controller(생성 후 AppBinding에 추가), Repository, Provider 생성***
    2. 회원가입 (join) + Email, Username 중복체크
       1. ***빈 메소드 만들기***
       2. ***뷰에 씌우기***
       3. ***기능구현***
    3. 로그인 (login)
       1. ***빈 메소드 만들기***
       2. ***뷰에 씌우기***
       3. ***기능구현***
    4. 로그아웃 (logout)
       1. ***빈 메소드 만들기***
       2. ***뷰에 씌우기***
       3. ***기능구현***

3. 기능별 구현 - Post
    1. Controller (생성 후 AppBinding에 추가), Repository, Provider 생성
    2. 글 목록 받아오기 (findAll)
       1. ***빈 메소드 만들기***
       2. ***뷰에 씌우기***
       3. ***기능구현***
    3. 글쓰기 (wirte)
       1. ***빈 메소드 만들기***
       2. ***뷰에 씌우기***
       3. ***기능구현***
    4. 글상세보기 (findById)
       1. ***빈 메소드 만들기***
       2. ***뷰에 씌우기***
       3. ***기능구현***
    5. 글수정 (update)
       1. ***빈 메소드 만들기***
       2. ***뷰에 씌우기***
       3. ***기능구현***
    6. 글삭제 (delete)
       1. ***빈 메소드 만들기***
       2. ***뷰에 씌우기***
       3. ***기능구현***

4. Firestore Security Role 설정
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
  	//회원정보컬렉션
  	match /users/{document} {
      allow read: if true; //닉네임 이메일 중복체크때문에 허용
      allow update,delete: if request.auth.uid == resource.data.uid; //자기것만 수정 삭제
      allow create: if request.auth.uid != null; //FirebaseAuth로 1차 로그인 된 사람만 쓸 수 있슴
    }
    //포스트
    match /post/{document} {
      allow read: if true; //모두 읽기 가능
      allow create: if request.auth.uid == request.resource.data.user.uid; //자신의 아이디로만 등록가능 (파라미터변조방지)
      allow update,delete: if request.auth.uid == resource.data.user.uid; //자기것만
    }
  }
}
```