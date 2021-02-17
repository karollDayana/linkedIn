import 'package:flutter/material.dart';
import 'package:linkedln/providers/menu_provider.dart';
import 'package:linkedln/providers/publications_provider.dart';
import 'package:linkedln/widgets/publications.dart';
import 'package:provider/provider.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  ScrollController controller = new ScrollController();
  double lastScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > lastScroll && controller.offset > 120) {
        Provider.of<MenuProvider>(context, listen: false).show = false;
      } else {
        Provider.of<MenuProvider>(context, listen: false).show = true;
      }

      lastScroll = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final publicationProvider = Provider.of<PublicationsProvider>(context);

    return CustomScrollView(
      controller: controller,
      physics: BouncingScrollPhysics(),
      slivers: [
        _crearAppBar(context),
        SliverList(
          delegate: SliverChildListDelegate([
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: publicationProvider.publication.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Publications(
                      publication: publicationProvider.publication[
                          publicationProvider.publication.length - 1 - index],
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
          ]),
        )
      ],
    );
  }
}

Widget _crearAppBar(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return SliverAppBar(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      leadingWidth: 0,
      toolbarHeight: size.height * 0.178,
      title: _Stories());
}

class _Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.125,
      margin: EdgeInsets.only(top: size.height * 0.053),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.055),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profileImage.jpg'),
                      radius: size.width * 0.07,
                    ),
                    Text(
                      'Tu historia',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: size.height * 0.014,
                          color: Color.fromRGBO(6, 6, 6, 1)),
                    )
                  ],
                ),
                Positioned(
                  right: size.width * 0.005,
                  bottom: size.height * 0.025,
                  child: Container(
                      width: size.width * 0.07,
                      child: FloatingActionButton(
                          child: Icon(
                            Icons.add,
                            size: size.width * 0.06,
                            color: Color.fromRGBO(27, 120, 167, 1),
                          ),
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                          onPressed: () {
                            print('Agregar historia');
                          })),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
