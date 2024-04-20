////getting the element in the html with the ID, when that element is clicked it will run the addNewRow function
//document.getElementById('addRowBtn').addEventListener('click', function(event) {event.preventDefault();
////    console.log("Button clicked!");

////console.log(ingredients)
//
////getting the element in the html with the ID, when that element is clicked it will run the addNewRow function
//document.getElementById('addRowBtn').addEventListener('click', function(event) {event.preventDefault();
////    console.log("Button clicked!");
//    var count =1;
//    ingredients = document.querySelector('#ingredientname')
//    quantity = document.querySelector('#quantity')
//    unit = document.querySelector('#unitname')
////    getting the container where the row will be added
//    var container = document.getElementById('#containerIngredients');
////    adding one row to the container
//    container.append(addNewRow(ingredients,quantity,unit));
//   });
//
//function addNewRow(ingredients,quantity,unit){
////creates a new row starting off with the first div from the row
//    var newRow = document.createElement("div")
//        newRow.classList.add("row", "g-3", "align-items-center")
//
//
//        newRow.innerHTML = `
//            <div class="row g-3 align-items-center">
//                <div class="col-auto">
//                    <div class="d-flex">
//                        <div class="p-2">
//                            <label for="ingredientname" class="col-form-label">Select an ingredient</label>
//                            <select class="form-select" aria-label="Default select example">
//                                <option selected>Select an ingredient</option>
//        //                        {% for ingredient in ingredientname %}
//        //                            <option value="{{ ingredient }}">{{ingredientname}}</option>
//        //                        {% endfor %}
//                                    <option value="${ingredients}" selected>${ingredients}</option>
//                            </select>
//                        </div>
//                    </div>
//                </div>
//                <div class="col-auto">
//                    <div class="p-2">
//                        <label for="quantity" class="col-form-label">Quantity:</label>
//                        <input type="number" min="1" step="0.25" id="quantity" name="quantity" class="form-control" aria-describedby="quantity">
//                    </div>
//                </div>
//                <div class="col-auto">
//                    <div class="p-2">
//                        <label for="unit" class="col-form-label">Select a unit</label>
//                        <select class="form-select" aria-label="Default select example">
//                            <option selected>Select a unit</option>
//                            {% for unit in unitname %}
//                                <option value="{{ unit }}">{{ unitname }}</option>
//                            {% endfor %}
//                        </select>
//                    </div>
//                </div>
//            </div>
//        `;
//
//
//
////returning the new row which can then be appended when the function is run
//            return(newRow)
//
//            console.log(newRow);
//}
document.addEventListener('DOMContentLoaded', function() {
    // Your JavaScript code here
    var count = 1;
const btn = document.getElementById('addRowBtnStep');
console.log(btn);
    document.getElementById('addRowBtnStep').addEventListener('click', function(event) {
        event.preventDefault();
        count++;
        console.log("Count:", count);
        var containerstep = document.getElementById('containerStep');
        containerstep.append(addNewRowStep(count));
    });

    function addNewRowStep(count) {
        var rowId = 'row_' + count;
        var newRowStep = document.createElement("div");
        newRowStep.classList.add("row", "g-3", "align-items-center");
        newRowStep.innerHTML = `
            <div class="col-auto">
                <div class="mb-3">
                    <div class="d-flex">
                        <label for="${rowId}_stepnumber" class="form-label">Step Number</label>
                        <input type="number" min="1" id="${rowId}_stepnumber" name="${rowId}_stepnumber" class="form-control" aria-describedby="${rowId}_stepnumber" style="width: 100px;">
                        <label for="${rowId}_stepdescription" class="form-label">Step Description</label>
                        <textarea class="form-control" id="${rowId}_stepdescription" name="${rowId}_stepdescription" rows="3" cols="100"></textarea>
                    </div>
                </div>
            </div>`;
        return newRowStep;
    }
});
