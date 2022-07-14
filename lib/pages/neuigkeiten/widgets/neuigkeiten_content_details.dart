import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../constants/text_styles.dart';

// all the input text which get displayed on the neuigkeiten page
// used in neuigkeiten_content_mobile.dart and neuigkeiten_content_desktop.dart

class NeuigkeitenContentDetails extends StatelessWidget {
  const NeuigkeitenContentDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // if the ScreenType is desktop, then text on left side, else center
        var textAlignment;
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          textAlignment = TextAlign.left;
        } else {
          textAlignment = TextAlign.center;
        }

        return Container(
          width: 650,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Neuigkeiten- \nseite von \nTheBestFitnessTracker',
                style: titleTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Herzlich Willkommen auf unserer Webseite TheBestFitnessTrackerEU. \n\n Hier finden Sie aktuelle Neuigkeiten und wichtige Fakten zu unserer Studie: \n\n ...',
                style: descriptionTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              )
            ],
          ),
        );
      },
    );
  }
}
