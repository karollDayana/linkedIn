import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedln/models/publication_model.dart';

final Map<Reaction, String> reactionName = {
  Reaction.recommend: 'recomienda',
  Reaction.celebrate: 'celebra',
  Reaction.support: 'apoya',
  Reaction.love: 'le encanta',
  Reaction.interest: 'le interesa',
  Reaction.curiosity: 'le da curiosidad',
};

class Publications extends StatelessWidget {
  final PublicationModel publication;

  const Publications({this.publication});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (publication.isReaction)
              ? _UserReaction(
                  publication: publication,
                )
              : Container(
                  height: 0,
                ),
          (publication.isReaction)
              ? Divider(
                  indent: size.width * 0.03,
                  endIndent: size.width * 0.03,
                  thickness: size.height * 0.0015,
                  height: 0.0,
                )
              : Container(
                  height: 0,
                ),
          _UserDescription(
            publication: publication,
          ),
          _PublicationDescription(
            publication: publication,
          ),
          (publication.imagePublication.length == 0)
              ? Container()
              : _PublicationImage(
                  publication: publication,
                ),
          (publication.reactions == null)
              ? Container()
              : _PublicationReactions(
                  publication: publication,
                ),
          Divider(
            indent: size.width * 0.03,
            endIndent: size.width * 0.03,
            thickness: size.height * 0.0015,
          ),
          _PublicationOptions(),
        ],
      ),
    );
  }
}

class _MenuPublication extends StatelessWidget {
  final AlignmentGeometry alignment;

  const _MenuPublication({this.alignment});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.chevronDown,
        size: size.width * 0.05,
        color: Color.fromRGBO(81, 81, 81, 1),
      ),
      padding: EdgeInsets.all(0),
      alignment: alignment, //revisar esto en las dos opciones de publicacion
      onPressed: () {},
    );
  }
}

class _UserReaction extends StatelessWidget {
  final PublicationModel publication;

  const _UserReaction({@required this.publication});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      height: size.height * 0.055,
      child: Row(
        children: [
          Text(publication.userName,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: size.height * 0.018,
                color: Color.fromRGBO(71, 71, 71, 1),
              )),
          Expanded(
              child: Text(' ${reactionName[publication.userReaction]} esto',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: size.height * 0.018,
                    color: Color.fromRGBO(71, 71, 71, 1),
                  ))),
          _MenuPublication(
            alignment: Alignment.centerRight,
          )
        ],
      ),
    );
  }
}

class _UserDescription extends StatelessWidget {
  final PublicationModel publication;

  const _UserDescription({@required this.publication});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.055,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.02),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(right: size.width * 0.02),
              child: (publication.isPerson)
                  ? CircleAvatar(
                      backgroundImage: AssetImage(publication.image),
                      radius: size.width * 0.07,
                    )
                  : Image(
                      image: AssetImage(publication.image),
                      width: size.width * 0.12,
                      height: 100,
                    )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(publication.name,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: size.height * 0.018,
                      color: Color.fromRGBO(71, 71, 71, 1),
                    )),
                Text(
                  publication.description,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: size.width * 0.031,
                      color: Color.fromRGBO(136, 136, 136, 1)),
                ),
                Row(
                  children: [
                    Text(
                      publication.date,
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: size.width * 0.031,
                          color: Color.fromRGBO(136, 136, 136, 1)),
                    ),
                    FaIcon(
                      (publication.isPublic)
                          ? FontAwesomeIcons.globeAmericas
                          : FontAwesomeIcons.userFriends,
                      size: size.width * 0.025,
                      color: Color.fromRGBO(99, 99, 99, 1),
                    )
                  ],
                )
              ],
            ),
          ),
          (!publication.isReaction)
              ? _MenuPublication(
                  alignment: Alignment.topRight,
                )
              : Container()
        ],
      ),
    );
  }
}

class _PublicationDescription extends StatelessWidget {
  final PublicationModel publication;

  const _PublicationDescription({@required this.publication});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Text(
        publication.text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _PublicationImage extends StatelessWidget {
  final PublicationModel publication;

  const _PublicationImage({@required this.publication});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
        child: (publication.imagePublication.length == 1)
            ? Image(
                image: AssetImage(publication.imagePublication[0]),
                height: size.height * 0.46,
                width: size.width,
                fit: BoxFit.cover,
              )
            : Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: size.width * 0.005),
                    child: Image(
                      image: AssetImage(publication.imagePublication[0]),
                      height: size.height * 0.46,
                      width: size.width * 0.495,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.005),
                    child: Image(
                      image: AssetImage(publication.imagePublication[1]),
                      height: size.height * 0.46,
                      width: size.width * 0.495,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ));
  }
}

class _PublicationReactions extends StatelessWidget {
  final PublicationModel publication;

  const _PublicationReactions({@required this.publication});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Row(
        children: [
          FaIcon(
            Icons.recommend,
            color: Color.fromRGBO(31, 131, 177, 1),
            size: size.width * 0.045,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Text(
              publication.reactions.values.first.toString(),
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: size.height * 0.015,
                  color: Color.fromRGBO(159, 159, 159, 1)),
            ),
          )),
          (publication.comment != 0)
              ? GestureDetector(
                  onTap: () {},
                  child: Text(
                    '${publication.comment} comentario',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: size.height * 0.015,
                        color: Color.fromRGBO(159, 159, 159, 1)),
                  ))
              : Container(),
        ],
      ),
    );
  }
}

class _PublicationOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.03,
          right: size.width * 0.09,
          bottom: size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _PublicationOption(
              icon: FontAwesomeIcons.thumbsUp,
              text: 'Recomendar',
              onTap: () {
                print('recomendar');
              }),
          _PublicationOption(
              icon: FontAwesomeIcons.commentAlt,
              text: 'Comentar',
              onTap: () {
                print('comentar');
              }),
          _PublicationOption(
              icon: FontAwesomeIcons.share,
              text: 'Compartir',
              onTap: () {
                print('compartir');
              }),
          _PublicationOption(
              icon: FontAwesomeIcons.solidPaperPlane,
              text: 'Enviar',
              onTap: () {
                print('enviar');
              }),
        ],
      ),
    );
  }
}

class _PublicationOption extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final String text;

  const _PublicationOption(
      {@required this.onTap, @required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FaIcon(icon,
              size: size.height * 0.015, color: Color.fromRGBO(81, 81, 81, 1)),
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: size.height * 0.014,
                color: Color.fromRGBO(81, 81, 81, 1)),
          ),
        ],
      ),
    );
  }
}
