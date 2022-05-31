
enum PageState { Error, Loading, End }

class PageResultModel<T> {
  PageState state = PageState.Loading;

  num pageNum = 0;
  num pageSize = 0;
  num totalPage = 0;
  num total = 0;
  List<T> items = <T>[];

  num get length => items?.length ?? 0;

  bool get isLoading => state == PageState.Loading;

  bool get isError => state == PageState.Error;

  bool get isComplete => state == PageState.End;


  @override
  String toString() {
    return 'PageResultModel{state: $state, pageNum: $pageNum, pageSize: $pageSize, totalPage: $totalPage, total: $total}';
  }

  int _computePageCount() {
    return total % pageSize == 0 ? total ~/ pageSize : total ~/ pageSize + 1;
  }

  void checkNextPage() {
    if (total == -1) {
      //无限加载
      this.state = PageState.Loading;
    } else {
      if (pageNum < totalPage) {
        this.state = PageState.Loading;
      } else {
        this.state = PageState.End;
      }
    }
  }
}
