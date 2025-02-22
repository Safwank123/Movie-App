import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/custom_appbar.dart';

class TvSeriesPage extends StatefulWidget {
  const TvSeriesPage({super.key});

  @override
  State<TvSeriesPage> createState() => _TvSeriesPageState();
}

class _TvSeriesPageState extends State<TvSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(title: 'Tv Shows'),
      body: SingleChildScrollView(
        child: Column(
          children: [
             const SizedBox(height: 20,),
            Container(
              height: 300,
              width: 410,
             
              decoration: BoxDecoration(
         color: Colors.black,
         borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                   Row(
                   
                    children: [
                      const SizedBox(width: 20,),
                      Text('Airing Today',style: GoogleFonts.lato(color: Colors.white,fontSize: 30)),
                      const SizedBox(width: 175,),
                       IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                 Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => 
        Padding(
          padding: const EdgeInsets.only(left: 20,bottom: 10),
          child: Container(
            height: 200, 
            width: 130,   
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
          ),
        ),
        
                ],
              ),
            ),
             const SizedBox(height: 20,),
            Container(
              height: 300,
              width: 410,
             
              decoration: BoxDecoration(
         color: Colors.black,
         borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                   Row(
                   
                    children: [
                      const SizedBox(width: 20,),
                      Text('On The Air',style: GoogleFonts.lato(color: Colors.white,fontSize: 30)),
                      const SizedBox(width:  130,),
                       IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                 Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 5,
            scrollDirection: Axis.horizontal, 
            itemBuilder: (context, index) => 
        Padding(
          padding: const EdgeInsets.only(left: 20,bottom: 10),
          child: Container(
            height: 200, 
            width: 130,   
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
          ),
        ),
        
                ],
              ),
            ),
             const SizedBox(height: 20,),
            Container(
              height: 300,
              width: 410,
             
              decoration: BoxDecoration(
         color: Colors.black,
         borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                   Row(
                   
                    children: [
                      const SizedBox(width: 20,),
                      Text('Top Rated',style: GoogleFonts.lato(color: Colors.white,fontSize: 30)),
                      const SizedBox(width: 200,),
                       IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                 Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 5,
            scrollDirection: Axis.horizontal, 
            itemBuilder: (context, index) => 
        Padding(
          padding: const EdgeInsets.only(left: 20,bottom: 10),
          child: Container(
            height: 200, 
            width: 130,   
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
          ),
        ),
        
                ],
              ),
            ),
             const SizedBox(height: 20,),
            Container(
              height: 300,
              width: 410,
             
              decoration: BoxDecoration(
         color: Colors.black,
         borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                   Row(
                   
                    children: [
                      const SizedBox(width: 20,),
                      Text('Upcomming',style: GoogleFonts.lato(color: Colors.white,fontSize: 30)),
                      const SizedBox(width: 180,),
                       IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                 Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 5,
            scrollDirection: Axis.horizontal, 
            itemBuilder: (context, index) => 
        Padding(
          padding: const EdgeInsets.only(left: 20,bottom: 10),
          child: Container(
            height: 200, 
            width: 130,   
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
          ),
        ),
        
                ],
              ),
            ),
             const SizedBox(height: 20,),
            Container(
              height: 300,
              width: 410,
             
              decoration: BoxDecoration(
         color: Colors.black,
         borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                   Row(
                   
                    children: [
                      const SizedBox(width: 20,),
                      Text('Upcomming',style: GoogleFonts.lato(color: Colors.white,fontSize: 30)),
                      const SizedBox(width: 180,),
                       IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                 Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 5,
            scrollDirection: Axis.horizontal, 
            itemBuilder: (context, index) => 
        Padding(
          padding: const EdgeInsets.only(left: 20,bottom: 10),
          child: Container(
            height: 200, 
            width: 130,   
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20)
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
    );
  }
}