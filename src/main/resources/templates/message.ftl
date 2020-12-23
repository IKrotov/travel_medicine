<#import "parts/common.ftl" as c>

<@c.page>

<div class="container bg-light" style="padding-bottom: 10px; padding-top: 20px">
    <h2 align="center" class="header">${message.header}</h2>

    <hr class="featurette-divider featurette">

    <div class="container" style="max-width: 800px">
        <#if message.file??>
            <div style="text-align: center; margin-bottom: 20px">
                <img src="${message.file.url}" style="width: 100%">
            </div>
        <#else>
        <div>
            <img src="/static/img/snk_logo.png">
        </div>
        </#if>

        <div>
            <p>${message.text}</p>
        </div>
    </div>
</div>

</@c.page>