<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Выбрать заготовку</h1>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-2">Поиск по группам</div>
            <div class="col-10">
                <form action="/employee/custom_script/all" method="get">
                    <select name="filter" class="service-input">
                        <option value="" selected>Пусто</option>
                        <#list groups as group>
                            <option value="${group.getName()}">${group.getName()}</option>
                        </#list>
                    </select>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="btn btn-primary" type="submit">Поиск</button>
                </form>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <#list scripts as script>
                <div class="col-12">
                    <p>${script}</p>
                </div>
                <div class="col-md-12">
                    <a class="btn btn-primary" href="/employee/custom_script/template/${script.getId()}">Выбрать</a>
                </div>
                <br><br>
            </#list>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <hr>
            </div>
        </div>
        <#list customScripts as customScript>
        <div class="row">
            <div class="col-12 justify-content-center">
                <p>${customScript}</p>
            </div>
            <div class="col-6">
                <p><a class="btn btn-primary" href="/employee/custom_script/${customScript.getId()}">Посмотреть</a></p>
            </div>
            <div class="col-6">
                <p><a class="btn btn-danger" href="/employee/custom_script/${customScript.getId()}/delete">Удалить</a></p>
            </div>
        </div>
        </#list>
    </div>

</@c.page>