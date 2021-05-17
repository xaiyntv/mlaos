import 'package:flutter/material.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/signout_process.dart';
import 'package:mlao/widget/infomation_shop.dart';
import 'package:mlao/widget/list_food_menu_shop.dart';
import 'package:mlao/widget/order_list_shop.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutPreocess(context))
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            homeOrder(),
            homeMenu(),
            homeInfomation(),
            signOut(),
          ],
        ),
      );

  ListTile homeOrder() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('ສິນຄ້າທີ່ລູກຄ້າສັ່ງ'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.menu),
        title: Text('ລາຍການສິນຄ້າ'),
        onTap: () {
          setState(() {
            currentWidget = ListFoodMenuShop();
          });
          Navigator.pop(context);
        },
      );
  ListTile homeInfomation() => ListTile(
      leading: Icon(Icons.info),
      title: Text('ຂໍ້ມູນຮ້ານ'),
      onTap: () {
        setState(() {
          currentWidget = InfomationShop();
        });
        Navigator.pop(context);
      });
  ListTile signOut() => ListTile(
        leading: Icon(Icons.logout),
        title: Text('ອອກ'),
        onTap: () => signOutPreocess(context),
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
