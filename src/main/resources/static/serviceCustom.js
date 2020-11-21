var $addCustom = document.getElementsByClassName('add-service-custom');
var countServiceCustom = document.getElementsByClassName("service-input-custom").length + 1;

function addServiceCustom(){
    $obj = "<div class=\"card-body\">\n" +
        "                            <div class=\"col-12\">\n" +
        "                                <select name=\"service-"+countServiceCustom+"\" class=\"service-input-custom\">\n";

    services.forEach(MapElements);

    $obj += "                                </select>\n" +
        "                            </div>\n" +
        "                            <div class=\"col-12\">\n" +
        "                                <input type=\"text\" name=\"service-"+countServiceCustom+"-text\" placeholder=\"Записка\">\n" +
        "                            </div>\n" +
        "                            <div class=\"col-12\">\n" +
        "                                <a class=\"btn btn-danger\" onclick=\"deleteService('service-"+countServiceCustom+"');\">Удалить</a>\n" +
        "                            </div>\n" +
        "                        </div>";

    $formService = document.getElementsByClassName('formServiceCustom')[0];
    $pointService= document.getElementsByClassName('pointServiceCustom')[0];

    $div = document.createElement("div");
    $div.className = "row justify-content-center service-"+countServiceCustom+" card";
    $formService.insertBefore($div, $pointService);
    $insert = document.getElementsByClassName("row justify-content-center service-"+countServiceCustom+" card");
    $insert[0].innerHTML += $obj;
    countServiceCustom++;
}

$addCustom[0].addEventListener('click', function(event) {
    if(services.size < 1){add();}
    addServiceCustom();
});

