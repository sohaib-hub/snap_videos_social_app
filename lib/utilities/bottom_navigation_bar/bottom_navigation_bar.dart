
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/appcolors.dart';
import '../../resources/appicons.dart';


class BottomNavBar extends StatefulWidget {

  const BottomNavBar({super.key, required this.initialindex});
  final RxInt initialindex;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
    RxInt selectedIndex=0.obs;
  /*final List<Widget> _pages = [

   //  NotificationSettingView(),
    // Add more pages as needed

  ];*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // selectedIndex=widget.!initialindex;
  }
/*void _ontaped (index) {
print('ontapindex$index');
print("selectedindex${selectedIndex.value}");
selectedIndex.value = index;
print('after ontapontapindex$index');
print("selectedindex${selectedIndex.value}");
  switch(index){
    case 0:
      Navigatetoroute(context, '/homeView', HomeView());
    case 1:
      Navigatetoroute(context, '/foodsView', FoodsView());
    case 2:
      Navigatetoroute(context, '/myaccountView', MyaccountView());
      case 3:
    Navigatetoroute(context, '/mycartView', MycartView());


  }


}*/
 /* void Navigatetoroute(context, String routename,Widget screen){
    final String? currentroutename=ModalRoute.of(context)?.settings.name;
    bool routeexist=currentroutename==routename;
    if(routeexist){
      Navigator.popUntil(context,ModalRoute.withName(routename));
    }
    else
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder:(context)=>screen,
              settings: RouteSettings(name: routename)
        ));

      }
  }*/

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        BottomNavigationBar(
            backgroundColor: Appcolors.primary_color,
           /*   selectedIconTheme: IconThemeData(
            color: Appcolors.black,
            size: 17,
          ),*/
          iconSize: 18,

          selectedItemColor: Appcolors.white,
          unselectedItemColor: Appcolors.white,
        type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex.value,
        //  onTap:_ontaped,

        /*  items: [
            BottomNavigationBarItem(

              icon: Icon(AppIcons.home,
              //  color:selectedIndex==0? Appcolors.primary_color:Appcolors.background_color,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              label: 'Discover',
              icon: Icon(AppIcons.search,
               // color:selectedIndex==1? Appcolors.primary_color:Appcolors.background_color,
              ),
            ),
            BottomNavigationBarItem(
             label: '',
              icon: Container(
                padding: EdgeInsets.all(10),
                color: Appcolors.green,
                child: Icon(AppIcons.add,
                 // color:selectedIndex==2? Appcolors.primary_color:Appcolors.background_color,
                ),
              ),
            ),

            BottomNavigationBarItem(
              label: 'Deals',
            //  icon:Icon(AppIcons.person),
              icon:Icon(AppIcons.deals,
               // color:selectedIndex==3? Appcolors.primary_color:Appcolors.background_color,
              ),

            ),
        BottomNavigationBarItem(
          label: 'Profile',
            icon:Icon(AppIcons.person),
          //icon:Icon(AppIcons.deals,
            // color:selectedIndex==3? Appcolors.primary_color:Appcolors.background_color,
          ),
            // Add more BottomNavigationBarItems as needed
          ],*/

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Container(
                 height: Get.height*0.04,
                 width: Get.width*0.15,
            //    padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.green,
                    ],
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(Icons.add),
              ),
             label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Deals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
             // ),
            ));
  }
}

