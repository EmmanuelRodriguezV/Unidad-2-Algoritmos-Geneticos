commands = {};
addr_player_state = 0x000e; 
commands["up"] = false;
commands["left"] = false;
commands["down"] = false;
commands["right"] = true;
commands["A"] = false;
is_finished = 0; 
commands["B"] = false;
addr_y_viewport = 0x00b5;
numero_poblacion = 30;
frames_estimados = 130;
commands["start"] = false;
poblacion = {};
commands["select"] = false;







function get_y_viewport()
    return memory.readbyte(addr_y_viewport);
end;
function recuperar_estado()
    savestate.load("guardado.state");
end;

function draw_graph()
    x_axe = 90;
    y_axw= 90;
    
    gui.drawAxis(x_axe,y_axw, 90 );
    gui.drawBezier({{60,30},{63,35},{66,39}},"red");
    
end;
function get_is_dead()
    local player_state = memory.readbyte(addr_player_state);
    local y_viewport = get_y_viewport();
    if (player_state == 0x06) or (player_state == 0x0b) or (y_viewport > 1) then
        return 1;
    else
        return 0;
    end;
end;

function crear_poblacion()
    file = io.open("test3.lua", "w");
    for i=0 , numero_poblacion,1
    do
     renglon = {};
     for j=0,frames_estimados,1
     do
 
         numero = math.random();
         if numero >.5
         then
             table.insert(renglon,j,1);
             file:write(tostring(1));
         else
            file:write(tostring(0));
             table.insert(renglon,j,0);
         end;
     end;
     file:write("\n");
     end;
    end;
function dummy()
console.log(" SE HIZO CLICK");

end;
    function create_form()
        forma =  forms.newform(500, 500, "UNIDAD 2 ALGORITMOS GENETICOS" ) ;
        entrenar_button = forms.button(forma,"Entrenar",dummy(),100,100,100,100);
        forms.addclick(entrenar_button,dummy());
        
  end;
  
  
  
  


function main ()
    while true do
        if get_is_dead() == 1
        then
        recuperar_estado();
        end
        draw_graph();
        emu.frameadvance();
        joypad.set({Right=1},1);
         end
end;
create_form();

main();