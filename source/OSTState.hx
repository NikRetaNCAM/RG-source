package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUIInputText;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.Assets;

class OSTState extends FlxState
{
	var nowPlaying:FlxText = new FlxText(0, 0, 0, 'NOW PLAYING:', 30);
	var songName:FlxText = new FlxText(0, 0, 0, '', 25);
	var curSong:Float = 1;
	var maxSong:Int = 5;
	var minSong:Int = 1;
	var curString:String = '';
	var spamTimer:FlxTimer = new FlxTimer();
	var minTimer:FlxTimer = new FlxTimer();
	var shift:Bool = false;

	override public function create():Void
	{
		var playButt:FlxButton = new FlxButton(25, 650, 'PLAY', songplay);
		playButt.scale.set(2, 2);
		playButt.label.scale.set(2, 2);
		playButt.updateHitbox();
		playButt.setPosition(25, 650);
		nowPlaying.screenCenter();
		nowPlaying.y -= 15;
		songName.screenCenter();
		songName.y += 20;
		add(nowPlaying);
		add(songName);
		add(playButt);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		inputCheck();
		songcheck();
		songName.text = Std.string(curSong) + '. ' + curString;
		songName.screenCenter(X);
		super.update(elapsed);
	}

	function songcheck()
	{
		curString = Assets.getText('assets/data/$curSong/$curSong.txt');
	}

	function songplay()
	{
		FlxG.sound.playMusic('assets/data/$curSong/$curSong.ogg', 1, true);
	}

	function inputCheck()
	{
		shift = FlxG.keys.pressed.SHIFT;
		if (FlxG.keys.justPressed.RIGHT && curSong < maxSong)
		{
			if (shift && (curSong + 10) <= maxSong)
			{
				curSong += 10;
			}
			else
			{
				curSong += 1;
			}
		}
		if (FlxG.keys.justPressed.LEFT && curSong > minSong)
		{
			if (shift && (curSong - 10) >= minSong)
			{
				curSong -= 10;
			}
			else
			{
				curSong -= 1;
			}
		}
	}
}
