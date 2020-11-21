<#import "parts/common.ftl" as c>

<@c.page>
    <div class="container">

        <h1> Панель администратора </h1>

        <hr class="featurette-divider featurette m-3 p-3">

        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#news" role="tab" aria-controls="news" aria-selected="true">Новости</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#country" role="tab" aria-controls="country" aria-selected="false">Страны</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#users" role="tab" aria-controls="users" aria-selected="false">Пользователи</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="news" role="tabpanel" aria-labelledby="news-tab">
                    <div class="m-3 p-3">
                        <h3>Добавление новостей</h3>
                        <div>
                            <form name="message-form" method="post" action="/admin/addMessage" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="header">Заголовок новости</label>
                                    <textarea name="header" class="form-control" id="header" rows="1"></textarea>
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
            <div class="tab-pane fade" id="country" role="tabpanel" aria-labelledby="country-tab">
                <h2 class="header m-3 p-3">Редактирование по странам</h2>
                    <div class="row m-3">
                        <div class="col-3">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active" id="v-pills-vaccine-tab" data-toggle="pill" href="#v-pills-vaccine" role="tab" aria-controls="v-pills-vaccine" aria-selected="true">Вакцинация</a>
                                <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Другие болезни</a>
                                <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Профилактика</a>
                                <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Аптечка</a>
                                <a class="nav-link" id="v-pills-settings-after-trip" data-toggle="pill" href="#v-pills-after-trip" role="tab" aria-controls="v-pills-after-trip" aria-selected="false">После поездки</a>
                                <a class="nav-link" id="v-pills-settings-ref-list" data-toggle="pill" href="#v-pills-ref-list" role="tab" aria-controls="v-pills-ref-list" aria-selected="false">Список источников</a>

                                <hr class="featurette-divider">

                                <a class="nav-link" id="v-pills-settings-add-country" data-toggle="pill" href="#v-pills-add-country" role="tab" aria-controls="v-pills-add-country" aria-selected="false">Добавить страну</a>
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-vaccine" role="tabpanel" aria-labelledby="v-pills-vaccine-tab">
                                    <#include "parts/country/vaccine.ftl">
                                </div>
                                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                    <#include "parts/country/diseases.ftl">
                                </div>
                                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                    <#include "parts/country/prevention.ftl">
                                </div>
                                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <#include "parts/country/health.ftl">
                                </div>
                                <div class="tab-pane fade" id="v-pills-after-trip" role="tabpanel" aria-labelledby="v-pills-after-trip-tab">
                                    <#include "parts/country/afterTrip.ftl">
                                </div>
                                <div class="tab-pane fade" id="v-pills-ref-list" role="tabpanel" aria-labelledby="v-pills-ref-list-tab">
                                    <#include "parts/country/refList.ftl">
                                </div>
                                <div class="tab-pane fade" id="v-pills-add-country" role="tabpanel" aria-labelledby="v-pills-ref-add-country">
                                    <#include "parts/country/countryController.ftl">
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="tab-pane fade m-3 p-3" id="users" role="tabpanel" aria-labelledby="users-tab">
                <h3> Управление пользователями</h3>
                <table class="table m-3 p-3">
                    <thead class="thead-light">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Roles</th>
                        <th scope="col">IsAdmin</th>
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
                                    <p>${role}</p>
                                </div>
                            </#list>
                        </td>
                        <td>
                            <form action="/admin" method="post">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <input type="hidden" name="action" value="setAdminRole"/>
                                <#if user.isAdmin()>
                                    <button type="submit" class="btn btn-outline-secondary">Unmake Admin</button>
                                <#else>
                                    <button type="submit" class="btn btn-outline-info">Make Admin</button>
                                </#if>

                            </form>
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
        </div>
    </div>
</@c.page>