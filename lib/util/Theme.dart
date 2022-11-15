import 'package:amity2/util/Import_Package.dart';

class ThemeController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
  final List<String> theme = [
    '영화','애니','웹툰','인물','물건','음악'
  ];
  final firestore = FirebaseFirestore.instance;
  List<String> product = [];
  List<String> movie = [];
  List<String> animation =[];
  List<String> webtoon =[];
  List<String> celeb = [];
  List<String> music =[];
  List<String> bomb = [];
  
  getData() async{
    var productData = await firestore.collection("categoty").doc("product").get();
    String productTemp = productData.data()!.values.toString();
    product.assignAll(productTemp.split(','));
    var movieData = await firestore.collection("categoty").doc("movie").get();
    String movieTemp = movieData.data()!.values.toString();
    movie.assignAll(movieTemp.split(','));
    var aniData = await firestore.collection("categoty").doc("animation").get();
    String aniTemp = aniData.data()!.values.toString();
    animation.assignAll(aniTemp.split(','));
    var celebData = await firestore.collection("categoty").doc("celeb").get();
    String celebTemp = celebData.data()!.values.toString();
    celeb.assignAll(celebTemp.split(','));
    var musicData = await firestore.collection("categoty").doc("music").get();
    String musicTemp = musicData.data()!.values.toString();
    String musicTemp2 = musicTemp.replaceAll(')', ')\n');
    music.assignAll(musicTemp2.split(','));
    var bombData = await firestore.collection("categoty").doc("bomb").get();
    String bombTemp = bombData.data()!.values.toString();
    bomb.assignAll(bombTemp.split(','));
  }

  GlobalKey themeKey = GlobalKey();

  double getPositionY(){
    var box = themeKey.currentContext!.findRenderObject();
    var translation = box!.getTransformTo(null).getTranslation();
    return box.paintBounds.shift(Offset(translation.x, translation.y)).bottomCenter.dy;
  }
}