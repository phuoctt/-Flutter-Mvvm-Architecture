
import 'dart:io';

class NetworkService {

  Future postApiResponse() async{

    dynamic responseJson ;
    try {
      await Future.delayed(const Duration(seconds: 1));

    }on SocketException {

      throw ('No Internet Connection');
    }

    return responseJson ;
  }


}