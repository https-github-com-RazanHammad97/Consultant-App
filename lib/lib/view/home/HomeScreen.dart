import 'package:consultant_app/model/mail/MailFilter.dart';
import 'package:consultant_app/model/status/StatusMail.dart';
import 'package:consultant_app/view/home/HomeVM.dart';
import 'package:consultant_app/view/search/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/remote/response/ApiResponse.dart';
import '../../data/repositories/Auth/auth_api.dart';
import '../../model/category/Categories.dart';
import '../../model/mail/MailData.dart';
import '../../utils/Constants.dart';
import '../tiles/MailTile.dart';
import '../tiles/StatusTile.dart';
import '../widgets/CustomText.dart';
import '../widgets/LoadingWidget.dart';
import '../widgets/MyErrorWidget.dart';
import '../widgets/listView/TagGridList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MailFilter> data = <MailFilter>[];

  @override
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
      backgroundColor: kLightWhiteColor,
      appBar: AppBar(
        backgroundColor: kLightWhiteColor,
        leading: const Image(
          image: AssetImage('images/menu.png'),
        ),
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              )
            },
            child: Container(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: const Icon(
                Icons.search,
                color: kBlackColor,
                size: 25,
              ),
            ),
          ),
          // Image(image: AssetImage('images/search.png')),
          const Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('images/profile.png'),
                // AssetImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    return TagGridList(viewModel.tagsMain.data!.tags!);
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
              CustomText('New Inbox', 20, 'Poppins', kLightPrimaryColor,
                  FontWeight.w600),
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
  if (data.isEmpty) {
    return CustomText(
        'Not found data', 14, 'Poppins', kDarkGreyColor, FontWeight.w400);
  }
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
  if (statusList.isEmpty) {
    return CustomText(
        'Not found data', 14, 'Poppins', kDarkGreyColor, FontWeight.w400);
  }
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
