package assets.skins {
//	import mx.core.FlexGlobals;
	
	import spark.skins.mobile.ActionBarSkin;
		
	public class CustomActionBarSkin extends ActionBarSkin {		
		
//		[Bindable]
//		private var text:String = FlexGlobals.topLevelApplication.test;	
		
		public function CustomActionBarSkin() {
			
			super();
			// Background-FXG-Datei Home Screen
			borderClass = backgroundActionBar;
			
			/* Für Test mit Farbwechsel Header-Nav	*/
	/*		if (text == null) {
				borderClass = null;
			} else {
				borderClass = backgroundActionBar;
			} 
*/
		
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void {


			
		}
	}
}