<?php

/**
 * @file plugins/themes/saludColectiva/SaludColectivaThemePlugin.inc.php
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SaludColectivaThemePlugin
 * @ingroup plugins_themes_salud_colectiva
 *
 * @brief Default theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class SaludColectivaThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {

		// Initialize the parent theme
		$this->setParent('defaultthemeplugin');

		// Add custom styles
		$this->modifyStyle('stylesheet', array('addLess' => array('styles/index.less')));

		// Remove the typography options of the parent theme.
		// `removeOption` was introduced in OJS 3.0.2
		if (method_exists($this, 'removeOption')) {
			$this->removeOption('typography');
		}

		// Add the option for an accent color
		$this->addOption('accentColour', 'FieldColor', [
			'label' => __('plugins.themes.saludColectiva.option.accentColour.label'),
			'description' => __('plugins.themes.default.option.colour.description'),
			'default' => '#F7BC4A',
		]);

		// Load the Montserrat and Open Sans fonts
		$this->addStyle(
			'font',
			'//fonts.googleapis.com/css?family=Montserrat:400,700|Noto+Serif:400,400i,700,700i',
			array('baseUrl' => '')
		);

		// Dequeue any fonts loaded by parent theme
		// `removeStyle` was introduced in OJS 3.0.2
		if (method_exists($this, 'removeStyle')) {
			$this->removeStyle('fontNotoSans');
			$this->removeStyle('fontNotoSerif');
			$this->removeStyle('fontNotoSansNotoSerif');
			$this->removeStyle('fontLato');
			$this->removeStyle('fontLora');
			$this->removeStyle('fontLoraOpenSans');
			$this->removeStyle('fontNotoSerif');
			$this->removeStyle('fontNotoSerif');
			$this->removeStyle('fontNotoSerif');
			$this->removeStyle('fontNotoSerif');
			$this->removeStyle('fontNotoSerif');
		}

		// Start with a fresh array of additionalLessVariables so that we can
		// ignore those added by the parent theme. This gets rid of @font
		// variable overrides from the typography option
		$additionalLessVariables = array();

		// Update colour based on theme option from parent theme
		if ($this->getOption('baseColour') !== '#1E6292') {
			$additionalLessVariables[] = '@bg-base:' . $this->getOption('baseColour') . ';';
			if (!$this->isColourDark($this->getOption('baseColour'))) {
				$additionalLessVariables[] = '@text-bg-base:rgba(0,0,0,0.84);';
			}
		}

		// Update accent colour based on theme option
		if ($this->getOption('accentColour') !== '#F7BC4A') {
			$additionalLessVariables[] = '@accent:' . $this->getOption('accentColour') . ';';
		}

		if ($this->getOption('baseColour') && $this->getOption('accentColour')) {
			$this->modifyStyle('stylesheet', array('addLessVariables' => join('', $additionalLessVariables)));
		}

		HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData')); // AGREGADO

	}

	/**
	 * Se activa cuando se llama al Hook 'TemplateManager::display'.
	 *
	 * @param string $hookname
	 * @param array $args [$templateMgr, $template, $sendContentType, $charset, $output]
	 */
	public function loadTemplateData($hookName, $args) {

		// Recupera el TemplateManager
		$templateMgr = $args[0];
		$template = $args[1];
		
		// No continua si el template no es el correcto
		if ($template != 'frontend/pages/article.tpl') {
			return false;
		}
		
		$submission = $templateMgr->get_template_vars('article');		
		$almetrics = "https://api.altmetric.com/v1/doi/" . $submission->_data["publications"][0]->_data["pub-id::doi"];
		$almetrics_json = @file_get_contents($almetrics);

		$templateMgr->assign('almetrics_json', $almetrics_json);
		
		return false;
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.saludColectiva.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.saludColectiva.description');
	}
}

?>
