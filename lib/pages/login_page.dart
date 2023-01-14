import 'package:flutter/material.dart';
import 'package:flutter_employee_list_transisi/constant.dart';
import 'package:flutter_employee_list_transisi/pages/home_page.dart';
import 'package:flutter_employee_list_transisi/service/api_service.dart';
import 'package:flutter_employee_list_transisi/widgets/custom_button.dart';
import 'package:flutter_employee_list_transisi/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void checkLogin() async {
      if (formKey.currentState!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          isLoading = true;
        });
        Map<String, dynamic> response = await ApiService()
            .login(emailController.text, passwordController.text);
        setState(() {
          isLoading = false;
        });
        if (response['token'] == null) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text("User not found"),
            ),
          );
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          );
        }
      }
    }

    Widget myFormSection() {
      return Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              title: "Email",
              hintText: "Masukkan Email",
              controller: emailController,
              keyboarType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              title: "Password",
              hintText: "Masukkan Password",
              isPassword: true,
              controller: passwordController,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Column(
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
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        onTap: () async {
                          checkLogin();
                        },
                        title: "Sign In",
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
