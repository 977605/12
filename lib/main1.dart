import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController myController = TextEditingController();
  late int count;

  List<Friend> myFriends = [
    Friend(
      name: 'Траурница',
      pig: 'assets/images/traurnitsa.jpg',
      description: 'русское название дано бабочке по её тёмной — «траурной» окраске',
      longDescription:'Траурница - русское название дано бабочке по её тёмной — «траурной» окраске. '
          'Латинский видовой эпитет antiopa связан с греческой мифологией: '
          'Антиопа — царица амазонок, взятая в плен Тесеем.',
    ),
    Friend(
      name:'Крапивница' ,
      pig:  'assets/images/krapivnitsa.jpg',
      description: 'бабочка крапивница (лат. Aglais urticae)',
      longDescription:'Крапивница - бабочка крапивница (лат. Aglais urticae) '
          'обитает на обширной территории Евразии в умеренных широтах, '
          'встречаясь в поле и в лесу, в городских парках и в садах, в скверах и '
          'на лужайках вблизи человеческого жилья.',
    ),
    Friend(
      name: 'Павлиний глаз',
      pig: 'assets/images/pavlinii_glaz.jpg',
      description: 'бабочка относится к семейству Нимфалиды',
      longDescription:'Павлиний глаз - эта бабочка относится к семейству Нимфалиды. '
          'Её близкими родственниками являются шашечницы, крапивницы и перламутровки. '
          'Своё название данное порхающее существо получило из-за наличия на крылышках пятнышек, '
          'которые имеют сходство с «глазами» на хвосте павлина.',
    ),
    Friend(
      name: 'Капустница',
      description:   'Капустница - капустница или белянка капустная.',
      pig: 'assets/images/kapustnitsa.jpg',
      longDescription:   'Капустница - капустница или белянка капустная (лат. Pieris brassicae) — дневная бабочка из семейства белянок (Pieridae). Видовой эпитет происходит от лат. Brassica — капуста, одно из кормовых растений гусениц.',

    )
  ];

  List<Friend> visibleMyFriends =[];

  int updateCount(int index){
    if(count==1){
      count =0;
    }
    return count;
  }

  @override
  void initState() {
    visibleMyFriends=myFriends;
    count =0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      // MaterialApp(
      //   title: 'Books App',
      //   home: Navigator(
      //     pages: [
      //       MaterialPage(
      //         key: ValueKey('BooksListPage'),
      //         child:
      //             BooksListScreen(
      //               friends: friends,
      //               onTapped: _handleBookTapped,
      //             ),
      //
      //         ),
      //
      //       if (_selectedBook != null) BookDetailsPage(friend: _selectedBook!)
      //     ],
      //     onPopPage: (route, result) {
      //       if (!route.didPop(result)) {
      //         return false;
      //       }
      //
      //       // Update the list of pages by setting _selectedBook to null
      //       setState(() {
      //         _selectedBook = null;
      //       });
      //
      //       return true;
      //     },
      //   ),
      // );
      Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/babochka.jpg'),
        ),
        title: const Text('Бабочки', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                labelText: 'Название бабочки',
                suffixIcon: IconButton(
                  onPressed: (){
                    myController.clear();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => BooksListScreen(friends: visibleMyFriends))
                    // );
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.blue,
                  ),
              ),
              ),
              onSubmitted: (value) {
                print('count');
                print(count);
                // if(visibleMyFriends.length==4){
                //   count=0;
                // }
                visibleMyFriends=myFriends
                    .where((friend) => friend!.name!.startsWith(value))
                    .toList();
                // update(index);
                if(visibleMyFriends.length==1){
                  count=1;
                }
                if(visibleMyFriends.length==4){
                  count=0;
                }
                print('visibleMyFriends.length');
                print(visibleMyFriends.length);
                print('count');
                print(count);
                // myController.clear();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => BooksListScreen(friends: visibleMyFriends)));
                setState(() {
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: visibleMyFriends.length==0?
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/babochka.jpg'),
                      SizedBox(width:5, height:5),
                      Text('Такой бабочки нет в списке :(', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red)),
                      Text('Попробуйте поискать другую бабочку', textAlign: TextAlign.center, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black)),
                      // Image.network('https://i.gifer.com/5362.gif')
                    ],
                  )

                //Text("Такой бабочки нет в списке")

                    :
                ListView.builder(
                  itemCount: visibleMyFriends.length,
                  itemBuilder: (context, index) {
                    Friend friend = visibleMyFriends[index];
                    return
                      Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color:
                                count ==1 ?
                                Colors.red
                                    :Colors.blue
                                ,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          leading: ClipRect(
                            child: Image(
                              image: AssetImage(visibleMyFriends[index].pig.toString()),
                              width: 65,
                              height: 50,
                            ),
                          ),
                      onTap: (){
                            int i =updateCount(count);
                            print("uuuuuuuuuuuuu");
                            print(i);
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookDetailsScreen(friend: friend)));
                      },
                      //     onTap: () {
                      // setState(() {
                      // count = 0;
                      // });
                      // },
                      //     onTap: () => Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => DetailsPage(
                      //           // name: visibleMyFriends.name,
                      //           // pig: visibleMyFriends.pig,
                      //           // description: visibleMyFriends.description,
                      //           // longDescription: visibleMyFriends. longDescription,
                      //         ),
                      //       ),
                      //     ),

                          title: Text(visibleMyFriends[index].name.toString()),
                          subtitle: Text(visibleMyFriends[index].description.toString()),
                        ),
                      ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
