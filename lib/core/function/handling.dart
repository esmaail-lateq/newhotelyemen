import 'package:newhotelyemeni/core/class/statusRquest.dart';

handling(response){
if(response is StatusRquest){
  return response;
}
else {
  return StatusRquest.success;
}
}