import 'package:flutter/material.dart';
import 'package:social_app_flutter/widgets/posts.dart';
import 'package:social_app_flutter/widgets/stories.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    child: Row(
                      
                      children: [
                        Text('Powered by ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                        Text('RaftLabs',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ],
                    )),
              ],
            ),
            const Stories(),        //seperate file for stories and posts
            Divider(
              color: Colors.grey.shade300,
              thickness: 0.2,
            ),
            const Posts(),
          ],
        ),
      ),
    );
  }
}
