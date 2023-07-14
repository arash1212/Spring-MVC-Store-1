/**
 * adds one extra button to table to choose product
 */
function setTableClientProducts(id, URL) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState === 4) {
            let text = [this.responseText];
            var json = JSON.parse(text);
            var table = document.createElement("table");
            table.setAttribute("border", "1")
            table.style.cssText = "width:100%";
            //GET Headers
            var headers = [];
            for (let key in json[0]) {
                headers.push(key);
            }
            //SET HEADERS
            tr = table.insertRow();
            for (let h in headers) {
                tr.insertCell().innerHTML = headers[h];
            }
            tr.insertCell().innerHTML = "انتخاب محصول";
            //SET DATA ROWS
            for (i = 0; i < json.length; i++) {
                let tr = table.insertRow();
                for (let key in headers) {
                    let cell = tr.insertCell();
                    cell.innerHTML = json[i][headers[key]];
                }
                //SET BUTTON
                tr.insertCell().innerHTML = "<td><input type='button' value='انتخاب' onclick=''></td>"
            }
            document.getElementById(id).innerHTML = "";
            document.getElementById(id).appendChild(table);
        }
    }
    xhttp.open("GET", URL, true);
    xhttp.send();
}

/**
 * creates select from json
 */
function createSelect(id, URL, name, createdElementID) {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4) {
            var json = JSON.parse(this.responseText);
            var select = document.createElement("select");
            select.setAttribute("name", name);
            select.setAttribute("id", createdElementID);
            //select.className="form-control"
            //get names for options in category select
            for (let key in json) {
                var option = document.createElement("option");
                option.text = json[key].category_name;
                select.add(option);
            }
            //if (document.getElementById(createdElementID) != null)
            //document.getElementById(id).removeChild(document.getElementById(createdElementID));
            document.getElementById(id).appendChild(select);
        }

    }
    xhttp.open("GET", URL, true);
    xhttp.send()
}
