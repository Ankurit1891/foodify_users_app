import 'package:flutter/material.dart';
import 'package:foodify_user_app/global/global.dart';

import '../authentication/auth_screen.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60))
            ),
            padding: const EdgeInsets.only(top: 25,bottom: 10),
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 160,
                      child:  CircleAvatar(
                        backgroundImage: NetworkImage(
                               sharedPreferences!.getString("photoUrl")!,
                        ),
                      ),
                      width: 160,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                 Text(
                  sharedPreferences!.getString("name")!,
                  style: const TextStyle(
                    color: Colors.black,fontSize: 20,fontFamily: "Train"
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12,),
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              children:  [
                const Divider(
                  height: 5,
                  indent: 50,
                  endIndent: 50,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.home,color: Colors.black,),
                  title: const Text(
                    "Home",style: TextStyle(
                    color: Colors.black,
                  ),
                  ),
                  onTap: ()
                  {

                  },
                ),
                const Divider(
                  height: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                  thickness: 1,
                ),// home
                ListTile(
                  leading: const Icon(Icons.reorder,color: Colors.black,),
                  title: const Text(
                    "My Orders",style: TextStyle(
                    color: Colors.black,
                  ),
                  ),
                  onTap: ()
                  {

                  },
                ),
                const Divider(
                  height: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                  thickness: 1,
                ),/// my orders
                ListTile(
                  leading: const Icon(Icons.access_time,color: Colors.black,),
                  title: const Text(
                    "History",style: TextStyle(
                    color: Colors.black,
                  ),
                  ),
                  onTap: ()
                  {

                  },
                ),
                const Divider(
                  height: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                  thickness: 1,
                ),/// history
                ListTile(
                  leading: const Icon(Icons.search,color: Colors.black,),
                  title: const Text(
                    "Search",style: TextStyle(
                    color: Colors.black,
                  ),
                  ),
                  onTap: ()
                  {

                  },
                ),
                const Divider(
                  height: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                  thickness: 1,
                ),/// search
                ListTile(
                  leading: const Icon(Icons.add_location,color: Colors.black,),
                  title: const Text(
                    "Add New Address",style: TextStyle(
                    color: Colors.black,
                  ),
                  ),
                  onTap: ()
                  {

                  },
                ),
                const Divider(
                  height: 5,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey,
                  thickness: 1,
                ),/// location
                ListTile(
                  leading: const Icon(Icons.exit_to_app,color: Colors.black,),
                  title: const Text(
                    "Sign Out",style: TextStyle(
                    color: Colors.black,
                  ),
                  ),
                  onTap: ()
                  {
                    firebaseAuth.signOut().then((value){
                      Navigator.push(context, MaterialPageRoute(builder:(c)=>const AuthScreen()));
                    }
                    );
                  },

                ),  //sign out
                const Divider(
                  height: 5,
                  indent: 50,
                  endIndent: 50,
                  color: Colors.grey,
                  thickness: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
