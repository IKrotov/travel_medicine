<#import "parts/common.ftl" as c>
<@c.page>

<div class="container pb-5 ">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel1.jpg" style="height: 300px" alt="Первый слайд">
                            <#--<img class="d-block w-100" src="https://www.dropbox.com/s/3ghosx9nfu4y6ss/testhajhfjahjf.png\?raw=1" style="height: 300px" alt="Первый слайд">-->
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel2.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel3.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel4.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel5.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel6.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel7.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel8.jpg" style="height: 300px" alt="Первый слайд">
                    </div>
                    <div class="col">
                        <img class="d-block w-100" src="/static/img/carusel9.jpg" style="height: 300px" alt="Первый слайд">
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
        <div class="col">
            <div class="card mb-3 mt-3 div-link">
                <div class="card-body">
                    <div style="height: 75px"></div>
                    <h1 class="card-title">Путешественникам</h1>
                    <div style="height: 75px"></div>
                    <a href="/country" class="stretched-link"></a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card mb-3 mt-3 div-link">
                <div class="card-body">
                    <div style="height: 75px"></div>
                    <h1 class="card-title" >Клиницистам</h1>
                    <div style="height: 75px"></div>
                    <a href="/country" class="stretched-link"></a>
                </div>
            </div>
        </div>
    </div>
</div>

 <hr class="featurette-divider">

<h1 class="text-center mb-5">Новости</h1>
<div class="container">
    <div class="row">
    <#list messages as message>
        <div class="col-md-4">
            <div class="card mb-4">
                <#--<div class="img-preview" style="background-image:url(/img/${message.fileName});">-->
                    <div class="img-preview" style="background-image:url(${message.file.url});">
                </div>
                <div class="card-body" style="height: 260px">
                    <h5 class="card-title">${message.header}</h5>
                    <p class="card-text">
                        <#assign minitext=(message.text!"")>
                        <#if minitext?length &lt; 110>
                            ${minitext}
                        <#else>
                            ${minitext?substring(0,109)} ...
                        </#if>
                    </p>
                    <a href="/messages/${message.id}" class="card-link">Открыть новость</a>
                </div>
            </div>
        </div>
    </#list>

    </div>
</div>
</@c.page>
