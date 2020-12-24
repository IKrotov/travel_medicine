<#import "parts/common.ftl" as c>
<@c.page>

<div class="container pb-5 ">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel1.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel2.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel3.jpg"  alt="Первый слайд">
                    </div>

                    <div class="col  img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel1.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col  img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel2.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col  img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel3.jpg"  alt="Первый слайд">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel4.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel5.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel6.jpg"  alt="Первый слайд">
                    </div>

                    <div class="col img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel4.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel5.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel6.jpg"  alt="Первый слайд">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel7.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel8.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel9.jpg" alt="Первый слайд">
                    </div>

                    <div class="col img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel7.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel8.jpg"  alt="Первый слайд">
                    </div>
                    <div class="col img-d-none">
                        <img class="d-block w-100" src="/static/img/carusel9.jpg"  alt="Первый слайд">
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev" style="width: 6%">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next" style="width: 6%">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

 <hr class="featurette-divider featurette">

<div class="container text-center mb-3 mt-3">
    <div class="row">
        <div class="col col-sm-6">
            <div class="card mb-3 mt-3 div-link">
                <div class="card-body">
                    <h1 class="card-title button-card-title">Путешественникам</h1>
                    <a href="/country" class="stretched-link"></a>
                </div>
            </div>
        </div>

        <div class="col col-sm-6">
            <div class="card mb-3 mt-3 div-link">
                <div class="card-body">
                    <h1 class="card-title button-card-title" >Клиницистам</h1>
                    <a href="/country" class="stretched-link"></a>
                </div>
            </div>
        </div>
    </div>
</div>

 <hr class="featurette-divider">

<h2 class="text-center mb-5">Новости</h2>
<div class="container">
    <div class="row">
    <#list messages as message>
        <div class="col-md-4">
            <div class="card mb-4">
                <#if message.file??>
                    <div class="img-preview" style="background-image:url(${message.file.url});">
                <#else>
                     <div class="img-preview" style="background-image:url(/static/img/snk_logo.png);">
                </#if>
                </div>
                <div class="card-body" style="height: 260px">
                    <h3 class="card-title card-title-fix">${message.header}</h3>
                    <p class="card-text card-text-fix">
                        <#assign minitext=(message.text!"")>
                        <#if minitext?length &lt; 110>
                            ${minitext}
                        <#else>
                            ${minitext?substring(0,109)}...
                        </#if>
                    </p>

                    <a href="/messages/${message.id}" class="card-link">Открыть новость</a>
                </div>
                <div class="card-footer footer-content">
                    <small class="text-muted">${message.date}</small>
                    <small class="text-muted">${message.continent}, ${message.countryName}</small>
                </div>
            </div>
        </div>
    </#list>
    </div>
    <div class="text-center">
    <button type="button" class="btn btn-light"><a href="/messages">Все новости</a></button>
    </div>
</div>
</@c.page>
