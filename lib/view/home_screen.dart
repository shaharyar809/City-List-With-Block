import 'package:city_list/bloc/city_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/city.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CityBloc>(context).add(CityLoad());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("City List"),
        ),
        body: BlocBuilder<CityBloc, CitySate>(builder: (context, state) {
          if (state is CityLoaded) {
            return ListView.builder(
                itemCount: state.cityList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("${state.cityList[index].name}"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("City ID ${state.cityList[index].id}"),
                                Text(
                                    "State ID ${state.cityList[index].stateId}"),
                                Text(
                                    "Country ID ${state.cityList[index].countryId}"),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    leading: const Icon(Icons.list),
                    title: Text(
                      "${state.cityList[index].name}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                });
          }
          if (state is CityLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CityError) {
            return const Center(child: Text("Error Occur"));
          }
          return Container();
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            BlocProvider.of<CityBloc>(context).add(CityLoad());
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
