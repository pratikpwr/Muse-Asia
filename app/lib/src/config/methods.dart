

class CustomMethods {

  static String getDesc(String fullDesc) {
    // String desc = state.episode.description.split('===========')[1] ??
    //     state.episode.description;
    // String desc = state.episode.description;

    var shortDesc = fullDesc.split("===========");
    if (shortDesc.length > 1) {
      return shortDesc[1];
    }
    return fullDesc;
  }
}