class Resource <T>{
  T? data;
  Status? status;
  String? message;

  Resource.idle(){
    this.data=null;
    this.status=Status.IDLE;
    this.message=null;
  }

  Resource.success({this.data}){
    this.status=Status.SUCCESS;
    this.message=null;
  }

  Resource.loading(T? d){
    this.data=d;
    this.status=Status.LOADING;
    this.message=null;
  }

  Resource.error({this.message}){
    this.data=null;
    this.status=Status.ERROR;
  }
}

enum Status{
  IDLE,
  LOADING,
  ERROR,
  SUCCESS
}