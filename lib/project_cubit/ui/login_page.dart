import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_cubit/widget/custom_button.dart';
import 'package:project_cubit/widget/text_filed_custom.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  label: "Username",
                  controller: userController,
                  hint: "enter username",
                  validator: Validator.empty,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  label: "Password",
                  controller: passController,
                  hint: "enter password",
                  obscure: true,
                  validator: Validator.password,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomdButton(
                    text: "Login",
                    onpress: () {
                      if (formkey.currentState!.validate()) {
                        String username = userController.text;
                        String password = passController.text;
                        if (checkLog(username, password)) {
                          Navigator.pushNamed(context, "/home");
                          ScaffoldMessenger.of(context).showSnackBar(
                              new SnackBar(content: Text("Login Successfull")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              new SnackBar(
                                  content:
                                      Text("Invalid Username or Password")));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            content: Text("Please provide reqired fields")));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool checkLog(String username, String password) {
  if (username == "admin" && password == "123456") return true;
  return false;
}
