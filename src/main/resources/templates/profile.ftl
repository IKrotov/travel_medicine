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

            <p>Имя: ${name}</p>
            <p><span>Email: ${email}</span></p>
            <p>Статус: </p>
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
                            <div class="control-group">
                                <!-- Username -->
                                <label class="control-label"  for="username">Введите новое имя пользователя</label>
                                <div class="controls">
                                    <input type="text" id="username" name="username" placeholder="" class="input-xlarge">
                                    <input type="hidden" name="userId" value="${userId}">
                                    <p class="help-block">Имя должно содеражать то-то то-то</p>
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
                <div class="tab-pane fade" id="pills-email" role="tabpanel" aria-labelledby="pills-email-tab">
                    <h3 class="title">Изменить Email</h3>
                    <form class="form-horizontal" action='/profile/changeEmail' method="POST">
                        <div class="control-group">
                            <!-- E-mail -->
                            <label class="control-label" for="email">E-mail</label>
                            <div class="controls">
                                <input type="hidden" name="userId" value="${userId}">
                                <input type="text" id="email" name="email" placeholder="" class="input-xlarge">
                                <p class="help-block">Введите новый Email</p>
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
                <div class="tab-pane fade" id="pills-password" role="tabpanel" aria-labelledby="pills-password-tab">
                    <h3 class="title">Изменить пароль</h3>
                    <form action="/profile/changePassword" method="post">

                        <div class="control-group">
                            <!-- Password-->
                            <label class="control-label" for="password">Введите новый пароль</label>
                            <div class="controls">
                                <input type="hidden" name="userId" value="${userId}">
                                <input type="password" id="password" name="password" placeholder="" class="input-xlarge">
                                <p class="help-block">Пароль должен быть такой-то...</p>
                            </div>
                        </div>

                        <div class="control-group">
                            <!-- Password -->
                            <label class="control-label"  for="password_confirm">Подтвердите пароль</label>
                            <div class="controls">
                                <input type="password" id="password_confirm" name="passwordConfirm" placeholder="" class="input-xlarge">
                                <p class="help-block">Пароли должны совпадать</p>
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