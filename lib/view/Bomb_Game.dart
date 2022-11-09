import 'package:amity2/util/Import_Package.dart';


class BombGame extends StatelessWidget {
  BombGame({Key? key}) : super(key: key);

  final controller = Get.put(BombGameController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return WillPopScope(
      onWillPop: (){
        Get.put(DialogController()).back();
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Obx(()=>Text(controller.timer.time.value.toString())),
                 GetBuilder<BombGameController>(
                   init: controller,
                   builder: (value) {
                     return Column(
                       children: [
                         AnimatedContainer(
                           duration: const Duration(milliseconds: 600),
                           height: 200.h,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             border: Border.all(color: controller.colors, width: 2.r),
                           ),
                           child: Center(child: Text(
                             controller.title , style: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.bold),
                           ),),
                         ),
                         AnimatedContainer(
                           curve: Curves.bounceIn,
                           height:120.r,
                           width:120.r,
                           duration: const Duration(milliseconds: 200),
                           child: ImageIcon(const AssetImage('assets/images/bomb.png'), size: 80.r, color: controller.colors,),
                         )
                       ],
                     );
                   }
                 ),
                  playerSlider(),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.put(AudioController()).audioNext();
                      controller.carouselController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      if(controller.currentPlayer.value < controller.setting.playerList.length-1){
                        controller.currentPlayer.value++;
                      }else if(controller.currentPlayer.value == controller.setting.playerList.length-1) {
                        controller.currentPlayer.value = 0;
                      }
                      print(controller.currentPlayer.value);
                      /*if(controller.currentPlayer.value >= setting.playerList.length - 1){
                        if(setting.playerList.length >= 4){
                          controller.carouselController.jumpToPage(0);
                          controller.currentPlayer.value = 0;
                        }
                        else{
                          controller.currentPlayer.value = 0;
                          Scrollable.ensureVisible(setting.playerList[0].key.currentContext!,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                      }else if(controller.currentPlayer.value < setting.playerList.length - 1){
                        print('여기로들어옴');
                        Scrollable.ensureVisible(setting.playerList[controller.currentPlayer.value + 1].key.currentContext!,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                        controller.currentPlayer.value++;
                      }else{
                        print('?');
                      }
*/
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xffaecdff),
                      ),
                      height: 60.h,
                      width: 300.w,
                      child: Center(child: Obx(()=> Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controller.currentPlayer.value ==  controller.setting.playerList.length -1 ?
                          controller.setting.playerList[0].name  : controller.setting.playerList[controller.currentPlayer.value + 1].name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16.sp)),
                          Text( '에게 넘기기',style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                        ],
                      )),),
                    ),
                  )
                ],
              ),
            )
        ),
    );
  }

  Widget playerSlider() {
    return SizedBox(
        width: 150.w,
        height: 300.h,
        child:  CarouselSlider(
          carouselController: controller.carouselController,
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            scrollPhysics: const NeverScrollableScrollPhysics(),
              autoPlay: false,
              height: 300.h,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.setIndex(index);
              }),
              items: List.generate( controller.setting.playerList.length,
                  (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                                controller.setting.playerIMG[index]),
                          )),
                    ),
                     SizedBox(height: 50.h,),
                     Text(controller.setting.playerList[index].name, style:  TextStyle(fontSize: 30.sp),),
                  ],
                );
              }),
        ),
        );
  }
}

class BombGameController extends GetxController{
  final timer = Get.put(TimerController());
  final theme = Get.put(ThemeController()).bomb;
  final setting = Get.put(SettingController());
  Color colors = Color(0xffaecdff);
  CarouselController carouselController = CarouselController();
  RxInt currentPlayer = 0.obs;
  String title = '';
  void setIndex(int n){
    currentPlayer.value = n;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    makeTitle();
    interval(timer.time, (callback) => effect(), time: const Duration(milliseconds: 200));
  }
  void makeTitle(){
    title = theme[Random().nextInt(theme.length-1)];
    update();
  }
  void effect(){
    var i = Random().nextInt(8);
    switch(i){
      case 0 : colors = Colors.red;
      break;
      case 1 : colors = Colors.orange;
      break;
      case 2 :  colors =Colors.yellow;
      break;
      case 3 :  colors =Colors.green;
      break;
      case 4 :  colors = Colors.blue;
      break;
      case 5 :  colors = Colors.indigoAccent;
      break;
      case 6 :  colors = Colors.purple;
      break;
      case 7:  colors = Colors.pink;
      break;
      default :  colors = const Color(0xffaecdff);
    }
    update();
  }
}