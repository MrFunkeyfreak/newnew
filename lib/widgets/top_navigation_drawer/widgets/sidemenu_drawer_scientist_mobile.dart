import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../routing/route_names.dart';
import '../../top_navbar_item/top_navbar_item.dart';
import '../sidemenu_drawer_header.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<String> currentUserEmail() async {
  // get the email of the currentUser
  final String email = await auth.currentUser.email;

  return email;
}

class SideMenuDrawerScientistMobile extends StatelessWidget {
//drawer for hamburgericon (menu) in mobile screen - used in layout_template.dart
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 16),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SideMenuDrawerHeader(),
            TopNavBarItem(
              'Userverwaltung',
              UsersAdministrationRoute,
              icon: IconData(0xe318, fontFamily: 'MaterialIcons'),
            ),
            TopNavBarItem(
              'Dashboard',
              DashboardRoute,
              icon: IconData(0xf0639, fontFamily: 'MaterialIcons'),
            ),
            TopNavBarItem('Informationen', DashboardRoute,
                icon: IconData(0xe3b2, fontFamily: 'MaterialIcons')),
            TopNavBarItem(
              'Neuigkeiten',
              DashboardRoute,
              icon: IconData(0xe08c, fontFamily: 'MaterialIcons'),
            ),
            Spacer(),

            //sign out the current user - button

            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  TextButton.icon(
                    onPressed: () async => {
                      await FirebaseAuth.instance.signOut(),
                      print('user ist ausgeloggt'),
                      Navigator.of(context).pushNamed(AuthenticationPageRoute),
                    },
                    icon: Icon(
                      IconData(0xe3b3, fontFamily: 'MaterialIcons'),
                      color: Colors.black,
                      size: 20,
                    ),
                    label: Text("Logout",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  FutureBuilder<String>(
                      // displaying the email of the current user
                      future: currentUserEmail(),
                      builder: (_, AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.hasData) {
                            try {
                              return Text('eingeloggt als: \n' + snapshot.data);
                            } catch (e) {
                              print(e);
                            }
                          }
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                ]),

            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
