import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  Widget shopCardBuilder() {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: Stack(
        children: [
          Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 130,
                  width: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/dummyshop.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Xerox Prints',
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Keshav Nagar',
                      style: GoogleFonts.raleway(
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    // const ListTile(
                    //   title: Text('Send Files'),
                    // )
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // const Spacer(),
                          const Text('View more'),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_right_sharp))
                        ],
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
          // Container(),
          // const Positioned.fill(bottom: 0, right: 0, child: Text('ABC'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 100,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Nearby Shops',
                style: TextStyle(fontFamily: 'MoonBold', fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              shopCardBuilder(),
              const SizedBox(
                height: 10,
              ),
              shopCardBuilder(),
              const SizedBox(
                height: 10,
              ),
              shopCardBuilder(),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
