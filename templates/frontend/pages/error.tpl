{**
 * saludColetiva/templates/frontend/pages/error.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Generic error page.
 * Displays a simple error message and (optionally) a return link.
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl"}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css">

<!-- AGREGADO -->
<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
<div id="pkp_content_main">

<div class="page page_error">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
	<div class="description">
		{translate key=$errorMsg params=$errorParams}
	</div>
	{if $backLink}
		<div class="cmp_back_link">
			<a href="{$backLink}">{translate key=$backLinkLabel}</a>
		</div>
	{/if}
</div>

</br>

{include file="frontend/components/footer.tpl"}
