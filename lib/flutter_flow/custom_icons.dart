import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myFlutterAppFamily = 'MyFlutterApp';
  static const String _icomoonFamily = 'Icomoon';
  static const String _maleFemaleFamily = 'MaleFemale';

  // MyFlutterApp
  static const IconData klogoaa =
      IconData(0xe800, fontFamily: _myFlutterAppFamily);
  static const IconData kchat =
      IconData(0xe801, fontFamily: _myFlutterAppFamily);

  // icomoon
  static const IconData klogoicon =
      IconData(0xe900, fontFamily: _icomoonFamily);

  // maleFemale
  static const IconData kman = IconData(0xe9dc, fontFamily: _maleFemaleFamily);
  static const IconData kwoman =
      IconData(0xe9dd, fontFamily: _maleFemaleFamily);
}
