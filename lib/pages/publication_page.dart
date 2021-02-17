import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedln/providers/publications_provider.dart';
import 'package:provider/provider.dart';

class PublicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final publicationProvider = Provider.of<PublicationsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.055,
        leadingWidth: size.height * 0.045,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: _LeadingAppbar(),
        elevation: 1,
        title: Text(
          'Compartir publicación',
          style: TextStyle(color: Color.fromRGBO(25, 25, 25, 1)),
        ),
        actions: <Widget>[
          _RaisedButton(
            child: Text(
              'Publicar',
              style: TextStyle(
                  color: (publicationProvider.publicationUser.text != '')
                      ? Color.fromRGBO(25, 25, 25, 1)
                      : Color.fromRGBO(196, 196, 196, 1),
                  fontFamily: 'Roboto',
                  fontSize: size.height * 0.018),
            ),
            color: Color.fromRGBO(255, 255, 255, 1),
            onPressed: (publicationProvider.publicationUser.text != '')
                ? () {
                    publicationProvider.addPublicationFeed(
                        publicationProvider.publicationUser);
                    Navigator.pop(context);
                  }
                : null,
          ),
        ],
      ),
      body: Column(
        children: [
          _PublicationData(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_Hashtag(), _Buttons()],
          )
        ],
      ),
    );
  }
}

class _LeadingAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.02),
      child: IconButton(
          icon: FaIcon(
            Icons.clear,
            color: Color.fromRGBO(103, 103, 103, 1),
            size: size.height * 0.03,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}

class _RaisedButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Color color;

  const _RaisedButton(
      {@required this.child, @required this.onPressed, @required this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      disabledColor: Colors.transparent,
      color: color,
      elevation: 0,
      onPressed: onPressed,
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const _IconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return IconButton(
      icon: FaIcon(
        icon,
        size: size.width * 0.055,
        color: Color.fromRGBO(103, 103, 103, 1),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
    );
  }
}

class _PublicationData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: size.width * 0.045,
            right: size.width * 0.045,
            top: size.height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _UserData(),
              _PublicationContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.008),
      height: size.height * 0.057,
      child: Row(
        children: [
          CircleAvatar(
              backgroundImage: AssetImage('assets/profileImage.jpg'),
              radius: size.width * 0.055),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Karol Dayanna Contreras Calderón',
                  style: TextStyle(
                      fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                ),
                _VisibilityButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisibilityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        width: size.width * 0.4,
        height: size.height * 0.028,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(255, 255, 255, 1),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(152, 152, 152, 1), spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(FontAwesomeIcons.userFriends,
                size: size.height * 0.02,
                color: Color.fromRGBO(132, 133, 135, 1)),
            Text(
              'Solo contactos',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(99, 99, 99, 1)),
            ),
            FaIcon(
              FontAwesomeIcons.caretDown,
              size: size.height * 0.025,
              color: Color.fromRGBO(132, 133, 135, 1),
            )
          ],
        ),
      ),
    );
  }
}

class _PublicationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final publicationProvider = Provider.of<PublicationsProvider>(context);

    return TextFormField(
      keyboardType: TextInputType.text,
      scrollPhysics: NeverScrollableScrollPhysics(),
      textAlign: TextAlign.justify,
      maxLines: null,
      scrollPadding: EdgeInsets.only(bottom: size.height * 0.1),
      style: TextStyle(fontFamily: 'Roboto', fontSize: size.height * 0.022),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '¿Sobre qué quieres hablar?',
        hintStyle:
            TextStyle(fontFamily: 'Roboto', fontSize: size.height * 0.022),
      ),
      onChanged: (value) {
        publicationProvider.addText(value);
      },
    );
  }
}

class _Hashtag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: 0),
        child: TextFormField(
          style: TextStyle(
              color: Color.fromRGBO(33, 90, 144, 1),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '# Añadir hashtag',
            hintStyle: TextStyle(
                color: Color.fromRGBO(33, 90, 144, 1),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500),
          ),
          textAlign: TextAlign.justify,
        ));
  }
}

class _Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        _IconButton(
          icon: FontAwesomeIcons.camera,
          onPressed: () {},
        ),
        _IconButton(
          icon: FontAwesomeIcons.video,
          onPressed: () {},
        ),
        _IconButton(
          icon: FontAwesomeIcons.image,
          onPressed: () {},
        ),
        _IconButton(
          icon: FontAwesomeIcons.ellipsisH,
          onPressed: () {},
        ),
        Expanded(
          child: Container(),
        ),
        _RaisedButton(
            child: Row(
              children: [
                FaIcon(
                  Icons.comment,
                  size: size.width * 0.045,
                  color: Color.fromRGBO(139, 139, 139, 1),
                ),
                Text(
                  ' Contactos',
                  style: TextStyle(
                      color: Color.fromRGBO(98, 98, 98, 1),
                      fontFamily: 'Roboto',
                      fontSize: size.width * 0.035),
                )
              ],
            ),
            color: Color.fromRGBO(250, 250, 250, 1),
            onPressed: () {})
      ],
    );
  }
}
