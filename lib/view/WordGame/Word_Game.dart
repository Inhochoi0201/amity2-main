import 'package:amity2/util/Import_Package.dart';


class WordGame extends StatelessWidget {
  WordGame({Key? key}) : super(key: key);
  final controller = Get.put(WordGameController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return  WillPopScope(
      onWillPop: () {
        Get.put(DialogController()).back();
        return Future(() => false);
      },
      child: Scaffold(
          body: Container(
            width: Get.width,
            padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => Container(
                  height: 200.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xffaecdff),
                        width: 3
                    ),
                  ),
                  child: Stack(
                    children: [
                       Center(
                        child: Text(controller.title.value, style:  TextStyle(fontSize: 100.sp, fontFamily: 'OnePop', color: Colors.black),),
                      ),
                      Positioned(
                          top: 5.h,
                          left: 8.w,
                          child: RichText(
                            text:  TextSpan(
                                text: 'Play With  ',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xff3d3d3d)
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'A',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xffaecdff)
                                    ),),
                                  TextSpan(
                                      text: 'MITY',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: const Color(0xff3d3d3d),
                                        fontWeight: FontWeight.normal,
                                      )
                                  )
                                ]
                            ),
                          ) ),
                    ],
                  ),
                ),
                ),
                 SizedBox(height: 10.h,),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffaecdff))
                      ),
                      height: 150.r,
                      width: 150.r,
                      child: Center(
                            child: Obx(
                                ()=> AnimatedFlipCounter(
                                  duration: const Duration(milliseconds: 100),
                                value: Get.put(TimerController()).time.value < 0 ? 0 : Get.put(TimerController()).time.value,
                                textStyle: TextStyle(
                                  fontFamily: 'OneTitle',
                                  fontSize: 75.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
                                  color: Get.put(TimerController()).time.value > Get.put(TimerController()).time.value/2 ? const Color(0xffaecdff) : Colors.red,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      offset:  Offset(5.w, 5.h),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      )
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        child:  Icon(Icons.timer_outlined, size: 50.sp,color: const Color(0xffaecdff),)
                    ),
                  ],
                ),
                 SizedBox(height: 10.h,),
                  playerSlider(),
                 SizedBox(height: 30.h,),
                GestureDetector(
                  onTap: (){
                    Get.put(AudioController()).audioNext();
                    Get.put(TimerController()).pass();
                    controller.carouselController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
                    if(controller.currentPlayer.value < controller.setting.playerList.length-1){
                      controller.currentPlayer.value++;
                    }else if(controller.currentPlayer.value == controller.setting.playerList.length-1) {
                      controller.currentPlayer.value = 0;
                    };
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
                         Text('에게 넘기기',style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                      ],
                    )),),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }

  Widget playerSlider() {
    return SizedBox(
      width: 150.w,
      height: 200.h,
      child:  CarouselSlider(
        carouselController: controller.carouselController,
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            autoPlay: false,
            height: 200.h,
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
                  SizedBox(height: 20.h,),
                  Text(controller.setting.playerList[index].name, style:  TextStyle(fontSize: 25.sp),),
                ],
              );
            }),
      ),
    );
  }
}

class WordGameController extends GetxController{
  final setting = Get.put(SettingController());
  final timer = Get.put(TimerController());
  CarouselController carouselController = CarouselController();
  void setIndex(int n){
    currentPlayer.value = n;
  }
  RxInt currentPlayer = 0.obs;
  final List<String> wordList = ['ㄱ','ㄴ','ㄷ','ㄹ','ㅁ','ㅂ','ㅅ','ㅇ','ㅈ','ㅊ','ㅋ','ㅌ','ㅍ','ㅎ'];
  RxString title = ''.obs; //현제 타이틀
  RxInt i = 0.obs;

  makeTitle(){
    title.value = wordList[Random().nextInt(wordList.length-1)] + wordList[Random().nextInt(wordList.length-1)];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    makeTitle();
  }
}
