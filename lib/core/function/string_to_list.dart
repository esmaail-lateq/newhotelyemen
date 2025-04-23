


List<String> stringToList(String data){
  return data .replaceAll('[', '')
    .replaceAll(']', '')
    .split(',')
    .map((e) => e.trim())
    .toList();
}