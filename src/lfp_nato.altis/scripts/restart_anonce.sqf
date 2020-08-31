for "_i" from 1 to 14 do {
[
 [
 ["Напоминаем, что рестарты происходят в","size = '0.7'"],
 ["","<br/>"],
 ["02:00 и 09:00 по МСК","size = '0.7'"],
 ["","<br/>"],
 ["в автоматическом режиме","size = '0.7'"],
 ["","<br/>"]
 ],
 safeZoneX / 45.5, safeZoneH / 2,
 true,
 "<t font='PuristaBold'>%1</t>",
 [],
 { false },
 true
] spawn BIS_fnc_typeText2;
sleep 7200;
};