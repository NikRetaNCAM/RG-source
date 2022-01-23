import discord_rpc.DiscordRpc;

class Discord
{
	static function main()
	{
		DiscordRpc.start({
			clientID: "000",
			onReady: onReady,
			onError: onError,
			onDisconnected: onDisconnected
		});

		while (true)
		{
			DiscordRpc.process();
		}

		DiscordRpc.shutdown();
	}

	static function onReady()
	{
		DiscordRpc.presence({
			details: 'Haxe Discord RPC Test App',
			state: 'DiscordRPC library accessable using hxcpp @:native externs',
			largeImageKey: 'logo1024',
			largeImageText: 'Haxe'
		});
	}

	static function onError(_code:Int, _message:String)
	{
		trace('Error! $_code : $_message');
	}

	static function onDisconnected(_code:Int, _message:String)
	{
		trace('Disconnected! $_code : $_message');
	}

	public static function setPresence(stateTxt:Null<String>, detailTxt:Null<String>)
	{
		#if desktop
		DiscordRpc.presence({
			details: detailTxt,
			state: stateTxt,
			largeImageKey: 'logo1024',
			largeImageText: 'Haxe'
		});
		#end
	}
}
