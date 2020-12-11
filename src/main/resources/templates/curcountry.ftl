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
                            <a class="nav-link" href="#vaccine">
                                <span data-feather="file"></span>
                                Вакцинация
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#diseases">
                                <span data-feather="shopping-cart"></span>
                                Заболевания
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#prevention">
                                <span data-feather="users"></span>
                                Профилактика
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#health">
                                <span data-feather="bar-chart-2"></span>
                                Аптечка
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#after-trip">
                                <span data-feather="layers"></span>
                                После поездки
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#ref-list">
                                <span data-feather="layers"></span>
                                Список источников
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">${country.countryName}</h1>
                </div>

                <!--Google map-->
                <div id="map-container-google-1" class="z-depth-1-half map-container" style="height: 500px">
                    ${country.googleMap!}
                </div>

                <section id="vaccine">

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
                </section>

                <section id="diseases">
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
                </section>

                <section id="prevention">
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
                </section>

                <section id="health">
                    <div class="row m-6">
                        <div class="m-3">
                            <h2>Аптечка</h2>
                            <form name="pdf" method="get" action="/country/getPDF/${country.id}">
                                <input type="submit" value="PDF">
                            </form>
                        </div>
                    <#if country.health ??>
                     <div>
                         <p><b>Индивидуальная аптечка</b> (по рекомендациям Всемирной организации здравоохранения):</p>
                         ${country.health.healthText}
                     </div>
                    </#if>
                    </div>
                </section>


                <section id="after-trip">
                    <div class="row m-6">
                        <div class="m-3">
                            <h2>После поездки</h2>
                        </div>
                    <#if country.afterTheTrip ??>
                     <div>
                         <p>Консультирование возвращующихся путешественников</p>
                         ${country.afterTheTrip.afterTripText}
                     </div>
                    </#if>
                    </div>
                </section>

                <section id="ref-list">
                    <div class="row m-6">
                        <div class="m-3">
                            <h2>Список источников</h2>
                        </div>
                    <#if country.listOfReferences ??>
                     <div>
                         ${country.listOfReferences.listOfReferencesText}
                     </div>
                    </#if>
                    </div>
                </section>

            </main>
        </div>
    </div>
</@c.page>

