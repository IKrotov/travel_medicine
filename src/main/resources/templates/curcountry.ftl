<#import "parts/common.ftl" as c>

<@c.page>

<link rel="stylesheet" href="/static/curcountry.css">

    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                <div class="sidebar-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                <span data-feather="home"></span>
                                Общая информация <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="file"></span>
                                Вакцинация
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="shopping-cart"></span>
                                Заболевания
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="users"></span>
                                Профилактика
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="bar-chart-2"></span>
                                Аптечка
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="layers"></span>
                                После поездки
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">${country.countryName}</h1>
                </div>

                <#--<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>-->
                <#if country.mapFileName??>
                     <div class="block">
                         <img src="/img/${country.mapFileName}" style="width: 50%; max-height: 400px">
                     </div>
                </#if>

                <div class="row m-6 p-6">
                    <div class="m-3">
                        <h2>Вакцинация</h2>
                    </div>

                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th>Название</th>
                            <th>Рекомендовано</th>
                            <th>Пути передачи</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list country.vaccines as vaccine>
                            <tr>
                                <td><a href="${vaccine.url}">${vaccine.vacName}</a></td>
                                <td>${vaccine.recommendation}</td>
                                <td>${vaccine.transmission}</td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
                </div>

                <div class="row m-6 p-6">
                    <div class="m-3">
                        <h2>Другие заболевания</h2>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                            <tr>
                                <th>Заболевание</th>
                                <th>Профелактика</th>
                                <th>Комментарии</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list country.otherDiseasesSet as diseases>
                            <tr>
                                <td>
                                    <#if diseases.url?has_content>
                                        <a href="${diseases.url}">
                                            ${diseases.disName}
                                        </a>
                                        <#else>
                                            ${diseases.disName}
                                    </#if>
                                </td>
                                <td>${diseases.prevention}</td>
                                <td>${diseases.comment}</td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row m-6">
                    <div class="m-3">
                        <h2>Профилактика</h2>
                    </div>
                    <#if country.prevention ??>
                     <div>
                         <p> Общие рекомендации по профилактике заболеваний во время поездки</p>
                         ${country.prevention.preventionText}
                     </div>
                    </#if>
                </div>

                <div class="row m-6">
                    <div class="m-3">
                        <h2>Аптечка</h2>
                    </div>
                    <#if country.health ??>
                     <div>
                         <p><b>Индивидуальная аптечка</b> (по рекомендациям Всемирной организации здравоохранения):</p>
                          <#--<br/>-->
                         ${country.health.healthText}
                     </div>
                    </#if>
                </div>

                <div class="row m-6">
                    <div class="m-3">
                        <h2>После поездки</h2>
                    </div>
                    <#if country.health ??>
                     <div>
                         <p><b>Индивидуальная аптечка</b> (по рекомендациям Всемирной организации здравоохранения):</p>
                     <#--<br/>-->
                         ${country.health.healthText}
                     </div>
                    </#if>
                </div>

            </main>
        </div>
    </div>
</@c.page>

