sleep 90;

private ["_messages", "_timeout"];

_messages = [
	["DADS", "DADS #2 HARDCORE A3Wasteland"],
	["Welcome", (name player)],
	["Repeatedly Teamkill", "24h BAN"],
	["Combat Logging", "24h BAN"],
	["DONT", "Build around Vendors"],
	["Teamspeak3", "Info on map"],
	["Website/Forums", "www.dadsarmy.se"],
	["This server accept", "BLASTCORE Phoenix/DragonFyre/CBA3"],
	["Server", "3960X@3.9ghz 32GB RAM"],
	["Earplugs", "Put in your earplugs by using the END key."]
];

_timeout = 5;
{
	private ["_title", "_content", "_titleText"];
	uiSleep 2;
	_title = _x select 0;
	_content = _x select 1;
	_titleText = format[("<t font='TahomaB' size='0.40' color='#a81e13' align='left' shadow='1' shadowColor='#000000'>%1</t><br /><t shadow='1'shadowColor='#000000' font='TahomaB' size='0.60' color='#FFFFFF' align='left'>%2</t>"), _title, _content];
	[_titleText,[safezoneX + safezoneW - 0.8,0.50],[safezoneY + safezoneH - 0.8,0.7],_timeout,0.5] spawn BIS_fnc_dynamicText;
	uiSleep (_timeout * 1.1);
} forEach _messages;
