<#import "parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <h1> Панель администратора </h1>

        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="m-3 p-">
                        <h3>Добавление новостей</h3>
                        <div>
                            <form name="message-form" method="post" action="/admin/addMessage" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="header">Заголовок новости</label>
                                    <input name="header" type="text" class="form-control" id="header" placeholder="Заголовок новости">
                                </div>
                                <div class="form-group">
                                    <label for="text">Текст новости</label>
                                    <textarea name="text" class="form-control" id="text" rows="6"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="file">Прикрепить картинку для новости</label>
                                    <input type="file" name="file" class="form-control-file" id="file">
                                </div>
                                <button type="submit" class="btn btn-primary"> Опубликовать </button>
                            </form>
                        </div>

                        <div class="row m-3 p-3">
                            <div class="block">
                                <h3>Загруженные новости</h3>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Заголовок новости</th>
                                    <th scope="col">Delete</th>
                                </tr>
                                </thead>
                                <tbody>
                            <#list messages as message>
                            <tr>
                                <th scope="row">${message.id}</th>
                                <td>${message.header}</td>
                                <td>
                                    <form action="/admin/deleteMsg" method="post">
                                        <input type="hidden" name="messageId" value="${message.id}"/>
                                        <input type="hidden" name="action" value="delete"/>
                                        <button type="submit" class="btn btn-outline-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>
                            </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <div class="container">
                    <h4>Здесь будут страны</h4>
                    <div class="row">
                        <div class="col-3">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Вакцины</a>
                                <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Болезни</a>
                                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Профилактика</a>
                                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Аптечка</a>
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">Здесь вакцины</div>
                                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">Здесь болезни</div>
                                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">Здесь профилактика</div>
                                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">Здесь артечки</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                <table class="table">
                    <thead class="thead-light">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Roles</th>
                        <th scope="col">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list allUsers as user>
                    <tr>
                        <th scope="row">${user.id}</th>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>
                            <#list user.roles as role>
                                <div>
                                    <p>${role.name}</p>
                                </div>
                            </#list>
                        </td>
                        <td>
                            <form action="/admin" method="post">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <input type="hidden" name="action" value="delete"/>
                                <button type="submit" class="btn btn-outline-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>

        <#--<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">-->
            <#--<li class="nav-item">-->
                <#--<a class="nav-link active" id="pills-news-tab" data-toggle="pill" href="#pills-news" role="tab" aria-controls="pills-news" aria-selected="true">Новости</a>-->
            <#--</li>-->
            <#--<li class="nav-item">-->
                <#--<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Страны</a>-->
            <#--</li>-->
            <#--<li class="nav-item">-->
                <#--<a class="nav-link" id="pills-users-tab" data-toggle="pill" href="#pills-users" role="tab" aria-controls="pills-users" aria-selected="false">Управление пользователями</a>-->
            <#--</li>-->
        <#--</ul>-->
        <#--<div class="tab-content" id="pills-tabContent">-->
            <#--<div class="tab-pane fade show active" id="pills-news" role="tabpanel" aria-labelledby="pills-news-tab">-->
                <#--<div class="m-3 p-">-->
                    <#--<h3>Добавление новостей</h3>-->
                    <#--<div>-->
                        <#--<form name="message-form" method="post" action="/admin/addMessage" enctype="multipart/form-data">-->
                            <#--<div class="form-group">-->
                                <#--<label for="header">Заголовок новости</label>-->
                                <#--<input name="header" type="text" class="form-control" id="header" placeholder="Заголовок новости">-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                                <#--<label for="text">Текст новости</label>-->
                                <#--<textarea name="text" class="form-control" id="text" rows="6"></textarea>-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                                <#--<label for="file">Прикрепить картинку для новости</label>-->
                                <#--<input type="file" name="file" class="form-control-file" id="file">-->
                            <#--</div>-->
                            <#--<button type="submit" class="btn btn-primary"> Опубликовать </button>-->
                        <#--</form>-->
                    <#--</div>-->

                    <#--<div class="row m-3 p-3">-->
                        <#--<div class="block">-->
                            <#--<h3>Загруженные новости</h3>-->
                        <#--</div>-->
                    <#--</div>-->
                    <#--<div class="table-responsive">-->
                        <#--<table class="table">-->
                            <#--<thead class="thead-light">-->
                            <#--<tr>-->
                                <#--<th scope="col">#</th>-->
                                <#--<th scope="col">Заголовок новости</th>-->
                                <#--<th scope="col">Delete</th>-->
                            <#--</tr>-->
                            <#--</thead>-->
                            <#--<tbody>-->
                            <#--<#list messages as message>-->
                            <#--<tr>-->
                                <#--<th scope="row">${message.id}</th>-->
                                <#--<td>${message.header}</td>-->
                                <#--<td>-->
                                    <#--<form action="/admin/deleteMsg" method="post">-->
                                        <#--<input type="hidden" name="messageId" value="${message.id}"/>-->
                                        <#--<input type="hidden" name="action" value="delete"/>-->
                                        <#--<button type="submit" class="btn btn-outline-danger">Delete</button>-->
                                    <#--</form>-->
                                <#--</td>-->
                            <#--</tr>-->
                            <#--</#list>-->
                            <#--</tbody>-->
                        <#--</table>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</div>-->

            <#--<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">-->
                <#--<div class="container">-->
                    <#--<h4>Здесь будут страны</h4>-->
                    <#--<div class="row">-->
                        <#--<div class="col-3">-->
                            <#--<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">-->
                                <#--<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Вакцины</a>-->
                                <#--<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Болезни</a>-->
                                <#--<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Профилактика</a>-->
                                <#--<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Аптечка</a>-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--<div class="col-9">-->
                            <#--<div class="tab-content" id="v-pills-tabContent">-->
                                <#--<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">Здесь вакцины</div>-->
                                <#--<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">Здесь болезни</div>-->
                                <#--<div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">Здесь профилактика</div>-->
                                <#--<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">Здесь артечки</div>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="tab-pane fade" id="pills-users" role="tabpanel" aria-labelledby="pills-users-tab">-->
                <#--<table class="table">-->
                    <#--<thead class="thead-light">-->
                    <#--<tr>-->
                        <#--<th scope="col">#</th>-->
                        <#--<th scope="col">Username</th>-->
                        <#--<th scope="col">Email</th>-->
                        <#--<th scope="col">Roles</th>-->
                        <#--<th scope="col">Delete</th>-->
                    <#--</tr>-->
                    <#--</thead>-->
                    <#--<tbody>-->
                    <#--<#list allUsers as user>-->
                    <#--<tr>-->
                        <#--<th scope="row">${user.id}</th>-->
                        <#--<td>${user.username}</td>-->
                        <#--<td>${user.email}</td>-->
                        <#--<td>-->
                            <#--<#list user.roles as role>-->
                                <#--<div>-->
                                    <#--<p>${role.name}</p>-->
                                <#--</div>-->
                            <#--</#list>-->
                        <#--</td>-->
                        <#--<td>-->
                            <#--<form action="/admin" method="post">-->
                                <#--<input type="hidden" name="userId" value="${user.id}"/>-->
                                <#--<input type="hidden" name="action" value="delete"/>-->
                                <#--<button type="submit" class="btn btn-outline-danger">Delete</button>-->
                            <#--</form>-->
                        <#--</td>-->
                    <#--</tr>-->
                    <#--</#list>-->
                    <#--</tbody>-->
                <#--</table>-->
            <#--</div>-->
            <a href="/">Главная</a>
        </div>
    </div>
</@c.page>

<#--<!DOCTYPE html>-->
<#--<html xmlns:th="http://www.thymeleaf.org">-->
<#--<head>-->
    <#--<meta charset="utf-8">-->
    <#--<title>Log in with your account</title>-->

    <#--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">-->
<#--</head>-->

<#--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
<#--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>-->
<#--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->
