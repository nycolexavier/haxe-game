package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import openfl.Lib;

class Main extends Sprite {
	var inited:Bool;

	private var platform1:Platform;

	private var platform2:Platform;

	private var ball:Ball;

	// ENTRY POINT = ponto de entrada

	function resize(e) {
		if (!inited)
			init();
		// else (resize or orientation change) = se (redimensionar ou mudar de orientação)
	}

	function init() {
		if (inited)
			return;
		inited = true;

		platform1 = new Platform();
		platform1.x = 5;
		platform1.y = 200;
		this.addChild(platform1);

		platform2 = new Platform();
		platform2.x = 480;
		platform2.y = 200;
		this.addChild(platform2);

		ball = new Ball();
		ball.x = 250;
		ball.y = 250;
		this.addChild(ball);

		// code
	}

	// SETUP

	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) {
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // IOS 6
		#else
		init();
		#end
	}

	public static function main() {
		// static entry point = ponto de entrada estático
		Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}

class Plataform extends Sprite {
	public function new() {
		super();
		this.graphics.beginFill(0xffffff);
		this.graphics.drawRect(0, 0, 15, 100);
		this.graphics.endFill();
	}
}

class Ball extends Sprite {
	public function new() {
		super();
		this.graphics.beginFill(0xffffff);
		this.graphics.drawCircle(0, 0, 10);
		this.graphics.endFill();
	}
}