import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedln/pages/init_page.dart';
import 'package:linkedln/pages/job_page.dart';
import 'package:linkedln/pages/network_page.dart';
import 'package:linkedln/pages/notification_page.dart';
import 'package:linkedln/providers/menu_provider.dart';
import 'package:linkedln/services/search_delegate.dart';
import 'package:linkedln/widgets/menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List pages = [
    InitPage(),
    NetworkPage(),
    Container(),
    NotificationPage(),
    JobPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final menuProvider = Provider.of<MenuProvider>(context);

    return Scaffold(
        backgroundColor: Color.fromRGBO(232, 229, 220, 1),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: pages[menuProvider.selectedItem],
                ),
              ),
              Positioned(top: 0, child: _AppBar()),
              Positioned(
                bottom: 0,
                child: Menu(
                  show: menuProvider.show,
                  items: [
                    ItemButton(icon: FontAwesomeIcons.home, label: 'Inicio'),
                    ItemButton(
                        icon: FontAwesomeIcons.userFriends, label: 'Mi red'),
                    ItemButton(
                        icon: FontAwesomeIcons.solidPlusSquare,
                        label: 'Publicar'),
                    ItemButton(
                        icon: FontAwesomeIcons.solidBell,
                        label: 'Notificaciones'),
                    ItemButton(
                        icon: FontAwesomeIcons.briefcase, label: 'Empleos'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final showAppBar = Provider.of<MenuProvider>(context).show;

    return AnimatedOpacity(
      opacity: (showAppBar) ? 1 : 0,
      duration: Duration(milliseconds: 250),
      child: Container(
        width: size.width,
        height: size.height * 0.053,
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.035, right: size.width * 0.035),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profileImage.jpg'),
                radius: size.width * 0.04,
              ),
            ),
            Expanded(child: _Searcher()),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.solidCommentDots,
                size: size.width * 0.055,
                color: Color.fromRGBO(102, 102, 102, 1),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _Searcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.04,
      margin: EdgeInsets.only(right: size.width * 0.03),
      child: GestureDetector(
        onTap: () {
          showSearch(context: context, delegate: DataSearch());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
                child: Icon(
                  FontAwesomeIcons.search,
                  color: Color.fromRGBO(1, 3, 7, 1),
                  size: size.height * 0.018,
                )),
            Expanded(
                child: Container(
                    child: Text(
              'Buscar',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: size.width * 0.035,
                  color: Color.fromRGBO(1, 3, 7, 1)),
              textAlign: TextAlign.start,
            ))),
            IconButton(
              icon: Icon(
                Icons.qr_code_scanner,
                color: Color.fromRGBO(91, 94, 99, 1),
              ),
              onPressed: () {},
              padding: EdgeInsets.only(right: size.width * 0.01),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(238, 243, 247, 1),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