class Friend {
  String? name;
  String? description;
  String? pig;
  String? longDescription;

  Friend({
    required this.name,
    required this.description,
    required this.pig,
    required this.longDescription,
  });
}

class BookDetailsPage extends StatelessWidget {
  final Friend friend;

  BookDetailsPage(
    this.friend,
  );

  @override
  Widget build(BuildContext context) {
   return
     Scaffold(
       appBar: AppBar(
         title: Text(friend.name.toString()),
       ),
       body:
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
                   Image(
                     image: AssetImage(friend.pig.toString()),
                     width: 50,
                     height: 35,
                   ),
                   Text(friend.name.toString()),
                   Text(friend.description.toString()),
           ],
         ),
       ),
     );
  }
}
class BooksListScreen extends StatelessWidget {
  final List<Friend> friends;
  // final ValueChanged<Friend> onTapped;
  List<Friend> visibleMyFriends =[];

  BooksListScreen({
    required this.friends,
    // required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:

      // TextField(
      //           decoration: InputDecoration(
      //             labelText: 'Название бабочки',
      //           ),
      //           onSubmitted: (value) {
      //             visibleMyFriends=friends
      //                 .where((friend) => friend!.name!.contains(value))
      //                 .toList();
      //             // myController.clear();
      //             // setState(() {
      //             // });
      //           },
      //         ),


           ListView(
              children: [
                for (var friend in friends)
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(
                        color: Colors.green,
                        width: 3,
                        //   color: i == index
                        //       ? Colors.blue
                        //       : Colors.black12,
                        //   width: 3
                      ),
                    ),
                    child: ListTile(
                      leading: Image(
                                image: AssetImage(friend.pig.toString()),
                                width: 50,
                                height: 35,
                              ),
                      title: Text(friend.name.toString()),
                      subtitle: Text(friend.description.toString()),
                      onTap: (){
                       // count =0;
                       //  print("uuuuuuuuuuuuu");
                       //  print(i);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookDetailsScreen(friend: friend)));
                      },
                    ),
                  )
              ],
            ),



    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Friend friend;

  BookDetailsScreen({
    required this.friend,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(friend.name.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (friend != null) ...[
              Text(friend.name.toString(), style: Theme.of(context).textTheme.headline6),
              Text(friend.longDescription.toString(), style: Theme.of(context).textTheme.subtitle1),
              Image(
                        image: AssetImage(friend.pig.toString()),
                        width: 500,
                        height: 350,
                      ),
            ],
          ],
        ),
      ),
    );
  }
}

// class DetailsPage extends StatelessWidget {
//   const DetailsPage({Key? key,
//     required this.name,
//     required this.pig,
//     required this.description,
//     required this.longDescription
//   })
//       : super(key: key);
//
//   final String pig;
//   final String name;
//   final String description;
//   final String longDescription;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Бабочка '+ '$name'),
//       ),
//       body: Center(
//         child: Card(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: 400,
//                   // height: 400,
//                   child:
//                   Hero(
//                     tag: name,
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Image(
//                         image: AssetImage(pig),
//
//                       ),
//
//                     ),
//
//                   ),
//
//                 ),
//               ),
//               // Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(longDescription, style: TextStyle(fontSize: 18)),
//               )
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }