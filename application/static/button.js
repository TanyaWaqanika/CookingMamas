//var count=1;
//$("#btn").click(function(){
//  event.preventDefault();
//  $("#container").append(addNewRow(count));
//  count++;
//
//});
document.getElementById('addRowBtn').addEventListener('click', function(event) {event.preventDefault();
    console.log("Button clicked!");
    addNewRow();
   });

function addNewRow(){

    var container = document.getElementById('containerIngredients');
    console.log(container);

    var newRow = document.createElement("div")
        newRow.classList.add("row", "g-3", "align-items-center")

    var innerDiv = document.createElement("div");
    innerDiv.classList.add("col-auto");
    innerDiv.innerHTML = '<div class="d-flex">'+
                              '<label for="ingredients" class="col-form-label">Select the ingredients, quantity and unit</label>'+
                               '<div class="p-2">'+
                                        '<select class="form-select" aria-label="Default select example">'+
                                                  '<option selected>Select your ingredients</option>'+
                                                  '<option value="1">Egg</option>'+
                                                  '<option value="2">Flour</option>'+
                                                  '<option value="3">Butter</option>'+
                                        '</select>'+
                                '</div>'+
                                '<div class="p-2">'+
                                        '<label for="quantity" class="col-form-label">Select the quantity</label>'+
                                '</div>'+
                                '<div class="col-auto">'+
                                    '<input type="number" min ="0" id="quantity" name="quantity" class="form-control" aria-describedby="quantity">'+
                                '</div>'+
                                  '<label for="unit" class="col-form-label">Select the unit</label>'+
                                  '<div class="p-2">'+
                                      '<select class="form-select" aria-label="Default select example">'+
                                          '<option selected>Select your unit</option>'+
                                          '<option value="1">ml</option>'+
                                          '<option value="2">l</option>'+
                                          '<option value="3">tbsp</option>'+
                                    '</select>'+
                                 '</div>'+
                               '</div>';
        newRow.appendChild(innerDiv);
        container.appendChild(newRow);

        console.log("New row added!");


}


