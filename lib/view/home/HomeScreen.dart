import 'package:consultant_app/model/mail/MailFilter.dart';
import 'package:consultant_app/model/status/StatusMail.dart';
import 'package:consultant_app/view/home/HomeVM.dart';
import 'package:consultant_app/view/listView/TagList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/remote/response/ApiResponse.dart';
import '../../data/repositories/Auth/auth_api.dart';
import '../../data/services/main_services.dart';
import '../../model/category/Categories.dart';
import '../../model/mail/MailData.dart';
import '../../utils/Constants.dart';
import '../../views/widgets/BottomSheet/NewInbox.dart';
import '../../views/widgets/CustomSearch.dart';
import '../../views/widgets/CustomText.dart';
import '../../views/widgets/my_drawer_widget.dart';
import '../../views/widgets/tiles/StatusTile.dart';
import '../tiles/MailTile.dart';
import '../widgets/LoadingWidget.dart';
import '../widgets/MyErrorWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MailFilter> data = <MailFilter>[];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isVisible = false;
  AuthApi auth = AuthApi();

  showUserContainer() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeVM viewModel = HomeVM();
    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(),
      backgroundColor: kLightWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.blue,),
          onPressed: (){scaffoldKey.currentState!.openDrawer();},
        ),
        backgroundColor: kLightWhiteColor,
        // leading: IconButton(
        //   onPressed: (){
        //     print(1);
        //
        //   },
        //   icon: const Image(
        //     image: AssetImage('images/menu.png'),
        //   ),
        // ),
        elevation: 0,
        actions:  <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: TextButton(
                onPressed: (){
                  showUserContainer();
                },
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('images/profile.png'),
                  // AssetImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          Visibility(
              visible: isVisible,
              child: Container(
                width: 200, height: 400,
                // alignment: Alignment.topRight,
                // padding: EdgeInsets.only(bottom: 500, left: 200),

                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: TextButton(
                    onPressed: () {
                      auth.logOut();
                      MainServices().saveToken("");
                      print(
                          "after logout token ${MainServices().readFromHiveBox("token")}");
                      if (mounted) {
                        Navigator.pushNamed(context, "/Login");
                      }
                    },
                    child: Text("Log Out")),
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearch(),
            const SizedBox(height: 24),
            ChangeNotifierProvider(
              create: (BuildContext context) => viewModel,
              child: Consumer<HomeVM>(builder: (context, viewModel, _) {
                switch (viewModel.statusMain.status) {
                  case Status.LOADING:
                    print("Status :: LOADING");
                    return LoadingWidget();
                  case Status.ERROR:
                    print("Status :: ERROR ");
                    return MyErrorWidget(viewModel.statusMain.message ?? "NA");
                  case Status.COMPLETED:
                    print("Status :: COMPLETED");
                    return _getStatusGridView(
                        viewModel.statusMain.data!.status!);
                  default:
                }
                return Container();
              }),
            ),
            const SizedBox(height: 14),
            ChangeNotifierProvider(
              create: (BuildContext context) => viewModel,
              child: Consumer<HomeVM>(
                builder: (context, viewModel, _) {
                  switch (viewModel.catMain.status) {
                    case Status.LOADING:
                      print("Cat :: LOADING");
                      return LoadingWidget();
                    case Status.ERROR:
                      print("Cat :: ERROR ");
                      return MyErrorWidget(viewModel.catMain.message ?? "NA");
                    case Status.COMPLETED:
                      print("Cat :: COMPLETED");
                      getMailsByCat(viewModel);
                      return _getMailsList(data);
                    default:
                  }
                  return Container();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText('Tags', 20, 'Poppins', kBlackColor, FontWeight.w600),
            const SizedBox(
              height: 15,
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => viewModel,
              child: Consumer<HomeVM>(builder: (context, viewModel, _) {
                switch (viewModel.tagsMain.status) {
                  case Status.LOADING:
                    print("tagsMain :: LOADING");
                    return LoadingWidget();
                  case Status.ERROR:
                    print("tagsMain :: ERROR ");
                    return MyErrorWidget(viewModel.tagsMain.message ?? "NA");
                  case Status.COMPLETED:
                    print("tagsMain :: COMPLETED");
                    return TagList(viewModel.tagsMain.data!.tags!);
                  default:
                }
                return Container();
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 57,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: kNavBottomColor, width: 1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: kLightPrimaryColor,
                radius: 13,
                child: Image(
                  image: AssetImage('images/add.png'),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              NewInbox(
                child: CustomText('New Inbox', 20, 'Poppins',
                    kLightPrimaryColor, FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<MailFilter>> getMailsByCat(HomeVM viewModel) async {
    data = <MailFilter>[];
    List<Categories> cats = viewModel.catMain.data!.categories!;
    List<MailData> mails = viewModel.mailMain.data!.mails!.data!;
    List<MailData> tmp = [];
    for (int i = 0; i < cats.length; i++) {
      for (int j = 0; j < mails.length; j++) {
        if (mails[j].sender!.category!.name == cats[i].name) tmp.add(mails[j]);
      }
      data.add(MailFilter(cats[i].name!, tmp));
      tmp = [];
    }
    return data;
  }
}

Widget _getMailsList(List<MailFilter> data) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int idx) {
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            // this.text, this.size, this.fontFamily, this.color, this.fontWeight
            title: CustomText(
                data[idx].title, 20, 'Poppins', kBlackColor, FontWeight.w600),
            backgroundColor: Colors.transparent,
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: data[idx].children.length,
                itemBuilder: (context, index) {
                  return MailTile(data[idx].children[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0,
                  );
                },
              ),
            ],
          ),
        );
      });
}

Widget _getStatusGridView(List<StatusMail> statusList) {
  return GridView.builder(
    itemCount: statusList.length,
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1.75,
    ),
    itemBuilder: (context, position) => StatusTile(statusList[position]),
  );
}
