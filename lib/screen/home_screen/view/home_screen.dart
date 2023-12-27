import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/screen/home_screen/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  TextEditingController txtname = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.readApi(choiseColor: "blue");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Wallpaper"),
        ),
        body: Column(
          children: [
            TextField(
              controller: txtname,
              decoration: InputDecoration(
                  icon: IconButton(
                    onPressed: () {
                      homeController.readApi(choiseColor: txtname.text);
                    },
                    icon: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: "Enter Flower Color"),
            ),
            Obx(
              () => Expanded(
                child: homeController.homeModel.value==null?CircularProgressIndicator():GridView.builder(
                  itemCount: homeController.homeModel.value.hits!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.network(
                          "${homeController.homeModel.value.hits![index].webformatUrl}"),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
