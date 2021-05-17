import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mlao/model/user_model.dart';
import 'package:mlao/screen/main_rider.dart';
import 'package:mlao/screen/main_shop.dart';
import 'package:mlao/screen/main_user.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/normal_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ເຂົ້າສູ່ລະບົບ'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyStyle().showLogo(),
              MyStyle().mySizebox(),
              MyStyle().showTitle('MLAO'),
              MyStyle().mySizebox(),
              userForm(),
              MyStyle().mySizebox(),
              passwordForm(),
              MyStyle().mySizebox(),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Container(
        width: 250.0,
        child: ElevatedButton(
          onPressed: () {
            if (user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              normalDialog(context, 'ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບຖ້ວນ');
            } else {
              checkeAuthen();
            }
          },
          child: Text(
            'ລົງຊື່ເຂົ້າໃຊ້',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
  Future<Null> checkeAuthen() async {
    String url =
        'http://192.168.100.43/mlaos/getUserWhereUser.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      print('res = $response');
      var result = json.decode(response.data);
      print('result =$result');

      for (var map in result) {
        Usermodel userModel = Usermodel.fromJson(map);
        if (password == userModel.password) {
          String chooseType = userModel.chooseType;

          if (chooseType == 'User') {
            routToService(MainUser(), userModel);
          } else if (chooseType == 'Shop') {
            routToService(MainShop(), userModel);
          } else if (chooseType == 'Rider') {
            routToService(MainRider(), userModel);
          } else {
            normalDialog(context, 'Error');
          }
        } else {
          normalDialog(context, 'ຊື່ແລະລະຫັດຜ່ານນີບໍ່ຖຶກຕ້ອງ ກະລຸນາປ່ຽນໄໝ່');
        }
      }
    } catch (e) {}
  }

  Future<Null> routToService(Widget myWidget, Usermodel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('id', userModel.id);
    preferences.setString('ChooseType', userModel.chooseType);
    preferences.setString('Name', userModel.name);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'ຊື່ຜູ້ໃຊ້:',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );
  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'ລະຫັດຜ່ານ:',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );
}
