{**
 * saludColectiva/templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
	<div class="pkp_search">
		<div class="search_controls">
			{* Sidebars *}
			{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
			<div class="search_prompt">
				{$sidebarCode}
				-
				<a href=" https://www.facebook.com/RevistaSaludColectiva"><img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/facebook.png" alt="FB"></a>
				<a href="https://twitter.com/SaludColectiva"><img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/twitter.png" alt="TW"></a>
				<a href="http://www.linkedin.com/groups/4072393"><img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/linkedin.png" alt="IN"></a>
			</div>
		</div>
	</div>	
{/if}
