part of stagexl_rockdot;

@retain
class GamingSetScoreCommand extends AbstractUGCCommand {

  @override void execute([RockdotEvent event = null]) {
    super.execute(event);
    
    UGCGameVO vo = event.data;
    vo.uid = _ugcModel.userDAO.uid;

    amfOperation("GamingEndpoint.setScore", vo.toMap());
  }

  @override bool dispatchCompleteEvent([dynamic result = null]) {
    _ugcModel.userExtendedDAO.score = result.result.score;
    _ugcModel.gaming.rank = result.result.rank;
    return super.dispatchCompleteEvent(result.result);
  }
}
