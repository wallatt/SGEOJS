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
 * @uses $publishedSubmissions array Lists of articles published in this issue
 *   sorted by section.
 * @uses $publishedSubmissionsContinuous array Lists of articles published in this issue
 *   sorted by date.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
<div class="obj_issue_toc">

	{* INDICATE IF THIS IS ONLY A PREVIEW *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}

	{* FULL-ISSUE GALLEYS *}
	{if $issueGalleys}
		<div class="galleys">
			<h2>
				{translate key="issue.fullIssue"}
			</h2>
			<ul class="galleys_links">
				{foreach from=$issueGalleys item=galley}
					<li>
						{include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
					</li>
				{/foreach}
			</ul>
		</div>
	{/if}

	{* ARTICLES *}
	<div class="sections">
		{* CONTINOUS PUBLICATION *}
		{if $issue->getVolume() > 14}
			{foreach from=$publishedSubmissionsContinuous item=article}
				{include file="frontend/objects/article_summary_continuous.tpl"}
				</br></br>
			{/foreach}
		{* CONTINOUS ACTUAL PUBLICATION *}
		{elseif $issue->getVolume() == "" && $issue->getId() == 149}
			{foreach from=$publishedSubmissionsContinuousActual item=article}
				{include file="frontend/objects/article_summary_continuous.tpl"}
				</br></br>
			{/foreach}
		{* TRADITIONAL PUBLICATION *}
		{else}
			{foreach name=sections from=$publishedSubmissions item=section}
				<div class="section">
				{if $section.articles}
					{if $section.title}
						<h2>
							{$section.title|escape}
						</h2>
					{/if}
					</br></br>
					{foreach from=$section.articles item=article}
						{include file="frontend/objects/article_summary.tpl"}
						</br></br>
					{/foreach}
				{/if}
				</div>
			{/foreach}
		{/if}
	</div><!-- .sections -->
</div>
