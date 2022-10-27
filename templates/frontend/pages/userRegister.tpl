{**
 * saludColectiva/templates/frontend/pages/userRegister.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 * @uses $primaryLocale string The primary locale for this journal/press
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl" pageTitle="user.register"}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css">

<!-- AGREGADO -->
<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
<div id="pkp_content_main">

<div class="page page_register">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.register"}

	<form class="cmp_form register" id="register" method="post" action="{url op="register"}">
		{csrf}

		{if $source}
			<input type="hidden" name="source" value="{$source|escape}" />
		{/if}

		{include file="common/formErrors.tpl"}

		{include file="frontend/components/registrationForm.tpl"}
		
		{include file="frontend/components/registrationFormContexts.tpl"}

		{* When a user is registering with a specific journal *}
		{if $currentContext}

			<fieldset class="consent">
				{* Require the user to agree to the terms of the privacy policy *}
				<div class="fields">
					<div class="optin optin-privacy">
						<label>
							<input type="checkbox" name="privacyConsent" id="privacyConsent" value="1"{if $privacyConsent} checked="checked"{/if}>
							{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
							<label for="privacyConsent">{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}</label>
						</label>
					</div>
				</div>
				{* Ask the user to opt into public email notifications *}
				<div class="fields">
					<div class="optin optin-email">
						<label>
							<input type="checkbox" name="emailConsent" id="emailConsent" value="1"{if $emailConsent} checked="checked"{/if}>
							<label for="emailConsent">{translate key="user.register.form.emailConsent"}</label>
						</label>
					</div>
				</div>
			</fieldset>
		{/if}

		{* When a user is registering for no specific journal, allow them to
		   enter their reviewer interests *}
		{if !$currentContext}
			<fieldset class="reviewer_nocontext_interests">
				<legend>
					{translate key="user.register.noContextReviewerInterests"}
				</legend>
				<div class="fields">
					<div class="reviewer_nocontext_interests">
						{* See comment for .tag-it above *}
						<ul class="interests tag-it" data-field-name="interests[]" data-autocomplete-url="{url|escape router=$smarty.const.ROUTE_PAGE page='user' op='getInterests'}">
							{foreach from=$interests item=interest}
								<li>{$interest|escape}</li>
							{/foreach}
						</ul>
					</div>
				</div>
			</fieldset>
		{/if}

		{* recaptcha spam blocker *}
		{if $reCaptchaHtml}
			<fieldset class="recaptcha_wrapper">
				<div class="fields">
					<div class="recaptcha">
						{$reCaptchaHtml}
					</div>
				</div>
			</fieldset>
		{/if}

		<div class="buttons">
			<button class="submit" type="submit">
				{translate key="user.register"}
			</button>

			{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
			<a href="{url page="login" source=$rolesProfileUrl}" class="login">{translate key="user.login"}</a>
		</div>
	</form>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
