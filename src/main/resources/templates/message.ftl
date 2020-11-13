<#import "parts/common.ftl" as c>

<@c.page>

<div class="container mt-5">

    <h2 align="center" class="header">${message.header}</h2>

    <hr class="featurette-divider featurette">

    <div class="m-3">
        <p align="center" style="text-align: center"> <img src="/img/${message.fileName}" style="max-width: 75%; max-height: 600px"></p>
        <div class="m-3">
            <p>${message.text}</p>
        </div>
    </div>
</div>

</@c.page>