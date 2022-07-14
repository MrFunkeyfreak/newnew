import 'package:bestfitnesstrackereu/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// all the input text which get displayed on the information page
// used in information_content_mobile.dart and information_content_desktop.dart

class InformationContentDetails extends StatelessWidget {
  const InformationContentDetails({Key key}) : super(key: key);

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
                'Informations- \nseite von \nTheBestFitnessTracker',
                style: titleTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Herzlich Willkommen auf unserer Webseite TheBestFitnessTrackerEU. \n\n Hier finden Sie Informationen zu unserer aktuellen Studie: \n\n ...',
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
