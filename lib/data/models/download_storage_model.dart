import '../../domain/entities/download_storage_entities.dart';

class DownloadStorageModel extends DownloadStorageEntity {
  DownloadStorageModel({
    required super.title,
    required super.subtitle,
    required super.dataSize,
    required super.image,

  });

 factory DownloadStorageModel.fromJson(Map<String,dynamic>jsonData){
   return DownloadStorageModel(
       title: jsonData['title'],
       subtitle: jsonData['subtitle'],
       dataSize: jsonData['dataSize'],
       image: jsonData['image'],
    );
 }

 Map <String,dynamic> toJson(){
   return {
     'title':title,
     'subtitle':subtitle,
     'dataSize':dataSize,
     'image':image,

   };
 }



}
