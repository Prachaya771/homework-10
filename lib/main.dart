import 'package:flutter/material.dart';
import 'apex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apex Blog',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Apex> apex = [
    Apex(
        profileuser: 'assets/images/apex1.jpg',
        img: 'assets/images/apex1-2.jpg',
        userpost: 'Maggie',
        comments: [
          Comments(
              user: 'Wraith',
              comment:
                  'เท่มากก'),
          Comments(
              user: 'Lifeline',
              comment: 'มาเล่นด้วยกันไหม')
        ],
        content: "ยินดีที่ได้รู้จักนะทุกคน \n"),
    Apex(
        profileuser: 'assets/images/apex2.png',
        img: 'assets/images/apex2-2.jpg',
        userpost: 'Bloodhound',
        comments: [
          Comments(
              user: 'Loba',
              comment:
                  'นายรุนแรงเกินไปนะ Bloodhound'),
          Comments(
              user: 'Fuse',
              comment: 'ไว้เจอกันนน')
        ],
        content:
            "นายคือผู้โชคดี \n"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
          title: Text('Apex Blog',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ))),
      body: ListView.builder(
          itemCount: apex.length,
          itemBuilder: (context, index) => MyCard(apex: apex[index])),
    );
  }
}

class MyCard extends StatefulWidget {
  final Apex apex;

  const MyCard({
    Key? key,
    required this.apex,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.apex.profileuser}'),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(child: Text('${widget.apex.userpost}')),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                )
              ],
            ),
          ),
          Image.asset(
            '${widget.apex.img}',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Expanded(child: Text('${widget.apex.content}'))],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10.0, left: 16.0, right: 16.0),
            child: Column(
              children: [
                for (int i = 0; i < widget.apex.comments.length; i++)
                  Row(
                    children: [
                      SizedBox(
                        height: 23.0,
                      ),
                      Text(
                        '${widget.apex.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${widget.apex.comments[i].comment}',
                        style: TextStyle(),
                      )
                    ],
                  )
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    like = !like;
                  });
                },
                icon: like
                    ? Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      )
                    : Icon(Icons.favorite_border),
              ),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      widget.apex.comments
                          .add(Comments(user: 'Pathfinder', comment: value));
                      controller.clear();
                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
