import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/api_calling/controller/api_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/card_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController apiController = Get.put(ApiController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Posts App",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Obx(
        () => apiController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/man.png"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "User : " +
                              apiController
                                  .postModel
                                  .posts![apiController.currentIndex.value]
                                  .userId
                                  .toString(),
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 550,
                      child: CardSwiper(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          backCardOffset: Offset(0, 0),
                          onSwipe: (previousIndex, currentIndex, direction) {
                            apiController.updateIndex(currentIndex!);
                            apiController.updateContainerIndex(currentIndex);
                            return true;
                          },
                          cardBuilder: (context,
                              index,
                              horizontalOffsetPercentage,
                              verticalOffsetPercentage) {
                            List container = [
                              CardsContainer(
                                  itemCount: apiController
                                      .postModel.posts![index].tags.length,
                                  tags: apiController
                                      .postModel.posts![index].tags,
                                  title: apiController
                                      .postModel.posts![index].title,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.orangeAccent,
                                        Colors.orange
                                      ]),
                                  body: apiController
                                      .postModel.posts![index].body),
                              CardsContainer(
                                  itemCount: apiController
                                      .postModel.posts![index].tags.length,
                                  tags: apiController
                                      .postModel.posts![index].tags,
                                  title: apiController
                                      .postModel.posts![index].title,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.teal, Colors.tealAccent]),
                                  body: apiController
                                      .postModel.posts![index].body),
                              CardsContainer(
                                  itemCount: apiController
                                      .postModel.posts![index].tags.length,
                                  tags: apiController
                                      .postModel.posts![index].tags,
                                  title: apiController
                                      .postModel.posts![index].title,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.redAccent, Colors.red]),
                                  body: apiController
                                      .postModel.posts![index].body),
                              CardsContainer(
                                  itemCount: apiController
                                      .postModel.posts![index].tags.length,
                                  tags: apiController
                                      .postModel.posts![index].tags,
                                  title: apiController
                                      .postModel.posts![index].title,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.pinkAccent, Colors.pink]),
                                  body: apiController
                                      .postModel.posts![index].body),
                              CardsContainer(
                                  itemCount: apiController
                                      .postModel.posts![index].tags.length,
                                  tags: apiController
                                      .postModel.posts![index].tags,
                                  title: apiController
                                      .postModel.posts![index].title,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.lightBlueAccent,
                                        Colors.lightBlue
                                      ]),
                                  body: apiController
                                      .postModel.posts![index].body),
                            ];

                            return Column(
                              children: [
                                container[apiController.containerIndex.value],
                              ],
                            );
                          },
                          cardsCount: apiController.postModel.posts!.length),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/like.png",
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(apiController
                                .postModel
                                .posts![apiController.currentIndex.value]
                                .reaction
                                .likes
                                .toString()),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/dislike.png",
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(apiController
                                .postModel
                                .posts![apiController.currentIndex.value]
                                .reaction
                                .dislikes
                                .toString()),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
