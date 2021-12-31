import 'package:bloc_with_cubit/calculator/model/home_screen_model.dart';
import 'package:bloc_with_cubit/calculator/repository/home_screen_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator/bloc/counter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterBloc(repository: HomeScreenRepository()),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CounterBloc _bloc;
  bool isSearch = false;
 List<HomeScreenModel> _searchResult = [];
 List<HomeScreenModel> _allData = [];
 TextEditingController searchController = TextEditingController();

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _searchResult = _allData
        .where((HomeScreenModel exam) => exam.title
        .toString()
        .toLowerCase()
        .contains(text.toLowerCase()))
        .toList();

    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    _bloc = BlocProvider.of<CounterBloc>(context);
    _bloc.add(FetchCounterEvent());
  }
  dataTransfer(data){
    _allData = data;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: isSearch ? TextField(autofocus: true,
        controller: searchController,
          onChanged: onSearchTextChanged,
        ) : Text("Bloc 7.2.0 with Api"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearch = !isSearch;
                });
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is IntialCounterState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          }
          if (state is CounterErrorState) {
            return Center(child: Text(state.ErrorMsg));
          }
          if (state is CounterLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CounterLoadedState) {
            dataTransfer(state.Counter);
            return _searchResult.isEmpty ? ListView.builder(
              itemCount: state.Counter!.length,
              itemBuilder: (BuildContext context, pos) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Dismissible(
                    key: ValueKey<int>(state.Counter![pos].id),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        state.Counter!.removeAt(pos);
                      });
                    },
                    child: ListTile(
                        hoverColor: Colors.grey,
                        onTap: () {},
                        tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        leading: Text(state.Counter![pos].id.toString()),
                        title: Text(state.Counter![pos].title),
                        subtitle: Text(state.Counter![pos].body)),
                  ),
                );
              },
            ) : ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (BuildContext context, pos) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Dismissible(
                    key: ValueKey<int>(_searchResult[pos].id),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        state.Counter!.removeAt(pos);
                      });
                    },
                    child: ListTile(
                        hoverColor: Colors.grey,
                        onTap: () {},
                        tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        leading: Text(_searchResult[pos].id.toString()),
                        title: Text(_searchResult[pos].title),
                        subtitle: Text(_searchResult[pos].body)),
                  ),
                );
              },
            ) ;
          } else {
            return const Center(child: Text('error'));
          }
        },
      ),
    ));
  }

}
