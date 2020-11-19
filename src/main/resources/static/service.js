var $add = document.getElementsByClassName('add-service');
var countService = document.getElementsByClassName("service-input").length + 1;
let services = [];

function addService(){
    $obj = "<div class=\"col-md-10\">\n" +
        "                    <p>\n" +
        "                        <select name=\"service-"+countService+"\" class=\"service-input\">\n";

    Array.prototype.forEach.call(services, function(element) {
        $obj += "<option class=\"serviceOption\" value=\""+element.key+"\">"+element.value+"</option>\n";
    });

    $obj += "                        </select>\n" +
        "                    </p>\n" +
        "                </div>\n" +
        "<div class=\"col-2\"><a class=\"btn btn-danger\" onClick=\"deleteService('service-"+countService+"');\">Удалить</a></div>";

    $formService = document.getElementsByClassName('formService')[0];
    $pointService= document.getElementsByClassName('pointService')[0];

    $div = document.createElement("div");
    $div.className = "row justify-content-center service-"+countService;
    $formService.insertBefore($div, $pointService);
    $insert = document.getElementsByClassName("row justify-content-center service-"+countService);
    $insert[0].innerHTML += $obj;
    countService++;
}

$add[0].addEventListener('click', function(event) {
    if(services.length < 1){add();}
    addService();
});

function add() {
    servicesOption = document.getElementsByClassName("serviceOption");
    Array.prototype.forEach.call(servicesOption, function(element) {
        services.push({key: element.value, value:element.text});
    });
}

function deleteService(nameService) {
    document.getElementsByClassName('row justify-content-center '+nameService)[0].remove();
}

