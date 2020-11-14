<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Сайт поликлиники</h1>
            </div>
        </div>

        <div class="row justify-content-center">
            <#list branches as branche>
            <div class="col-12">
                    <p>${branche}</p>
            </div>
                <div class="col-12">
                    <a class="btn btn-primary" href="/admin/branch/${branche.getId()}">Посмотреть</a>
                    <a class="btn btn-danger" href="/admin/branch/${branche.getId()}/delete">Удалить</a>
                </div>
                <br><br>
            </#list>

        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <form action="/admin/branch/add" method="post">
                    <input type="text" name="name">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="btn btn-primary" type="submit">Создасть</button>
                </form>
            </div>
        </div>
    </div>
</@c.page>