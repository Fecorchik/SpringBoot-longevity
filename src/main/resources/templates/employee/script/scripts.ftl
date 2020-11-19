<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Список сценариев</h1>
            </div>
        </div>
    </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-2">Поиск по группам</div>
                <div class="col-10">
                    <form action="/employee/script/all" method="get">
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
                    <a class="btn btn-primary" href="/employee/script/${script.getId()}">Посмотреть</a>
                    <a class="btn btn-danger" href="/employee/script/${script.getId()}/delete">Удалить</a>
                </div>
                <br><br>
            </#list>
        </div>
    </div>


    <form action="/employee/script/add" method="post">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <input type="text" name="name" placeholder="Имя сценария">

                    <select name="group">
                        <#list groups as group>
                            <option value="${group.getId()}">${group.getName()}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="formService">
                <div class="row justify-content-center service-1">
                    <div class="col-md-10">
                        <p>
                            <select name="service-1" class="service-input">
                                <#list services as service>
                                    <option class="serviceOption" value="${service.getId()}">Имя:${service.getName()}, Цена:${service.getPrice()}</option>
                                </#list>
                            </select>
                        </p>
                    </div>
                    <div class="col-2">
                        <#--                    <a href="" class="btn btn-danger" onclick="deleteService('service-1');">Удалить</a>-->
                    </div>
                </div>

                <div class="pointService"></div>
            </div>


            <div class="row justify-content-center">
                <div class="col-md-12">
                    <p><div class="add-service btn btn-primary">Добавить услугу</div></p>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-12">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn btn-primary" type="submit">Создасть</button>
                </div>
            </div>
        </div>
    </form>
</@c.page>