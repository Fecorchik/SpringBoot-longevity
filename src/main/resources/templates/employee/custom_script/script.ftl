<#import "../../parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <h1>Кастомный сценарий</h1>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <p>ID: ${customScript.getId()}</p>
            </div>
            <div class="col-12">
                <p>Клиент: ${customScript.getId()}</p>
                <div class="row">
                    <div class="col-12">
                        <p>Имя: ${customScript.getClient().getFirstName()}</p>
                    </div>
                    <div class="col-12">
                        <p>Фамилия: ${customScript.getClient().getLastName()}</p>
                    </div>
                    <div class="col-12">
                        <p>Отчество: ${customScript.getClient().getPatronymic()}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <h3>Выбранные сервисы</h3>
            </div>
        </div>

        <#list 0..count-1 as i>
            <div class="row card">
                <div class="card-body">
                    <div class="col-12">
                        <p>Название услуги: ${customScript.getServices()[i].getName()}, Цена: ${customScript.getServices()[i].getPrice()}</p>
                    </div>
                    <div class="col-12">
                        <p>Записка: <#if customScript.getNote()[i].getNote() == "empty">Нет записи<#else>${customScript.getNote()[i].getNote()}</#if></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12"><hr></div>
            </div>
        </#list>
    </div>
</@c.page>