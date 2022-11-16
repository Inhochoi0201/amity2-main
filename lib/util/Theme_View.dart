import 'package:amity2/util/Import_Package.dart';

class ThemeView extends StatelessWidget{
  ThemeView({super.key});
  final controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
              top: 0,bottom: 0,left: 0,right: 0,
              child: GestureDetector(onTap: ()=> Get.back(),
                  child: Container(color: Colors.transparent,))),
          Positioned(
              left: 0, right: 0, top: controller.getPositionY(),
              child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xffaecdff),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 280.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  Text('테마선택', style: TextStyle(color: Colors.white,fontSize: 18.sp,fontFamily: 'OneTitle'),),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    height: 180.h,
                    width: 360.w,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        childAspectRatio: 2/1,
                        crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemBuilder: (ctx, index)=> GestureDetector(
                          onTap: () {
                            if(controller.theme[index].isNotEmpty){
                              Get.put(SettingController()).selectedTheme.value = controller.theme[index];
                            }else{
                              Get.put(DialogController()).customAlert('데이터 불러오기를 실패했습니다.\n네트워크 확인 후 다시 시도해주세요.');
                            }
                          },
                          child: Obx(
                              ()=> Container(
                              width: (Get.width-24.w)/3,
                              decoration: BoxDecoration(
                                color: Get.put(SettingController()).selectedTheme.value == controller.theme[index] ? Colors.blueAccent :
                                controller.theme[index].isEmpty ? const Color(0xffdddddd) :Colors.transparent,
                                border: Border.all(color: Colors.white)
                              ),
                                child: Center(child: Text(controller.theme[index], style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 15.sp),),),
                            ),
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: ()=> Get.back(),
                        child: Container(
                          height: 42.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white
                          ),
                          child: Center(child: Text('선택', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: const Color(0xffAecdff)),),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}