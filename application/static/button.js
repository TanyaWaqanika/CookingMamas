document.addEventListener('DOMContentLoaded', function() {
//Setting a count of one - get the value of number of rows from the hidden input type.
//this value is to track the number of rows added so we can use this when we are iterating over the rows in the app route
    var count = 1;
     const numRowsInput = document.getElementById('num_rows');
    const btn = document.getElementById('addRowBtn')
    console.log(btn);
    if (btn) {
        btn.addEventListener('click', function(event) {
            event.preventDefault();
            console.log("Button clicked.");
             count++;
        console.log("Count:", count);
        numRowsInput.value = count;
        console.log("number of rows:", numRowsInput);
        var containerstep = document.getElementById('containerStep');
        containerstep.append(addNewRowStep(count));
//        var numRows = document.getElementById('num_rows').value;
            // Rest of your code
        });
    } else {
        console.error("Element with ID 'addRowBtnStep' not found");
    }
;


    function addNewRowStep(count) {
        var rowId = 'row_' + count;
        var newRowStep = document.createElement("div");
        newRowStep.classList.add("row", "g-3", "align-items-center");
        newRowStep.innerHTML = `
            <div class="col-auto">
                <div class="mb-3">
                    <div class="d-flex">
                        <label for="${rowId}_stepnumber" class="col-form-label">Step Number</label>
                            <input type="number" min="1" id="${rowId}_stepnumber" name="${rowId}_stepnumber" class="form-control" aria-describedby="${rowId}_stepnumber" style="width: 100px;">
                        <label for="${rowId}_stepdescription" class="col-form-label">Step Description</label>
                            <textarea class="form-control" id="${rowId}_stepdescription" name="${rowId}_stepdescription" rows="3" cols="100"></textarea>
                    </div>
                </div>
            </div>`;
        return newRowStep;
    }
});
