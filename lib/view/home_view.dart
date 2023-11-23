import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/model/search_model.dart';
import 'package:newsapp/model_view/category_container.dart';
import 'package:newsapp/model_view/category_list.dart';
import 'package:newsapp/model_view/new_list_view.dart';

class Homepage extends StatefulWidget {
  final String title;
  final String date;
  const Homepage({super.key, required this.title, required this.date});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentTab = 1;
  //DateTime currentDate = DateTime.now();
  //String currentdate = "";
  List<CategoryContainer> categorylist = [];

  @override
  void initState() {
    //currentdate = "${currentDate.year}-${currentDate.day}-${currentDate.month}";
    categorylist = category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Khabar",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () async {
                await Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform);
                try {
                  await FirebaseAuth.instance.signOut();
                } catch (e) {
                  debugPrint('e');
                }
                // ignore: use_build_context_synchronously
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('LoginRoutes', (route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryContainer(
                        title: categorylist[0].title,
                        imageurl: categorylist[0].imageurl),
                    CategoryContainer(
                        title: categorylist[1].title,
                        imageurl: categorylist[1].imageurl),
                    CategoryContainer(
                        title: categorylist[2].title,
                        imageurl: categorylist[2].imageurl),
                    CategoryContainer(
                        title: categorylist[3].title,
                        imageurl: categorylist[3].imageurl),
                    CategoryContainer(
                        title: categorylist[4].title,
                        imageurl: categorylist[4].imageurl),
                    CategoryContainer(
                        title: categorylist[5].title,
                        imageurl: categorylist[5].imageurl)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              NewListView(
                title: widget.title,
                date: currentdate,
              )
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const NewsDetail(
              //             imageurl:
              //                 'https://img.freepik.com/free-vector/classic-planet-earth-with-gradient-style_23-2147914521.jpg?size=626&ext=jpg&ga=GA1.1.1042869445.1689512999&semt=ais',
              //             description: 'hello world',
              //             title: 'Title',
              //           ),
              //         ));
              //   },
              //   child: const NewsRowList(
              //     newsImageUrl:
              //         'https://img.freepik.com/free-vector/classic-planet-earth-with-gradient-style_23-2147914521.jpg?size=626&ext=jpg&ga=GA1.1.1042869445.1689512999&semt=ais',
              //     description: 'hello world',
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade300,
        currentIndex: _currentTab,
        onTap: (value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
            label: const String.fromEnvironment("name"),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('ProfileRoutes');
              },
              icon: const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c98ec19e-aae2-4d4c-a71f-77b215bd93ec/ddrzwsu-2e2b0726-def8-4817-91c0-d8c16b244273.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2M5OGVjMTllLWFhZTItNGQ0Yy1hNzFmLTc3YjIxNWJkOTNlY1wvZGRyendzdS0yZTJiMDcyNi1kZWY4LTQ4MTctOTFjMC1kOGMxNmIyNDQyNzMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.-AgnfteHKfj6qNKqfxt0K2aEtRdMm-IHKNM7hX3pvqY"),
              ),
            ),
            label: const String.fromEnvironment("name"),
          ),
        ],
      ),
    );
  }
}
