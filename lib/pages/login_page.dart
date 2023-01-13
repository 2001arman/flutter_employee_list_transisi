import 'package:flutter/material.dart';
import 'package:flutter_employee_list_transisi/constant.dart';
import 'package:flutter_employee_list_transisi/pages/home_page.dart';
import 'package:flutter_employee_list_transisi/widgets/custom_button.dart';
import 'package:flutter_employee_list_transisi/widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget myFormSection() {
      return Column(
        children: const [
          CustomTextFormField(
            title: "Username",
            hintText: "Masukkan Username",
          ),
          CustomTextFormField(
            title: "Password",
            hintText: "Masukkan Password",
            isPassword: true,
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Sign In",
                  style: titleTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 64, vertical: defaultMargin),
                  width: 200,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                    ),
                  ),
                ),
              ),
              myFormSection(),
              SizedBox(height: defaultMargin),
              CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      ),
                    );
                  },
                  title: "Sign In")
            ],
          ),
        ),
      ),
    );
  }
}
