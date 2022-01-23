package;

import Discord;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxBGSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import haxe.EnumTools;

class StartingState extends FlxState
{
	var blackCover:FlxSprite = new FlxSprite(0, 0);
	var menuBg:FlxSprite = new FlxSprite(0, 0);
	var logoThig:FlxSprite = new FlxSprite(0, 0);
	var enterOo:FlxSprite = new FlxSprite(0, 0);
	var introsEnd:Bool = false;

	override public function create():Void
	{
		Discord.setPresence('StartingState', 'Menus');
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.rgMenu__ogg, 1, true);
		}
		logoThig.frames = FlxAtlasFrames.fromSparrow(AssetPaths.title__png, AssetPaths.title__xml);
		logoThig.animation.addByPrefix('bump', 'llogo', 24, true);
		logoThig.scale.set(0.5, 0.5);
		logoThig.updateHitbox();
		enterOo.frames = FlxAtlasFrames.fromSparrow(AssetPaths.enter__png, AssetPaths.enter__xml);
		enterOo.animation.addByPrefix('press', 'enter', 24, true);
		enterOo.scale.set(0.75, 0.75);
		enterOo.updateHitbox();
		logoThig.screenCenter();
		enterOo.screenCenter();
		logoThig.y += 700;
		enterOo.x -= 800;
		enterOo.y += 65;
		menuBg.loadGraphic(AssetPaths.menu_retro__jpg);
		blackCover.makeGraphic(1285, 725, FlxColor.BLACK);
		add(menuBg);
		add(blackCover);
		add(logoThig);
		add(enterOo);
		FlxTween.tween(logoThig, {y: 200}, 1.5, {ease: FlxEase.quadInOut, onComplete: onTweenComplete});
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER && introsEnd == true)
		{
			FlxG.camera.flash(FlxColor.WHITE, 0.5, function flashComp()
			{
				FlxG.camera.fade(FlxColor.BLACK, 1, false, function fadeComp()
				{
					FlxG.switchState(new MenuState());
				});
			});
		}
		super.update(elapsed);
	}

	function onTweenComplete(tween:FlxTween)
	{
		logoThig.animation.play('bump');
		FlxTween.tween(enterOo, {x: 620}, 1.5, {
			ease: FlxEase.circInOut,
			onComplete: function entComplete(tween:FlxTween)
			{
				FlxG.camera.flash(FlxColor.WHITE, 1);
				remove(blackCover);
				introsEnd = true;
				enterOo.animation.play('press');
			}
		});
	}
}
