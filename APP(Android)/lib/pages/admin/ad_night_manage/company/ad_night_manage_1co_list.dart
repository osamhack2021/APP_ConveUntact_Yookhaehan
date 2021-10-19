import 'package:flutter/widgets.dart';
import 'package:myapp/pages/home_page/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';

class ADNightManage1COListScreen extends StatefulWidget {
  @override
  NightStudyList createState() => NightStudyList();
}
class NightStudyList extends State<ADNightManage1COListScreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text("1CO 연등 관리"),
      //actions: [
        //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white,)),
      //],
      headerWidget: headerWidget(context),
      //headerBottomBar: headerBottomBarWidget(),
      body: [
        Row(
         crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("사이버 지식 정보방", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${nightRez1COComputerList.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            SizedBox(width: 6),
          ]
        ),
        Divider(),
        Computer1COListView(),
        Row(
         crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("학습", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
            Spacer(),
            Text("${nightRez1COStudyList.length}건의 내용 존재", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10)),
            SizedBox(width: 6),
          ]
        ),
        Divider(),
        Study1COListView(),
      ],
      //fullyStretchable: true,
      //expandedBody: Text("Expanded"),
    );
  }
  //Container headerBottomBarWidget() {
    //return Container(
      //child: Row(
        //mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.center,
        //children: [//설정 아이콘
          //IconButton(onPressed: () {}, icon: Icon(Icons.person, color: Colors.white),),
        //],
      //),
    //);
  //}
  Container headerWidget(BuildContext context) => Container(
    color: Colors.indigo.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "1CO 연등 관리",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //letterSpacing: 0.5,
                fontSize: 30,
              ),
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Color(0x00000000),
              child: Image.asset(
                '/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/library.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
        //Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
            //Padding(
              //padding: const EdgeInsets.only(bottom: 12),
                //child: ScrollPhysicsMenuButton(
                  //theme: Theme.of(context),
                //),
            //),
          //],
        //),
      ],
    ),
  );
  ListView Computer1COListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: nightRez1COComputerList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/computer.png'),
          ),
          title: Text("${nightRez1COComputerList[index].user}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(nightRez1COComputerList[index].perpose),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                  });
                },
                child: Text('출발'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green.shade100),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: "${nightRez1COComputerList[index].user}",
                      text: "복귀 / 취소 처리되었습니다.",
                      confirmBtnColor: Colors.indigo.shade200,
                    );
                    nightRez1COComputerList.removeAt(index);
                  });
                },
                child: Text('복귀 / 취소'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
  ListView Study1COListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: nightRez1COStudyList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0x00000000),
            child: Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/library.png'),
          ),
          title: Text("${nightRez1COStudyList[index].user}", style: TextStyle(color: Colors.indigo.shade200, fontWeight: FontWeight.bold)),
          subtitle: Text(nightRez1COStudyList[index].perpose),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                  });
                },
                child: Text('출발'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green.shade100),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      title: "${nightRez1COStudyList[index].user}",
                      text: "복귀 / 취소 처리되었습니다.",
                      confirmBtnColor: Colors.indigo.shade200,
                    );
                    nightRez1COStudyList.removeAt(index);
                  });
                },
                child: Text('복귀 / 취소'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}
class NightRez{
  final String user;
  final String perpose;
  NightRez(
    {required this.user, required this.perpose});
}
List<NightRez> nightRez1COComputerList = [
  NightRez(
    user: "일병 홍길동",
    perpose: "코딩 공부"
  ),
  NightRez(
    user: "상병 최길동",
    perpose: "해커톤 준비"
  ),
  NightRez(
    user: "일병 김길동",
    perpose: "한국사 인강"
  ),
  NightRez(
    user: "이병 안길동",
    perpose: "코딩 공부"
  ),
  NightRez(
    user: "병장 이길동",
    perpose: "자기소개서 작성"
  ),
];
List<NightRez> nightRez1COStudyList = [
  NightRez(
    user: "일병 손흥민",
    perpose: "독서"
  ),
  NightRez(
    user: "상병 이천수",
    perpose: "태권도"
  ),
  NightRez(
    user: "이병 박태환",
    perpose: "병기본"
  ),
  NightRez(
    user: "일병 김연경",
    perpose: "독서"
  ),
  NightRez(
    user: "병장 김연아",
    perpose: "자기소개서 작성"
  ),
];