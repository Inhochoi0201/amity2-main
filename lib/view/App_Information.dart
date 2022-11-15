
import 'package:amity2/util/Import_Package.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/sub_icon.png', height: 120.r, width: 120.r,),
              SizedBox(height: 30.h,),
              TextButton(onPressed: ()=>launchUrl(Uri.parse('https://iconoding.tistory.com/')), child: Text('개발자 블로그', style: TextStyle(fontSize: 15.sp, color: const Color(0xffaecdff)),)),
              SizedBox(height: 30.h,),
            ],
          ),
          Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100)),
                  color: Color(0xffaecdff),
                ),
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: false,
                        floating: true,
                        title: Text('icon attribution', style: TextStyle(fontSize: 17.sp, fontFamily: 'OneTitle', fontWeight: FontWeight.bold, color: Colors.white),),
                        centerTitle: true,
                        backgroundColor: Colors.transparent,
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Icon made by Pixel perfect from www.flaticon.com", style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              SizedBox(height: 20.h,),
                              InkWell(
                                  onTap: ()=> launchUrl(Uri.parse('https://www.flaticon.com/free-icons/character')),
                                  child: Text('Character icons created by Freepik - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),)),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse('https://www.flaticon.com/free-icons/witch')),
                                child: Text('Witch icons created by Freepik - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse('https://www.flaticon.com/free-icons/wizard')),
                                child: Text('Wizard icons created by Freepik - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse('https://www.flaticon.com/free-icons/angry-birds')),
                                child: Text('Angry birds icons created by Those Icons - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse("https://www.flaticon.com/free-icons/character")),
                                child: Text('Character icons created by Swifticons - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse("https://www.flaticon.com/free-icons/fairy")),
                                child: Text('Fairy icons created by Freepik - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse("https://www.flaticon.com/free-icons/character")),
                                child: Text('Character icons created by Freepik - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse("https://www.flaticon.com/free-icons/warrior")),
                                child: Text('Warrior icons created by max.icons - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse("https://www.flaticon.com/free-icons/profile")),
                                child: Text('Profile icons created by Freepik - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse("https://www.flaticon.com/free-icons/superhero")),
                                child: Text('Superhero icons created by Pixel perfect - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              InkWell(
                                onTap: ()=>launchUrl(Uri.parse("https://www.flaticon.com/free-icons/bomb")),
                                child: Text('Bomb icons created by vectorsmarket15 - Flaticon', style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                              ),
                              SizedBox(height: 30.h,),
                              Text('현재 버전 ${Get.put(AppController()).version} ver',style: TextStyle(fontSize: 13.sp, color: Colors.white)),
                              Text("요구사항은 개발자 이메일로 보내주세요.", style: TextStyle(fontSize: 13.sp, color: Colors.white),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
