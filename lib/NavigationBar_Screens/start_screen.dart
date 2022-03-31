import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';

import '../shared/constants/size_config.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => Mybloc(),
      child: BlocConsumer<Mybloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return Scaffold(
            backgroundColor: Colors.white,
            appBar:AppBar(
              title: SvgPicture.asset(
                'assets/images/Logo.svg',
                width: SizeConfig.getProportionateScreenWidth(113),
                height: SizeConfig.getProportionateScreenHeight(26.2),
                fit: BoxFit.contain,
              ),
              backgroundColor: Colors.white,
              elevation: 4,
              shadowColor: HexColor("0053CB").withOpacity(0.1),
              automaticallyImplyLeading: false,
              //leadingWidth: 0,
              titleSpacing: SizeConfig.getProportionateScreenWidth(17),
              //leading: Container(),
              toolbarHeight: SizeConfig.getProportionateScreenHeight(88),
              actions: [
                SvgPicture.asset(
                  'assets/images/notification on.svg',
                  semanticsLabel: 'vector',
                  width: SizeConfig.getProportionateScreenWidth(24),
                  height: SizeConfig.getProportionateScreenWidth(24),
                ),
                SizedBox(width: SizeConfig.getProportionateScreenWidth(8)),
                CircleAvatar(
                  maxRadius: SizeConfig.getProportionateScreenWidth(16),
                  minRadius: SizeConfig.getProportionateScreenWidth(16),
                  child:Text("N",style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                  ),),
                  backgroundColor: HexColor("0053CB"),
                ),
                SizedBox(width: SizeConfig.getProportionateScreenWidth(16)),
              ],
            ),
            body:
            Mybloc.get(context).screens[Mybloc.get(context).selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedFontSize: 12,
              selectedFontSize: 12,

              currentIndex: Mybloc.get(context).selectedIndex,
              onTap: (index) {
                Mybloc.get(context).changeBottomNavBar(index);
              },
              selectedItemColor: HexColor('2F80ED'),
              unselectedItemColor: HexColor('BDBDBD'),
              type: BottomNavigationBarType.fixed,
              items: Mybloc.get(context).bottomItemsEnglish,//Mybloc.get(context).bottomItemsEnglish,
            ),
          );
        },
      ),
    );
  }
}

void show(BuildContext ctx) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: ctx,
    builder: (ctx) => InkWell(
      onTap: () {
        Navigator.pop(ctx);
      },
      child: Container(
        decoration: BoxDecoration(
            color: HexColor('0053CB'),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.5221))),
        height: MediaQuery.of(ctx).size.height * 0.1090712742980562,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(ctx).size.width * 0.1869158878504673,
              height: 2,
              color: HexColor('C4E2FC'),
            ),
            SizedBox(
              height: MediaQuery.of(ctx).size.height * 0.0086393088552916,
            ),
            Container(
              width: MediaQuery.of(ctx).size.width * 0.0934579439252337,
              height: 2,
              color: HexColor('C4E2FC'),
            ),
            SizedBox(
                height: MediaQuery.of(ctx).size.height * 0.0259179265658747),
            Text(
              'CONTINUE STUDYING',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: HexColor('FFFFFF'),
                //height: 21.48,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
