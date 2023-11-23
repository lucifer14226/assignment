import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  final String? imageToUrl;
  final String description;
  final String? title;
  final String url;
  const NewsDetail(
      {super.key,
      required this.imageToUrl,
      required this.description,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    if (imageToUrl!.isNotEmpty && imageToUrl != null && title != null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Khabar',
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title!,
                        style: GoogleFonts.poppins(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 20),
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(imageToUrl!),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      description,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(url));
                      },
                      child: Text(
                        url,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Text(
                  //     'Published on',
                  //     style: GoogleFonts.poppins(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //     textAlign: TextAlign.start,
                  //   ),
                  // ),
                ]),
          ),
        ),
      );
    } else if (title != null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Name',
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title!,
                        style: GoogleFonts.poppins(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      description,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(url));
                      },
                      child: Text(
                        url,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Text(
                  //     'Published on',
                  //     style: GoogleFonts.poppins(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //     textAlign: TextAlign.start,
                  //   ),
                  // ),
                ]),
          ),
        ),
      );
    } else {
      return const Placeholder();
    }
  }
}
