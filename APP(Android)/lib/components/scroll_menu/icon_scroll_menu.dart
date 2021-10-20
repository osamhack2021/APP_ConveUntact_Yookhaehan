import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
class IconScrollMenu extends StatefulWidget {
  const IconScrollMenu({
    Key? key,
    required this.theme,
  }) : super(key: key);
  final ThemeData theme;
  @override
  _IconScrollMenuState createState() =>
      _IconScrollMenuState();
}
class _IconScrollMenuState extends State<IconScrollMenu> {
  late Image selectedKey;
  List<Image> keys = <Image>[
    Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/soccer.png'),
    Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/football.png'),
    Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/basketball.png'),
    Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/karaoke.png'),
    Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/library.png'),
    Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/playground.png'),
    Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/table_tennis.png'),
    Image.asset('/workspaces/APP_ConveUntact_Yookhaehan/myapp/lib/icons/utility_hall.png'),
  ];
  @override
  void initState() {
    selectedKey = keys[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Widget scrollChildButton = SizedBox(
      width: 300,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: 
                selectedKey
            ),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Padding(
          //padding: const EdgeInsets.only(bottom: 12.0),
          //child: Text(
            //'Menu button with scroll physics',
            //style: widget.theme.textTheme.headline2!.copyWith(
              //fontSize: 18,
            //),
          //),
        //),
        MenuButton<Image>(
          menuButtonBackgroundColor: Color(0x3dffffff),
          child: scrollChildButton,
          items: keys,
          topDivider: true,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (Image value) => Container(
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
            child: value,
          ),
          toggledChild: Container(
            child: scrollChildButton,
          ),
          divider: Container(
            height: 1,
            color: Colors.grey,
          ),
          onItemSelected: (Image value) {
            setState(() {
              selectedKey = value;
            });
          },
          decoration: BoxDecoration(
            //border: Border.all(color: Colors.grey[300]!),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )
          ),
          onMenuButtonToggle: (bool isToggle) {
            print(isToggle);
          },
        ),
      ],
    );
  }
} 