package assets.skins {
	import mx.core.FlexGlobals;
	
	import spark.skins.mobile.ActionBarSkin;
	
	import views.Home;
	
	public class CustomActionBarSkin extends ActionBarSkin {		
		
		[Bindable]
		private var text:String = FlexGlobals.topLevelApplication.text;
	
		
		
		public function CustomActionBarSkin() {
			super();
			
			//backgroundActionBar is the name of the FXG file
	//		borderClass = backgroundActionBar;
			
			/* Für Test mit Farbwechsel Header-Nav	*/
			if (text == null) {
				borderClass = backgroundActionBar;
			} else {
				borderClass = backgroundActionBar;
			} 

		
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void {


			
		}
	}
}