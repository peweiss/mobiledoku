package assets.skins {
//	import mx.core.FlexGlobals;
	
	import spark.skins.mobile.ActionBarSkin;
		
	public class CustomActionBarSkinGZB extends ActionBarSkin {		
		
//		[Bindable]
//		private var text:String = FlexGlobals.topLevelApplication.test;	
		
		public function CustomActionBarSkinGZB() {
			
			super();

			// Background-FXG-Datei GZB Screens
			borderClass = backgroundActionBarGZB;
			
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