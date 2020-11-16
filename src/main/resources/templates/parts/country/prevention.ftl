<h3>Раздел профилактика</h3>
    <div>
        <form name="prevention-form" method="post" action="admin/country/prevention"
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
                <label for="prevText"></label>
                <textarea name="preventionText" class="form-control" id="prevText"
                          rows="8"></textarea>
            </div>
            <button type="submit" class="btn btn-primary"> Добавить</button>
        </form>
    </div>