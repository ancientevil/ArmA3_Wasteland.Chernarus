//Ambient

//nul = [650,650,200,500,1,[1,0,0],player,[0.2,0.5,0.2,0.8,0.8,0.6,0.6,0.6,0.8,0.2],1,1000,nil,["COMBAT","MOVE"],true] execVM "LV\ambientCombat.sqf";
//nul = [650,650,200,500,1,[0,1,0],player,[0.2,0.5,0.2,0.8,0.8,0.6,0.6,0.6,0.8,0.2],1,1000,nil,["COMBAT","MOVE"],true] execVM "LV\ambientCombat.sqf";
//nul = [650,650,200,500,1,[0,0,1],player,[0.2,0.5,0.2,0.8,0.8,0.6,0.6,0.6,0.8,0.2],1,1000,nil,["COMBAT","MOVE"],true] execVM "LV\ambientCombat.sqf";




//air
nul = ["AIPATROL",1,3500,[false,false],[false,false,true],false,[0,0],[1,0],[0.3,0.4,0.4,0.8,0.8,0.8,0.4,0.4,0.6,0.3],nil,"COMBAT","MOVE",nil] execVM "LV\militarize.sqf";
nul = ["AIPATROL",2,3500,[false,false],[false,false,true],false,[0,0],[1,0],[0.3,0.4,0.4,0.8,0.8,0.8,0.4,0.4,0.6,0.3],nil,"COMBAT","MOVE",nil] execVM "LV\militarize.sqf";
nul = ["AIPATROL",3,3500,[false,false],[false,false,true],false,[0,0],[1,0],[0.3,0.4,0.4,0.8,0.8,0.8,0.4,0.4,0.6,0.3],nil,"COMBAT","MOVE",nil] execVM "LV\militarize.sqf";

//Militarize
nul = ["AIPATROL",1,3500,[true,false],[false,false,false],false,[8,2],[0,0],[0.2,0.3,0.3,0.8,0.8,0.8,0.4,0.4,0.6,0.3],nil,"COMBAT","MOVE",nil] execVM "LV\militarize.sqf";
nul = ["AIPATROL",2,3500,[true,false],[false,false,false],false,[8,2],[0,0],[0.2,0.3,0.3,0.8,0.8,0.8,0.4,0.4,0.6,0.3],nil,"COMBAT","MOVE",nil] execVM "LV\militarize.sqf";
nul = ["AIPATROL",3,3500,[true,false],[false,false,false],false,[8,2],[0,0],[0.2,0.3,0.3,0.8,0.8,0.8,0.4,0.4,0.6,0.3],nil,"COMBAT","MOVE",nil] execVM "LV\militarize.sqf";