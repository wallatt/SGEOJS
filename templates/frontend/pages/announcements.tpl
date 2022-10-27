{**
 * saludColectiva/templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the latest announcements
 *
 * @uses $announcements array List of announcements
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl" pageTitle="announcement.announcements"}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css"> 

<!-- AGREGADO -->
<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
<div id="pkp_content_main">

<div class="page page_announcements">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="announcement.announcements"}
	{include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="announcements" sectionTitleKey="announcement.announcements"}

	{$announcementsIntroduction}

	{include file="frontend/components/announcements.tpl"}
</div><!-- .page -->

</br>

{include file="frontend/components/footer.tpl"}
