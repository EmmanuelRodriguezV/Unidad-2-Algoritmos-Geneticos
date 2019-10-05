

function funcion ()

    console.log("mira esto");
    
end;

variable = 1;




--[[
    
entrenar_button = forms.button(forma,"Entrenar",function() 
    variable  = variable + 1;
console.log(tostring(variable));
end);
--]]

forma =  forms.newform(500, 500, "UNIDAD 2 ALGORITMOS GENETICOS" ) ;
btn_seleccionar_valores = forms.button(forma,"Seleccionar valores",function()
end,0,0,160,30);
forms.setlocation(btn_seleccionar_valores,150,220);

btn_entrenar = forms.button(forma,"Entrenar sistema",function()
end,0,0,160,30);
forms.setlocation(btn_entrenar,150,280);

btn_cargar_mejor = forms.button(forma,"Cargar al mejor",function()
end,0,0,160,30);
forms.setlocation(btn_cargar_mejor,150,330);


forms.label(forma, "Probabilidad de  Mutacion",30,60,200,20) ;
forms.label(forma, "Probabilidad de Cruce",30,100,200,20) ;
forms.label(forma, "Tolerancia",30,150) ;

--[[
     int forms.textbox(int formhandle, [string caption = null], [int? width = null], [int? height = null], [string boxtype = null], [int? x = null], [int? y = null], [bool multiline = False], [bool fixedwidth = False], [string scrollbars = null]) 

--]]

textbox_mutacion = forms.textbox(forma,".50",100,20);
forms.setlocation(textbox_mutacion,240,60);


textbox_cruce = forms.textbox(forma,".68",100,20);
forms.setlocation(textbox_cruce,240,100);

texbox_tolerancia = forms.textbox(forma,"2",100,20);
forms.setlocation(texbox_tolerancia,240,150);






--[[

console.log(entrenar_button);
console.log(forma);
forms.addclick(entrenar_button,function()
    console.log("el boton hizo click")
end)

local checkbox = forms.checkbox(forma,"esto",2,2)
forms.addclick(checkbox,function()
    console.log(forms.ischecked(checkbox))
end)


--]]








