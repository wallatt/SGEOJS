{**
 * saludColectiva/templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css"> 

<!-- AGREGADO -->
<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
<div id="pkp_content_main">

<div class="page page_lost_password">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login.resetPassword"}

	<p>{translate key="user.login.resetPasswordInstructions"}</p>

	<form class="cmp_form lost_password" id="lostPasswordForm" action="{url page="login" op="requestResetPassword"}" method="post">
		{csrf}
		{if $error}
			<div class="pkp_form_error">
				{translate key=$error}
			</div>
		{/if}

		<fieldset class="fields">
			<div class="email">
				<label>
					<span class="label">
						{translate key="user.login.registeredEmail"}
						<span class="required">*</span>
						<span class="pkp_screen_reader">
							{translate key="common.required"}
						</span>
					</span>
					<input type="text" name="email" id="email" value="{$email|escape}" required>
				</label>
			</div>
			<div class="buttons">
				<button class="submit" type="submit">
					{translate key="user.login.resetPassword"}
				</button>

				{if !$disableUserReg}
					{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
					<a href="{$registerUrl}" class="register">
						{translate key="user.login.registerNewAccount"}
					</a>
				{/if}
			</div>
		</fieldset>

	</form>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
