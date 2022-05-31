
class AiRefrashController{
  dynamic state;

  void refrash(){
    try{
      state?.onRefrash();
    }catch(e){
    }
  }
} 

