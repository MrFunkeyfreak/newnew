import 'package:bestfitnesstrackereu/pages/user_administration/widgets/add_button_admin.dart';
import 'package:bestfitnesstrackereu/widgets/page_content_details/neuigkeiten_content_Admin.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../constants/text_styles.dart';

class NeuigkeitenContentDetails extends StatefulWidget {
  const NeuigkeitenContentDetails({Key key}) : super(key: key);

  @override

  State<NeuigkeitenContentDetails> createState() => _NeuigkeitenContentDetails();
}
class _NeuigkeitenContentDetails extends State<NeuigkeitenContentDetails>{

  bool isEnable = false;
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  String name = "Neuigkeiten"; //default Text
  String name2 = "Auf dieser Seite halten wir Sie stets auf dem Laufenden. Wir möchten BestFitnessTrackerEU zu einem tollen Erlebnis für Sie machen und werden das Angebot an Sportarten in Zukunft weiter ausbauen. Schauen sie regelmäßig vorbei um immer auf dem aktuellsten Stand zu bleiben.";


  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment;
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          textAlignment = TextAlign.left;
        } else {
          textAlignment = TextAlign.center;
        }

        return Container(
          width: 650,
            child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: titleTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Neuigkeiten aktualisieren",
                  ),
                  controller : _controller,
                ),
              ),
              Container(
                child: FlatButton(
                  child: Text('bearbeiten'),
                  onPressed:(){
                    setState((){
                      name = _controller.text;
                      isEnable = !isEnable;

                    });
                  },

                ),
              ),
              SizedBox(
                height: 30,
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
                    hintText: "Neuigkeiten aktualisieren",
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
          ),
            ));
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
