package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var songButt:FlxButton = new FlxButton(20, 40, 'SONGS', function songClicc()
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function songFade()
		{
			FlxG.switchState(new PlayState());
		});
	});

	var spButt:FlxButton = new FlxButton(20, 80, 'OST', function ostClicc()
	{
		FlxG.sound.music.kill();
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function ostFade()
		{
			FlxG.switchState(new OSTState());
		});
	});

	override public function create():Void
	{
		songButt.scale.set(2, 2);
		songButt.label.scale.set(2, 2);
		songButt.updateHitbox();
		songButt.setPosition(20, 40);
		spButt.scale.set(2, 2);
		spButt.label.scale.set(2, 2);
		spButt.updateHitbox();
		spButt.setPosition(20, 80);
		add(songButt);
		add(spButt);
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
