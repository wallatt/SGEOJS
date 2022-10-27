{**
 * saludColectiva/templates/frontend/objects/article_details.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * Many journals will want to add custom data to this object, either through
 * plugins which attach to hooks on the page or by editing the template
 * themselves. In order to facilitate this, a flexible layout markup pattern has
 * been implemented. If followed, plugins and other content can provide markup
 * in a way that will render consistently with other items on the page. This
 * pattern is used in the .main_entry column and the .entry_details column. It
 * consists of the following:
 *
 * <!-- Wrapper class which provides proper spacing between components -->
 * <div class="item">
 *     <!-- Title/value combination -->
 *     <div class="label">Abstract</div>
 *     <div class="value">Value</div>
 * </div>
 *
 * All styling should be applied by class name, so that titles may use heading
 * elements (eg, <h3>) or any element required.
 *
 * <!-- Example: component with multiple title/value combinations -->
 * <div class="item">
 *     <div class="sub_item">
 *         <div class="label">DOI</div>
 *         <div class="value">12345678</div>
 *     </div>
 *     <div class="sub_item">
 *         <div class="label">Published Date</div>
 *         <div class="value">2015-01-01</div>
 *     </div>
 * </div>
 *
 * <!-- Example: component with no title -->
 * <div class="item">
 *     <div class="value">Whatever you'd like</div>
 * </div>
 *
 * Core components are produced manually below, but can also be added via
 * plugins using the hooks provided:
 *
 * Templates::Article::Main
 * Templates::Article::Details
 * Templates::Article::JatsParserFullText
 *
 * @uses $article Submission This article
 * @uses $publication Publication The publication being displayed
 * @uses $firstPublication Publication The first published version of this article
 * @uses $currentPublication Publication The most recently published version of this article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 * @uses $keywords array List of keywords assigned to this article
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 * @uses $licenseTerms string License terms.
 * @uses $licenseUrl string URL to license. Only assigned if license should be
 *   included with published submissions.
 * @uses $ccLicenseBadge string An image and text with details about the license
 *}
 
<script src="{$baseUrl}/plugins/themes/saludColectiva/js/jquery.min.js"></script>
<script src="{$baseUrl}/plugins/themes/saludColectiva/js/sweetalert.min.js"></script>
<script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script> <!-- DIMENSIONS BADGE -->
<script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script> <!-- ALTMETRIC -->

<script type="text/javascript" src="//cdn.plu.mx/widget-popup.js"></script>
<script type="text/javascript" src="//cdn.plu.mx/widget-summary.js"></script>

