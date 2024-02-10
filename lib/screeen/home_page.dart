import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_app/core/param/image_param.dart';
import 'package:cat_app/core/service_locator.dart';
import 'package:cat_app/screeen/loading_screen.dart';
import 'package:cat_app/screeen/uploup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../domain/models/image_model/api_response.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// (control state) || (state mange)

 List<CatImage> images = [];
 late final ScrollController controller;
 int page = 0;
 final int limit = 20;
 bool isLoading = false;

 @override
  void initState() {
    super.initState();
    initController();
    getAllImage();
  }

 void getAllImage({int page = 0})async{
   setState(() => isLoading = true);
   images.addAll(await repozitory.fetchAllCatImage(ImageParam(limit: limit,page: page)));
  setState(() => isLoading = false);
 }

 void initController(){
   controller = ScrollController();
   controller.addListener(() {
     if(controller.position.pixels >= controller.position.maxScrollExtent/*&& (page + 1) * limit == images.length*/){

       getAllImage(page: ++page);
     }
   });
}

  void uploudPush(){
   Navigator.push(context, MaterialPageRoute(builder: (context) => const UploudScreen()));
   setState(() {});
  }
  /// UI => widgets
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Cat App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: uploudPush,
        child: const Icon(CupertinoIcons.paw),
      ),
      body: Stack(
        children: [
           MasonryGridView.builder(
             controller: controller,
               gridDelegate:  const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
             itemCount: images.length,
             itemBuilder: (BuildContext context, int index) {
                 final image = images[index];
                 final ratio = image.width / image.height;
                 return Padding(
                     padding: const EdgeInsets.all(5),
                   child: AspectRatio(
                     aspectRatio: ratio,
                     child: GestureDetector(
                       onDoubleTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return  DetailScreen(
                             image: image.url,
                           );
                         }));
                       },
                       child: Hero(
                         tag: "cat",
                         child: CachedNetworkImage(
                           imageUrl: image.url,
                           placeholder: (context,url) => ColoredBox(
                             color: Colors.primaries[index % Colors.primaries.length],
                           ),
                           errorWidget: (context,url,error) => const Icon(Icons.error),
                         ),
                       ),
                     ),
                   ),
                 );
             },
           ),
          if(isLoading)const LoadingScreen(),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String image;
  const DetailScreen({super.key,required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onDoubleTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Hero(
                tag: "cat",
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context,url) => const ColoredBox(
                    color: Colors.transparent,
                  ),
                  errorWidget: (context,url,error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
