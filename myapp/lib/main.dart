import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //static const String _title = 'Test TextButton';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '가입 유형을 선택하세요',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
          ),
          SizedBox(height: 150),
          // TextButton(
          //   style: TextButton.styleFrom(
          //     textStyle: const TextStyle(fontSize: 20),
          //   ),
          //   onPressed: null,
          //   child: const Text('사용자'),
          // ),
          //const SizedBox(height: 60),
          // TextButton(
          //   style: TextButton.styleFrom(
          //     textStyle: const TextStyle(fontSize: 60),
          //   ),
          //   onPressed: () {},
          //   child: const Text('관리자'),
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFF3C8BF),
                          Color(0xFFF5B9AC),
                          Color(0xFFF6A391),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 150),
                  ),
                  onPressed: () {},
                  child: const Text('사용자'),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFA1B7F1),
                          Color(0xFF98B1F2),
                          Color(0xFF8CA8F2),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 150),
                  ),
                  onPressed: () {},
                  child: const Text('관리자'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
