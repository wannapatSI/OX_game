import 'package:flutter_tic_tac_toe/model/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/model/game_model.dart';

class page_HistoryGame extends StatefulWidget {
  static String routeName = '/historygame';
  const page_HistoryGame({super.key});

  @override
  State<page_HistoryGame> createState() => _page_HistoryGameState();
}

class _page_HistoryGameState extends State<page_HistoryGame> {
  DatabaseService service = DatabaseService();
  Future<List<Match>>? matchList;
  List<Match>? retrievedMatchList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    matchList = service.retrieveMatch();
    retrievedMatchList = await service.retrieveMatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(16, 13, 30, 1),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 80),
            child: Center(
                child: Column(children: [
              //appbar
              //header
              const Text(
                'HISTORY GAME',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Trench',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //List card
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder(
                    future: matchList,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Match>> snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: retrievedMatchList!.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemBuilder: (context, index) {
                              return Dismissible(
                                onDismissed: ((direction) async {
                                  await service.deleteMatch(
                                      retrievedMatchList![index]
                                          .matchID
                                          .toString());
                                }),
                                background: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  padding: const EdgeInsets.only(right: 28.0),
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: const Text(
                                    "DELETE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                resizeDuration:
                                    const Duration(milliseconds: 200),
                                key: UniqueKey(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 83, 80, 80),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: ListTile(
                                    onTap: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    title: Text(
                                        "The Winner is ${retrievedMatchList![index].theWinner}"),
                                    subtitle: Text(
                                        "Grid : ${retrievedMatchList![index].gameGrid}, Mode : ${retrievedMatchList![index].gameMode}"),
                                    trailing:
                                        const Icon(Icons.arrow_right_rounded),
                                  ),
                                ),
                              );
                            });
                      } else if (snapshot.connectionState ==
                              ConnectionState.done &&
                          retrievedMatchList!.isEmpty) {
                        return Center(
                          child: ListView(
                            children: const <Widget>[
                              Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text('No data available')),
                            ],
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ]))));
  }
}
