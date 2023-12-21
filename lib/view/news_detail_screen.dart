import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailScreen extends StatefulWidget {
final   String newsImage, newsDate, newsTitle, author, description, content, source;

  const NewsDetailScreen(
      {super.key,
      required this.newsImage,
      required this.newsDate,
      required this.newsTitle,
      required this.author,
      required this.description,
      required this.content,
      required this.source});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final format = DateFormat("MMM dd, yyyy");
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    DateTime dateTime=DateTime.parse(widget.newsDate);
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:  Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              ),
              child: SizedBox(
                width: width,
                height: height *.45,
                child:CachedNetworkImage(imageUrl:widget.newsImage,
                fit: BoxFit.cover,
                  placeholder: (context,ulr)=>Center(child: SpinKitFadingCircle()),
                ),
              ),
            ),
          ),
          Container(
            height: height *.6,
            margin: EdgeInsets.only(top: height*.4),
            padding: const EdgeInsets.only(top:20,right: 20,left: 20,),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            color: Colors.white,
          ),
            child: ListView(
              children: [
                Text(widget.newsTitle,style: GoogleFonts.poppins(
                  fontSize: 20,color: Colors.black87,fontWeight: FontWeight.w700
                ),),
                SizedBox(height: height*.02,),
                Row(
                  children: [
                    Expanded(
                      child: Text(widget.source,style:  GoogleFonts.poppins(
                          fontSize: 13,color: Colors.black87,fontWeight: FontWeight.w600
                      ),),
                    ),
                    Text(format.format(dateTime),style:  GoogleFonts.poppins(
                        fontSize: 12,color: Colors.black87,fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
                SizedBox(height: height*.03,),
            Text(widget.description,style: GoogleFonts.poppins(
                fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500
            ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
