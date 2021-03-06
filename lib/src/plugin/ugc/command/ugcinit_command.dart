part of acanvas_framework.ugc;

class UGCInitCommand extends AbstractUGCCommand {
  @override
  void execute([AcSignal event = null]) {
    super.execute(event);

    this.log.info("Will use following host: " +
        applicationContext.propertiesProvider
            .getProperty("project.host.json")
            .toString());
    dispatchCompleteEvent();
  }
}
