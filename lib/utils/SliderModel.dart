



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
  sliderModel.setDesc("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do");
  sliderModel.setTitle("Unbeatable\nmarket prices\nalways ");
  sliderModel.setImageAssetPath("assets/images/c3.png");
  slides.add(sliderModel);



  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("banking solution");

  sliderModel.setImageAssetPath("assets/images/c1.png");
  sliderModel.setTitle("Fresh food items\ndirectly from farm\nto table");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("activities on your phone");
  sliderModel.setTitle("Fastest\nhome delivery\nservice");
  sliderModel.setImageAssetPath("assets/images/c2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //  //1

  //
  //   sliderModel = new SliderModel();
  //
  //   //2

  //   sliderModel.setImageAssetPath("assets/images/stepper_2.png");
  //   slides.add(sliderModel);
  //
  //   sliderModel = new SliderModel();
  //
  //   //3

  //   sliderModel.setImageAssetPath("assets/images/stepper_3.png");
  //   slides.add(sliderModel);
  //
  //   sliderModel = new SliderModel();

  return slides;
}