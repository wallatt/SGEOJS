{**
 * saludColectiva/templates/frontend/pages/message.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Generic message page.
 * Displays a simple message and (optionally) a return link.
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl"}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css">

{* //// Comienza estilo estructurado /////////////////////////////////////////////////////////// *}

<!-- AGREGADO -->
<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
<div id="pkp_content_main">

<div class="page page_message">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
	<div class="description">
		{if $messageTranslated}
			{$messageTranslated}
		{else}
			{translate key=$message}
		{/if}
	</div>
	{if $backLink}
		<div class="cmp_back_link">
			<a href="{$backLink}">{translate key=$backLinkLabel}</a>
		</div>
	{/if}
</div>

<br><br>

{include file="frontend/components/footer.tpl"}