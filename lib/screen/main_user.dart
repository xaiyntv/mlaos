import 'package:flutter/material.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/signout_process.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(nameUser == null ? 'Main User' : '$nameUser ກຳລັງໃຊ້ງານຢູ່'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutPreocess(context))
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
          ],
        ),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('bg.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('ຜູ້ໃຊ້'),
      accountEmail: Text('ກະລຸນາລົງຊື່ເຂົ້າໃຊ້ງານ'),
    );
  }
}
