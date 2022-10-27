{**
 * saludColectiva/templates/frontend/pages/search.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to search and view search results.
 *
 * @uses $query Value of the primary search query
 * @uses $authors Value of the authors search filter
 * @uses $dateFrom Value of the date from search filter (published after).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $dateTo Value of the date to search filter (published before).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $yearStart Earliest year that can be used in from/to filters
 * @uses $yearEnd Latest year that can be used in from/to filters
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl" pageTitle="common.search"}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css">

	{* //// Comienza estilo estructurado /////////////////////////////////////////////////////// *}
	
	<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
		<div id="pkp_content_main">
	
			<div class="page-header">
				<h2>
					{if $query}
						{translate key="plugins.themes.saludColectiva.search.resultsFor" query=$query}
					{elseif $authors}
						{translate key="plugins.themes.saludColectiva.search.resultsFor" query=$authors}
					{else}
						{translate key="common.search"}
					{/if}
				</h2>
			</div>
			
			<section>

				<div class="row gtr-200">
				
					{* //// PRIMERA SECCION //////////////////////////////////////////////////////// *}
				
					<div class="col-4 col-12-medium">
					
						<div class="col-lg-4 search-col-filters">
							</br>
							<div class="search-filters">
								<h3>{translate key="plugins.themes.saludColectiva.search.params"}</h3>
								<form class="form-search" method="post" action="{url op="search"}">
									{csrf}
									</br>
									<div class="form-group form-group-query">
										<label for="query">
											{translate key="common.searchQuery"}
										</label>
										<input type="text" class="form-control" id="query" name="query" value="{$query|escape}">
									</div>
									</br>
									<div class="form-group form-group-authors">
										<label for="authors">
											{translate key="search.author"}
										</label>
										<input type="text" class="form-control" id"authors" name="authors" value="{$authors|escape}">
									</div>
									</br>
									<div class="form-group form-group-date-from">
										<label for="dateFromYear">
											{translate key="search.dateFrom"}
										</label>
										<div class="form-control-date">
											{html_select_date class="form-control" prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
										</div>
									</div>
									</br>
									<div class="form-group form-group-date-to">
										<label for="dateToYear">
											{translate key="search.dateTo"}
										</label>
										<div class="form-control-date">
											{html_select_date class="form-control" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
										</div>
									</div>
									</br>
									<div class="form-group form-group-buttons">
										<button class="btn btn-primary" type="submit">{translate key="common.search"}</button>
									</div>
								</form>
							</div>
						</div>

					</div>
					
					{* //// SEGUNDA SECCION //////////////////////////////////////////////////////// *}
					
					<div class="col-8 col-12-medium">
					
						<div class="col-lg-8 search-col-results">
							<div class="search-results">
							
								</br></br>
								
								{call_hook name="Templates::Search::SearchResults::PreResults"}

								{* Results pagination *}
								{if !$results->wasEmpty()}
									<div class="pkp_screen_reader">
										{page_info iterator=$results}
										{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
									</div>
								{/if}

								{* Search results, finally! *}
								<div class="search_results">
									{iterate from=results item=result}
										{include file="frontend/objects/article_summary.tpl" article=$result.publishedSubmission journal=$result.journal showDatePublished=true hideGalleys=true}
									{/iterate}
								</div>

								{* No results found *}
								{if $results->wasEmpty()}
									{if $error}
										{include file="frontend/components/notification.tpl" type="error" message=$error|escape}
									{else}
										{include file="frontend/components/notification.tpl" type="notice" messageKey="search.noResults"}
									{/if}

								{* Results pagination *}
								{else}
									<div class="cmp_pagination">
										{page_info iterator=$results}
										{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
									</div>
								{/if}

								{* Search Syntax Instructions *}
								{block name=searchSyntaxInstructions}{/block}
												
							</div>
						</div>
					</div>
				</div>
			
			</section>

		</div>
	</div>
	
	</br></br>

{include file="frontend/components/footer.tpl"}
