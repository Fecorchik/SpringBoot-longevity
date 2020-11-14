<#macro auth path isRegisterForm>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <form action="${path}" method="post">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Имя пользователя:</label>
                        <div class="col-sm-6">
                            <input type="text" name="username"
                                   class="form-control"
                                   placeholder="Имя пользователя"
                                   required/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Пароль:</label>
                        <div class="col-sm-6">
                            <input type="password" name="password"
                                   class="form-control"
                                   placeholder="Пароль"
                                   required/>
                        </div>
                    </div>
                    <#if isRegisterForm>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Повтор пароля:</label>
                            <div class="col-sm-6">
                                <input type="password" name="password2"
                                       class="form-control "
                                       placeholder="Повтор пароля"
                                       required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">ФИО:</label>
                            <div class="col-sm-6">
                                <input type="text" name="fullName"
                                       class="form-control "
                                       placeholder="ФИО"
                                       required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Почта:</label>
                            <div class="col-sm-6">
                                <input type="email" name="email"
                                       class="form-control"
                                       placeholder="some@some.com"
                                       required/>
                            </div>
                        </div>
                    </#if>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button class="btn btn-primary" type="submit"><#if isRegisterForm>Создать<#else>Войти</#if></button>
                </form>
            </div>
        </div>
    </div>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-danger" type="submit">Выйти</button>
    </form>
</#macro>