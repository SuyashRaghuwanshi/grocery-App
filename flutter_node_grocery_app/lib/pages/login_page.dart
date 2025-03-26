import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_grocery_app/api/api_service.dart';
import 'package:flutter_node_grocery_app/config.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAsyncCallProcess = false;
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool hidePassword = true;
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall: isAsyncCallProcess,
          child: Form(key: globalKey, child: _loginUI()),
        ),
      ),
    );
  }

  Widget _loginUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Center(
            child: Image.asset(
              "assets/images/shopping-bag.png",
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Grocery App",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
          SizedBox(height: 10),
          FormHelper.inputFieldWidget(
            context,
            "Email",
            "E-Mail",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* Required";
              }
              bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
              ).hasMatch(onValidate);
              if (!emailValid) {
                return "Invalid E-Mail";
              }
              return null;
            },
            (onSaved) {
              email = onSaved.toString().toString();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.email_outlined),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade200,
            prefixIconColor: Colors.black,
            hintFontSize: 14,
            hintColor: Colors.black.withOpacity(0.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          SizedBox(height: 10),
          FormHelper.inputFieldWidget(
            context,
            "Password",
            "Password",
            (onValidate) {
              if (onValidate.isEmpty) {
                return "* Required";
              }

              return null;
            },
            (onSaved) {
              password = onSaved.toString().toString();
            },
            showPrefixIcon: true,
            prefixIcon: Icon(Icons.lock_open),
            borderRadius: 10,
            contentPadding: 15,
            fontSize: 14,
            prefixIconPaddingLeft: 10,
            borderColor: Colors.grey.shade200,
            prefixIconColor: Colors.black,
            hintFontSize: 14,
            hintColor: Colors.black.withOpacity(0.6),
            backgroundColor: Colors.grey.shade100,
            borderFocusColor: Colors.grey.shade200,
          ),
          SizedBox(height: 10),
          Center(
            child: FormHelper.submitButton(
              "Sign Up",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isAsyncCallProcess = true;
                  });
                  APIService.loginUser(email!, password!).then((res) {
                    setState(() {
                      isAsyncCallProcess = false;
                    });
                    if (res) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "User Logged-In Successfully",
                        "Ok",
                        () {
                          Navigator.of(context).pop();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            "/home",
                            (route) => false,
                          );
                        },
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Invalid Email or Password",
                        "Ok",
                        () {
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  });
                }
              },
              btnColor: Colors.deepOrangeAccent,
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 20,
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Dont have an account?",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "Sign Up",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            "/register",
                            (route) => false,
                          );
                        },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
