import 'package:amity2/util/Import_Package.dart';
class Player{
  String name;
  final String image;
  final GlobalKey key;
  int score;
  Player({
    required this.score,
    required this.name,
    required this.image,
    required this.key,
  }
      );
}