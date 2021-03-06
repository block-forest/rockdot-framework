part of acanvas_framework.ugc;

class UGCFilterItemCommand extends AbstractUGCCommand
    implements IStateModelAware {
  StateModel _stateModel;
  UGCFilterVO _vo;

  void set stateModel(StateModel stateModel) {
    _stateModel = stateModel;
  }

  @override
  void execute([AcSignal event = null]) {
    super.execute(event);

    _vo = event.data;

    switch (_vo.condition) {
      case UGCFilterVO.CONDITION_FRIENDS:
        _vo.creator_uids = _ugcModel.friendsWithUGCItems;
        break;
      case UGCFilterVO.CONDITION_ME:
        _vo.creator_uid = _ugcModel.userDAO.uid;
        break;
      case UGCFilterVO.CONDITION_UGC_ID:
        int id = int.parse(_stateModel.currentStateVO.params["id"]);
        _vo.item_id = id;
        break;
      case UGCFilterVO.CONDITION_ALL:
        break;
      case UGCFilterVO.CONDITION_UID:
        //TODO
        break;
    }

    amfOperation("UGCEndpoint.filterItems", map: _vo.toMap());
  }

  @override
  bool dispatchCompleteEvent([dynamic result = null]) {
    _vo.nextToken = null; //indicates that nextToken is to be set by DataProxy
    return super.dispatchCompleteEvent(result);
  }
}
