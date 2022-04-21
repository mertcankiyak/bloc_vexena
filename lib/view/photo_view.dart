import 'package:bloc_vexena/viewmodel/photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/photo_service.dart';

class PhotoView extends StatelessWidget {
  PhotoView({Key? key}) : super(key: key);
  PhotoService _photoService = PhotoService();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PhotoCubit(photoService: _photoService),
        child: BlocConsumer<PhotoCubit, PhotoState>(
          listener: (context, state) {},
          builder: (context, state) {
            return buildScaffold(context, state);
          },
        ));
  }

  Scaffold buildScaffold(BuildContext context, PhotoState state) {
    return Scaffold(
      floatingActionButton: _buildElevatedButton(context),
      appBar: _buildAppBar(context),
      body: (state is PhotoCompleteState)
          ? _buildListView(state)
          : _buildProgressBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      elevation: 0,
      title: Text(
        "Cubit & Vexena",
        style: Theme.of(context).textTheme.headline5,
      ),
      centerTitle: true,
    );
  }

  ListView _buildListView(PhotoCompleteState state) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: ((context, index) {
          return _buildListItem(state, index);
        }));
  }

  Card _buildListItem(PhotoCompleteState state, int index) {
    return Card(
      child: ListTile(
        leading: Image.network(state.model[index].thumbnailUrl!),
        title: Text(state.model[index].id.toString()),
        subtitle: Text(state.model[index].title ?? ""),
      ),
    );
  }

  Visibility _buildProgressBar(BuildContext context) {
    return Visibility(
      visible: context.watch<PhotoCubit>().isLoading,
      child: Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.amber,
        color: Colors.grey.shade400,
      )),
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    return BlocConsumer<PhotoCubit, PhotoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo),
          ),
          child: Text("Fetch Data"),
          onPressed: () {
            context.read<PhotoCubit>().fetchPhotos();
          },
        );
      },
    );
  }
}
