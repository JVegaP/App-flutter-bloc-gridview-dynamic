import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_flutter_app/core/constants/app_constants.dart';
import 'package:giphy_flutter_app/core/constants/color_constants.dart';
import 'package:giphy_flutter_app/core/constants/style_constants.dart';
import 'package:giphy_flutter_app/presentation/home/bloc/home_bloc.dart';
import 'package:giphy_flutter_app/presentation/home/widgets/widget_item_home.dart';
import 'package:giphy_flutter_app/presentation/widgets/widget_animation_circular_loading.dart';
import 'package:giphy_flutter_app/presentation/widgets/widget_empty_view.dart';
import 'package:giphy_flutter_app/presentation/widgets/widget_textfield.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({
    Key? key
  }): super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc = HomeBloc();
  @override
  void initState() {
    bloc = BlocProvider.of<HomeBloc>(context, listen: false);
    _loadView();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          child: _mainContainer()
      ),
    );
  }

  Widget _mainContainer() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.only(top: kDimens10),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: kDimens30,
                  width: kDimens30,
                  child: WidgetAnimationCircularLoading(
                    visible: bloc.isLoading, key: const Key('kWidgetLoading'),
                  ),
                ),
              ),
              WidgetEmptyView(
                  key: const Key('kWidgetViewEmpty'),
                  visible: !bloc.isLoading && bloc.items.isEmpty
              ),
              _listGiphy(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDimens10),
                child: WidgetTextField(
                    key: const Key('kWidgetTextField'),
                    labelText: kDefaultSearch,
                    prefix: const Icon(
                      Icons.search,
                      color: kGray,
                    ),
                    onSubmitted: (String value) {
                      if(value.isEmpty) {
                        _loadView();
                      } else {
                        _search(value);
                      }
                    }
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _listGiphy() {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDimens15,
        right: kDimens15,
        top: kDimens60,
        bottom: kDimens15
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(_calculateSize(bloc.items.length), (index) {
                    return WidgetItemHome(
                        image: bloc.items[index].images.fixedWidth.url,
                        height: bloc.items[index].images.fixedWidth.height
                    );
                  }),
                ),
            ),
            const SizedBox(width: kDimens10),
            Expanded(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                    bloc.items.length % 2 == 0 ?
                    _calculateSize(bloc.items.length) :
                    _calculateSize(bloc.items.length) - 1, (index) {
                      return WidgetItemHome(
                          image: bloc.items[index + _calculateSize(bloc.items.length)].images.fixedWidth.url,
                          height: bloc.items[index + _calculateSize(bloc.items.length)].images.fixedWidth.height
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Method that calculate size column
  int _calculateSize(int size) {
    return (size / 2).round();
  }

  /// Method that create
  void _loadView() async {
    bloc.isLoading = true;
    await bloc.getListGiphy().then((value){
    }).whenComplete(() => bloc.isLoading = false
    );
  }

  /// Method that search items by name
  void _search(String value) async {
    bloc.isLoading = true;
    await bloc.getListGiphyByName(search: value).then((value){
    }).whenComplete(() => bloc.isLoading = false
    );
  }

}