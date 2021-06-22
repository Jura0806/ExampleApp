import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static  final String id = 'home_page';
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   late PageController _pageController;
   int _selectedPage = 0;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Messenger'),
          backgroundColor: Colors.orange,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          children: [
            Container(
              child: Image.asset('assets/images/iphone.jpg',fit: BoxFit.cover) ,
            ),
            Container(
              child:   ListView(
            children: [
            _itemList(image: 'assets/images/Ramesh.jpg', name: 'Ramesh', data: '20:22', text: 'How are  you?'),
            _itemList(image: 'assets/images/Diyor.jpg', name: 'Diyor', data: '20:33', text: 'How are  you?'),
            _itemList(image: 'assets/images/Dovudjon.jpg', name: 'Dovudjon', data: '20:22', text: 'How are  you?'),
            _itemList(image: 'assets/images/HasanAka.jpg', name: 'Hasan aka', data: '12:29', text: 'How are  you?'),
    _itemList(image: 'assets/images/quvonchdos.jpg', name: 'Quvonchbek', data: '00:22', text: 'How are  you?'),
    _itemList(image: 'assets/images/Shodyorbek.jpg', name: 'Shodyorbek', data: '2:22', text: 'How are  you?'),
    _itemList(image: 'assets/images/Hasanboyaka.jpg', name: 'Hasanboy aka', data: '20:32', text: 'How are  you? how the flutter goes. Are you studying? Learn to stop faster.'),
    ],
    ),

            ),
            Container(
              child: Image.asset('assets/images/video.jpg',fit: BoxFit.scaleDown,) ,
            ),
            Container(
              child: Image.asset('assets/images/Notification.png',fit: BoxFit.cover,) ,
            ),
          ],
        ),
       bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.orangeAccent,
         type: BottomNavigationBarType.fixed,
         //selectedItemColor: Colors.white,
         items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
           BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label:  'Notification'),
         ],
         currentIndex: _selectedPage,
         selectedItemColor: Colors.white,
         onTap: (int index){
           setState(() {
             _selectedPage = index;
             _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
           });
         },
       ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Jurabek', style: TextStyle(fontSize: 18),),
              accountEmail: Text('jurabekdeveloper@gmail.com', style: TextStyle(fontSize: 15)),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.deepOrange,
                    Colors.orangeAccent
                  ])
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/photo_2021-06-20 06.07.58.jpeg'),
              ),
            ),
            Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Icon(Icons.home, size: 30, color: Colors.orangeAccent,),
                            Padding(padding: EdgeInsets.all(10.0)),
                            Text('Home', style: TextStyle(fontSize: 20,color: Colors.orangeAccent),)
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Icon(Icons.person, size: 30),
                            Padding(padding: EdgeInsets.all(10.0)),
                            Text('Profile', style: TextStyle(fontSize: 20),)
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Icon(Icons.supervisor_account, size: 30),
                            Padding(padding: EdgeInsets.all(10.0)),
                            Text('Abouts', style: TextStyle(fontSize: 20),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
   Widget _itemList({image, name, data, text, icon}){
     return Container(
       padding: EdgeInsets.all(10.0),
       child: Row(
         //  crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           CircleAvatar(
             radius: 35,
             backgroundImage: AssetImage(image),
           ),
           Expanded(child: Column(
             children: [
               Container(
                 // padding: EdgeInsets.all(6),
                   child: Row(
                     children: [
                       SizedBox(width: 15),
                       Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                       SizedBox(width: 15),
                       Text(data)
                     ],
                   )
               ),
               Container(
                 child: Text(text, style: TextStyle(fontSize: 15),),
               ),
             ],
           ),
           ),
           Padding(padding: EdgeInsets.only(left: 100.0)),
           Icon(Icons.navigate_next_rounded, size: 30, color: Colors.deepPurple),
         ],
       ),
     );
   }

}