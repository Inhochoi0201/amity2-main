import 'package:amity2/util/Import_Package.dart';

class MusicController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  final firestore = FirebaseFirestore.instance;
  List<String> music = [];
  List<String> lylic =[];

  getData() async{
    var productData = await firestore.collection("lylics").doc("music").get();
    String productTemp = productData.data()!.values.toString();
    music.assignAll(productTemp.split('^'));
  }
}