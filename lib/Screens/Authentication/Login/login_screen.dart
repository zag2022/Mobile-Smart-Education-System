import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc.dart';
import 'package:smart_education/Logics/StateManagement/Bloc/bloc_states.dart';
import 'package:smart_education/Screens/Authentication/Signin/sign_screen.dart';
import 'package:smart_education/Screens/Joining%20University/explore_all_cources_screeen.dart';
import 'package:smart_education/shared/commponents.dart';
import 'package:smart_education/shared/constants/size_config.dart';

import '../../../shared/input_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => Mybloc(),
      child: BlocConsumer<Mybloc, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getProportionateScreenWidth(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                          height: SizeConfig.getProportionateScreenHeight(50)),
                      Center(
                        child: SvgPicture.asset(
                          'assets/Logo.svg',
                          fit: BoxFit.contain,
                          height: SizeConfig.getProportionateScreenHeight(62.3),
                          width: SizeConfig.getProportionateScreenWidth(268.66),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(40.7),
                      ),
                      Text(
                        "To get started — Login to your account.",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: HexColor('0053CB'),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(24),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Email
                            buildColumn(text: "Email"),
                            InputFieldWidget(
                              controller: emailController,
                              // onSubmit: (value) {
                              //   if (value!.isEmpty ||
                              //       !value.contains('@') ||
                              //       !value.contains('.')) {
                              //     return 'Enter a valid User Email!';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.emailAddress,
                              hint: 'Enter your Email',
                              fieldKey: "email",
                            ),
                            SizedBox(
                              height:
                              SizeConfig.getProportionateScreenHeight(24),
                            ),
                            //Password
                            buildColumn(text: "Password"),
                            InputFieldWidget(
                              controller: passwordController,
                              // onSubmit: (value) {
                              //   if (value!.isEmpty || value.length < 8) {
                              //     return 'Password is to short at least 8 !';
                              //   }
                              //   return null;
                              // },
                              keyboardType: TextInputType.text,

                              hint: 'Enter your Password',
                              fieldKey: "password",
                            ),
                            SizedBox(
                              height:
                              SizeConfig.getProportionateScreenHeight(23),
                            ),
                            Text(
                              'Reset your password?',
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: HexColor('0053CB'),
                              ),
                            ),
                            SizedBox(
                              height:
                              SizeConfig.getProportionateScreenHeight(318),
                            ),
                            Container(
                              //56 396
                              height:
                              SizeConfig.getProportionateScreenHeight(56),
                              width:
                              SizeConfig.getProportionateScreenWidth(396),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF0D47A1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: MaterialButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: HexColor('FFFFFF'),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                onPressed: () {
                                  if (passwordController.text.trim().isEmpty ||
                                      passwordController.text.trim().length < 3) {
                                    navigateTo(context, SearchScreen());

                                    /// TODO: show snack bar => please enter a valid data
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height:
                              SizeConfig.getProportionateScreenHeight(24),
                            ),
                            Center(
                              child: MaterialButton(
                                onPressed: () {
                                  navigateTo(context, SignUpScreen());
                                },
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Don’t have an account? ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          color: HexColor('1E88E5'),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Sign up',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          color: HexColor('1565C0'),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Column buildColumn({required String text}) {
    return Column(
      children: [
        Text(
          text,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: HexColor('0053CB'),
            fontSize: 14,
            //height:0.01727861771 ,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: SizeConfig.getProportionateScreenHeight(8),
        ),
      ],
    );
  }
}
