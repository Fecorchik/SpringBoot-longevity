<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Сервисы</h1>
            </div>
        </div>

        <div class="row justify-content-center">
            <#list services as service>
                <div class="col-12">
                    <p>${service}</p>
                </div>
                <div class="col-12">
                    <a class="btn btn-primary" href="/admin/service/${service.getId()}">Посмотреть</a>
                    <a class="btn btn-danger" href="/admin/service/${service.getId()}/delete">Удалить</a>
                </div>
                <br><br>
            </#list>

        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <form action="/admin/service/add" method="post">
                    <input type="text" name="name" placeholder="Имя сервисы">
                    <input type="text" name="price" placeholder="Цена">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="btn btn-primary" type="submit">Создасть</button>
                </form>
            </div>
        </div>
    </div>
</@c.page>