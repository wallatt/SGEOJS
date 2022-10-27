{**
 * saludColectiva/templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
 
{* //// HEADER ///////////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

{* //// ESTILO/JS ////////////////////////////////////////////////////////////////////////////// *}

<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/principal.css">
<link rel="stylesheet" type="text/css" href="{$baseUrl}/plugins/themes/saludColectiva/css/bootstrap.css">

<script src="{$baseUrl}/plugins/themes/saludColectiva/js/jquery.min.js"></script>
<script defer src="{$baseUrl}/plugins/themes/saludColectiva/js/jquery.flexslider-min.js"></script>
<script src="{$baseUrl}/plugins/themes/saludColectiva/js/jquery.flexslider.config.js"></script>

{* //// COMIENZO PAGINA //////////////////////////////////////////////////////////////////////// *}
	
	{* ////////// SLIDER /////////////////////////////////////////////////////////////////////// *}

    <section class="slider">
		<div class="flexslider">
        	<ul class="slides">
				{foreach name=announcements from=$announcements item=announcement}
					{if $announcement->getAnnouncementTypeName() eq "principal"}
						<li>
							<img src={$announcement->getLocalizedDescription()|substr:13:-8} align="Slider"/>
							<div class="flex-caption">
								<h2>{$announcement->getLocalizedTitle()|escape}</h2>
								<avs>{$announcement->getLocalizedDescriptionShort()}</avs>
							</div>
						</li>
					{/if}
				{/foreach}
            </ul>
        </div>
     </section>
	
	<div class="page_index_journal">
	{call_hook name="Templates::Index::journal"}

	{* ////////// COMIENZA ESTILO ESTRUCTURADO ///////////////////////////////////////////////// *}
	
	<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">

		<div id="pkp_content_main">

			<section>
		
				{* ////////// RESUMEN DE LA REVISTA //////////////////////////////////////////// *}
				
				<div class="row">
					<abt>
						</br></br>
						{$additionalHomeContent}
						</br>
					</abt>
				</div>
				
				{* ////////// IMAGEN EN PAGINA PRINCIPAL /////////////////////////////////////// *}
				
				{if $homepageImage}
					<div class="homepage_image">
						<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
					</div>
				{/if}
				
				{* ////////// AVISOS  ////////////////////////////////////////////////////////// *}

				{if $numAnnouncementsHomepage && $announcements|@count}
				
					<hr class="major" />

					{foreach name=announcements from=$announcements item=announcement}
						<div class="row">
							{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
								{break}
							{/if}
							{if $announcement->getAnnouncementTypeName() eq "izquierda" || $announcement->getAnnouncementTypeName() eq "derecha"}
								{if $announcement->getAnnouncementTypeName() eq "izquierda"}
									<div class="col-1 col-12-medium"></div>
									<div class="col-5 col-12-medium">
										<p>{$announcement->getLocalizedDescriptionShort()|substr:3:-2}</p>
									</div>
									<div class="col-5 col-12-medium">
										<h3><anc>{$announcement->getLocalizedTitle()|escape}</anc></h3>
										<ancdsc>{$announcement->getLocalizedDescription()}</ancdsc>
									</div>
								{/if}
								{if $announcement->getAnnouncementTypeName() eq "derecha"}
									<div class="col-1 col-12-medium"></div>
									<div class="col-5 col-12-medium">
										<h3><anc>{$announcement->getLocalizedTitle()|escape}</anc></h3>
										<ancdsc>{$announcement->getLocalizedDescriptionShort()}</ancdsc>
									</div>
									<div class="col-5 col-12-medium">
										<p>{$announcement->getLocalizedDescription()|substr:3:-2}</p>
									</div>
								{/if}
							{/if}
						</div>
						{if $announcement->getAnnouncementTypeName() eq "izquierda" || $announcement->getAnnouncementTypeName() eq "derecha"}
							{if not $smarty.foreach.announcements.last}
								<hr class="major" />
							{/if}
						{/if}	
					{/foreach}
					</br></br>
				{/if}
			</section>
			
		</div>
	</div><!-- .page -->

{* ////////// Footer /////////////////////////////////////////////////////////////////////////// *}

{include file="frontend/components/footer.tpl"}
