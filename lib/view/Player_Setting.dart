import 'package:amity2/util/Import_Package.dart';

class PlayerSetting extends GetView<PlayerSettingController> {
  const PlayerSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              top: 0,bottom: 0,left: 0,right: 0,
                child: GestureDetector(onTap: ()=> Get.back(),
                child: Container(color: Colors.transparent,))),
            Positioned(child: Padding(
              padding:  EdgeInsets.all(30.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffaecdff))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(height: 60.h,),
                     Text("플레이어 상세설정", style: TextStyle(color: const Color(0xffaecdff), fontSize: 30.sp,fontWeight: FontWeight.bold),),
                     SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      child:
                          Row(children: [
                            Text('순서', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                            SizedBox(width:10.w),
                            Text('캐릭터',style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
                            SizedBox(width: 50.w,),
                            Text('플레이어 이름',style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold))
                          ],),
                    ),
                     Padding(
                        padding: EdgeInsets.all(10.r),
                        child:Divider(height: 5.h,thickness: 2,color: const Color(0xffaecdff),)),
                    Get.put(SettingController()).playerList.isEmpty ?
                     Expanded(child: Text('먼저 인원수를 지정한 후,\n설정페이지로 들어와주세요.', style: TextStyle(color:Colors.red, fontWeight: FontWeight.bold,fontSize: 20.sp),textAlign: TextAlign.center,)) :
                    Expanded(
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 16.w),
                        child: ListView.separated(
                          itemCount: Get.put(SettingController()).playerList.length,
                          itemBuilder: (BuildContext ctx, int index){
                            return Container(
                              color: Colors.white,
                              height: 30.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                       SizedBox(width: 10.w,),
                                      Text('${index+1}', style:  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),),
                                       SizedBox(width: 30.w,),
                                      Image.asset(Get.put(SettingController()).playerList[index].image, height: 30.h),
                                       SizedBox(width: 20.w,),
                                      SizedBox(
                                        height: 60.h,
                                        width: 200.w,
                                        child: TextFormField(
                                          controller:  Get.put(PlayerSettingController()).txtController[index],
                                          decoration: InputDecoration(
                                            contentPadding:  EdgeInsets.symmetric(vertical: 6.h),
                                            hintText: Get.put(SettingController()).playerList[index].name,
                                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
                                            suffix: IconButton(
                                              alignment: Alignment.bottomCenter,
                                                icon:  Icon(Icons.clear, color: const Color(0xffaecdff),size: 24.sp,),
                                                onPressed: () => Get.put(PlayerSettingController()).txtController[index].clear(),
                                              ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey.withOpacity(0.4),
                                              ),
                                            ),
                                            focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xffaecdff)
                                              )
                                            ),
                                          ),
                                          cursorColor: const Color(0xffaecdff),
                                          style:  TextStyle(
                                            fontSize: 16.sp, color: const Color(0xffaecdff), fontWeight: FontWeight.bold
                                          ),
                                          textAlignVertical: TextAlignVertical.bottom,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext ctx, int index){
                            return  const Divider();
                          },
                        ),
                      ),
                    ),
                    Padding(padding:  EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 10.h),
                    child: GestureDetector(
                      onTap: (){
                          Get.put(PlayerSettingController()).saveTXT();
                          Get.put(DialogController()).savePlayer();
                          () => Get.back();
                      },
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffaecdff),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:  Center(child: Text('저장', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp),),),
                      ),
                    ),
                    ),
                    Padding(padding:  EdgeInsets.fromLTRB(16.w, 0, 16.w, 10.h),
                      child: GestureDetector(
                        onTap: ()=> Get.back(),
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffaecdff)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:  Center(child: Text('나가기', style: TextStyle(color: const Color(0xffaecdff), fontWeight: FontWeight.bold, fontSize: 16.sp),),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PlayerSettingController extends GetxController{
  List<TextEditingController> txtController = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    makeTxtController();
  }

  void makeTxtController(){
    for(var i =0; i<Get.put(SettingController()).playerList.length; i++){
      txtController.add(TextEditingController());
    }
  }

  void saveTXT(){
    for(var i = 0; i< Get.put(SettingController()).playerList.length;i++){
      if((Get.put(SettingController()).playerList[i].name = txtController[i].text).isNotEmpty) {
        Get.put(SettingController()).playerList[i].name = txtController[i].text;
      }else if(txtController[i].text.isEmpty){
        Get.put(SettingController()).playerList[i].name = '플레이어$i';
      }
    }
  }
}
