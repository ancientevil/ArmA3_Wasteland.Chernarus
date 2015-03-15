// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HackLaptop.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_positions", "_camonet", "_laptop", "_obj", "_randomGroup", "_vehicleName","_table"];

_setupVars =
{
	_missionType = "Hackers";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	//delete existing base parts and vehicles at location
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete; 
	
	_camonet = createVehicle ["CamoNet_INDP_big_F", [_missionPos select 0, _missionPos select 1], [], 0, "CAN COLLIDE"];
	_camonet allowdamage false;
	_camonet setDir random 360;
	_camonet setVariable ["R3F_LOG_disabled", false];

	_missionPos = getPosASL _camonet;

	_table = createVehicle ["Land_WoodenTable_small_F", _missionPos, [], 0, "CAN COLLIDE"];
	_table setPosASL [_missionPos select 0, (_missionPos select 1) - 0.25, _missionPos select 2];
	
	_laptop = createVehicle ["Land_Laptop_unfolded_F", _missionPos, [], 0, "CAN COLLIDE"];
	_laptop attachTo [_table,[0,0,0.60]];
	
	

	_obj = createVehicle ["I_GMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj setPosASL [_missionPos select 0, (_missionPos select 1) + 2, _missionPos select 2];

	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";

	_laptop setVariable [ "Done", false, true ];

	// NPC Randomizer 
	_randomGroup = [createGroup1,createGroup2,createGroup3,createGroup4,createGroup5] call BIS_fnc_selectRandom;
	_randomGroup2 = [createGroup1,createGroup2,createGroup3,createGroup4,createGroup5] call BIS_fnc_selectRandom;
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos] spawn _randomGroup;
	[_aiGroup,_missionPos] spawn _randomGroup2;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";	
	
	_vehicleName = "Laptop";
	_missionHintText = format ["<t color='%2'>Hackers</t> are using a laptop to hack your bank accounts. Hacking the laptop successfully will steal 1.5 percent from each on-line players bank account! HURRY TO DEFEND YOUR BANK ACCOUNT OR HACK OTHERS BANK ACCOUNTS!", _vehicleName, moneyMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec =
{
	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";
};
_waitUntilCondition = nil;
_waitUntilSuccessCondition = { _laptop getVariable ["Done", false] };
_ignoreAiDeaths = true;

_failedExec =
{
	// Mission failed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_camonet, _obj, _laptop, _table];
};

_successExec =
{
	// Mission completed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_camonet, _laptop, _table];
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_obj];

	_successHintMessage = format ["The laptop is hacked. Well done!"];
};

_this call moneyMissionProcessor;