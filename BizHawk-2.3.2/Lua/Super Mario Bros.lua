forms.newform(400,400,"mira esta forma");
 console.log( joypad.getimmediate() );


while true do
	emu.frameadvance();
	console.log("hola");
--	gui.addmessage(mainmemory.readbyte(3));
--	gui.drawEllipse(50, 50, 400, 400);
end
