import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_darl_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/home/widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState(){
    _tabController =  TabController(length: 4, vsync: this);

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVector.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _homeTopCard(),
              _tabs(),
              SizedBox(
                height: 100,
                child: TabBarView(
                  controller: _tabController ,
                  children: [
                    const NewsSongs(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                  ),
              )
      //         Container(child: Image.network(
      //   "https://firebasestorage.googleapis.com/v0/b/fir-a2f0b.appspot.com/o/covers%2FCalvin%20Harris%20%2CDua%20Lipa%20-%20one%20kisss.jpg?alt=media&token=20f9d22c-1c47-46d1-a7da-31728d7da6c4",
      //   errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(Icons.error, color: Colors.red, size: 50),
      //         SizedBox(height: 8),
      //         Text('Failed to load image', style: TextStyle(fontSize: 16)),
      //       ],
      //     );
      //   },
      // ),) ,
              ]),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        child: Container(
          height: 140,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(AppVector.homeTopCard),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 60,
                  ) ,
                  child: Image.asset(AppImages.homeArtist),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

Widget _tabs(){
  return TabBar(
    controller: _tabController,
    isScrollable: true,
    labelColor: context.isDarkMode ? Colors.white : Colors.black,
    indicatorColor: AppColors.primary,
    padding: EdgeInsets.symmetric(
      vertical: 40,
     horizontal: 16
    ),
    tabs: const [
      Text(
        'News',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize : 16  ),
          
      ),
Text(
        'Videos',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize : 16  ),
      ),
Text(
        'Artists',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize : 16  ),
      ),
Text(
        'Podcasts',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize : 16  ),
      ),

    ],
    );
}
}
