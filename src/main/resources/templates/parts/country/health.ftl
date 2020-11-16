<h3>Раздел аптечки</h3>
    <div>
        <form name="vaccine-form" method="post" action="admin/country/health"
              enctype="multipart/form-data">
            <div class="form-group">
                <select class="custom-select" name="countryId" required
                        title="Выбор страны">
                    <#list allCountry as country>
                        <option value="${country.id}">${country.countryName}</option>
                    </#list>
                </select>
            </div>
            <div class="form-group">
                <label for="healthText"></label>
                <textarea name="healthText" class="form-control" id="healthText"
                          rows="8"></textarea>
            </div>
            <button type="submit" class="btn btn-primary"> Добавить</button>
        </form>
    </div>