import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
class ConfirmStateScrollMenu extends StatefulWidget {
  const ConfirmStateScrollMenu({
    Key? key,
    required this.theme,
  }) : super(key: key);
  final ThemeData theme;
  @override
  _ConfirmStateScrollMenuState createState() =>
      _ConfirmStateScrollMenuState();
}
class _ConfirmStateScrollMenuState extends State<ConfirmStateScrollMenu> {
  late String selectedKey;
  List<String> keys = <String>[
    '승인',
    '거절',
    '보류(추후 재신청)',
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
              child: Text(
                selectedKey,
                overflow: TextOverflow.ellipsis,
              ),
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
        MenuButton<String>(
          menuButtonBackgroundColor: Color(0x3dffffff),
          child: scrollChildButton,
          items: keys,
          topDivider: true,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (String value) => Container(
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
            child: Text(value),
          ),
          toggledChild: Container(
            child: scrollChildButton,
          ),
          divider: Container(
            height: 1,
            color: Colors.grey,
          ),
          onItemSelected: (String value) {
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