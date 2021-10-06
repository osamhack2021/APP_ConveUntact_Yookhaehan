import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:get/get.dart';

const primaryColor = Color(0xFFACBDF4);
void main() {
  runApp(Select_detail());
}

class Select_detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: '세부 부대 설정',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFACBDF4),
        primaryColor: primaryColor,
        primarySwatch: Colors.blue,
      ),
      home: FullyFunctionalAwesomeDropDown(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FullyFunctionalAwesomeDropDown extends StatefulWidget {
  @override
  _FullyFunctionalAwesomeDropDownState createState() =>
      _FullyFunctionalAwesomeDropDownState();
}

class _FullyFunctionalAwesomeDropDownState
    extends State<FullyFunctionalAwesomeDropDown> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false,
      _navigateToPreviousScreenOnIOSBackPress = true;
  late List<String> _list;
  String _selectedItem = 'Select Country';

  @override
  void initState() {
    _list = ["1중대", "2중대", "3중대"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,

        /// user has to wrap it's main body to GestureDetector so all the implemented functionalities would be work
        /// perfectly. this is used to close the drop down on [out side touch, ios back pressed, drawer open, pan down, scrolling]
        child: GestureDetector(
          onTap: _removeFocus,
          onPanDown: (focus) {
            _isPanDown = true;
            _removeFocus();
          },
          child: Scaffold(
            backgroundColor: primaryColor,
            key: _scaffoldKey,

            /// I have maintain open and close state of drop down with the drawer
            /// if drop down is opened and user wants to open Drawer, it will first close the drop dwon then open the drawer
            endDrawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Item 2'),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            /// in appBar I have added iOS back button and open and close state of drop down is work like a charm when iOS back button
            /// pressed
            appBar: PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: SafeArea(
                child: PreferredSize(
                    preferredSize: Size.fromHeight(100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 30,
                          child: Container(
                              margin: EdgeInsets.only(
                                left: 8,
                              ),
                              child: IconButton(
                                color: Colors.black,
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                ),
                                onPressed: _onWillPop,
                              )),
                        ),
                        Text('APP바는 공통 양식에 따르겠습니다',
                            // textScaleFactor: 1.0,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Container(
                          child: Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    size: 30,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () {
                                    _onDrawerBtnPressed();
                                  } //_onDrawerBtnPressed
                                  )),
                        )
                      ],
                    )),
              ),
            ),
            body: Container(
              margin: const EdgeInsets.all(30),
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 3.0,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 15, left: 16, right: 20),
                    child: AwesomeDropDown(
                      isPanDown: _isPanDown,
                      isBackPressedOrTouchedOutSide:
                          _isBackPressedOrTouchedOutSide,
                      padding: 8,
                      dropDownIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 23,
                      ),
                      elevation: 5,
                      dropDownBorderRadius: 10,
                      dropDownTopBorderRadius: 50,
                      dropDownBottomBorderRadius: 50,
                      dropDownIconBGColor: Colors.transparent,
                      dropDownOverlayBGColor: Colors.transparent,
                      dropDownBGColor: Colors.white,
                      dropDownList: _list,
                      selectedItem: _selectedItem,
                      numOfListItemToShow: 4,
                      selectedItemTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      dropDownListTextStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          backgroundColor: Colors.transparent),
                      onDropDownItemClick: (selectedItem) {
                        _selectedItem = selectedItem;
                      },
                      dropStateChanged: (isOpened) {
                        _isDropDownOpened = isOpened;
                        if (!isOpened) {
                          _isBackPressedOrTouchedOutSide = false;
                        }
                      },
                    ),
                  ),
                ],
                
              ),

            ),
          ),
        ));
  }


  /// this func is used to close dropDown (if open) when you tap or pandown anywhere in the screen
  /// this method is also used for iOS backPressed as mentioned in gif
  void _removeFocus() {
    if (_isDropDownOpened) {
      setState(() {
        _isBackPressedOrTouchedOutSide = true;
      });
      _navigateToPreviousScreenOnIOSBackPress = false;
    }
  }

  /// this func will call on mob backPressed and on iOS back pressed
  /// if dropdown opens it will close the dropdown else it will pop the screen
  Future<bool> _onWillPop() {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      Navigator.of(context).pop();
      return Future.value(false);
    } else {
      if (_isDropDownOpened) {
        setState(() {
          _isBackPressedOrTouchedOutSide = true;
        });
        FocusManager.instance.primaryFocus!.unfocus();
        return Future.value(false);
      } else {
        if (_navigateToPreviousScreenOnIOSBackPress) {
          Navigator.of(context).pop();
          return Future.value(true);
        } else {
          _navigateToPreviousScreenOnIOSBackPress = true;
          return Future.value(false);
        }
      }
    }
  }

  /// this func will call on DrawerIconPressed, it closes the dropDown if open and then open the drawer
  void _onDrawerBtnPressed() {
    if (_isDropDownOpened) {
      setState(() {
        _isBackPressedOrTouchedOutSide = true;
      });
    } else {
      _scaffoldKey.currentState!.openEndDrawer();
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
