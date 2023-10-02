import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app_flutter/view/add_post_screen.dart';
import 'package:social_app_flutter/view/auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //used tabs here
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Row(
                      children: [
                        Text('Powered by ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                        Text(
                          'RaftLabs',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://as1.ftcdn.net/v2/jpg/04/23/59/74/1000_F_423597477_AKCjGMtevfCi9XJG0M8jter97kG466y7.jpg'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade500)),
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 27),
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 27),
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 27),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Arun D G Prabakaran',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                    ),
                    const Text(
                      'Flutter Developer(Android/iOS)',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Think good, Be good, Do good.',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'github.com/arun960720',
                      style:
                          TextStyle(fontSize: 20, color: Colors.blue.shade700),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        //navigate to addPostScreen
                        builder: (context) => const AddPostForm(),
                      )),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            'Add Post',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance
                            .signOut(); //signing out function and back to signIn screen
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ));
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                            child: Text('Logout',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16))),
                      ),
                    ),
                  ],
                ),
              ),
              const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.grid_on_sharp,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.person_pin_outlined,
                        color: Colors.black, size: 28),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //tabs for user's posts
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemCount: 10,
                        itemBuilder: (context, i) => Padding(
                              padding: const EdgeInsets.all(1),
                              child: Container(
                                color: Colors.grey,
                                child: Center(
                                    child: Text(
                                  'DART',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.purple.shade50),
                                )),
                              ),
                            )),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: 10,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          color: Colors.blue.shade300,
                          child: Center(
                            child: Text(
                              'ANDROID/IOS',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.purple.shade50),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
