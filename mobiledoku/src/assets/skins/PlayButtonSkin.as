/***
 * PlayButtonSkin.as – gestaltet Play-Button auf Video.
 * Autor: 		Markus Tobler 
 * Datum:		1.3.2014 
 * Gesehen:		
 ***/
package assets.skins {
	import mx.events.FlexEvent;
	
	import spark.skins.mobile.ButtonSkin;
	
	public class PlayButtonSkin extends ButtonSkin
	{
		
		//Import the new assets for the background of the button
		[Bindable]
		[Embed(source="/assets/icons/playbutton.png")]
		private var down:Class;
		
		[Bindable]
		[Embed(source="/assets/icons/playbutton.png")]
		private var up:Class;
		
		public function PlayButtonSkin()
		{
			super();
			
			//Set the width and the height to the size of the image.
			//width = 160;
			//height = 160;
			// --> Wird Dynamisch anhand der Bildschirmbreite berechnet
			
			
		}
		
		// Override this function to return our skin images and not the normal ones. 
		override protected function getBorderClassForCurrentState():Class
		{
			if (currentState == "down"){
				labelDisplay.setStyle("color",0xFFFFFF);
				return down;
			}
			else{
				labelDisplay.setStyle("color",0x48250A);
				return up;
			}	
		}
		
		// Override this function to prvent the button from drawing a background
		override protected function drawBackground(unscaledWidth:Number,
												   unscaledHeight:Number):void{
			
		}
		
		override protected function
			labelDisplay_valueCommitHandler(event:FlexEvent):void 
		{
			//super.labelDisplay_valueCommitHandler(event);
			labelDisplayShadow.text = labelDisplay.text;
			
			labelDisplay.setStyle("fontFamily","Lions Den");
			labelDisplay.setStyle("fontSize",40);
			labelDisplay.setStyle("fontWeight","normal");
			labelDisplay.setStyle("color",0x48250A);
			labelDisplayShadow.setStyle("fontFamily","Lions Den");
			labelDisplayShadow.setStyle("fontSize",40);
			labelDisplayShadow.setStyle("fontWeight","normal");
			
		}
		
	}
}