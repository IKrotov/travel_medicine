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
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade show active" id="v-pills-vaccine" role="tabpanel" aria-labelledby="v-pills-vaccine-tab">
                                    <h3>Добавление вакцин</h3>
                                    <div>
                                        <form name="vaccine-form" method="post" action="admin/country/vaccine" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <select class="custom-select" name="countryId" required title="Выбор страны">
                                                    <#list allCountry as country>
                                                        <option value="${country.id}">${country.countryName}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="vacName">Название вакцины</label>
                                                <textarea name="vacName"  class="form-control" id="vacName" rows="1"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="url">Ссылка </label>
                                                <textarea name="url" class="form-control" id="url" rows="1"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="recommendation">Рекомендации</label>
                                                <textarea name="recommendation" class="form-control" id="recommendation" rows="6"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="transmission">Пути передачи</label>
                                                <textarea name="transmission" class="form-control" id="transmission" rows="6"></textarea>
                                            </div>

                                            <button type="submit" class="btn btn-primary"> Добавить </button>
                                        </form>
                                    </div>

                                    <div class="row m-3 p-3">
                                        <div class="block">
                                            <h3>Вакцинация</h3>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="thead-light">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Заголовок вакцины</th>
                                                <th scope="col">Delete</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <#list allCountry as country>
                                                <tr>
                                                    <td colspan="3">${country.countryName}</td>
                                                </tr>
                                                <#if country.vaccines??>
                                                    <#list country.vaccines as vaccine>
                                                    <tr>
                                                        <th scope="row">${vaccine.id}</th>
                                                        <td>${vaccine.vacName}</td>
                                                        <td>
                                                            <form action="/admin/country/vaccine/${vaccine.id}" method="post">
                                                                <input type="hidden" name="countryId" value="${country.id}">
                                                                <input type="hidden" name="action" value="delete"/>
                                                                <button type="submit" class="btn btn-outline-danger">Delete</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                    </#list>
                                                </#if>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                    <h3>Добавление других болезней</h3>
                                    <div>
                                        <form name="vaccine-form" method="post" action="admin/country/diseases" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <select class="custom-select" name="countryId" required title="Выбор страны">
                                                    <#list allCountry as country>
                                                        <option value="${country.id}">${country.countryName}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="disName">Название болезни</label>
                                                <textarea name="disName" class="form-control" id="disName" rows="1"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="url">Ссылка </label>
                                                <textarea name="url" class="form-control" id="url" rows="1"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="prevention">Профилактика</label>
                                                <textarea name="prevention" class="form-control" id="prevention" rows="6"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="comment">Комментарий</label>
                                                <textarea name="comment" class="form-control" id="comment" rows="6"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary"> Добавить </button>
                                        </form>
                                    </div>

                                    <div class="row m-3 p-3">
                                        <div class="block">
                                            <h3>Другие заболевания</h3>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="thead-light">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Название болезни</th>
                                                <th scope="col">Delete</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <#list allCountry as country>
                                                <tr>
                                                    <td colspan="3">${country.countryName}</td>
                                                </tr>
                                                <#if country.otherDiseasesSet??>
                                                    <#list country.otherDiseasesSet as diseases>
                                                    <tr>
                                                        <th scope="row">${diseases.id}</th>
                                                        <td>${diseases.disName}</td>
                                                        <td>
                                                            <form action="/admin/country/diseases/${diseases.id}" method="post">
                                                                <input type="hidden" name="countryId" value="${country.id}">
                                                                <input type="hidden" name="action" value="delete"/>
                                                                <button type="submit" class="btn btn-outline-danger">Delete</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                    </#list>
                                                </#if>
                                                </#list>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">

                                </div>
                                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                    <h3>Раздел аптечки</h3>
                                    <div>
                                        <form name="vaccine-form" method="post" action="admin/country/prevention" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <select class="custom-select" name="countryId" required title="Выбор страны">
                                                    <#list allCountry as country>
                                                        <option value="${country.id}">${country.countryName}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="prevText"></label>
                                                <textarea name="preventionText" class="form-control" id="prevText" rows="8"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary"> Добавить </button>
                                        </form>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="v-pills-after-trip" role="tabpanel" aria-labelledby="v-pills-after-trip-tab">Здесь после путешествия</div>
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
                                    <p>${role.name}</p>
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