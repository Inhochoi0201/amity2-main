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
    String productStr = productTemp.substring(1, productTemp.length-1);
    product.assignAll(productStr.split(','));
    var movieData = await firestore.collection("categoty").doc("movie").get();
    String movieTemp = movieData.data()!.values.toString();
    String movieStr = movieTemp.substring(1, movieTemp.length-1);
    movie.assignAll(movieStr.split(','));
    var aniData = await firestore.collection("categoty").doc("animation").get();
    String aniTemp = aniData.data()!.values.toString();
    String aniStr = aniTemp.substring(1, aniTemp.length-1);
    animation.assignAll(aniStr.split(','));
    var webtoonData = await firestore.collection("categoty").doc("webtoon").get();
    String webtoonTemp = webtoonData.data()!.values.toString();
    String webtoonStr =  webtoonTemp.substring(1,webtoonTemp.length-1);
    webtoon.assignAll(webtoonStr.split(','));
    var celebData = await firestore.collection("categoty").doc("celeb").get();
    String celebTemp = celebData.data()!.values.toString();
    String celebStr = celebTemp.substring(1, celebTemp.length-1);
    celeb.assignAll(celebStr.split(','));
    var musicData = await firestore.collection("categoty").doc("music").get();
    String musicTemp = musicData.data()!.values.toString();
    String musicTemp2 = musicTemp.replaceAll(')', ')\n');
    String musicStr = musicTemp2.substring(1, musicTemp2.length-1);
    music.assignAll(musicStr.split(','));
    var bombData = await firestore.collection("categoty").doc("bomb").get();
    String bombTemp = bombData.data()!.values.toString();
    String bombStr = bombTemp.substring(1, bombTemp.length-1);
    bomb.assignAll(bombStr.split(','));
  }

  GlobalKey themeKey = GlobalKey();

  double getPositionY(){
    var box = themeKey.currentContext!.findRenderObject();
    var translation = box!.getTransformTo(null).getTranslation();
    return box.paintBounds.shift(Offset(translation.x, translation.y)).bottomCenter.dy;
  }
}