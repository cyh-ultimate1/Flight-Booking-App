import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../Services/OnlineServices.dart';
import '../constants.dart';
import '../CustomWidgets/customWidgets.dart';
import 'HomeEntryPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final secureStorage = const FlutterSecureStorage();
  bool isLoading = false;

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<void> _loginBtnAction(BuildContext context) async {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }

    var username = _usernameController.text;
    var password = _passwordController.text;

    setState(() {
      isLoading = true;
    });
    var loginResponse =
        await OnlineService.Instance.loginUser(username, password);
    var sessionKey = loginResponse != null ? loginResponse.token : "";
    setState(() {
      isLoading = false;
    });
    if (sessionKey.isNotEmpty) {
      secureStorage.write(key: GlobalConstants.jwt, value: sessionKey);
      OnlineService.Client.headersTemplate["Authorization"] =
          "Bearer " + sessionKey;
      displayDialog(context, "Success", "Success");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeEntryPage()),
          (r) => false);
    } else {
      displayDialog(context, "An Error Occurred",
          "No account was found matching that username and password");
    }
  }

  String validateTextNotEmpty(String? text, String elementName) {
    return (text == null || text.isEmpty) ? "$elementName is empty" : "";
  }

  String? validateUsername(String? text) {
    var errMsg = "";
    errMsg += validateTextNotEmpty(text, "Username");
    return errMsg.isEmpty ? null : errMsg;
  }

  String? validatePassword(String? text) {
    var errMsg = "";
    errMsg += validateTextNotEmpty(text, "Password");
    return errMsg.isEmpty ? null : errMsg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         fit: BoxFit.fill,
        //         colorFilter: ColorFilter.mode(
        //             Colors.black.withOpacity(0.2), BlendMode.dstATop),
        //         image: const AssetImage("assets/images/some_building.png"))),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            gradient: GlobalConstants.customLinearGradient),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _form,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _usernameController,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20.0),
                      decoration: const InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white)),
                      // validator: (e) => validateUsername(e),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20.0),
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white)),
                      validator: (e) => validatePassword(e),
                    ),
                    customWidgets.emptyHorizontalSpace(),
                    isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () => _loginBtnAction(context),
                            child: Text("Log In".toUpperCase()),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange[800],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                  ]),
            )),
      ),
    );
  }
}
