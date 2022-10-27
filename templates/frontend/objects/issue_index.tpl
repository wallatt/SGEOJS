{**
 * saludColectiva/templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedArticles array Lists of articles published in this issue
 *   sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
 
<!-- AGREGADO -->
<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
<div id="pkp_content_main">
 
<div class="obj_issue_toc">

	{* Articles *}
	<div class="sections">
	{foreach name=sections from=$publishedArticles item=section}
		<div class="section">
		{if $section.articles}
			<ul class="cmp_article_list articles">
				{foreach from=$section.articles item=article}
					<li>
						{include file="frontend/objects/article_summary.tpl"}
					</li>
				{/foreach}
			</ul>
		{/if}
		</div>
	{/foreach}
	</div><!-- .sections -->
</div>