<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Группа сценария</h1>
            </div>
        </div>
        <div class="row justify-content-center">
            <form action="/employee/script_group/${group.getId()}/update" method="post">
                <div class="col-12">
                    <p>Id = ${group.getId()}</p>
                    <input type="text" name="name" value="${group.getName()}">
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-primary" type="submit">Обновить</button>
            </form>
        </div>
    </div>
</@c.page>