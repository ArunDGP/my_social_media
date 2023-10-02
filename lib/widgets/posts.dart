import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  List<Map> people = [                //user's data
    {
      'name': 'Arun',
      'image':
          'https://images.pexels.com/photos/5195607/pexels-photo-5195607.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Jefry',
      'image':
          'https://images.pexels.com/photos/7967362/pexels-photo-7967362.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Chandru',
      'image':
          'https://images.pexels.com/photos/14875251/pexels-photo-14875251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Dany',
      'image':
          'https://images.pexels.com/photos/9607344/pexels-photo-9607344.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Glar',
      'image':
          'https://images.pexels.com/photos/14682794/pexels-photo-14682794.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Babu',
      'image':
          'https://images.pexels.com/photos/4347482/pexels-photo-4347482.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Rajesh',
      'image':
          'https://images.pexels.com/photos/9511985/pexels-photo-9511985.jpeg?auto=compress&cs=tinysrgb&w=600'
    },
    {
      'name': 'Manoj',
      'image':
          'https://images.pexels.com/photos/3863792/pexels-photo-3863792.jpeg?auto=compress&cs=tinysrgb&w=600'
    },
    {
      'name': 'Raghul',
      'image':
          'https://images.pexels.com/photos/6073851/pexels-photo-6073851.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Santhosh',
      'image':
          'https://images.pexels.com/photos/9269359/pexels-photo-9269359.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Shahana',
      'image':
          'https://images.pexels.com/photos/6990438/pexels-photo-6990438.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Jasmine',
      'image':
          'https://images.pexels.com/photos/14833511/pexels-photo-14833511.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(people[i]['image']),      //network image from list of data
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            people[i]['name'],            //user's name from list of data
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                ),
                Container(        //container for post
                  height: 380,
                  color: Colors.grey,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Your post will be displayed here',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade100,
                            fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: GestureDetector(
                              onTap: toggleFavorite,
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite                 
                                    : Icons.favorite_border,
                                size: 28,
                                color: isFavorite ? Colors.red : Colors.black,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, right: 19),
                            child: Icon(
                              Icons.mode_comment_outlined,
                              size: 28,
                            ),
                          ),
                          const Icon(
                            Icons.send_outlined,
                            size: 28,
                          ),
                        ],
                      ),
                      const Icon(Icons.bookmark_border_rounded, size: 28)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text('Liked  by'),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'your friend',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text('and'),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        '62 others',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                          TextSpan(
                            text: people[i]['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                              text:
                                  '  This is user\'s description of thier posts.',  //hardcode data
                              style: TextStyle(height: 1.5)),
                          const TextSpan(
                            text:
                                ' #android #ios #app #software #flutter #dart #developer #programmer',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, height: 1.5),
                          )
                        ]))),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    '16 hours ago',             //hardcode data
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.grey, fontSize: 10, height: 1.8),
                  ),
                )
              ],
            );
          }),
    );
  }
}
