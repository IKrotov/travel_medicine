<#import "parts/common.ftl" as c>
<@c.page>

<div>
    <form class="form-horizontal" action='/registration' method="POST">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User Name :</label>
            <div class="col-sm-6">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="User name" />
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Password" />
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Confirm password:</label>
            <div class="col-sm-6">
                <input type="password" name="passwordConfirm"
                       class="form-control ${(passwordConfirmError??)?string('is-invalid', '')}"
                       placeholder="Retype password" />
                <#if passwordConfirmError??>
                    <div class="invalid-feedback">
                        ${passwordConfirmError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                       class="form-control ${(emailError??)?string('is-invalid', '')}"
                       placeholder="some@some.com" />
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>
        <button type="submit" class="btn btn-success"> Добавить</button>
    </form>
</div>
</@c.page>