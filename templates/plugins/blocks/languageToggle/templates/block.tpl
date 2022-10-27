{**
 * saludColectiva/templates/plugins/blocks/languageToggle/block.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Salud Colectiva -- language toggle.
 *}
{if $enableLanguageToggle}
	{foreach from=$languageToggleLocales item=localeName key=localeKey}
		{if $currentLocale eq "es_ES"}
			{if $localeName eq "English"}
				<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
					{$localeName}
				</a>
			{/if}
		{/if}
		{if $currentLocale eq "en_US"}
			{if $localeName != "English"}
				<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
					{$localeName}
				</a>
			{/if}
		{/if}
	{/foreach}
{/if}
