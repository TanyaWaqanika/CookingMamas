//getting the element in the html with the ID, when that element is clicked it will run the addNewRow function
document.getElementById('addRowBtn').addEventListener('click', function(event) {event.preventDefault();
//    console.log("Button clicked!");
    var count =1;
//    getting the container where the row will be added
    var container = document.getElementById('containerIngredients');
//    adding one row to the container
    container.append(addNewRow(count));
   });


function addNewRow(count){
//creates a new row starting off with the first div from the row
    var newRow = document.createElement("div")
        newRow.classList.add("row", "g-3", "align-items-center")
//adding the rest of the html for that row using the + to concatenate it
//        newRow.innerHTML = '<div class="col-auto">'+
//                            '<div class="d-flex">'+
//                                  '<label for="ingredients" class="col-form-label">Select the ingredients, quantity and unit</label>'+
//                                   '<div class="p-2">'+
//                                            '<select class="form-select" aria-label="Default select example">'+
//                                                      '<option selected>Select your ingredients</option>'+
//                                                      '<option value="1">Egg</option>'+
//                                                      '<option value="2">Flour</option>'+
//                                                      '<option value="3">Butter</option>'+
//                                            '</select>'+
//                                    '</div>'+
//                                    '<div class="p-2">'+
//                                            '<label for="quantity" class="col-form-label">Select the quantity</label>'+
//                                    '</div>'+
//                                    '<div class="col-auto">'+
//                                        '<input type="number" min ="0" id="quantity" name="quantity" class="form-control" aria-describedby="quantity">'+
//                                    '</div>'+
//                                      '<label for="unit" class="col-form-label">Select the unit</label>'+
//                                      '<div class="p-2">'+
//                                          '<select class="form-select" aria-label="Default select example">'+
//                                              '<option selected>Select your unit</option>'+
//                                              '<option value="1">ml</option>'+
//                                              '<option value="2">l</option>'+
//                                              '<option value="3">tbsp</option>'+
//                                        '</select>'+
//                                     '</div>'+
//                                   '</div>';

newRow.innerHTML = `
    <div class="row g-3 align-items-center">
        <div class="col-auto">
            <div class="d-flex">
                <div class="p-2">
                    <label for="ingredientname" class="col-form-label">Select an ingredient</label>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>Select an ingredient</option>
                        {% for ingredient in ingredientname %}
                            <option value="{{ ingredient }}">{{ingredientname}}</option>
                        {% endfor %}
                    </select>
                </div>
            </div>
        </div>
        <div class="col-auto">
            <div class="p-2">
                <label for="quantity" class="col-form-label">Quantity:</label>
                <input type="number" min="1" step="0.25" id="quantity" name="quantity" class="form-control" aria-describedby="quantity">
            </div>
        </div>
        <div class="col-auto">
            <div class="p-2">
                <label for="unit" class="col-form-label">Select a unit</label>
                <select class="form-select" aria-label="Default select example">
                    <option selected>Select a unit</option>
                    {% for unit in unitname %}
                        <option value="{{ unit }}">{{ unitname }}</option>
                    {% endfor %}
                </select>
            </div>
        </div>
    </div>
`;



//returning the new row which can then be appended when the function is run
            return(newRow)
            console.log("New row added!");
}


