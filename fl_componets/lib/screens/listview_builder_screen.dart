import 'package:fl_componets/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesIds = [1,2,3,4,5,6,7,8,9];
  final ScrollController  scrollController =  ScrollController();
   bool isLoading = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) > scrollController.position.maxScrollExtent){
        add10();
      }
    });
  }

  void add10(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
    setState(() { });
  }
 
  Future fetchData() async{
    if(isLoading) return;

    isLoading = true;
    setState(() { });

    Future.delayed(const Duration(seconds: 3));
     add10();
     isLoading = false;
     setState(() { });

      if((scrollController.position.pixels + 100) > scrollController.position.maxScrollExtent) return;
     
     
      scrollController.animateTo(
         (scrollController.position.pixels + 120),
         duration: const Duration(microseconds: 300), 
         curve: Curves.fastOutSlowIn
      );
  }
    
  Future<void> onRefresh() async{

    Future.delayed(const Duration(seconds: 2));
     final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add10();
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context:  context,
        removeTop: true, 
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh ,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                 itemCount: imagesIds.length,
                 itemBuilder:(context, index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('http://picsum.photos/500/300?image=${imagesIds[index]}')
                  );
              }),
            ),


            if( isLoading)
              Positioned(
                bottom: 40,
                left: size.width* 0.5 - 30, 
                child: const _LoadingIcon()
                )
              
          ],
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color:  Colors.white,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator() ,
    );
  }
}