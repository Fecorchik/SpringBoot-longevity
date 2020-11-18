<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Сервис</h1>
            </div>
        </div>

        <form action="/admin/service/${service.getId()}/update" method="post">
            <div class="row justify-content-center">
                <div class="col-2">
                    <p>Id = ${service.getId()}</p>
                </div>
                <div class="col-5">
                    <p>Имя <input type="text" name="name" value="${service.getName()}"></p>
                </div>
                <div class="col-5">
                    <p>Цена <input type="text" name="price" value="${service.getPrice()}"></p>
                </div>
            </div>



            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Обновить</button>
            </div>
        </form>

    </div>
</@c.page>