
import 'package:doc_on_call_24_7_mobile/entity/Speciality.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class GeneralSpecialistBloc {

  final apiProvider = RetrofitClientInstance.getInstance();
  final _locationData = PublishSubject<List<Speciality>>();


  List<Speciality> _location = [];
  Stream< List<Speciality>> get allSpecialist => _locationData.stream;



  getSpeciality() async{
    List<Speciality> itemModel = await apiProvider.getDataService().getSpeciality();
    _location = itemModel;
    _locationData.sink.add(itemModel);

  }

  searchQuery(String txt) async {
    //   _locationData.where((event) => event.contains(txt)).map((event) => _locationData.sink.add(event));

    if (txt.isEmpty) {
      _locationData.sink.add(_location);
    } else {
      List<Speciality> _rst = [];
      _location.forEach((element) => {


        if(element.specialty.toLowerCase().contains(txt)){
          _rst.add(element),
          _locationData.sink.add(_rst)
        } else {
          _locationData.sink.add(_rst)
        }
      });
    }
  }


  dispose() {
    _locationData.drain();
  }
}

final generalSpecialistBloc = GeneralSpecialistBloc();