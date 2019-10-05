
--[[
    DECLARACION DE CONSTANTES Y VARIABLES  PARA USAR DENTRO DEL PROYECTO
    commands          : representa los botones que se pueden utilizar dentro del juego
    addr_player_state : significa el estado del jugador,si esta vivo o muerto 
    is_finished       : nos avisa acerca de si el jugador llego al punto final del nivel
    addr__y_viewport  : es acerca de la posicion en y de mario ,si se cae fuera del piso del nivel tendra un 
                        valor negativo y para  no esperar a que llegue al final , podemos asumir que murio
                        y reiniciar el nivel
--]]



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
SAVE_STATE_NIVEL_01 = "guardado.state"







function get_y_viewport()
    return memory.readbyte(addr_y_viewport);
end;

function recuperar_estado()
    savestate.load(SAVE_STATE_NIVEL_01);
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
    btn_seleccionar_valores = forms.button(forma,"Seleccionar valores",
        function()


        end,0,0,160,30);
    forms.setlocation(btn_seleccionar_valores,150,220);
    btn_entrenar = forms.button(forma,"Entrenar sistema",
       function()


       end,0,0,160,30);

    forms.setlocation(btn_entrenar,150,280);
    btn_cargar_mejor = forms.button(forma,"Cargar al mejor",
        function()


        end,0,0,160,30);
    forms.setlocation(btn_cargar_mejor,150,330);
    forms.label(forma, "Probabilidad de  Mutacion",30,60,200,20) ;
    forms.label(forma, "Probabilidad de Cruce",30,100,200,20) ;
    forms.label(forma, "Tolerancia",30,150) ;
    textbox_mutacion = forms.textbox(forma,".50",100,20);
    forms.setlocation(textbox_mutacion,240,60);
    textbox_cruce = forms.textbox(forma,".68",100,20);
    forms.setlocation(textbox_cruce,240,100);
    texbox_tolerancia = forms.textbox(forma,"2",100,20);
    forms.setlocation(texbox_tolerancia,240,150);        

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