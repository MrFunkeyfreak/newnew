import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../provider/auth.dart';
import '../../../routing/route_names.dart';
import '../../../widgets/top_navigation_bar/widgets/desktop/top_navigation_bar_user_desktop.dart';

// different TopNavigationBar for admin, scientist and user
//final FirebaseAuth auth = FirebaseAuth.instance;

final user = FirebaseAuth.instance.currentUser;
var mapUserinformations;
final AuthProvider authProvider2 = AuthProvider();

Future<Map<String, dynamic>?> getCurrentUserEmail() async {
  // get the email of the currentUser
  //mapUserinformations = await authProvider2.getUserByEmail(user.email);

  return await mapUserinformations;
}

class Test extends StatelessWidget {
  var currentUserInfos = getCurrentUserEmail();
  @override
  Widget build(BuildContext context) {
    //final authProvider = Provider.of<AuthProvider>(context);  // creating an instance of authProvider

    bool currentRouteIsAdmin = false;
    bool currentRouteIsUser = false;
    bool currentRouteIsScientist = false;

    // checking if an admin, an user or a scientist page is the currentRoute and then set the specific bool value to true
    Navigator.popUntil(context, (currentRoute) {
      if (currentRoute.settings.name == RegristrationScientistRoute ||
          currentRoute.settings.name == RegristrationAdminRoute ||
          currentRoute.settings.name == DashboardRoute ||
          currentRoute.settings.name == UsersAdministrationRoute) {
        currentRouteIsAdmin = true;
      }
      if (currentRoute.settings.name == RegristrationScientistRoute) {
        currentRouteIsScientist = true;
      }
      if (currentRoute.settings.name == InformationRoute ||
          currentRoute.settings.name == NeuigkeitenRoute ||
          currentRoute.settings.name == AuthenticationPageRoute ||
          currentRoute.settings.name == RegristrationUserRoute ||
          currentRoute.settings.name == ForgotPasswordRoute ||
          currentRoute.settings.name == AccessDeniedRoute) {
        currentRouteIsUser = true;
      }
      // Return true so popUntil() pops nothing.
      return true;
    });
    //var mapUserinformations = {};
    print('1111111 is null');
    final user = FirebaseAuth.instance.currentUser;
    print('222222222 is null');
    //var mapUserinformations = {};
    if (user == null) {
      print('user is null');
      mapUserinformations = null;
    } else {
      print('user email: ' + user.email!);
      //var mapUserinformations;
      FutureBuilder<Map<String, dynamic>?>(
          // displaying the email of the current user
          future: currentUserInfos,
          builder: (_, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print('no data');
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.hasData) {
                print('no data');
                return mapUserinformations = snapshot.data!['role'];
              } else {
                print('no data');
              }
            } else {
              return CircularProgressIndicator();
            }
            return Text('Something went wrong');
          });
    }

    //mapUserinformations =  authProvider.getUserByEmailInput(user.email) as Map<String, dynamic>;
    //print('test2' + mapUserinformations['role']);
    if (mapUserinformations != null) {
      //specific bool value for user is true, then create the user TopNavigationBar
      if (currentRouteIsUser == true && mapUserinformations['role'] == 'User') {
        return TopNavigationBarUserDesktop();
      }
      //}

      //checken ob es einen currentuser gibt - wenn es einen gibt, dann ok - wenn nicht, dann access denien.
      //if (authProvider.status == Status.Scientist) {
      //specific bool value for admin is true, then create the admin TopNavigationBar
      if (currentRouteIsAdmin == true &&
          mapUserinformations['role'] == 'Admin') {
        return TopNavigationBarUserDesktop();
      }

      //specific bool value for scientist is true, then create the admin TopNavigationBar
      //if(mapUserinformations['role'] == 'Scientist'){
      //if (authProvider.status == Status.Scientist) {
      if (currentRouteIsScientist == true &&
          mapUserinformations['role'] == 'Scientist') {
        return TopNavigationBarUserDesktop();
      }
    } else {
      return TopNavigationBarUserDesktop();
    }

    // when it is 404_page_not_found error page (need to do: check which user is logged in)
    if (currentRouteIsScientist == false &&
        currentRouteIsAdmin == false &&
        currentRouteIsUser == false) {
      return TopNavigationBarUserDesktop();
    }
    return TopNavigationBarUserDesktop();
  }
}
