function validateForm() {
    var x = document.forms["myForm"]["name"].value;
    var y = document.forms["myForm"]["address"].value;
    var z = document.forms["myForm"]["email"].value;
    var a = document.forms["myForm"]["mobile"].value;
    var b = document.forms["myForm"]["a/c number"].value;
    var c = document.forms["myForm"]["password"].value;
	if (x == "") {
        alert("Name must be filled out");
        return false;
    }
    if(x.length>20){
    	alert("Maximum 20 Characters allowed in name");
    	return false;
    }
    if(x.search(/^[a-zA-Z ]*$/) == -1){
    	alert("Maximum 20 characters with only english alphabets and space in name");
    	return false;
    }
    if (y == "") {
        alert("Address must be filled out");
        return false;
    }
    if(y.length>100){
    	alert("Maximum 100 Characters allowed in address");
    	return false;
    }
    if (z == "") {
        alert("E-mail must be filled out");
        return false;
    }
    if(z.search(/^[a-zA-Z]+@[a-zA-Z]*.com$/) == -1){
    	alert("E-mail not in specified format");
    	return false;
    }
    if (a == "") {
        alert("Mobile Number must be filled out");
        return false;
    }
    if(a.search(/^[1-9][0-9]{9}$/) == -1){
    	alert("Mobile Number can have 10 digits only");
    	return false;
    }
    if (b == "") {
        alert("Bank Account Number must be filled out");
        return false;
    }
    if(b.search(/^[1-9][0-9]{4}$/) == -1){
    	alert("Bank Account Number can have 5 digits only");
    	return false;
    }
    if (c == "") {
        alert("Bank Password must be filled out");
        return false;
    }
    if(c.search(/^[0-9a-zA-Z]{20}$/) == -1){
    	alert("Bank Account Number can have 5 digits only");
    	return false;
    }
} 