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
</div> <div class="table-responsive">
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