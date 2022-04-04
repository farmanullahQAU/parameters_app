class TyreModel{
  
  final String type;

  final double tyreWidth;
  final double? tyreProfile;
  final double? tyreThread;
  final String? tyreYear;
  final String? tyreSession;
  final String? description;
  final String? imageUrl;
  WheelModel wheel;

  TyreModel({
    this.description,
    this.imageUrl,

    required this.wheel,
    required this.type, required this.tyreWidth,this.tyreProfile,this.tyreYear,this.tyreThread,this.tyreSession});
}

class WheelModel{
final String? shortDescription;
 bool isFavorite;
final double price;
  final double rimWidth;
  final double rimOffset;
  final String? rimBrand;
  final double? rimDimeter;
  final String condition;

  WheelModel({
    
    this.isFavorite=false,
    
    required this.price,
    required this.condition,this.shortDescription,required this.rimWidth,required this.rimOffset,this.rimDimeter,this.rimBrand});
}

