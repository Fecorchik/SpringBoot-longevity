<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Сайт поликлиники</h1>
            </div>
        </div>
        <div class="row justify-content-center">
            <form action="/admin/branch/${branch.getId()}/update" method="post">
                <div class="col-12">
                    <p>Id = ${branch.getId()}</p>
                    <input type="text" name="name" value="${branch.getName()}">
                </div>

                <#list branch.getWorkSchedule() as work>
                    <p>День недели ${work.getDay().getDay()}</p>
                    Начало работы:
                    <input type="time" name="${work.getDay()}.start" value="${work.getTimeStartWork()}">
                    Конеч работы:
                    <input type="time" name="${work.getDay()}.end" value="${work.getTimeEndWork()}">
                    <br>
                </#list>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-primary" type="submit">Обновить</button>
            </form>
        </div>
    </div>
</@c.page>