import 'package:flutter/material.dart';
import 'package:linkedln/models/publication_model.dart';

class PublicationsProvider with ChangeNotifier {
  PublicationsProvider() {
    initPublications();
  }

  List<PublicationModel> _publication;
  PublicationModel _publicationUser;

  List<PublicationModel> get publication => this._publication;
  PublicationModel get publicationUser => this._publicationUser;

  void initPublications() {
    this._publication = [
      PublicationModel(
          isReaction: false,
          isPerson: false,
          edit: false,
          reactions: {Reaction.recommend: 7},
          comment: 0,
          image: 'assets/imagineApps.jpg',
          name: 'Imaginate Apps',
          description: '1.161 seguidores',
          date: '1 semana • ',
          isPublic: true,
          text:
              '"A renewed focus on collaboration and productivity \n \nCollaboration has to be reinvented. We are burning up a lot of social capital built up when people were working together. How to rebuild that capital while people are apart is a challenge… \n \n#apps #emprende #invertir #softwaredeveloper #tecnologiadigital #imagineapps',
          imagePublication: [
            'assets/publication3-1.jpg',
            'assets/publication3-2.jpg'
          ]),
      PublicationModel(
          isReaction: false,
          isPerson: false,
          edit: false,
          reactions: {Reaction.recommend: 6},
          comment: 0,
          image: 'assets/imagineApps.jpg',
          name: 'Imaginate Apps',
          description: '1.161 seguidores',
          date: '5 días • ',
          isPublic: true,
          text:
              'A wake-up call for doing better business \n \n"This crisis must serve as a wake-up call and a call to action for business and governments to think, act and invest for the common good and confront the structural obstacles that have inhibited inclusive economic growth for years." \n \nJamie Dimon, CEO of JP Morgan \n \n#inversion #economia #startup #business #jpmorgan #imagineapps #app',
          imagePublication: [
            'assets/publication2-1.jpg',
            'assets/publication2-2.jpg'
          ]),
      PublicationModel(
          isReaction: true,
          userName: 'Karol Dayanna',
          userReaction: Reaction.recommend,
          isPerson: false,
          edit: false,
          reactions: {Reaction.recommend: 10},
          comment: 1,
          image: 'assets/imagineApps.jpg',
          name: 'Imaginate Apps',
          description: '1.161 seguidores',
          date: '4 días • ',
          isPublic: true,
          text:
              'Startupcol invirtió en tecnología y ganó! \nHoy cuenta con más de 1.000 visitas diarias, ha aparecido en varios medios de comunicación y tiene más 1000 usuarios activos. \n \nEl desarrollo de software, siempre es la mejor apuesta.\n \n#apps #emprende #invertir #softwaredeveloper #tecnologiadigital #imagineapps',
          imagePublication: ['assets/publication1.jpg']),
      PublicationModel(
          isReaction: false,
          isPerson: false,
          edit: false,
          reactions: {Reaction.recommend: 10},
          comment: 1,
          image: 'assets/imagineApps.jpg',
          name: 'Imaginate Apps',
          description: '1.161 seguidores',
          date: '4 días • ',
          isPublic: true,
          text:
              'Startupcol invirtió en tecnología y ganó! \nHoy cuenta con más de 1.000 visitas diarias, ha aparecido en varios medios de comunicación y tiene más 1000 usuarios activos. \n \nEl desarrollo de software, siempre es la mejor apuesta.\n \n#apps #emprende #invertir #softwaredeveloper #tecnologiadigital #imagineapps',
          imagePublication: ['assets/publication1.jpg']),
    ];
  }

  void initPublicationUser() {
    this._publicationUser = PublicationModel(
        isReaction: false,
        image: 'assets/profileImage.jpg',
        name: 'Karol Dayanna Contreras Calderón',
        description: 'Flutter Mobile Developer',
        date: 'ahora • ',
        isPublic: false,
        text: '',
        isPerson: true,
        edit: false,
        imagePublication: []);
  }

  void addText(String value) {
    this._publicationUser.text = value;
    notifyListeners();
  }

  void addPublicationFeed(PublicationModel publicationModel) {
    this._publication.add(publicationModel);
    notifyListeners();
  }
}
