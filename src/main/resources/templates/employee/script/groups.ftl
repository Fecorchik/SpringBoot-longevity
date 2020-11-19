<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Группы сценариев</h1>
            </div>
        </div>

        <div class="row justify-content-center">
            <#list groups as group>
                <div class="col-12">
                    <p>${group}</p>
                </div>
                <div class="col-12">
                    <a class="btn btn-primary" href="/employee/script_group/${group.getId()}">Посмотреть</a>
                    <a class="btn btn-danger" href="/employee/script_group/${group.getId()}/delete">Удалить</a>
                </div>
                <br><br>
            </#list>

        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <form action="/employee/script_group/add" method="post">
                    <input type="text" name="name">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="btn btn-primary" type="submit">Создасть</button>
                </form>
            </div>
        </div>
    </div>
</@c.page>