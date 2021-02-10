



class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("pay less transfer charges");
  sliderModel.setTitle("Earn more interest");
  sliderModel.setImageAssetPath("assets/images/splash_1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("banking solution");
  sliderModel.setTitle("Coorporate ");
  sliderModel.setImageAssetPath("assets/images/splash_2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("activities on your phone");
  sliderModel.setTitle("Manage your banking");
  sliderModel.setImageAssetPath("assets/images/splash_3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}