{**
 * saludColectiva/templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
 
<!-- Aqui finaliza pkp_structure_main, iniciado en el header -->
</div><!-- pkp_structure_main -->
	
<!-- Aqui finaliza el pkp_structure_content, iniciado en el header -->
</div><!-- pkp_structure_content -->

	<div id="pkp_content_footer" class="pkp_structure_footer_wrapper" role="contentinfo">
			{if $pageFooter}
				<div class="pkp_mapa_sitio">
					</br>
					{$pageFooter}
					</br>
				</div>
			{/if}
	</div><!-- pkp_structure_footer_wrapper -->

	<div id="pkp_content_footer" class="pkp_structure_footer_wrapper" role="contentinfo">
			
		<section id="referencias">
			&nbsp;&nbsp; 
			<img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/logoPKP.png" alt="PKP">
			<img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/logoDora.png" alt="Dora">
			<img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/crossref_citedby.svg" alt="Crossref Cited By">
			<img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/crossref-similarity-check.svg" alt="Crossref Similarity Check">
			<a href="https://doaj.org/toc/1669-2381" target="_blank"><img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/doajSeal.png" alt="DOAJ"></a>		
			<img src="{$baseUrl}/plugins/themes/saludColectiva/templates/frontend/images/logoOrcid.png" alt="Orcid">
		</section>
		
		{if $currentLocale eq "es_ES"}
			<section id="info-institucional">
				</br>
				<p>ISSN 1669-2381 (versión impresa) | ISSN 1851-8265 (versión electrónica)</p>
				<p>Editor Responsable: Hugo Spinelli</p>
				<p>Propietario: Universidad Nacional de Lanús</p>
				<p>Rectora: Ana Jaramillo</p>
				<p>29 de Septiembre 3901, Remedios de Escalada, Lanús (B1826GLC), Provincia de Buenos Aires, Argentina</p>
				<p>Registro DNDA en trámite</p>
				</br>
			</section>
		{/if}
		{if $currentLocale eq "en_US"}
			<section id="info-institucional">
				</br>
				<p>ISSN 1669-2381 (print version) | ISSN 1851-8265 (electronic version)</p>
				<p>Editor in chief: Hugo Spinelli</p>
				<p>Publisher: Universidad Nacional de Lanús</p>
				<p>Rector: Ana Jaramillo</p>
				<p>29 de Septiembre 3901, Remedios de Escalada, Lanús (B1826GLC), Provincia de Buenos Aires, Argentina</p>
				<p>DNDA registration in process</p>
				</br>
			</section>
		{/if}
		
	</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>