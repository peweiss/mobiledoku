/***
 * VideoPlayer. Erstellt VideoPlayer anhand NetStream-Klasse.
 * Autor: 		Markus Tobler / Petra Weiss
 * Datum:		1.3.2014 
 * Gesehen:		http://blog.flexexamples.com/2008/03/01/displaying-a-video-in-flex-using-the-netconnection-netstream-and-video-classes
***/
package assets.classes {
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.setTimeout;
	
	import mx.controls.SWFLoader;
	
	import spark.components.Button;
	import spark.effects.Fade;
	
	public class VideoPlayer {
		// Setup Video Player
		import mx.utils.ObjectUtil;
		public var nc:NetConnection;
		public var ns:NetStream;
		public var movie:Video;
		public var dur:String; // Videodauer
		public var pfad:String; // Pfad zu Video
		public var fadePlayButtonIn:Fade;
		public var fadePlayButtonOut:Fade;
		public var playBtn:Button;
		public var screen:Object;
		public var vid:SWFLoader;
		public var videoFadeIn:Fade;
		public var videoFadeOut:Fade;		
		
		public var vidStatus:String; // Deklariere Variable für den Status des Videos: «playing» oder «stopped»
		
		// Das Video ist standardmässig auf Autoplay
		// Die Variable status enthält immer den aktuellen status des Videos --> «stopped» oder «playing»
		public var status:String = "playing";	
		
		// Start Konstruktor 
		// übergebene Werte: "assets/5_2.flv", fadePlayButtonIn, fadePlayButtonOut, videoFadeIn, videoFadeOut, playBtn, screen, vid
		public function VideoPlayer(pfad:String, fadePlayButtonIn:Fade, fadePlayButtonOut:Fade, videoFadeIn:Fade, videoFadeOut:Fade, playBtn:Button, screen:Object, vid:SWFLoader){
			trace ('Funktionaufruf und Pfad uebergeben: ' + pfad);

			var nsClient:Object = {};
			nsClient.onMetaData = ns_onMetaData;
			
			nc = new NetConnection();
			nc.connect(null);
			ns = new NetStream(nc);
			ns.play(pfad); // definiere abzuspielendes Video
			ns.client = nsClient;
			movie = new Video();
			
			movie.attachNetStream(ns);
			
			// Setze die PlayButton Grösse anhand der Screenbreite
			playBtn.width = screen.width/6.75;
			playBtn.height = screen.width/6.75;
			
			// Setze Play-Button bei Start auf nicht sichtbar
			playBtn.visible = false;
			
			// Eventlistener der bei einem neuen Status des Videos (z.B. «Video stoppt») die Funktion «statusChanged» aufruft
			ns.addEventListener(NetStatusEvent.NET_STATUS, statusChanged);	
			
			// Eventlistener der bei Klick auf den Play-Button die Funktion «clickHandler» aufruft
			playBtn.addEventListener(MouseEvent.CLICK, clickHandler);
			
			// Eventlistener der bei Klick auf das Video ebenfalls die Funktion «clickHandler» aufruft
			vid.addEventListener(MouseEvent.CLICK, clickHandler);			
		} // End Konstruktor
		
		public function ns_onMetaData(item:Object):void {
			// Die Grösse des Videos wird anhand der vorhandenen Screenbreite bestimmt. Die Höhe passt sich dem Format 16:9 an!
			movie.width = screen.width;
			movie.height = (screen.width/16)*9;
			
			// Die Grösse des Videocontainers soll der Grösse des Videos entsprechen
			vid.width = screen.width;
			vid.height = (screen.width/16)*9;
			
			// Get duration --> Nur informativ
			dur = ObjectUtil.toString(item.duration);
			trace('META: ' + dur);		
		}
		
		// Funktion die aufgerufen wird sobald das Video den Status wechselt (z.B. «Video stoppt»).
		public function statusChanged(stats:NetStatusEvent):void {
			if (stats.info.code == 'NetStream.Play.Stop') {
				trace('Video am Ende');
				status = 'stopped'; // Status auf stopped wechseln
				trace('gestoppt');
				ns.seek(ns.time); // Wechsle zum Anfang des Videos
				ns.pause(); // Stoppe das Video
				videoFadeOut.play(); 
				ns.seek(0); // Wechsle zum Anfang des Videos
				ns.pause(); // Stoppe das Video
				videoFadeIn.play(); // FadeIn Video
				// Setze Timeout --> Der Playbutton soll zeitversetzt eingeblendet werden
				setTimeout(delay, 1500);
				
				// Funktion die nach dem Timeout aufgerufen wird
				function delay():void{
					fadePlayButtonIn.play(); // Einfaden des Playbuttons
				}
			}
		}
		
		public function clickHandler(e:MouseEvent):void {
			// Aufrufen der Methode togglePause() des netStream Objektes
			// Wenn der Video nicht läuft wird er gestartet, wenn er läuft wird er gestoppt	
			ns.togglePause();
			
			if (status == "playing"){
				fadePlayButtonIn.play();
				status = 'stopped';
				trace('stopped');
			}
			else{
				fadePlayButtonOut.play();
				status = 'playing';
				trace('playing');
			}
		}
		
		// Stoppe das Video bei Deaktivierung der View
		public function stopMovie():void {
			ns.pause();	
		}
		
	}
}