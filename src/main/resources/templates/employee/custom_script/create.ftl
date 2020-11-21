<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Создать свой сценарий на основе готового</h1>
            </div>
        </div>
    </div>

    <form action="/employee/custom_script/add" method="post">
        <div class="container" style="border-bottom: 20px">
            <div class="row justify-content-center">
                <div class="col-12">
                    <select name="client">
                        <#list clients as client>
                            <option value="${client.getId()}">${client.getUsername()}</option>
                        </#list>
                    </select>
                </div>
            </div>
        </div>

            <div class="container" style="border-bottom: 20px">
                <div class="formServiceCustom">
                <#list script.getServices() as service>
                    <div class="row justify-content-center service-${service?index+1} card">
                        <div class="card-body">
                            <div class="col-12">
                                <select name="service-${service?index+1}" class="service-input-custom">
                                    <#list services as serviceList>
                                        <option class="serviceOption" value="${serviceList.getId()}" <#if service.getName() == serviceList.getName()>selected</#if> >Имя:${serviceList.getName()}, Цена:${serviceList.getPrice()}</option>
                                    </#list>
                                </select>
                            </div>
                            <div class="col-12">
                                <input type="text" name="service-${service?index+1}-text" placeholder="Записка">
                            </div>
                            <div class="col-12">
                                <a class="btn btn-danger" onclick="deleteService('service-${service?index+1}');">Удалить</a>
                            </div>
                        </div>
                    </div>
                </#list>
                <div class="pointServiceCustom"></div>
            </div>
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <p><div class="add-service-custom btn btn-primary">Добавить услугу</div></p>
                    </div>
                </div>
            </div>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button class="btn btn-primary" type="submit">Создасть</button>
                </div>
            </div>
        </div>
    </form>
    <script src="/static/service.js" type="text/javascript"></script>
    <script src="/static/serviceCustom.js" type="text/javascript"></script>
</@c.page>