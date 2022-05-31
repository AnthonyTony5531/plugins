import 'package:fast_ai/api/api.dart';
import 'package:fast_ai/utils/ai_json.dart';
import 'package:fast_ai/utils/util.dart';
import 'package:fast_ai/widgets/imagecache/xc_network_image.dart'
    as xcNetworkImage;

// 图片地址model
class ActivityPictureModel {
  String image; // 图片地址
  String imageLevel; // 图片等级:A、B、C、D、E 共5个等级
  String imageS;

  ActivityPictureModel({this.image, this.imageLevel, this.imageS});

  factory ActivityPictureModel.fromJson(Map<String, dynamic> json) {
    AiJson aiJson = AiJson(json);
    String image = aiJson.getString('image');
    String imageS = '';
    String baseImgUrl = Api.baseImgUrl;
    if (!isStrNullOrEmpty(image)) {
      imageS = "$baseImgUrl$image";
      xcNetworkImage.NetworkImage(imageS).preLoad();
    }
    return ActivityPictureModel(
      image: image,
      imageS: imageS,
      imageLevel: aiJson.getString('imageLevel'),
    );
  }
}
