

function funcion ()

    console.log("mira esto");
    
    end;

    
forma =  forms.newform(500, 500, "UNIDAD 2 ALGORITMOS GENETICOS" ) ;
entrenar_button = forms.button(forma,"Entrenar",funcion(),100,100,100,100);
forms.addclick(entrenar_button,funcion());

