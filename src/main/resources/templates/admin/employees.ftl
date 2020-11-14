<#import "../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Сайт поликлиники</h1>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12">
                <#list employees as employee>
                        <p>${employee.getId()}</p>
                        <p>${employee.getUsername()}</p>
                        <#list employee.getRole() as r>
                            <p>${r}</p>
                        </#list>
                        <p>${employee.getCreated()}</p>
                        <p>${employee.getUpdated()}</p>
                        <p>${employee.getPassword()}</p>

                    <a class="btn btn-primary" href="/admin/empl/${employee.getId()}/update"> Обновить Инфу</a>
                    <a class="btn btn-danger" href="/admin/empl/${employee.getId()}/delete">Удалить</a>
                    <br><br>
                </#list>
            </div>
        </div>
    </div>
</@c.page>