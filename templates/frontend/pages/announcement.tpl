{**
 * saludColectiva/templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page which represents a single announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$announcement->getLocalizedTitle()}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css">  

<!-- AGREGADO -->
<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
<div id="pkp_content_main">

<div class="page page_announcement">

	{* Display book details *}
	{include file="frontend/objects/announcement_full.tpl"}

</div><!-- .page -->

</br></br></br>

{include file="frontend/components/footer.tpl"}
