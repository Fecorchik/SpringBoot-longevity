<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Заказ</h1>
            </div>
        </div>

        <form action="/admin/order/${order.getId()}/update" method="post">
            <div class="row justify-content-center">
                <div class="col-2">
                    <p>Id = ${order.getId()}</p>
                </div>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Обновить</button>
            </div>
        </form>

    </div>
</@c.page>