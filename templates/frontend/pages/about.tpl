{**
 * saludColectiva/templates/frontend/pages/about.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl" pageTitle="about.aboutContext"}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css"> 

<!-- AGREGADO -->
<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
<div id="pkp_content_main">

<div class="page page_about">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.aboutContext"}
	{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="masthead" sectionTitleKey="about.aboutContext"}

	{$currentContext->getLocalizedSetting('about')}
</div><!-- .page -->

</br>

{include file="frontend/components/footer.tpl"}
