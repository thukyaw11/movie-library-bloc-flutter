import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/network/models/bloc/casts/cast_bloc.dart';
import 'package:movie_app/network/models/cast_model/casts_model.dart';
import 'package:movie_app/ui/components/BuildCastCard.dart';
import 'package:movie_app/ui/components/LoadMoreCard.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CastListPage extends StatefulWidget {
  @override
  _CastListPageState createState() => _CastListPageState();
}

class _CastListPageState extends State<CastListPage> {
  int pageId = 1;
  CastsModel castsModel;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 390) / 2;
    final double itemWidth = size.width / 2;

    final castBloc = BlocProvider.of<CastBloc>(context);
    castBloc.add(FetchCastEvent());
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.yellow,
            ),
          );
        }

        if (state is CastLoadedState) {
          castsModel = state.castList;
          return SmartRefresher(
            enablePullDown: true,
            header: WaterDropHeader(),
            controller: _refreshController,
            onRefresh: () async {
              castBloc..add(FetchCastEvent());
              _refreshController.loadComplete();
            },
            child: GridView.builder(
              itemCount: state.castList.casts.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 3 : 5,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index == castsModel.casts.length) {
                  return InkWell(
                    child: CastLoadMore(),
                    onTap: () => castBloc..add(FetchCastEvent()),
                  );
                }

                if (index + 1 == castsModel.casts.length && pageId != 1) {
                  return InkWell(
                    child: CastLoadMore(
                      direction: 'back',
                    ),
                    onTap: () => castBloc..add(FetchCastEvent()),
                  );
                }
                if (index != castsModel.casts.length)
                  return BuildCastCard(castModel: castsModel.casts[index]);
              },
            ),
          );
        }
        return Container(
          child: Center(
            child: Text(
              "hello world",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
