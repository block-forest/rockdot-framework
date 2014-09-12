part of rockdot_dart;





	/**
	 * @flowerModelElementId _0kyygC9LEeG0Qay4mHgS6g
	 */
	 class ScreenPluginBase extends AbstractOrderedFactoryPostProcessor {
		 static const String MODEL_UI = "MODEL_UI";
		 static const String SERVICE_UI = "SERVICE_UI";
	 ScreenPluginBase():super(20) {
		}


		@override IOperation postProcessObjectFactory(IObjectFactory objectFactory)
		{
			
			/* Objects */
			RockdotContextHelper.registerClass(objectFactory, MODEL_UI, ScreenModel, true);
			
			/* Object Postprocessors */
			objectFactory.addObjectPostProcessor(new ScreenPluginInjector(objectFactory));
			
			/* Commands */
			Map commandMap = new Map();
			commandMap[ ScreenEvents.INIT ] = ScreenPluginInitCommand; 
			commandMap[ScreenEvents.RESIZE] = ScreenResizeCommand;
			RockdotContextHelper.registerCommands(objectFactory, commandMap);
			
			/* Bootstrap Command */
			RockdotConstants.getBootstrap().add( ScreenEvents.INIT );
			
			return null;
		}

	}