<section>

	{* INDICATE IF THIS IS ONLY A PREVIEW *}
	{if $publication->getData('status') !== $smarty.const.STATUS_PUBLISHED}
	<div class="cmp_notification notice">
		{capture assign="submissionUrl"}{url page="workflow" op="access" path=$article->getId()}{/capture}
		{translate key="submission.viewingPreview" url=$submissionUrl}
	</div>

	{* NOTIFICATION THAT THIS IS AN OLD VERSION *}
	{elseif $currentPublication->getId() !== $publication->getId()}
		<div class="cmp_notification notice">
			{capture assign="latestVersionUrl"}{url page="article" op="view" path=$article->getBestId()}{/capture}
			{translate key="submission.outdatedVersion"
				datePublished=$publication->getData('datePublished')|date_format:$dateFormatShort
				urlRecentVersion=$latestVersionUrl|escape
			}
		</div>
	{/if}
	
	<h2 style="text-align: center;">{$publication->getLocalizedTitle()|escape}</h2>
	
	{* DOI (REQUIRES PLUGIN) *}
	{foreach from=$pubIdPlugins item=pubIdPlugin}
		{if $pubIdPlugin->getPubIdType() != 'doi'}
			{continue}
		{/if}
		{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
		{if $pubId}
			{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
			<dsgdoi>
				<h4><a href="{$doiUrl}">{$doiUrl}</a></h4>
			</dsgdoi>
		{/if}
	{/foreach}
	
	{* PUBLICATION DATE *}
	{if $publication->getData('datePublished')}
		
		{* IF THIS IS THE ORIGINAL VERSION *}
		{if $firstPublication->getID() === $publication->getId()}
			<h4 style="text-align: center;">{translate key="submissions.published"}
				{$firstPublication->getData('datePublished')|date_format:$dateFormatLong} <img style="vertical-align: middle;" src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/openAccess.png" alt="Open Access">
			</h4>
		{* IF THIS IS AN UPDATED VERSION *}
		{else}
			<h4 style="text-align: center;">{translate key="submissions.published"}
				{translate key="submission.updatedOn" datePublished=$firstPublication->getData('datePublished')|date_format:$dateFormatLong dateUpdated=$publication->getData('datePublished')|date_format:$dateFormatLong} <img style="vertical-align: middle;" src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/openAccess.png" alt="Open Access">
			</h4>
		{/if}
		
		{if count($article->getPublishedPublications()) > 1}
			<h4 style="text-align: center;">
				{translate key="submission.versions"}
			</h4>
			{foreach from=array_reverse($article->getPublishedPublications()) item=iPublication}
				{capture assign="name"}{translate key="submission.versionIdentity" datePublished=$iPublication->getData('datePublished')|date_format:$dateFormatLong version=$iPublication->getData('version')}{/capture}
				<h4 style="text-align: center; margin-top: 3px; margin-bottom: 3px;">
					{if $iPublication->getId() === $publication->getId()}
						{$name}
					{elseif $iPublication->getId() === $currentPublication->getId()}
						<a href="{url page="article" op="view" path=$article->getBestId()}">{$name}</a>
					{else}
						<a href="{url page="article" op="view" path=$article->getBestId()|to_array:"version":$iPublication->getId()}">{$name}</a>
					{/if}
				</h4>
			{/foreach}
		{/if}
		
	{/if}
	
	{* AUTHORS *}
	{if $article->getAuthors()}
		</br>
		<h3 style="text-align: center;">
			{foreach name=authors from=$article->getAuthors() item=author}
				{assign var=identificador value=$author->getId()}
				{assign var=afiliacion value=$author->getLocalizedAffiliation()}
				
				{if $author->getLocalizedBiography()|substr:0:2 eq "<p"}
					{assign var=biografia value=$author->getLocalizedBiography()|substr:3:-4}
				{else}
					{assign var=biografia value=$author->getLocalizedBiography()}
				{/if}
				
				<!-- SI EL REGISTRO DE AUTORES ES EL PRIMERO -->
				{if $smarty.foreach.authors.iteration == 1}
					<!-- SI EL REGISTRO DE AUTOR ES EL PRIMERO Y NO ES UNICO -->
					{if $article->getAuthors()|@count != 1}
						{if $author->getOrcid()}
							<span class="field-tip">
								<a onclick='myFunction("{$afiliacion}","{$biografia}")'>{$author->getFullName()|escape}</a>
								{if $author->getId() == $publication->getData('primaryContactId')}
									<a href="mailto:{$author->getData('email')|escape}"><i class="fa fa-envelope-o"></i></a>
								{/if}
								<span class="tip-content">{$biografia}</span>
							</span>
							{if $author->getData('rorId')}
								<a href="{$author->getOrcid()|escape}" target="_blank">{$orcidIcon}</a>
								<a href="{$author->getData('rorId')|escape}" target="_blank">{$rorIdIcon}</a>
							{else}
								<a href="{$author->getOrcid()|escape}" target="_blank">{$orcidIcon}</a>
							{/if}
							,
						{else}
							<span class="field-tip">
								<a onclick='myFunction("{$afiliacion}","{$biografia}")'>{$author->getFullName()|escape}</a>
								{if $author->getId() == $publication->getData('primaryContactId')}
									<a href="mailto:{$author->getData('email')|escape}"><i class="fa fa-envelope-o"></i></a>
								{/if}
								<span class="tip-content">{$biografia}</span>
								{if $author->getData('rorId')}
									<a href="{$author->getData('rorId')|escape}" target="_blank">{$rorIdIcon}</a>
								{/if}
							</span>
							,
						{/if}
					<!-- SI EL REGISTRO DE AUTOR ES EL PRIMERO Y ES UNICO -->
					{else}
						{if $author->getOrcid()}
							<span class="field-tip">						
								<a onclick='myFunction("{$afiliacion}","{$biografia}")'>{$author->getFullName()|escape}</a>
								{if $author->getId() == $publication->getData('primaryContactId')}
									<a href="mailto:{$author->getData('email')|escape}"><i class="fa fa-envelope-o"></i></a>
								{/if}
								<span class="tip-content">{$biografia}</span>
							</span>
							{if $author->getData('rorId')}
								<a href="{$author->getOrcid()|escape}" target="_blank">{$orcidIcon}</a>
								<a href="{$author->getData('rorId')|escape}" target="_blank">{$rorIdIcon}</a>
							{else}
								<a href="{$author->getOrcid()|escape}" target="_blank">{$orcidIcon}</a>
							{/if}
						{else}
							<span class="field-tip">
								<a onclick='myFunction("{$afiliacion}","{$biografia}")'>{$author->getFullName()|escape}</a>
								{if $author->getId() == $publication->getData('primaryContactId')}
									<a href="mailto:{$author->getData('email')|escape}"><i class="fa fa-envelope-o"></i></a>
								{/if}
								<span class="tip-content">{$biografia}</span>
							</span>
							{if $author->getData('rorId')}
								<a href="{$author->getData('rorId')|escape}" target="_blank">{$rorIdIcon}</a>
							{/if}
						{/if}
					{/if}
				<!-- SI EL REGISTRO DE AUTOR ES EL UNICO -->
				{elseif $smarty.foreach.authors.last}
					{if $author->getOrcid()}
						<span class="field-tip">
							<a onclick='myFunction("{$afiliacion}","{$biografia}")'>{$author->getFullName()|escape}</a>
							{if $author->getId() == $publication->getData('primaryContactId')}
								<a href="mailto:{$author->getData('email')|escape}"><i class="fa fa-envelope-o"></i></a>
							{/if}
							<span class="tip-content">{$biografia}</span>
						</span>
						<a href="{$author->getOrcid()|escape}" target="_blank">{$orcidIcon}</a>
						{if $author->getData('rorId')}
							<a href="{$author->getData('rorId')|escape}" target="_blank">{$rorIdIcon}</a>
						{/if}
					{else}
						<span class="field-tip">
							<a onclick='myFunction("{$afiliacion}","{$biografia}")'>{$author->getFullName()|escape}</a>
							{if $author->getId() == $publication->getData('primaryContactId')}
								<a href="mailto:{$author->getData('email')|escape}"><i class="fa fa-envelope-o"></i></a>
							{/if}
							<span class="tip-content">{$biografia}</span>
						</span>
						{if $author->getData('rorId')}
							<a href="{$author->getData('rorId')|escape}" target="_blank">{$rorIdIcon}</a>
						{/if}
					{/if}
				<!-- SI EL REGISTRO DE AUTOR NO ES EL PRIMERO NI EL ULTIMO -->
				{else}
					{if $author->getOrcid()}
						<span class="field-tip">
							<a onclick='myFunction("{$afiliacion}","{$biografia}")'>{$author->getFullName()|escape}</a>
							{if $author->getId() == $publication->getData('primaryContactId')}
								<a href="mailto:{$author->getData('email')|escape}"><i class="fa fa-envelope-o"></i></a>
							{/if}
							<span class="tip-content">{$biografia}</span>
						</span>
						{if $author->getData('rorId')}
							<a href="{$author->getOrcid()|escape}" target="_blank">{$orcidIcon}</a>
							<a href="{$author->getData('rorId')|escape}" target="_blank">{$rorIdIcon}</a>
						{else}
							<a href="{$author->getOrcid()|escape}" target="_blank">{$orcidIcon}</a>
						{/if}
						,				
					{else}
						<span class="field-tip">
							<a onclick='myFunction("{$afiliacion}","{$biografia}")'>{$author->getFullName()|escape}</a>,
							{if $author->getId() == $publication->getData('primaryContactId')}
								<a href="mailto:{$author->getData('email')|escape}"><i class="fa fa-envelope-o"></i></a>
							{/if}
							<span class="tip-content">{$biografia}</span>
						</span>
						{if $author->getData('rorId')}
							<a href="{$author->getData('rorId')|escape}" target="_blank">{$rorIdIcon}</a>
						{/if}
						,
					{/if}
				{/if}
			{/foreach}
		</h3>
	{/if}
	
	{literal}
	<script>
		$(window).on('load', function() {
			$('#almetric-scol:not(:empty)').after('<br>');
			$('#dimensions-scol:not(:empty)').after('<br>');
		});
	</script>
	{/literal}
	
	{literal}
	<script>
		function myFunction(afiliacion, biografia){
		
			var afi = afiliacion;
			var biog = biografia;
			
			swal({
			  title: "Biografía",
			  buttons: false,
			  text: biog
			 });
			
		}
	</script>
	{/literal}

	<div class="row gtr-200">
	
	{* #### LATERAL IZQUIERDO ################ *}
		
		<div class="col-4 col-12-medium">
		
			<hr />
		
			{* ARTICLE/ISSUE COVER IMAGE *}
			{if $publication->getLocalizedData('coverImage') || ($issue && $issue->getLocalizedCoverImage())}
				<div class="item cover_image">
					<div class="sub_item">
						{if $publication->getLocalizedData('coverImage')}
							{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
							<img
								style="border-radius: 0.375em;" src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
								alt="{$coverImage.altText|escape|default:''}"
							>
						{else}
							<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
								<img style="border-radius: 0.375em;" src="{$issue->getLocalizedCoverImageUrl()|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
							</a>
						{/if}
					</div>
				</div>
				<br>
			{/if}
					
			{* ARTICLE GALLEYS *}
			{if $primaryGalleys}
				<div class="item galleys">
					<ul class="value galleys_links">
						{foreach from=$primaryGalleys item=galley}
							{include file="frontend/objects/galley_link.tpl" parent=$article galley=$galley purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
						{/foreach}
					</ul>
				</div>
			{/if}		
			{if $supplementaryGalleys}
				<hr/ >
				<div class="item galleys">
					<ul class="value supplementary_galleys_links">
						{foreach from=$supplementaryGalleys item=galley}
							{include file="frontend/objects/galley_link.tpl" parent=$article galley=$galley isSupplementary="1"}
						{/foreach}
					</ul>
				</div>
			{/if}
			
			{* STATISTICS *}
			{if $publication->getData('status') == $smarty.const.STATUS_PUBLISHED}
			
				<div class="box">
					
					<div class="vistasResumen">
						<span class="paperbuzz-source-name" id="paperbuzz-source-pdf">
							Vistas de resumen
							<div class="paperbuzz-count-label" id="paperbuzz-count-pdf">
								<i class="icon-newspaper" aria-hidden="true"></i>
								{$article->getViews()}
							</div>
						</span>
					</div>			
					
					{call_hook name="Templates::Article::Details"}
					
					{* DIMENSIONS *}
				
					<span id="dimensions-scol" class="__dimensions_badge_embed__" data-doi="{$publication->_data["pub-id::doi"]}" data-style="small_circle" data-hide-zero-citations="true" data-legend="always"></span>
				
					{* ALMETRIC *}
					
					<div id="almetric-scol" data-link-target='_blank'  data-badge-details="right" data-badge-type="medium-donut" data-doi="{$publication->_data["pub-id::doi"]}" data-hide-no-mentions="true" class="altmetric-embed"></div>
					
					{* PLUMX *}
					
					{if $currentLocale eq "es_ES"}
						<a href="https://plu.mx/plum/a/?doi={$publication->_data["pub-id::doi"]}" class="plumx-summary plum-liberty-theme" data-site="plum" data-hide-when-empty="true" data-lang="es"></a>
					{/if}
					{if $currentLocale eq "en_US"}
						<a href="https://plu.mx/plum/a/?doi={$publication->_data["pub-id::doi"]}" class="plumx-summary plum-liberty-theme" data-site="plum" data-hide-when-empty="true"></a>
					{/if}
					
					{call_hook name="Templates::Article::Share"}
					
				</div>
			
			{/if}
			
			{* KEYWORDS *}
			{if !empty($publication->getLocalizedData('keywords'))}
				<hr />
				{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
				<h3 style="padding-bottom:10px;">{translate key="semicolon" label=$translatedKeywords}</h3>
				<div class="box">
					<p>
						{foreach name="keywords" from=$publication->getLocalizedData('keywords') item="keyword"}
							{$keyword|escape}{if !$smarty.foreach.keywords.last}, {/if}
						{/foreach}
					</p>
				</div>
			{/if}
			
			{* HOW TO CITE *}
			{if $citation}
				<hr />				

				<!--<div class="col-12">
					<select name="citacion" id="citacion">
						<option value="">{translate key="submission.howToCite.citationFormats"}</option>
						{foreach from=$citationStyles item="citationStyle"}
						<option value="1">{$citationStyle.title|escape}</option>
						{/foreach}
					</select>
				</div>-->
				
				<h3>{translate key="submission.howToCite"}</h3>
				</br>
				{translate key="submission.howToCite.citationFormats"}
				</br></br>	
				
				<h3>
				{foreach from=$citationStyles item="citationStyle" name="citation"}
					{if not $smarty.foreach.citation.last}
						<a
							aria-controls="citationOutput"
							href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
							data-load-citation
							data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
						>
						{$citationStyle.title|escape} |
						</a>
					{else}
						<a
							aria-controls="citationOutput"
							href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
							data-load-citation
							data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
						>
						{$citationStyle.title|escape}
						</a>
					{/if}

				{/foreach}
				</h3>
					
				</br>
				
				<div class="box" id="citationOutput" role="region" aria-live="polite">
					{$citation}
				</div>
				
				{if count($citationDownloads)}
					<h4>{translate key="submission.howToCite.downloadCitation"}</h4>
					<ul class="citation_formats_styles">
						{foreach from=$citationDownloads item="citationDownload"}
							<li>
								<a href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}">
									<span class="fa fa-download"></span>
									{$citationDownload.title|escape}
								</a>
							</li>
						{/foreach}
					</ul>
				{/if}
				
			{/if}

		</div>
		
		{* #################################### *}
		{* Columna derecha 						*}
		{* #################################### *}
		
		{* Submission with abstract *}
		{if $publication->getLocalizedData('abstract')}
			<div class="col-8 col-12-medium">
		
				<hr />

				<div class="abscst">
					<div class="cnt">
						{* Abstract *}
						<h3>{translate key="article.abstract"}</h3>
						</br>
						{$publication->getLocalizedData('abstract')|strip_unsafe_html}						
					</div>
				</div>
				
				{* Full text *}
				{call_hook name="Templates::Article::JatsParserFullText"}
				
				<br>
				
				{* References *}
				{if $parsedCitations || $publication->getData('citationsRaw')}
					<section class="item references">
						<div class="referencias">
							<h3 class="label">
								{translate key="submission.citations"}
							</h3>
							<br>
							{if $parsedCitations}
								{$numeroReferencia = 1}
								{foreach from=$parsedCitations item="parsedCitation"}
									<p>{$numeroReferencia}. {$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
									{$numeroReferencia = $numeroReferencia+1} 
								{/foreach}
							{else}
								{$publication->getData('citationsRaw')|escape|nl2br}
							{/if}
						</div>
					</section>
				{/if}

			</div>
		{* Submission without abstract *}
		{else}
			<div class="col-8 col-12-medium">
	
				<hr />

				{* Full text *}
				{call_hook name="Templates::Article::JatsParserFullText"}

				<br>

				{* References *}
				{if $parsedCitations || $publication->getData('citationsRaw')}
					<section class="item references">
						<div class="referencias">
							<h3 class="label">
								{translate key="submission.citations"}
							</h3>
							<br>
							{if $parsedCitations}
								{$numeroReferencia = 1}
								{foreach from=$parsedCitations item="parsedCitation"}
									<p>{$numeroReferencia}. {$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
									{$numeroReferencia = $numeroReferencia+1} 
								{/foreach}
							{else}
								{$publication->getData('citationsRaw')|escape|nl2br}
							{/if}
						</div>
					</section>
				{/if}

			</div>	
		{/if}
				
	</div>	
</section>