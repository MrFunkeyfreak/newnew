import 'package:bestfitnesstrackereu/pages/user_administration/user_administration_view.dart';
import 'package:bestfitnesstrackereu/widgets/page_content_details/informations_content_Admin.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../constants/text_styles.dart';

class InformationContentDetails extends StatefulWidget {
  const InformationContentDetails({Key key}) : super(key: key);

  @override

  State<InformationContentDetails> createState() => _InformationContentDetails();
}
class _InformationContentDetails extends State<InformationContentDetails> {
  bool isEnable = false;
  var _controller = new TextEditingController(text: ''); //Test um zu sehen ob sich der Text auch direkt als Variable einfügen lässt, ohne den String name
  var _controller2 = TextEditingController();

  String  name = "Allgemeine Informationen";
  String name2 = "Herzlich Willkommen auf unserer Webseite TheBestFitnessTrackerEU. \n\nBewegungsmangel ist in unserer modernen Gesellschaft ein weit verbreitetes Problem und kann weitreichende Folgen für jeden Einzelnen haben. Er fördert die Entstehung von Übergewicht und erhöht das Risiko für Typ-2-Diabetes, Herz-Kreislauferkrankungen und Krebs. Ab wann spricht man eigentlich von Bewegungsmangel? Man spricht von Bewegungsmangel, sobald die Muskulatur unseres Körpers zu wenig belastet wird. Dabei würde pro Woche bereits ein Bewegungspensum von 150 Minuten mäßige Aktivitäten oder 75 Minuten intensiver Sport wie Fahrradfahren oder Joggen ausreichen, um das Defizit auszugleichen. Dabei möchen wir Ihnen gerne behilflich sein. Mit dem BestFitnessTrackerEU haben Sie die Möglichkeit ihre Aktivitäten zu im Auge zu behalten und können dadurch ihren Bewegungsmangel reduzieren.";

  textlistener(){
    print("Update: ${_controller.text}");  // printed die Veränderungen im Text in der Konsole
    print("Update: ${_controller2.text}");

  }
  @override
  void initState() {
    super.initState();
    // Start listening to changes
    _controller.addListener(textlistener);
    _controller2.addListener(textlistener);
  }



  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {  // Anpassung des Textes auf verschiedene Bildschirmgrößen
        var textAlignment;
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          textAlignment = TextAlign.left;
        } else {
          textAlignment = TextAlign.center;
        }

        return Container(
          width: 650,
          child: SingleChildScrollView( // Text lässt sich scrollen. Es tauchten ständig Pixelfehler auf, weil der Text außerhalb des Fensters lag. Mithilfe dieses Widgets konnte das Problem behoben werden.
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: titleTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              ),
              TextField(
                enabled: true, //Text lässt sich bearbeiten, bei false ist bearbeitung deaktiviert, konnte das aber nicht auf den Admin übertragen, wird wahrscheinlich via If, else Funktion gemacht, aber hat bei mir nicht funktioniert
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                hintText: "Informationen aktualisieren", // Wird als Hintergrundtext im bearbeitungsfenster angezeigt.
                ),
                controller : _controller, // Text lässt sich bearbeiten
              ),
              FlatButton(
                child: Text('bearbeiten'),
                onPressed:(){
                  setState((){
                    name = _controller.text; // String wird durch neuen Controller Text ersetzt
                    isEnable = !isEnable; // Wird benötigt um Textfeld zu bearbeiten, oder zu sperren

                  });
                },

              ),
              Text(
                name2,
                style: descriptionTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Informationstext aktualisieren"
                  ),
                  controller : _controller2,

                ),
              ),
              Container(
                child: FlatButton(
                  child: Text('bearbeiten'),
                  onPressed:(){
                    setState((){
                      name2 = _controller2.text;
                      isEnable = !isEnable;

                    });
                  },

                ),
              ),


            ],
          )),
        );
      },
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();


  }
}


