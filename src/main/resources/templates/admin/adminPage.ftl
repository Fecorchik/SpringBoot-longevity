<#import "../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <h1>Админка</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col">
                        <p><a href="/admin/empl/all" class="btn btn-primary">Сотрудники</a></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <p><a href="/admin/branch/all" class="btn btn-primary">Отделения</a></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <p><a href="/admin/cabinet/all" class="btn btn-primary">Кабинеты</a></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <p><a href="/admin/service/all" class="btn btn-primary">Услуги</a></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <p><a href="/admin/order/all" class="btn btn-primary">Заказы</a></p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</@c.page>