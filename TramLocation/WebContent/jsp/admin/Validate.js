function valid(formName)
{

              for(i=0; i<formName.elements.length; i++)
              {
                
                 if(formName.elements[i].value == "")
                 {
                   alert("Fill "+formName.elements[i].name+ " field first !");
                   formName.elements[i].focus();
                   return false;
                 }
               
              }
              return true;
}

