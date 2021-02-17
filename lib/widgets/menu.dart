import 'package:flutter/material.dart';
import 'package:linkedln/providers/menu_provider.dart';
import 'package:linkedln/providers/publications_provider.dart';
import 'package:provider/provider.dart';

class ItemButton {
  final IconData icon;
  final String label;

  ItemButton({
    @required this.icon,
    @required this.label,
  });
}

class Menu extends StatelessWidget {
  final bool show;
  final List<ItemButton> items;

  Menu({
    this.show = true,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: (show) ? 1 : 0,
      duration: Duration(milliseconds: 250),
      child: Builder(
        builder: (BuildContext context) {
          return _MenuBackground(
            child: _MenuItems(items),
          );
        },
      ),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;

  _MenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context);
    final size = MediaQuery.of(context).size;

    return Container(
      child: child,
      width: size.width,
      height: size.height * 0.06,
      decoration: BoxDecoration(
          color: provider.backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, spreadRadius: 0.1)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<ItemButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            menuItems.length, (index) => _MenuBoton(index, menuItems[index])));
  }
}

class _MenuBoton extends StatelessWidget {
  final int index;
  final ItemButton item;

  _MenuBoton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<MenuProvider>(context);

    return GestureDetector(
      onTap: () {
        final menuProvider = Provider.of<MenuProvider>(context, listen: false);
        final publicationProvider =
            Provider.of<PublicationsProvider>(context, listen: false);

        if (index != 2) {
          menuProvider.selectedItem = index;
        } else {
          publicationProvider.initPublicationUser();
          Navigator.pushNamed(context, '/publicationPage');
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: size.width * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              item.icon,
              size: size.height * 0.025,
              color: (provider.selectedItem == index)
                  ? provider.activeColor
                  : provider.inactiveColor,
            ),
            Text(
              item.label,
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: size.height * 0.013),
            )
          ],
        ),
      ),
    );
  }
}
