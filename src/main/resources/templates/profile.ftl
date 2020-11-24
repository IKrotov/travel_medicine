<#import "parts/common.ftl" as c>

<@c.page>

<#include "parts/security.ftl">

<style>
    .avatar {
        vertical-align: middle;
        max-width: 200px;
        max-height: 200px;
        border-radius: 50%;
    }
</style>

    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    email = user.getEmail()
    userId = user.getId()
    >

<h2>Редактор профиля</h2>

<div class="container">
    <div class="row m-3">

        <div class="col-4">
            <div>
                <img class="avatar" src="/img/unknown_avatar.png">
            </div>
            <div class="p-2">
                <p>Имя: ${name}</p>
                <p><span>Email: ${email}</span></p>
                <p>Статус: </p>
            </div>

        </div>

        <div class="col-8">

            <#if status??>
                <h3 class="ui-state-error-text">${status}</h3>
            </#if>

            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-name" role="tab" aria-controls="pills-name" aria-selected="true">Имя пользователя</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-email" role="tab" aria-controls="pills-email" aria-selected="false">Почта</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-password" role="tab" aria-controls="pills-password" aria-selected="false">Пароль</a>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-name" role="tabpanel" aria-labelledby="pills-name-tab">
                    <h3 class="title">Изменить имя пользователя</h3>
                    <form class="form-horizontal" action='/profile/changeUsername' method="POST">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">User Name: </label>
                            <div class="col-sm-6">
                                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                                       placeholder="User name" />
                                <input type="hidden" name="userId" value="${userId}">
                                <#if usernameError??>
                                    <div class="invalid-feedback">
                                        ${usernameError}
                                    </div>
                                </#if>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <button class="btn btn-success">Применить</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="pills-email" role="tabpanel" aria-labelledby="pills-email-tab">
                    <h3 class="title">Изменить Email</h3>
                    <form class="form-horizontal" action='/profile/changeEmail' method="POST">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Email:</label>
                            <div class="col-sm-6">
                                <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                                       class="form-control ${(emailError??)?string('is-invalid', '')}"
                                       placeholder="some@some.com"/>
                                <input type="hidden" name="userId" value="${userId}">
                                <#if emailError??>
                                    <div class="invalid-feedback">
                                        ${emailError}
                                    </div>
                                </#if>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <button class="btn btn-success">Применить</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="pills-password" role="tabpanel" aria-labelledby="pills-password-tab">
                    <h3 class="title">Изменить пароль</h3>
                    <form action="/profile/changePassword" method="post">

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Password:</label>
                            <div class="col-sm-6">
                                <input type="password" name="password"
                                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                       placeholder="Password" />
                                <input type="hidden" name="userId" value="${userId}">
                                <#if passwordError??>
                                    <div class="invalid-feedback">
                                        ${passwordError}
                                    </div>
                                </#if>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Confirm password:</label>
                            <div class="col-sm-6">
                                <input type="password" name="passwordConfirm"
                                       class="form-control ${(passwordConfirmError??)?string('is-invalid', '')}"
                                       placeholder="Retype password" />
                                <#if passwordConfirmError??>
                                    <div class="invalid-feedback">
                                        ${passwordConfirmError}
                                    </div>
                                </#if>
                            </div>
                        </div>

                        <div class="control-group">
                            <!-- Button -->
                            <div class="controls">
                                <button class="btn btn-success">Применить</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

</@c.page>