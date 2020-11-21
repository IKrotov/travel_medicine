<h3>Редактор по странам</h3>
<div>
    <form name="country-form" method="post" action="/admin/addCountry" enctype="multipart/form-data">
        <div class="form-group">
            <label for="countryName">Название страны</label>
            <textarea name="countryName" class="form-control" id="countryName" rows="1"></textarea>
        </div>
        <div class="form-group">
            <label for="flagFileName">Прикрепить картинку с флагом</label>
            <input type="file" name="flagFileName" class="form-control-file" id="flagFileName">
        </div>
        <div class="form-group">
            <label for="mapFileName">Прикрепить картинку с картой</label>
            <input type="file" name="mapFileName" class="form-control-file" id="mapFileName">
        </div>
        <button type="submit" class="btn btn-success"> Добавить страну </button>
    </form>
</div>

<div class="row m-3 p-3">
    <div class="block">
        <h3>Добавленные старны</h3>
    </div>
</div>

<#if allCountry??>
    <div class="table-responsive">
        <table class="table">
            <thead class="thead-light">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Название страны</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>

        <#list allCountry as country>
        <tr>
            <th scope="row">${country.id}</th>
            <td>${country.countryName}</td>
            <td>
                <form action="/admin/deleteCountry" method="post">
                    <input type="hidden" name="countryId" value="${country.id}"/>
                    <button type="submit" class="btn btn-outline-danger">Delete</button>
                </form>
            </td>
        </tr>
        </#list>
            </tbody>
        </table>
    </div>
</#if>
