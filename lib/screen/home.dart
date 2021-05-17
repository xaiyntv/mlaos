import 'package:flutter/material.dart';
import 'package:mlao/screen/main_rider.dart';
import 'package:mlao/screen/main_shop.dart';
import 'package:mlao/screen/main_user.dart';
import 'package:mlao/screen/signin.dart';
import 'package:mlao/screen/signup.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/normal_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Future<Null> checkPreferance() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String chooseType = preferences.getString('ChooseTpe');
      if (chooseType != null && chooseType.isNotEmpty) {
        if (chooseType == 'User') {
          routeToService(MainUser());
        } else if (chooseType == "Shop") {
          routeToService(MainShop());
        } else if (chooseType == 'Rider') {
          routeToService(MainRider());
        } else {
          normalDialog(context, 'ຂໍ້ມູນຜູ້ໃຊ້ບໍ່ຖຶກຕ້ອງ');
        }

        {}
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), drawer: showDrawer());
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            signInMenu(),
            signUpMenu(),
          ],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(Icons.login),
      title: Text('ເຂົ້າສູ່ລະບົບ'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.add),
      title: Text('ສ້າງບັນຊີຜູ້ໃຊ້'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('bg.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        'ຜູ້ໃຊ້',
        style: TextStyle(color: Colors.black),
      ),
      accountEmail: Text(
        'ກະລຸນາລົງຊື່ເຂົ້າໃຊ້ງານ',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
