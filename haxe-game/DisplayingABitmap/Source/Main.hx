package;


import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import openfl.Lib;


class Main extends Sprite 
{
	
	var inited:Bool;

	// ENTRY POINT = ponto de entrada

	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change) = se (redimensionar ou mudar de orientação)
	}

	function init()
	{
		if (inited) return;
		inited = true;


		// code
	}

	// SETUP

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, added);	
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); //IOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point = ponto de entrada estático
		Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
	
}