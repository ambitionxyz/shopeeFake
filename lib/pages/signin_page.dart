import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:g5/pages/home_page.dart';
import 'package:g5/provider/accout_provider.dart';
import 'package:provider/provider.dart';

class LoginPapge extends StatelessWidget {
  LoginPapge({Key? key}) : super(key: key);

  var userNameController = TextEditingController();
  var passwordNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var providerAccount = Provider.of<AccountProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(
                    color: Color.fromARGB(255, 53, 66, 207),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 0, bottom: 0, top: 10, right: 0),
                    child: Image(image: AssetImage('assets/images/login.jpg'))),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Tên đăng nhập không được để trống";
                      } else {
                        return null;
                      }
                    },
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: "Vui lòng nhập tên đăng nhập",
                      label: Text("Tên đăng nhập"),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value == null || value.isEmpty) {
                        return 'Mật khẩu không được để trống';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Mật khẩu không hợp lệ';
                        } else {
                          return null;
                        }
                      }
                    },
                    controller: passwordNameController,
                    decoration: InputDecoration(
                      hintText: "Vui lòng nhập mật khẩu",
                      label: Text("Mật khẩu"),
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      var userName = userNameController.text;
                      var password = passwordNameController.text;
                      //check data
                      Future<String> userNameAfferLogin = providerAccount
                          .loginHome(username: userName, password: password);
                      if (userNameAfferLogin != '') {
                        EasyLoading.showToast('Đăng nhập thành công');
                        // print((String)userNameAfferLogin);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    }
                  },
                  child: Container(
                    child: Text(
                      "Đăng Nhập",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 53, 66, 207),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignUpPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 72, 81, 179)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          //side: BorderSide(color: Colors.)
                        ))),
                    child: Text(
                      "Tạo tài khoản mới",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  var userNameController = TextEditingController();
  var passwordNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "Đăng ký tài khoản",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Tên đăng nhập không được để trống";
                      } else {
                        return null;
                      }
                    },
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: "Vui lòng nhập tên đăng nhập",
                      label: Text(
                        "Tên",
                        style: TextStyle(
                            color: Color.fromARGB(255, 125, 124, 124)),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(211, 211, 211, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email không được để trống";
                      } else {
                        return null;
                      }
                    },
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: "Vui lòng nhập email",
                      label: Text(
                        "Email",
                        style: TextStyle(
                            color: Color.fromARGB(255, 125, 124, 124)),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(211, 211, 211, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value == null || value.isEmpty) {
                        return 'Mật khẩu không được để trống';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Mật khẩu không hợp lệ';
                        } else {
                          return null;
                        }
                      }
                    },
                    controller: passwordNameController,
                    decoration: const InputDecoration(
                      hintText: "Vui lòng nhập mật khẩu",
                      label: Text(
                        "Mật khẩu",
                        style: TextStyle(
                            color: Color.fromARGB(255, 125, 124, 124)),
                      ),
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.grey,
                      ),
                      iconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(211, 211, 211, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var userName = userNameController.text;
                            var password = passwordNameController.text;
                            var snackBar = SnackBar(
                              content: Text("Xin chào: ${userName}"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              //side: BorderSide(color: Colors.)
                            ))),
                        child: Text(
                          "Đăng Ký",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context,
                              MaterialPageRoute(builder: (_) => LoginPapge()));
                        },
                        style: ButtonStyle(
                          //backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 51, 178, 195)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          //overlayColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 237, 196, 183)),
                        ),
                        child: Text(
                          "Quay lại",
                          style:
                              TextStyle(fontSize: 20, color: Colors.deepOrange),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
