// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/view%20model/bloc/links_bloc/links_bloc.dart';
import 'package:todo/view/view_modules/links/widgets/links_loaded_state.dart';

class Links extends StatefulWidget {
  const Links({Key? key}) : super(key: key);

  @override
  _LinksState createState() => _LinksState();
}

class _LinksState extends State<Links> {
  final linksBloc = LinksBloc();

  @override
  void initState() {
    super.initState();
    linksBloc.add(LoadLinks());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LinksBloc, LinksState>(
      bloc: linksBloc,
      builder: (context, state) {
        if (state is LinksLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        //////////////////////////////////////
        /////////////////////////////////////
        else if (state is LinksLoaded) {
          return LinksLoadedState(state: state);
        }
        //////////////////////////////////////
        //////////////////////////////////////
        else if (state is LinksError) {
          return Center(child: Text(state.msg));
        }
        ////////////////////////////////////////
        ////////////////////////////////////////
        else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }

  @override
  void dispose() {
    linksBloc.close();
    super.dispose();
  }
}
